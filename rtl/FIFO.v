`timescale 1ns/1ps
// =============================================================================
// M7 - Output FIFO / rate smoother
// -----------------------------------------------------------------------------
// The convolution pipeline produces results in bursts: KERNEL_SIZE-1 = 2 dead
// cycles at every row boundary, plus a long dead stretch while the first two
// rows fill the line buffers. M7 absorbs those gaps so the accelerator emits a
// gapless one-result-per-cycle output stream.
//
// It works by building a reserve first: nothing is released until occupancy
// reaches RELEASE_THRESHOLD. From that point it pops every cycle, and the
// reserve is deep enough that the accumulated input gaps never drain it.
//
// RELEASE_THRESHOLD = 58 for IMG_WIDTH = 32.
// The general minimum is 2*IMG_WIDTH - 6. Derivation: at the end of the
// row-boundary gap following output row r, occupancy equals
// t_T - 2*(r+1) where t_T is the cycle of the threshold-th push. The last gap
// that still has data behind it is r = IMG_WIDTH-4, which requires
// t_T >= 2*IMG_WIDTH-5, and the smallest threshold meeting that is
// 2*IMG_WIDTH-6. For IMG_WIDTH = 32 that is 58, and 57 leaves occupancy at
// exactly 0 on the gap after output row 28 - one cycle of output dropout.
// This is verified by sweep in tests/tb_fifo.v: 58 passes, 57 fails.
//
// NOTE FOR THE REPORT: the write-up currently states the simulated minimum is
// 57. The code's 58 is the correct value; the report text needs the fix, not
// the RTL.
//
// Maximum occupancy ever reached is RELEASE_THRESHOLD-1 = 57, so FIFO_DEPTH=64
// has headroom. Assumption: the pixel source does not stall mid-image. If it
// does, output_valid still qualifies every beat correctly - only the gapless
// property is lost.
//
// LUT-LEAN VERSION (the competition FOM counts LUTs, not flip-flops):
//  * No occupancy counter. Before release nothing is popped, so the number of
//    words held is simply wr_ptr (the pointers restart at every pass); the
//    release point is therefore "wr_ptr == RELEASE_THRESHOLD-1 and a push".
//    After release, "not empty" is just wr_ptr != rd_ptr (the FIFO can never
//    fill: peak occupancy is RELEASE_THRESHOLD-1 < FIFO_DEPTH).
//  * The more_r gate is gone: exactly TOTAL_OUTPUTS words are pushed per
//    pass, so once they are all popped the FIFO is empty and pops stop by
//    themselves.
//  * The released-word counter that raises fifo_all_outputs_done is an LFSR
//    (lfsr_counter.v) instead of a binary counter.
//  * With a power-of-two FIFO_DEPTH the pointers wrap naturally, so no
//    wrap compare is built.
// Behaviour at the ports is unchanged.
// =============================================================================

module FIFO #(parameter DATA_WIDTH = 16 ,FIFO_DEPTH = 64 ,RELEASE_THRESHOLD = 58 ,IMG_WIDTH = 32)
(   input clk, rst,
    input fifo_pass_reset,
    input signed [DATA_WIDTH-1:0] final_output,
    input final_output_valid,
    output reg signed [DATA_WIDTH-1:0] output_pixel,
    output reg output_valid, fifo_all_outputs_done
);

(* ram_style = "distributed" *) reg signed [DATA_WIDTH-1:0] mem [FIFO_DEPTH-1:0];

localparam KERNEL_SIZE   = 3;
localparam TOTAL_OUTPUTS = (IMG_WIDTH - KERNEL_SIZE + 1) * (IMG_WIDTH - KERNEL_SIZE + 1);
localparam ADDR_WIDTH    = $clog2(FIFO_DEPTH);
localparam DEPTH_POW2    = ((FIFO_DEPTH & (FIFO_DEPTH - 1)) == 0);

reg [ADDR_WIDTH-1:0] wr_ptr, rd_ptr;
reg release_mode;
wire push, release_start, pop, last_pop;

assign push          = final_output_valid;
// Before release, words held == wr_ptr (nothing popped yet).
assign release_start = !release_mode && push && (wr_ptr == RELEASE_THRESHOLD-1);
assign pop           = (release_mode || release_start) && (wr_ptr != rd_ptr);

// fifo_all_outputs_done: LFSR counts released words; last_pop marks the
// TOTAL_OUTPUTS-th (TOTAL_OUTPUTS-1 already released and one more popping).
lfsr_counter #(.COUNT(TOTAL_OUTPUTS - 1)) u_release_count (
    .clk      (clk),
    .clear    (rst || fifo_pass_reset),
    .advance  (pop),
    .at_count (last_pop)
);

always @(posedge clk) begin
    if (rst || fifo_pass_reset) begin
        wr_ptr <= {ADDR_WIDTH{1'b0}};
        rd_ptr <= {ADDR_WIDTH{1'b0}};
        release_mode <= 1'b0;
        output_valid <= 1'b0;
        fifo_all_outputs_done <= 1'b0;
    end
    else begin
        if (push) begin
            mem[wr_ptr] <= final_output;
            wr_ptr      <= (DEPTH_POW2 || wr_ptr != FIFO_DEPTH-1) ? wr_ptr + 1'b1 : {ADDR_WIDTH{1'b0}};
        end
        if (pop) begin
            output_pixel <= mem[rd_ptr];
            rd_ptr       <= (DEPTH_POW2 || rd_ptr != FIFO_DEPTH-1) ? rd_ptr + 1'b1 : {ADDR_WIDTH{1'b0}};
        end
        output_valid <= pop;
        release_mode <= release_mode | release_start;
        if (pop && last_pop) fifo_all_outputs_done <= 1'b1;
    end
end

endmodule
