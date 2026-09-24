`timescale 1ns/1ps
// =============================================================================
// Clock generator for the 6x multi-pumped MAC -- NO MMCM
// -----------------------------------------------------------------------------
// clk_in   : 6x reference clock (default 300 MHz)
// clk_fast : clk_in on a BUFG           -> M3's single time-multiplexed DSP
// clk_sys  : clk_in / 6 on a BUFR       -> every other module (default 50 MHz)
//
// The MMCM version needed ~0.1 W for the MMCM alone, which the total-power FOM
// counts. Here the fast clock comes straight in and the system clock is
// divided down by a BUFR (BUFR_DIVIDE = "6"), which costs almost nothing.
// Vivado derives the divided clock automatically from the BUFR, so the XDC
// only needs create_clock on clk_in. 

module clk_gen_6x (
    input  wire clk_in,
    output wire clk_sys,
    output wire clk_fast
);

`ifdef SYNTHESIS
    BUFG u_bufg_fast (.I(clk_in), .O(clk_fast));

    BUFR #(
        .BUFR_DIVIDE ("6"),
        .SIM_DEVICE  ("7SERIES")
    ) u_bufr_sys (
        .I   (clk_in),
        .CE  (1'b1),
        .CLR (1'b0),
        .O   (clk_sys)
    );
`else
    reg       sys_r = 1'b0;
    reg [1:0] cnt   = 2'd0;

    always @(posedge clk_in) begin
        if (cnt == 2'd2) begin
            cnt   = 2'd0;
            sys_r = ~sys_r;
        end else begin
            cnt = cnt + 2'd1;
        end
    end

    assign clk_fast = clk_in;
    assign clk_sys  = sys_r;
`endif

endmodule
