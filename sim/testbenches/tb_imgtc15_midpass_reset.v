`timescale 1ns/1ps
// =============================================================================
// IMG-TC15 - MIDPASS RESET
// -----------------------------------------------------------------------------
// A pass with kernel A is aborted by rst after half the image has streamed.
// Only control state is reset (data registers and LUTRAM kernels are not),
// so this checks a clean recovery: after rst the design must be idle with
// no output, and a fresh pass with kernel B (bank 1) must be bit-exact.
// Golden data: python/golden_model_image_flow.py (imgtc15_*.hex).
// =============================================================================
module tb_imgtc15_midpass_reset #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file, i, k;

    initial begin
        $readmemh("../results_hex/imgtc15_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc15_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc15_kernel_b.hex", kern_b);
        $readmemh("../results_hex/imgtc15_exp_b.hex",    exp_b);
        errors = 0; stall_seed = 15; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        // Aborted pass: stream half the image, then assert rst mid-stream.
        kernel_select = 0; relu_enable = 0;
        @(negedge clk); start = 1;
        @(negedge clk); start = 0;
        i = 0;
        while (i < TOTAL_PIX/2) begin
            @(negedge clk);
            if (pixel_req) begin pixel_in = image_mem[i]; pixel_in_valid = 1; i = i + 1; end
            else pixel_in_valid = 0;
        end
        @(negedge clk); pixel_in_valid = 0; rst = 1;
        repeat (3) @(negedge clk);
        rst = 0;
        for (k = 0; k < 10; k = k + 1) begin
            @(negedge clk);
            if (busy || output_valid || pixel_req || done || frame_done) begin
                errors = errors + 1;
                $display("*** IMG-TC15 FAIL: not idle after reset (busy=%0b valid=%0b req=%0b done=%0b frame_done=%0b) ***",
                         busy, output_valid, pixel_req, done, frame_done);
            end
        end
        $display("IMG-TC15: aborted pass after %0d/%0d pixels, reset, idle check done", i, TOTAL_PIX);

        load_kernel(1, 1);
        out_file = $fopen("../results_hex/imgtc15_hw_output.hex", "w");
        run_pass(1, 0, 1, 0, out_file, "IMG-TC15");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC15 MIDPASS RESET: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
