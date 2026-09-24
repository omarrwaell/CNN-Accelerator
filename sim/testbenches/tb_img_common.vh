// =============================================================================
// tb_img_common.vh -- shared body for image testbenches IMG-TC7 .. IMG-TC16
// -----------------------------------------------------------------------------
// `include this INSIDE a module that declares parameters IMG_WIDTH and
// KERNEL_SIZE. It provides the DUT, clock, image/kernel/expected memories and
// the tasks each test sequences:
//
//   init_and_reset          - drive all inputs idle, pulse rst
//   load_kernel(bank, k)    - write kernel k (0=A, 1=B, 2=C) into a bank
//   write_bad_addresses(b)  - write junk to taps 9..15 (must be ignored)
//   run_pass(...)           - start a pass, stream the image (optionally with
//                             random stalls), check every output against an
//                             expected set, dump outputs to a hex file
//
// Compile with +incdir+../testbenches (see sim/scripts/*.do).
// =============================================================================

    localparam TOTAL_PIX     = IMG_WIDTH*IMG_WIDTH;
    localparam OUT_WIDTH_PIX = IMG_WIDTH-KERNEL_SIZE+1;
    localparam TOTAL_OUT     = OUT_WIDTH_PIX*OUT_WIDTH_PIX;
    localparam KERNEL_TAPS   = KERNEL_SIZE*KERNEL_SIZE;
    // Generous watchdog: a pass needs ~TOTAL_PIX cycles plus fill/drain, and
    // stalled passes stretch that by at most 1/(1-stall).
    localparam PASS_TIMEOUT  = 8*TOTAL_PIX + 2000;

    // 6x multi-pumped DUT: drive the 6x reference clock, and run all stimulus
    // and checks on the system clock the DUT derives from it (clk_in / 6).
    reg  clk_in = 0;
    wire clk = dut.clk_sys;
    reg rst, start, kernel_wr_en, relu_enable;
    reg [0:0] kernel_wr_bank, kernel_select;
    reg [3:0] kernel_wr_addr;
    reg signed [7:0] kernel_wr_data;
    reg [7:0] pixel_in;
    reg pixel_in_valid;
    wire busy, done, pixel_req;
    wire signed [15:0] output_pixel;
    wire output_valid, frame_done;

    cnn_accelerator_top #(.IMG_WIDTH(IMG_WIDTH), .NUM_KERNELS(2)) dut (
        .clk(clk_in), .rst(rst), .start(start), .busy(busy), .done(done),
        .kernel_wr_en(kernel_wr_en), .kernel_wr_bank(kernel_wr_bank),
        .kernel_wr_addr(kernel_wr_addr), .kernel_wr_data(kernel_wr_data),
        .kernel_select(kernel_select), .relu_enable(relu_enable),
        .pixel_in(pixel_in), .pixel_in_valid(pixel_in_valid), .pixel_req(pixel_req),
        .output_pixel(output_pixel), .output_valid(output_valid), .frame_done(frame_done)
    );
    always #(5.0/6.0) clk_in = ~clk_in;   // system clock period = 10 ns

    reg [7:0]  image_mem [0:TOTAL_PIX-1];
    reg [7:0]  kern_a [0:KERNEL_TAPS-1];
    reg [7:0]  kern_b [0:KERNEL_TAPS-1];
    reg [7:0]  kern_c [0:KERNEL_TAPS-1];
    reg [15:0] exp_a  [0:TOTAL_OUT-1];
    reg [15:0] exp_b  [0:TOTAL_OUT-1];
    reg [15:0] exp_c  [0:TOTAL_OUT-1];

    integer errors;
    integer stall_seed;
    integer stall_cycles;
    integer pix_sent;

    function [15:0] exp_val(input [1:0] which, input integer idx);
        case (which)
            2'd0:    exp_val = exp_a[idx];
            2'd1:    exp_val = exp_b[idx];
            default: exp_val = exp_c[idx];
        endcase
    endfunction

    function [7:0] kern_val(input [1:0] which, input integer idx);
        case (which)
            2'd0:    kern_val = kern_a[idx];
            2'd1:    kern_val = kern_b[idx];
            default: kern_val = kern_c[idx];
        endcase
    endfunction

    task init_and_reset;
        begin
            rst = 1; start = 0; kernel_wr_en = 0; kernel_wr_bank = 0; kernel_wr_addr = 0;
            kernel_wr_data = 0; kernel_select = 0; relu_enable = 0; pixel_in = 0; pixel_in_valid = 0;
            repeat (3) @(negedge clk);
            rst = 0;
            repeat (2) @(negedge clk);
        end
    endtask

    task load_kernel(input [0:0] bank, input [1:0] which);
        integer k;
        begin
            for (k = 0; k < KERNEL_TAPS; k = k + 1) begin
                @(negedge clk);
                kernel_wr_en = 1; kernel_wr_bank = bank; kernel_wr_addr = k[3:0];
                kernel_wr_data = $signed(kern_val(which, k));
            end
            @(negedge clk); kernel_wr_en = 0;
        end
    endtask

    // Taps 9..15 do not exist; kernel_storage must drop these writes rather
    // than alias them into real taps.
    task write_bad_addresses(input [0:0] bank);
        integer a;
        begin
            for (a = KERNEL_TAPS; a < 16; a = a + 1) begin
                @(negedge clk);
                kernel_wr_en = 1; kernel_wr_bank = bank; kernel_wr_addr = a[3:0];
                kernel_wr_data = (a[0]) ? 8'h7F : 8'h80;
            end
            @(negedge clk); kernel_wr_en = 0;
        end
    endtask

    // stall_pct: 0 = present a pixel on every pixel_req cycle; N = withhold
    // the pixel on ~N% of those cycles (seeded, reproducible).
    task run_pass(input [0:0] sel, input relu, input [1:0] which_exp,
                  input integer stall_pct, input integer out_file,
                  input [8*12-1:0] tag);
        integer i, o, cycles, pass_errors;
        reg give;
        begin
            kernel_select = sel; relu_enable = relu;
            @(negedge clk); start = 1;
            @(negedge clk); start = 0;

            i = 0; o = 0; cycles = 0; pass_errors = 0;
            while (o < TOTAL_OUT && cycles < PASS_TIMEOUT) begin
                @(negedge clk);
                cycles = cycles + 1;
                give = (i < TOTAL_PIX) && pixel_req;
                if (give && stall_pct > 0 && ({$random(stall_seed)} % 100) < stall_pct) begin
                    give = 0;
                    stall_cycles = stall_cycles + 1;
                end
                if (give) begin
                    pixel_in = image_mem[i]; pixel_in_valid = 1; i = i + 1;
                end else begin
                    pixel_in_valid = 0;
                end

                if (output_valid) begin
                    if (out_file != 0) $fdisplay(out_file, "%04x", output_pixel[15:0]);
                    if (output_pixel !== $signed(exp_val(which_exp, o))) begin
                        pass_errors = pass_errors + 1;
                        if (pass_errors <= 10)
                            $display("*** %0s MISMATCH #%0d: got=%0d expected=%0d ***",
                                     tag, o, output_pixel, $signed(exp_val(which_exp, o)));
                    end
                    o = o + 1;
                end
            end
            pixel_in_valid = 0;

            if (cycles >= PASS_TIMEOUT) begin
                pass_errors = pass_errors + 1;
                $display("*** %0s FAIL: timeout after %0d cycles, %0d/%0d outputs ***", tag, cycles, o, TOTAL_OUT);
            end
            if (i !== TOTAL_PIX) begin
                pass_errors = pass_errors + 1;
                $display("*** %0s FAIL: only %0d/%0d pixels sent ***", tag, i, TOTAL_PIX);
            end
            @(negedge clk);
            if (!frame_done) begin
                pass_errors = pass_errors + 1;
                $display("*** %0s FAIL: frame_done not asserted ***", tag);
            end
            // No extra output may appear after the frame completes.
            repeat (20) begin
                @(negedge clk);
                if (output_valid) begin
                    pass_errors = pass_errors + 1;
                    $display("*** %0s FAIL: output_valid after frame_done ***", tag);
                end
            end
            $display("%0s: %0d/%0d outputs checked, errors=%0d", tag, o, TOTAL_OUT, pass_errors);
            errors = errors + pass_errors;
            pix_sent = i;
        end
    endtask
