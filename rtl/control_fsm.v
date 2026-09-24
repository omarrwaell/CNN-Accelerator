`timescale 1ns/1ps
// =============================================================================
// M6 - Control FSM
// -----------------------------------------------------------------------------
// Source: files(2)/M6_control_fsm.sv, ported to Verilog-2001 with two changes
// made during integration (both explained below).
//
// Coordinates one image/kernel pass:
//   IDLE   - waiting for start
//   STREAM - requesting pixels until IMG_WIDTH^2 have been accepted
//   DRAIN  - fixed wait for M3+M5 to flush into M7
//   DONE   - parked until M7 confirms every result of this pass was released
//
// A one-cycle pass_reset pulse is issued on entry to STREAM. It goes to BOTH
// M2 (clears its row/column position counters) and M7 (rebuilds its reserve
// from scratch). Without it a second back-to-back pass inherits the previous
// pass's counter state and M2 would assert window_valid before real new-pass
// data has filled the window registers.
//
// CHANGE 1 - back-to-back passes.
//   The original went DONE -> IDLE on start, so launching a second pass needed
//   the start pulse held for two cycles (once to leave DONE, once to leave
//   IDLE). DONE now goes straight to STREAM on start, gated on
//   fifo_all_outputs_done so a new pass can never begin while M7 is still
//   emptying the previous one. This is what makes the multi-kernel bonus work
//   from a single start pulse per pass.
//
// CHANGE 2 - stall-safe pixel counting.
//   The original counted every STREAM cycle. It now counts only cycles where
//   the source actually presents a pixel (pixel_in_valid), so a stalling image
//   source cannot cause the FSM to end STREAM early and lose the tail of the
//   image. M1/M2/M3 were already stall-safe; this makes the control path match.
//
// CHANGE 3 - PIPE_LATENCY replaces MAC_LATENCY.
//   The drain wait must cover M3 (5 cycles) plus M5 (1 cycle) = 6, not 5.
//   Harmless in the original because `done` also waits on
//   fifo_all_outputs_done, but the parameter now means what its name says.
// =============================================================================

module control_fsm #(
    parameter IMG_WIDTH    = 32,
    parameter PIPE_LATENCY = 8      // M3 (6, transposed packed-DSP MAC) + M5 (2)
) (
    input  wire clk,
    input  wire rst,

    input  wire start,                    // pulse: begin a pass. The kernel bank
                                          // must already be loaded/selected in M4.
    input  wire pixel_in_valid,           // source is presenting a pixel this cycle
    input  wire fifo_all_outputs_done,    // from M7: this pass fully released

    output wire pixel_req,                // to source: accelerator wants pixels
    output wire pixel_valid_in,           // to M1: a pixel is actually being taken
    output wire pass_reset,               // to M2 and M7: one-cycle pulse
    output wire busy,
    output wire done
);

    localparam TOTAL_PIXELS = IMG_WIDTH * IMG_WIDTH;

    localparam IDLE   = 2'd0;
    localparam STREAM = 2'd1;
    localparam DRAIN  = 2'd2;
    localparam DONE   = 2'd3;

    // Drain timer: a shift register of PIPE_LATENCY-1 flip-flops instead of a
    // binary counter (no carry chain; flip-flops are free in the FOM).
    // Requires PIPE_LATENCY >= 2.
    localparam DRAIN_SR_WIDTH = PIPE_LATENCY - 1;

    reg [1:0]                    state, state_next;
    (* shreg_extract = "no" *)
    reg [DRAIN_SR_WIDTH-1:0]     drain_sr;
    wire                         last_pixel;     // TOTAL_PIXELS-1 accepted so far
    wire                         drain_done = drain_sr[DRAIN_SR_WIDTH-1];

    // A pass may be launched from IDLE, or straight from DONE once M7 has
    // finished releasing the previous pass.
    wire start_pass = start && ( (state == IDLE) ||
                                 ((state == DONE) && fifo_all_outputs_done) );

    // --- State register -----------------------------------------------------
    always @(posedge clk) begin
        if (rst)
            state <= IDLE;
        else
            state <= state_next;
    end

    // --- Next state ---------------------------------------------------------
    always @(*) begin
        state_next = state;
        case (state)
            IDLE: begin
                if (start_pass)
                    state_next = STREAM;
            end

            STREAM: begin
                if (pixel_in_valid && last_pixel)
                    state_next = DRAIN;
            end

            DRAIN: begin
                if (drain_done)
                    state_next = DONE;
            end

            DONE: begin
                // Park here so busy/done stay meaningful for as long as M7 is
                // still releasing this pass's results, which runs well past the
                // FSM's own fixed DRAIN window.
                if (start_pass)
                    state_next = STREAM;
            end

            default: state_next = IDLE;
        endcase
    end

    // --- Pixel counter: counts accepted pixels, not STREAM cycles -----------
    // LFSR instead of a binary counter (see lfsr_counter.v): held at its start
    // state outside STREAM, steps on each accepted pixel, and last_pixel is
    // high once TOTAL_PIXELS-1 pixels have been accepted -- the same condition
    // the binary count compared against.
    lfsr_counter #(.COUNT(TOTAL_PIXELS - 1)) u_pixel_count (
        .clk      (clk),
        .clear    (rst || (state != STREAM)),
        .advance  (pixel_in_valid),
        .at_count (last_pixel)
    );

    // --- Drain timer ----------------------------------------------------------
    // Fills with ones while in DRAIN; its top bit sets after PIPE_LATENCY-1
    // DRAIN cycles, so DRAIN lasts PIPE_LATENCY cycles as before.
    always @(posedge clk) begin
        if (rst || (state != DRAIN))
            drain_sr <= {DRAIN_SR_WIDTH{1'b0}};
        else
            drain_sr <= {drain_sr, 1'b1};
    end

    // --- Outputs ------------------------------------------------------------
    assign pass_reset     = start_pass;
    assign pixel_req      = (state == STREAM);
    assign pixel_valid_in = (state == STREAM) && pixel_in_valid;

    assign done = (state == DONE) && fifo_all_outputs_done;
    assign busy = (state != IDLE) && !done;

endmodule
