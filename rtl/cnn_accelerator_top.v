`timescale 1ns/1ps
// =============================================================================
// CNN Convolution Accelerator - top level
// -----------------------------------------------------------------------------
// IEEE SSCS Egypt Chapter 2026 Student Design Competition
//
// Wires the seven modules into one streaming 3x3 convolution accelerator:
//
//   pixel_in --> M1 line_buffer --(newest column)--> M3 (MAC, transposed)
//                     |                                ^        ^
//                     +--> M2 window position/valid ---+        |
//                                          M4 kernel_storage ---+
//                                                            |
//                          M5 output_handling --> M7 FIFO --> output_pixel
//
//   M6 control_fsm drives the pass: pixel_req / pixel_valid_in / pass_reset,
//   and reports busy / done.
//
// Interface summary
//   Kernel programming : kernel_wr_* write one tap per cycle into one bank.
//                        kernel_select picks the bank that feeds M3.
//   Start a pass       : pulse `start` once M4 holds the weights you want.
//                        Present pixels in raster order with pixel_in_valid
//                        high whenever pixel_req is high.
//   Results            : output_pixel / output_valid, in raster order,
//                        gapless once the FIFO reserve is built.
//   frame_done         : the last result of this pass has been released.
//
// Latency: 8 cycles through M3+M5 (M3 6 + M5 2), plus the M7 reserve build-up.
// Clocking: clk is the 6x reference (default 300 MHz). clk_fast = clk on a
// BUFG drives M3's single DSP; clk_sys = clk / 6 on a BUFR (default 50 MHz)
// drives everything else. No MMCM -- see clk_gen_6x.v.
// Throughput: 1 window in / 1 result out per cycle at steady state.
// =============================================================================

module cnn_accelerator_top #(
    parameter PIXEL_WIDTH       = 8,     // UQ8.0 input pixels
    parameter WEIGHT_WIDTH      = 8,     // Q3.4 signed weights
    parameter IMG_WIDTH         = 32,    // square image, IMG_WIDTH x IMG_WIDTH
    parameter ACC_WIDTH         = 20,    // Q15.4, must be PIXEL+WEIGHT+4
    parameter OUT_WIDTH         = 16,    // Q15.0 output
    parameter FRAC_BITS         = 4,     // fractional bits in the weights
    parameter NUM_KERNELS       = 2,     // >= 2 for the multi-kernel bonus
    // Derived - do not override.
    // RELEASE_THRESHOLD is the minimum reserve M7 must build before it starts
    // releasing, if the output stream is to stay gapless. See FIFO.v for the
    // derivation and tests/tb_fifo.v for the sweep that confirms it.
    parameter RELEASE_THRESHOLD = 2*IMG_WIDTH - 6,
    // Peak occupancy is RELEASE_THRESHOLD-1, so the FIFO must be at least that
    // deep. 2*IMG_WIDTH gives 7 words of headroom and equals the team's
    // original 64 at the default IMG_WIDTH of 32.
    parameter FIFO_DEPTH        = 2*IMG_WIDTH,
    parameter SEL_WIDTH         = (NUM_KERNELS > 1) ? $clog2(NUM_KERNELS) : 1
) (
    input  wire                           clk,
    input  wire                           rst,

    // --- Control ---
    input  wire                           start,
    output wire                           busy,
    output wire                           done,

    // --- Kernel programming (M4) ---
    input  wire                           kernel_wr_en,
    input  wire [SEL_WIDTH-1:0]           kernel_wr_bank,
    input  wire [3:0]                     kernel_wr_addr,
    input  wire signed [WEIGHT_WIDTH-1:0] kernel_wr_data,
    input  wire [SEL_WIDTH-1:0]           kernel_select,

    // --- Runtime options ---
    input  wire                           relu_enable,

    // --- Pixel input stream ---
    input  wire [PIXEL_WIDTH-1:0]         pixel_in,
    input  wire                           pixel_in_valid,
    output wire                           pixel_req,

    // --- Result stream ---
    output wire signed [OUT_WIDTH-1:0]    output_pixel,
    output wire                           output_valid,
    output wire                           frame_done
);

    // -------------------------------------------------------------------
    // Clocks: clk_fast (= clk, 6x, the single multi-pumped DSP in M3) and
    // clk_sys (= clk / 6, all modules). No MMCM, so there is no lock signal
    // to wait for; rst alone resets the design.
    // -------------------------------------------------------------------
    wire clk_sys, clk_fast;

    clk_gen_6x u_clk_gen (
        .clk_in   (clk),
        .clk_sys  (clk_sys),
        .clk_fast (clk_fast)
    );

    wire rst_sys = rst;

    // --- M6 -> everything ---
    wire pixel_valid_in;
    wire pass_reset;
    wire fifo_all_outputs_done;

    // --- M1 -> M3 (newest column) and M2 (pixel_valid_out) ---
    wire [PIXEL_WIDTH-1:0] curr_row_pixel, prev_row1_pixel, prev_row2_pixel;
    wire                   pixel_valid_out;

    // --- M2 -> M3 ---
    wire                   window_valid;

    // --- M4 -> M3: serial tap stream of the selected kernel bank ---
    wire signed [WEIGHT_WIDTH-1:0] tap_data;
    wire [3:0]                     tap_idx;
    wire                           tap_valid;

    // --- M3 -> M5 ---
    wire signed [ACC_WIDTH-1:0] mac_result;
    wire                        mac_result_valid;

    // --- M5 -> M7 ---
    wire signed [OUT_WIDTH-1:0] final_output;
    wire                        final_output_valid;

    assign frame_done = fifo_all_outputs_done;

    // Elaboration-time sanity checks. Simulation-only; ignored by synthesis.
    // synthesis translate_off
    initial begin
        if (FIFO_DEPTH < RELEASE_THRESHOLD)
            $display("[cnn_accelerator_top] ERROR: FIFO_DEPTH (%0d) < RELEASE_THRESHOLD (%0d) - M7 will overflow.",
                     FIFO_DEPTH, RELEASE_THRESHOLD);
        if (ACC_WIDTH < PIXEL_WIDTH + WEIGHT_WIDTH + 4)
            $display("[cnn_accelerator_top] ERROR: ACC_WIDTH (%0d) too small for a 3x3 tree - need %0d.",
                     ACC_WIDTH, PIXEL_WIDTH + WEIGHT_WIDTH + 4);
    end
    // synthesis translate_on

    // -------------------------------------------------------------------
    // M6 - control FSM
    // -------------------------------------------------------------------
    control_fsm #(
        .IMG_WIDTH    (IMG_WIDTH),
        .PIPE_LATENCY (8)
    ) u_m6_control_fsm (
        .clk                   (clk_sys),
        .rst                   (rst_sys),
        .start                 (start),
        .pixel_in_valid        (pixel_in_valid),
        .fifo_all_outputs_done (fifo_all_outputs_done),
        .pixel_req             (pixel_req),
        .pixel_valid_in        (pixel_valid_in),
        .pass_reset            (pass_reset),
        .busy                  (busy),
        .done                  (done)
    );

    // -------------------------------------------------------------------
    // M1 - line buffer
    // -------------------------------------------------------------------
    // M1 has no reset port: its buffers are plain flip-flops with no reset,
    // see line_buffer.v.
    line_buffer #(
        .PIXEL_WIDTH (PIXEL_WIDTH),
        .IMG_WIDTH   (IMG_WIDTH)
    ) u_m1_line_buffer (
        .clk             (clk_sys),
        .pixel_in        (pixel_in),
        .pixel_valid_in  (pixel_valid_in),
        .curr_row_pixel  (curr_row_pixel),
        .prev_row1_pixel (prev_row1_pixel),
        .prev_row2_pixel (prev_row2_pixel),
        .pixel_valid_out (pixel_valid_out)
    );

    // -------------------------------------------------------------------
    // M2 - window generator
    // -------------------------------------------------------------------
    window_generator #(
        .IMG_WIDTH   (IMG_WIDTH)
    ) u_m2_window_generator (
        .clk             (clk_sys),
        .rst             (rst_sys),
        .pixel_valid_in  (pixel_valid_out),
        .pass_reset      (pass_reset),
        .window_valid    (window_valid)
    );

    // -------------------------------------------------------------------
    // M4 - kernel storage (one LUT-RAM, streams the selected bank to M3;
    //      no reset -- load before start)
    // -------------------------------------------------------------------
    kernel_storage #(
        .WEIGHT_WIDTH (WEIGHT_WIDTH),
        .NUM_KERNELS  (NUM_KERNELS)
    ) u_m4_kernel_storage (
        .clk            (clk_sys),
        .kernel_wr_en   (kernel_wr_en),
        .kernel_wr_bank (kernel_wr_bank),
        .kernel_wr_addr (kernel_wr_addr),
        .kernel_wr_data (kernel_wr_data),
        .kernel_select  (kernel_select),
        .tap_data       (tap_data),
        .tap_idx        (tap_idx),
        .tap_valid      (tap_valid)
    );

    // -------------------------------------------------------------------
    // M3 - MAC engine (mac_result carries M5's rounding bias, see mac.v)
    // -------------------------------------------------------------------
    M3 #(
        .PIXEL_WIDTH  (PIXEL_WIDTH),
        .WEIGHT_WIDTH (WEIGHT_WIDTH),
        .ACC_WIDTH    (ACC_WIDTH),
        .FRAC_BITS    (FRAC_BITS)
    ) u_m3_mac (
        .clk          (clk_sys),
        .clk_fast     (clk_fast),
        .rst          (rst_sys),
        .pixel_valid  (pixel_valid_out),
        .window_valid (window_valid),
        .col_row0     (prev_row2_pixel),
        .col_row1     (prev_row1_pixel),
        .col_row2     (curr_row_pixel),
        .tap_data     (tap_data),
        .tap_idx      (tap_idx),
        .tap_valid    (tap_valid),
        .mac_result       (mac_result),
        .mac_result_valid (mac_result_valid)
    );

    // -------------------------------------------------------------------
    // M5 - output handling (round / saturate / ReLU)
    // -------------------------------------------------------------------
    // Largest |3x3 sum| = 9 * (2^PIXEL_WIDTH - 1) * 2^(WEIGHT_WIDTH-1)
    // (all weights at their most negative). After rounding it must fit the
    // signed OUT_WIDTH output, otherwise M5 has to saturate. Defaults:
    // 9*255*128 = 293760 -> 18360 after the >>4, far below 32767, so no clamp.
    localparam integer MAX_ABS_SUM = 9 * ((1 << PIXEL_WIDTH) - 1) * (1 << (WEIGHT_WIDTH - 1));
    localparam integer M5_SATURATE =
        (((MAX_ABS_SUM >> FRAC_BITS) + 1) >= (1 << (OUT_WIDTH - 1))) ? 1 : 0;

    output_handling #(
        .ACC_WIDTH (ACC_WIDTH),
        .OUT_WIDTH (OUT_WIDTH),
        .FRAC_BITS (FRAC_BITS),
        .SATURATE  (M5_SATURATE)
    ) u_m5_output_handling (
        .clk                (clk_sys),
        .rst                (rst_sys),
        .mac_result         (mac_result),
        .mac_result_valid   (mac_result_valid),
        .relu_enable        (relu_enable),
        .final_output       (final_output),
        .final_output_valid (final_output_valid)
    );

    // -------------------------------------------------------------------
    // M7 - output FIFO
    // -------------------------------------------------------------------
    FIFO #(
        .DATA_WIDTH        (OUT_WIDTH),
        .FIFO_DEPTH        (FIFO_DEPTH),
        .RELEASE_THRESHOLD (RELEASE_THRESHOLD),
        .IMG_WIDTH         (IMG_WIDTH)
    ) u_m7_fifo (
        .clk                   (clk_sys),
        .rst                   (rst_sys),
        .fifo_pass_reset       (pass_reset),
        .final_output          (final_output),
        .final_output_valid    (final_output_valid),
        .output_pixel          (output_pixel),
        .output_valid          (output_valid),
        .fifo_all_outputs_done (fifo_all_outputs_done)
    );

endmodule
