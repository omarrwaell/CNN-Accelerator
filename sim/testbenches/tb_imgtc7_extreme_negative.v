`timescale 1ns/1ps
// =============================================================================
// IMG-TC7 - EXTREME NEGATIVE
// -----------------------------------------------------------------------------
// Every weight is -128 (Q3.4 -8.0) on a noise image: each packed DSP lane
// holds its most negative high weight next to a negative low weight.
// Golden data: python/golden_model_image_flow.py (imgtc7_*.hex).
// =============================================================================
module tb_imgtc7_extreme_negative #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc7_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc7_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc7_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 7; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc7_hw_output.hex", "w");
        run_pass(0, 0, 0, 0, out_file, "IMG-TC7");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC7 EXTREME NEGATIVE: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
