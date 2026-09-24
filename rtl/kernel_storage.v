`timescale 1ns/1ps
// =============================================================================
// M4 - Kernel Storage (serial tap stream)
// -----------------------------------------------------------------------------
// Holds NUM_KERNELS independently writable 3x3 coefficient banks (Q3.4, 8-bit
// signed each). The write port loads one tap of one bank per cycle;
// kernel_select picks which bank feeds M3.
//
// Satisfies the spec's "coefficients must be programmable" requirement, and
// NUM_KERNELS >= 2 is what makes the multi-kernel bonus possible 
// STORAGE: all banks share ONE distributed RAM of NUM_KERNELS*16 x 8 bits,
// addressed {bank, tap} (8 LUTs for 2 banks). Instead of presenting all nine
// taps in parallel (which needed a 72-bit bank mux or 72 LUT-RAM bits), the
// selected bank is streamed out one tap per cycle, in the order 0..8, 0..8,
// ... M3 rebuilds its DSP operands from this stream. The stream runs for one
// sweep after each write or kernel_select change and is paused otherwise, so
// it does not toggle during a pass (dynamic power).
//
//   tap_valid : tap_data / tap_idx hold tap tap_idx of the selected bank
 

module kernel_storage #(
    parameter WEIGHT_WIDTH = 8,     // Q3.4: 1 sign + 3 integer + 4 fractional
    parameter NUM_KERNELS  = 2,     // >= 2 enables the multi-kernel bonus
    // Derived - do not override. $clog2(1) is 0, which would give a zero-width
    // port, so it is clamped to 1 for the single-kernel case.
    parameter SEL_WIDTH    = (NUM_KERNELS > 1) ? $clog2(NUM_KERNELS) : 1
) (
    input  wire                           clk,

    // Write interface: one tap of one bank per cycle
    input  wire                           kernel_wr_en,
    input  wire [SEL_WIDTH-1:0]           kernel_wr_bank,
    input  wire [3:0]                     kernel_wr_addr,   // tap 0..8, row-major
    input  wire signed [WEIGHT_WIDTH-1:0] kernel_wr_data,

    // Which bank feeds M3
    input  wire [SEL_WIDTH-1:0]           kernel_select,

    // Continuous stream of the selected bank's taps
    output reg  signed [WEIGHT_WIDTH-1:0] tap_data,
    output reg  [3:0]                     tap_idx,
    output reg                            tap_valid
);

    localparam TAPS  = 9;
    localparam ADDR_W = SEL_WIDTH + 4;

    wire wr_enable = kernel_wr_en && (kernel_wr_addr < TAPS[3:0]) &&
                     (kernel_wr_bank < NUM_KERNELS);

    (* ram_style = "distributed" *)
    reg [WEIGHT_WIDTH-1:0] mem [0:(1<<ADDR_W)-1];

    // Read pointer: steps 0..8, held while a write owns the port or the
    // stream is paused. Power-up value 0; any other value (9..15) wraps back
    // to 0 on its own.
    reg [3:0] rd_tap = 4'd0;

    wire [ADDR_W-1:0] addr = wr_enable ? {kernel_wr_bank, kernel_wr_addr}
                                       : {kernel_select,  rd_tap};
 
    localparam SWEEP = TAPS + 1;
    reg [SEL_WIDTH-1:0] sel_prev = {SEL_WIDTH{1'b0}};
    (* shreg_extract = "no" *)
    reg [SWEEP-1:0]     sweep_left = {SWEEP{1'b1}};   // power-up: one sweep
    wire changed   = wr_enable || (kernel_select != sel_prev);
    wire streaming = !wr_enable && sweep_left[0];

    always @(posedge clk) begin
        sel_prev <= kernel_select;
        if (changed)
            sweep_left <= {SWEEP{1'b1}};
        else if (streaming)
            sweep_left <= {1'b0, sweep_left[SWEEP-1:1]};

        if (wr_enable)
            mem[addr] <= kernel_wr_data;
        else if (streaming)
            rd_tap <= (rd_tap == TAPS-1) ? 4'd0 : rd_tap + 4'd1;

        if (streaming) begin
            tap_data <= mem[addr];
            tap_idx  <= rd_tap;
        end
        tap_valid <= streaming;
    end

endmodule
