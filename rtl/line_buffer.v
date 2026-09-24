`timescale 1ns/1ps
// =============================================================================
// M1 - Line Buffer
// -----------------------------------------------------------------------------
// Delays the incoming raster-order pixel stream by 1 row and by 2 rows, so that
// on any given cycle three vertically-stacked pixels at the same column
// (rows R, R-1, R-2) are simultaneously available to M2.
//
// Two IMG_WIDTH-deep shift registers chained in series. Shifts only when
// pixel_valid_in is high, so a stalled source is a no-op: every register holds.
// This makes the module stall-safe by construction.
//
// No reset on the buffers, and no reset port. Safe because window_valid in M2
// is gated on position counters, which hold off any output until 2 full rows
// + KERNEL_SIZE columns of real data have shifted in - by then no power-up
// residue is observable.
//
// Kept as plain flip-flops (shreg_extract = "no"), NOT SRL32E shift registers.
// SRLs would use ~PIXEL_WIDTH LUTs per buffer; flip-flops use none, and the
// competition FOM counts LUTs but not flip-flops (LUTs + 50*DSPs + 100*BRAMs),
// so 2*IMG_WIDTH*PIXEL_WIDTH flip-flops are the cheaper choice here.
//
// The earlier RESET_LINE_BUF=1 variant (reset buffers, FF-based) was removed:
// the top level only ever used RESET_LINE_BUF=0, so the reset branch and the
// rst port were dead and rst showed up as [Synth 8-3331] unconnected.
// =============================================================================

module line_buffer #(
    parameter PIXEL_WIDTH    = 8,
    parameter IMG_WIDTH      = 32
) (
    input  wire                       clk,
    input  wire [PIXEL_WIDTH-1:0]     pixel_in,
    input  wire                       pixel_valid_in,
    output wire [PIXEL_WIDTH-1:0]     curr_row_pixel,
    output wire [PIXEL_WIDTH-1:0]     prev_row1_pixel,
    output wire [PIXEL_WIDTH-1:0]     prev_row2_pixel,
    output wire                       pixel_valid_out
);

    (* shreg_extract = "no" *) reg [PIXEL_WIDTH-1:0] line_buf1 [0:IMG_WIDTH-1];
    (* shreg_extract = "no" *) reg [PIXEL_WIDTH-1:0] line_buf2 [0:IMG_WIDTH-1];

    integer i;

    always @(posedge clk) begin
        if (pixel_valid_in) begin
            for (i = IMG_WIDTH-1; i > 0; i = i - 1)
                line_buf1[i] <= line_buf1[i-1];
            line_buf1[0] <= pixel_in;

            for (i = IMG_WIDTH-1; i > 0; i = i - 1)
                line_buf2[i] <= line_buf2[i-1];
            line_buf2[0] <= line_buf1[IMG_WIDTH-1];
        end
    end

    assign curr_row_pixel  = pixel_in;
    assign prev_row1_pixel = line_buf1[IMG_WIDTH-1];
    assign prev_row2_pixel = line_buf2[IMG_WIDTH-1];
    assign pixel_valid_out = pixel_valid_in;

endmodule
