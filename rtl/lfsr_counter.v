`timescale 1ns/1ps
// =============================================================================
// LFSR event counter
// -----------------------------------------------------------------------------
// Replaces a binary "count N events" counter + compare. A binary counter
// needs a carry chain (~1 LUT per bit) plus the compare; an LFSR needs only
// the XNOR feedback (1 LUT) plus the compare, and its flip-flops are free in
// the competition FOM (LUTs + 50*DSPs + 100*BRAMs).
//
//   clear   : return to the start state (all zeros)
//   advance : step once (one event)
//   at_count: high while exactly COUNT advances have happened since clear
//
// The terminal state is computed at elaboration by stepping the LFSR COUNT
// times, so users compare against it exactly as they compared a binary count.
// WIDTH is chosen so the sequence period (2^WIDTH - 1) exceeds COUNT, i.e. the
// start state is never revisited before COUNT steps.
//
// Feedback: XNOR of the taps (1-indexed bit positions, Xilinx XAPP052 table),
// shifting left with the new bit entering bit 0. All-zeros is a valid state
// for XNOR feedback (all-ones is the lock-up state), so clear sets zero.
// Every tap set here (3..20 bits) was checked to give a maximal-length
// sequence.
//
// Elaboration steps the LFSR COUNT times; for very large images this exceeds
// Vivado's default loop limit, but the FOM build (32x32) needs only ~1000.
// =============================================================================

module lfsr_counter #(
    parameter integer COUNT = 899,
    parameter integer WIDTH = $clog2(COUNT + 2)
) (
    input  wire clk,
    input  wire clear,
    input  wire advance,
    output wire at_count
);

    // Feedback tap mask for a given width (bit k-1 set for tap k).
    function [31:0] tap_mask(input integer w);
        begin
            case (w)
                3:  tap_mask = (1<<2)|(1<<1);
                4:  tap_mask = (1<<3)|(1<<2);
                5:  tap_mask = (1<<4)|(1<<2);
                6:  tap_mask = (1<<5)|(1<<4);
                7:  tap_mask = (1<<6)|(1<<5);
                8:  tap_mask = (1<<7)|(1<<5)|(1<<4)|(1<<3);
                9:  tap_mask = (1<<8)|(1<<4);
                10: tap_mask = (1<<9)|(1<<6);
                11: tap_mask = (1<<10)|(1<<8);
                12: tap_mask = (1<<11)|(1<<5)|(1<<3)|(1<<0);
                13: tap_mask = (1<<12)|(1<<3)|(1<<2)|(1<<0);
                14: tap_mask = (1<<13)|(1<<4)|(1<<2)|(1<<0);
                15: tap_mask = (1<<14)|(1<<13);
                16: tap_mask = (1<<15)|(1<<14)|(1<<12)|(1<<3);
                17: tap_mask = (1<<16)|(1<<13);
                18: tap_mask = (1<<17)|(1<<10);
                19: tap_mask = (1<<18)|(1<<5)|(1<<1)|(1<<0);
                default: tap_mask = (1<<19)|(1<<16);   // 20
            endcase
        end
    endfunction

    localparam integer W = (WIDTH < 3) ? 3 : WIDTH;
    localparam [31:0]  TAPS = tap_mask(W);

    function [W-1:0] lfsr_step(input [W-1:0] s);
        begin
            lfsr_step = {s[W-2:0], ~^(s & TAPS[W-1:0])};
        end
    endfunction

    function [W-1:0] state_after(input integer n);
        integer i;
        reg [W-1:0] s;
        begin
            s = {W{1'b0}};
            for (i = 0; i < n; i = i + 1)
                s = lfsr_step(s);
            state_after = s;
        end
    endfunction

    localparam [W-1:0] TERMINAL = state_after(COUNT);

    // synthesis translate_off
    initial begin
        if (W > 20)
            $display("[lfsr_counter] ERROR: WIDTH %0d > 20 has no tap entry.", W);
        if ((1 << W) - 1 <= COUNT)
            $display("[lfsr_counter] ERROR: period %0d too short for COUNT %0d.", (1 << W) - 1, COUNT);
    end
    // synthesis translate_on

    reg [W-1:0] state = {W{1'b0}};
    always @(posedge clk) begin
        if (clear)        state <= {W{1'b0}};
        else if (advance) state <= lfsr_step(state);
    end

    assign at_count = (state == TERMINAL);

endmodule
