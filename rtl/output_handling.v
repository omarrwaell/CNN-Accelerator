`timescale 1ns/1ps
// =============================================================================
// M5 - Output Handling
// -----------------------------------------------------------------------------
// Source: files(2)/M5_output_handling.sv, ported to Verilog-2001 and given a
// synchronous reset to match the rest of the project.
//
// Turns M3's ACC_WIDTH-bit signed Q15.4 accumulator value into the final
// OUT_WIDTH-bit signed output:
//
//   1. Round     - round-half-up (add 2^(FRAC_BITS-1), then drop the
//                  FRAC_BITS fractional bits) rather than plain truncation,
//                  which biases every result downward. M3 already adds the
//                  2^(FRAC_BITS-1), so here rounding is a bit-select only.
//   2. Saturate  - clamp into the OUT_WIDTH signed range instead of wrapping.
//                  Only built when overflow is possible (SATURATE = 1); with
//                  the default widths it is provably impossible (see below).
//   3. ReLU      - bonus. When relu_enable is high a negative result becomes 0,
//                  implemented as the output register's synchronous reset.
//
// final_output_valid is a registered (twice-delayed) copy of mac_result_valid,
// so the data and its qualifier stay aligned: final_output appears exactly
// TWO cycles after the mac_result it came from (an internal pipeline
// register splits the round stage from the saturate/ReLU stage to shorten
// this module's critical path -- see the comment above rounded_val_r
// below), and M7 can trust final_output_valid completely.
// =============================================================================

module output_handling #(
    parameter ACC_WIDTH = 20,       // Q15.4, from M3
    parameter OUT_WIDTH = 16,       // Q15.0, spec minimum
    parameter FRAC_BITS = 4,        // fractional bits carried by the weights
    parameter SATURATE  = 1         // 0: overflow impossible, clamp not built
) (
    input  wire                          clk,
    input  wire                          rst,

    input  wire signed [ACC_WIDTH-1:0]   mac_result,
    input  wire                          mac_result_valid,

    input  wire                          relu_enable,

    output reg  signed [OUT_WIDTH-1:0]   final_output,
    output reg                           final_output_valid
);

    localparam RND_WIDTH = ACC_WIDTH - FRAC_BITS + 1;   // 17 for the defaults

    // --- Step 1: round (combinational, no adder) ------------------------------
    // M3 delivers mac_result = sum + 2^(FRAC_BITS-1) (the rounding constant is
    // preloaded into one of its accumulators), so round-half-up is just
    // dropping the FRAC_BITS fractional bits. The extra top bit reproduces the
    // old one-bit-wider rounding sum: M3 guarantees sum + bias fits ACC_WIDTH,
    // so that bit is always a copy of the sign.
    wire signed [RND_WIDTH-1:0] rounded_val =
        {mac_result[ACC_WIDTH-1], mac_result[ACC_WIDTH-1:FRAC_BITS]};

    // --- Pipeline register: splits the round stage from the saturate/ReLU
    // stage below. This shortens the combinational path identified via
    // Vivado timing analysis as this design's critical path (from M3's
    // add_final register, through round+saturate+ReLU, to M5's output
    // register -- 9 logic levels, 2.961 ns logic delay). Splitting it here
    // roughly halves that chain. Adds exactly 1 cycle of latency to M5
    // (1 -> 2 cycles total) -- this does not affect FOM (throughput and
    // resource usage are unaffected by pipeline depth) but raises the
    // achievable Fmax ceiling. M6's PIPE_LATENCY must change from 6 to 7
    // to match (see control_fsm.v and its instantiation).
    reg signed [RND_WIDTH-1:0] rounded_val_r;
    reg                        valid_stage1;

    // Only the valid bits are reset. Data registers load only with valid
    // data (enable = the valid that qualifies them) and are never read
    // unqualified downstream, so they need no reset - this keeps rst fanout
    // low and stops the data path toggling between results.
    always @(posedge clk) begin
        if (rst)
            valid_stage1 <= 1'b0;
        else
            valid_stage1 <= mac_result_valid;
    end

    always @(posedge clk) begin
        if (mac_result_valid)
            rounded_val_r <= rounded_val;
    end

    // --- Step 2: saturate (only when overflow is actually possible) ---------
    // With the default widths the largest |result| is 9*255*128/16 = 18360,
    // well inside the 16-bit output range, so overflow cannot occur by
    // construction. The top level computes this from the widths and passes
    // SATURATE = 0; saturation logic is then not built at all (fewer LUTs).
    // Any width change that makes overflow possible sets SATURATE = 1 and
    // brings the clamp back automatically.
    localparam signed [OUT_WIDTH-1:0] MAX_OUT = {1'b0, {(OUT_WIDTH-1){1'b1}}};
    localparam signed [OUT_WIDTH-1:0] MIN_OUT = {1'b1, {(OUT_WIDTH-1){1'b0}}};

    wire is_neg = rounded_val_r[RND_WIDTH-1];
    wire signed [OUT_WIDTH-1:0] out_val;

    generate
    if (SATURATE != 0) begin : g_saturate
        // Overflow iff the bits above the output sign bit are not all copies
        // of it.
        wire [RND_WIDTH-OUT_WIDTH:0] top_bits = rounded_val_r[RND_WIDTH-1:OUT_WIDTH-1];
        wire overflow = !((&top_bits) || !(|top_bits));
        assign out_val = overflow ? (is_neg ? MIN_OUT : MAX_OUT)
                                  : rounded_val_r[OUT_WIDTH-1:0];
    end else begin : g_no_saturate
        assign out_val = rounded_val_r[OUT_WIDTH-1:0];
    end
    endgenerate

    // --- Output register, with ReLU as its synchronous reset ------------------
    // "negative -> 0" is exactly a synchronous reset of the output register, so
    // ReLU uses the flip-flops' reset pins (free) instead of a 16-bit mux. The
    // reset may also fire on cycles with no valid result; that is harmless,
    // because final_output is only consumed when final_output_valid is high,
    // and it is always reloaded on the cycle before that.
    //
    // final_output_valid tracks valid_stage1 (already delayed 1 cycle from
    // mac_result_valid), so the total M5 latency is 2 cycles.
    always @(posedge clk) begin
        if (rst)
            final_output_valid <= 1'b0;
        else
            final_output_valid <= valid_stage1;
    end

    always @(posedge clk) begin
        if (relu_enable && is_neg)
            final_output <= {OUT_WIDTH{1'b0}};
        else if (valid_stage1)
            final_output <= out_val;
    end

endmodule
