`timescale 1ns/1ps
// =============================================================================
// M3 - MAC Engine (transposed form, two products per DSP operation)
// -----------------------------------------------------------------------------
// One 3x3 convolution result per clk cycle using ONE DSP48E1 (6x pumped).
// TWO PRODUCTS PER DSP OPERATION
// q*w_r0 and q*w_r1 come from a single multiply by packing both weights into
// the 25-bit A port:
//
//   A = w_r0 * 2^16 + w_r1          (fits 25-bit signed for any 8-bit w)
//   P = q*A + 2^15 = (q*w_r0) * 2^16 + (q*w_r1 + 2^15)
//
// q*w_r1 lies in [-32640, 32385], so q*w_r1 + 2^15 lies in [128, 65153]:
// it never borrows from or carries into bit 16. Hence, with no correction,
//   q*w_r0 = P[31:16]            (signed)
//   q*w_r1 = P[15:0] - 2^15      = {~P[15], P[14:0]}   (signed)
// The +2^15 rides in the DSP post-adder (constant on the C port).
//
// 6x MULTI-PUMPED: all six DSP operations run on ONE DSP48E1 clocked at
// clk_fast = 6 x clk (see clk_gen_6x.v), one operation per fast phase.
// Operands and results cross between clk and clk_fast in flip-flops; clk is
// clk_fast divided by 6 in a BUFR (no MMCM), so the crossings are synchronous
// and timed by Vivado.
//
// Pipeline (clk cycles; data stages after s3 are enabled by their valid):
//   s1  column registered          s2-s3  6 DSP ops + A/B/C sums on clk_fast
//   s3  A/B/C back in clk          s4-s5  balancing registers (flip-flops only)
//   s6  T1 / T2 / result
// Bit-exact with the 9-product sum (plus the documented rounding bias): every
// intermediate is wide enough for its worst case (A,B,C: 3 products -> 18
// bits; T2: 6 -> 19; result: 9 products + bias -> 20).
// =============================================================================

module M3 #(parameter PIXEL_WIDTH = 8, WEIGHT_WIDTH = 8, ACC_WIDTH = 20,
            parameter FRAC_BITS = 4)
(   input clk, rst,
    input clk_fast,         // 6x clk, phase-aligned (clk_gen_6x)
    input pixel_valid,      // a new column is being accepted this cycle
    input window_valid,     // ...and it completes a valid 3x3 window
    // Newest column: row 0 is the oldest image row (M1 prev_row2_pixel),
    // row 2 the current one (M1 curr_row_pixel).
    input [PIXEL_WIDTH-1:0] col_row0, col_row1, col_row2,
    // Serial kernel stream from M4 (selected bank, taps 0..8 repeating)
    input signed [WEIGHT_WIDTH-1:0] tap_data,
    input [3:0] tap_idx,
    input tap_valid,
    output signed [ACC_WIDTH-1:0] mac_result,   // sum + 2^(FRAC_BITS-1)
    output mac_result_valid
);

    localparam MULT_WIDTH = PIXEL_WIDTH + WEIGHT_WIDTH;     // 16: one product
    localparam SHIFT      = MULT_WIDTH;                     // lane spacing
    localparam PACK_WIDTH = SHIFT + WEIGHT_WIDTH + 1;       // 25: DSP A port
    localparam PROD_WIDTH = PACK_WIDTH + PIXEL_WIDTH + 1;   // 34
    localparam SUM3_WIDTH = MULT_WIDTH + 2;                 // 18: 3 products
    localparam T2_WIDTH   = MULT_WIDTH + 3;                 // 19: 6 products
    localparam [PROD_WIDTH-1:0] LANE_OFFSET = {{(PROD_WIDTH-1){1'b0}}, 1'b1} << (SHIFT-1);
    localparam signed [SUM3_WIDTH-1:0] ROUND_BIAS =
        (FRAC_BITS > 0) ? (1 << (FRAC_BITS - 1)) : 0;

    // synthesis translate_off
    initial begin
        if (PACK_WIDTH > 25)
            $display("[M3] ERROR: packed weight is %0d bits, DSP48E1 A port is 25.", PACK_WIDTH);
        if (ACC_WIDTH < MULT_WIDTH + 4)
            $display("[M3] ERROR: ACC_WIDTH (%0d) too small, need %0d.", ACC_WIDTH, MULT_WIDTH + 4);
    end
    // synthesis translate_on

    // --- Stage valids: the only reset registers in M3 ------------------------ 
    (* shreg_extract = "no" *) reg [5:1] ev;   // ev[k]: stage k holds an accepted pixel
    (* shreg_extract = "no" *) reg [6:1] wv;   // wv[k]: ...that completes a window
    always @(posedge clk) begin
        if (rst) begin
            ev <= 5'b0;
            wv <= 6'b0;
        end else begin
            ev <= {ev[4:1], pixel_valid};
            wv <= {wv[5:1], window_valid};
        end
    end
 
    // --- Operand build from the M4 tap stream (clk) -----------------------------
    // Tap order is row-major, so a row's column-0 tap arrives just before its
    // column-1 tap. Word for slot k (s = sign of the incoming tap):
    //   column 1 tap -> slot 2r:   {w_c0 - s, {8{s}}, w_c1}   (packed)

    wire [1:0] t_col = tap_idx % 3;
    wire [1:0] t_row = tap_idx / 3;
    wire       t_s   = tap_data[WEIGHT_WIDTH-1];

    reg  signed [WEIGHT_WIDTH-1:0] prev_c0;
    wire signed [WEIGHT_WIDTH-1:0] hi_src  = (t_col == 2'd1) ? prev_c0 : {WEIGHT_WIDTH{1'b0}};
    wire signed [WEIGHT_WIDTH:0]   hi_lane = hi_src - $signed({1'b0, t_s});
    wire [PACK_WIDTH-1:0] word   = {hi_lane, {(SHIFT-WEIGHT_WIDTH){t_s}}, tap_data};
    wire [2:0]            slot   = {t_row, 1'b0} + {2'b00, (t_col == 2'd2)};
    wire [2:0]            ins_ph = (slot == 3'd5) ? 3'd0 : slot + 3'd1;  // issue phase of op 'slot'

    reg                  ld_s;
    reg [PACK_WIDTH-1:0] word_s;
    reg [2:0]            insph_s;
    always @(posedge clk) begin
        if (tap_valid && t_col == 2'd0) prev_c0 <= tap_data;
        ld_s    <= tap_valid && (t_col != 2'd0);
        word_s  <= word;
        insph_s <= ins_ph;
    end

    // --- Stage 1 (clk): the column being processed ----------------------------
    reg [PIXEL_WIDTH-1:0] q_s0, q_s1, q_s2;
    always @(posedge clk) begin
        if (pixel_valid) begin
            q_s0 <= col_row0; q_s1 <= col_row1; q_s2 <= col_row2;
        end
    end

    // --- Phase tracking ---------------------------------------------------------
    // clk is clk_fast / 6, so every clk edge follows a clk_fast edge by a fixed
    // skew. tog_s flips on every clk edge; clk_fast sees the flip one fast
    // cycle later and pins the phase counter there, so ph == 0 during the first
    // fast cycle after each clk edge.
    reg       tog_s;
    reg       tog_f1, tog_f2;
    reg [2:0] ph;
    always @(posedge clk) begin
        if (rst) tog_s <= 1'b0;
        else     tog_s <= ~tog_s;
    end
    always @(posedge clk_fast) begin
        tog_f1 <= tog_s;
        tog_f2 <= tog_f1;
        if (tog_f1 ^ tog_f2) ph <= 3'd2;
        else                 ph <= (ph == 3'd5) ? 3'd0 : ph + 3'd1;
    end

    // --- clk_fast copies of everything crossing from clk ------------------------
    // One fast cycle behind their clk source, so they are valid in fast cycles
    // 1..6 of each clk period -- exactly the phases ops 0..5 are issued in.
    reg [PIXEL_WIDTH-1:0] q_f0, q_f1, q_f2;
    reg                   ld_f;
    reg [PACK_WIDTH-1:0]  word_f;
    reg [2:0]             insph_f;
    always @(posedge clk_fast) begin
        q_f0 <= q_s0; q_f1 <= q_s1; q_f2 <= q_s2;
        ld_f <= ld_s; word_f <= word_s; insph_f <= insph_s;
    end

    // --- A operand ring (clk_fast) ---------------------------------------------
    // Six words rotating once per clk period. In phase p, ring_0 holds the word
    // for op p-1, i.e. the op being issued; the word leaving ring_0 re-enters
    // at ring_5. A new word for slot k replaces the re-entering copy in phase
    // k+1 -- the phase in which the old slot-k word is leaving -- so a reload
    // never disturbs the other five slots.
    (* shreg_extract = "no" *)
    reg [PACK_WIDTH-1:0] ring_0, ring_1, ring_2, ring_3, ring_4, ring_5;
    always @(posedge clk_fast) begin
        ring_0 <= ring_1; ring_1 <= ring_2; ring_2 <= ring_3;
        ring_3 <= ring_4; ring_4 <= ring_5;
        ring_5 <= (ld_f && ph == insph_f) ? word_f : ring_0;
    end

    // B operand (clk_fast): 3:1 pixel select.
    reg [PIXEL_WIDTH-1:0] b_mux;
    always @(*) begin
        case (ph)
            3'd1, 3'd2: b_mux = q_f0;    // ops 0, 1
            3'd3, 3'd4: b_mux = q_f1;    // ops 2, 3
            default:    b_mux = q_f2;    // ops 4, 5 (ph 5, 0)
        endcase
    end

    wire signed [PROD_WIDTH-1:0] dsp_p;
    pumped_dsp #(.A_WIDTH(PACK_WIDTH), .PIXEL_WIDTH(PIXEL_WIDTH),
                 .P_WIDTH(PROD_WIDTH), .OFFSET(LANE_OFFSET)) u_dsp (
        .clk_fast (clk_fast), .a (ring_0), .b (b_mux), .p (dsp_p)
    );

    // --- Column sums on clk_fast ------------------------------------------------
    // Op k is on P during phase (k+4) mod 6:
    //   ph 4 op0, ph 0 op2, ph 2 op4  -> high lane into A, low lane into B
    //   ph 5 op1, ph 1 op3, ph 3 op5  -> low lane into C
    // Each sum restarts on its first op (A/B at ph 4, C at ph 5 with the
    // rounding bias), and all three are complete by the end of ph 3. frame_*
    // copies them at the end of ph 4 (A/B restart on that same edge, so the
    // copy still sees the finished sums) and holds them for six fast cycles,
    // across the clk edge that reads them.
    wire signed [MULT_WIDTH-1:0] p_hi = dsp_p[2*SHIFT-1:SHIFT];
    wire signed [MULT_WIDTH-1:0] p_lo = {~dsp_p[SHIFT-1], dsp_p[SHIFT-2:0]};

    reg  signed [SUM3_WIDTH-1:0] acc_a, acc_b, acc_c;
    reg  signed [SUM3_WIDTH-1:0] frame_a, frame_b, frame_c;
    wire signed [SUM3_WIDTH-1:0] base_a = (ph == 3'd4) ? {SUM3_WIDTH{1'b0}} : acc_a;
    wire signed [SUM3_WIDTH-1:0] base_b = (ph == 3'd4) ? {SUM3_WIDTH{1'b0}} : acc_b;
    wire signed [SUM3_WIDTH-1:0] base_c = (ph == 3'd5) ? ROUND_BIAS : acc_c;

    always @(posedge clk_fast) begin
        if (ph == 3'd4 || ph == 3'd0 || ph == 3'd2) begin
            acc_a <= base_a + p_hi;
            acc_b <= base_b + p_lo;
        end
        if (ph == 3'd5 || ph == 3'd1 || ph == 3'd3)
            acc_c <= base_c + p_lo;
        if (ph == 3'd4) begin
            frame_a <= acc_a; frame_b <= acc_b; frame_c <= acc_c;
        end
    end

    // --- Stages 3-5 (clk): back in clk, then balancing registers ----------------
    // Stage 3 captures the sums of the column registered two clk edges earlier
    // (aligned with ev[3]); stages 4-5 are flip-flop delays that keep M3's
    // latency at 6, as before.
    reg signed [SUM3_WIDTH-1:0] s3_a, s3_b, s3_c;
    reg signed [SUM3_WIDTH-1:0] s4_a, s4_b, s4_c;
    reg signed [SUM3_WIDTH-1:0] sum_c0, sum_c1, sum_c2;   // A, B, C
    always @(posedge clk) begin
        s3_a <= frame_a; s3_b <= frame_b; s3_c <= frame_c;
        if (ev[3]) begin s4_a <= s3_a; s4_b <= s3_b; s4_c <= s3_c; end
        if (ev[4]) begin sum_c0 <= s4_a; sum_c1 <= s4_b; sum_c2 <= s4_c; end
    end

    // --- Stage 6: transposed accumulation across columns ---------------------
    reg signed [SUM3_WIDTH-1:0] t1;
    reg signed [T2_WIDTH-1:0]   t2;
    reg signed [ACC_WIDTH-1:0]  acc_r;

    always @(posedge clk) begin
        if (ev[5]) begin
            t1    <= sum_c0;
            t2    <= t1 + sum_c1;
            acc_r <= t2 + sum_c2;
        end
    end

    assign mac_result       = acc_r;
    assign mac_result_valid = wv[6];

endmodule

// -----------------------------------------------------------------------------
// The one DSP48E1, on clk_fast: AREG/BREG -> MREG -> PREG, P = A*B + OFFSET.
// Kept as a module so use_dsp applies to it alone. Free-running: operations
// that carry no valid pixel are simply ignored downstream.
// -----------------------------------------------------------------------------
(* use_dsp = "yes" *)
module pumped_dsp #(parameter A_WIDTH = 25, PIXEL_WIDTH = 8, P_WIDTH = 34,
                    parameter [P_WIDTH-1:0] OFFSET = 0)
(   input clk_fast,
    input signed [A_WIDTH-1:0] a,
    input [PIXEL_WIDTH-1:0] b,
    output reg signed [P_WIDTH-1:0] p
);
    reg signed [A_WIDTH-1:0]     a_r;   // AREG
    reg        [PIXEL_WIDTH-1:0] b_r;   // BREG
    reg signed [P_WIDTH-1:0]     m_r;   // MREG

    always @(posedge clk_fast) begin
        a_r <= a;
        b_r <= b;
        m_r <= a_r * $signed({1'b0, b_r});
        p   <= m_r + $signed(OFFSET);
    end
endmodule
