`timescale 1ns/1ps
// =============================================================================
// M2 - Window Generator (window position tracker)
// -----------------------------------------------------------------------------
// Flags window_valid from row/column position counters only - never by
// inspecting pixel values. window_valid is high only once at least
// KERNEL_SIZE rows have been entered AND at least KERNEL_SIZE columns of the
// current row have arrived, which produces a fixed (KERNEL_SIZE-1)-cycle gap at
// every row boundary. M7 exists to absorb exactly those gaps.
//
// The 3x3 window itself is no longer held here. M3 is a transposed-form MAC:
// it consumes only the newest column (straight from M1) and carries the two
// older columns forward as partial sums, so the six column-delay registers
// that used to live here (48 FFs) had no reader and were removed.
//
// pass_reset clears the position counters so a second pass (multi-kernel bonus)
// starts from a clean origin instead of inheriting the previous pass's counter
// state.
// =============================================================================

module window_generator #(
    parameter IMG_WIDTH   = 32
) (
    input  wire clk,
    input  wire rst,
    input  wire pixel_valid_in,
    input  wire pass_reset,
    output wire window_valid
);

    localparam KERNEL_SIZE = 3;

    // Position tracking without binary counters (the FOM counts LUTs, not
    // flip-flops). window_valid only needs three facts, not full positions:
    //   * end of row      : an LFSR (lfsr_counter.v) counts accepted pixels in
    //                       the row and flags the (IMG_WIDTH-1)th, like the old
    //                       col_count == IMG_WIDTH-1;
    //   * column >= 2     : a 2-bit shift register filled with ones, one per
    //                       accepted pixel, cleared at each row start;
    //   * row >= 2        : a 2-bit shift register filled with ones, one per
    //                       completed row, cleared by rst / pass_reset.
    // (The old row counter saturated at IMG_WIDTH-1, so rows beyond 2 never
    // mattered.)
    wire row_end;
    wire pass_clear = rst || pass_reset;
    wire row_wrap   = pixel_valid_in && row_end;

    lfsr_counter #(.COUNT(IMG_WIDTH - 1)) u_col (
        .clk      (clk),
        .clear    (pass_clear || row_wrap),
        .advance  (pixel_valid_in),
        .at_count (row_end)
    );

    (* shreg_extract = "no" *) reg [1:0] col_ge;   // col_ge[k]: column index > k
    (* shreg_extract = "no" *) reg [1:0] row_ge;   // row_ge[k]: row index > k

    always @(posedge clk) begin
        if (pass_clear || row_wrap)
            col_ge <= 2'b00;
        else if (pixel_valid_in)
            col_ge <= {col_ge[0], 1'b1};

        if (pass_clear)
            row_ge <= 2'b00;
        else if (row_wrap)
            row_ge <= {row_ge[0], 1'b1};
    end

    assign window_valid = pixel_valid_in && row_ge[KERNEL_SIZE-2] && col_ge[KERNEL_SIZE-2];

endmodule
