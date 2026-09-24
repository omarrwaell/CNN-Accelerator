`timescale 1ns/1ps
// =============================================================================
// IMG-TC12 - RANDOM KERNEL
// -----------------------------------------------------------------------------
// Seeded random signed kernel on the input image.
// Golden data: python/golden_model_image_flow.py (imgtc12_*.hex).
// =============================================================================
module tb_imgtc12_random_kernel #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc12_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc12_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc12_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 12; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc12_hw_output.hex", "w");
        run_pass(0, 0, 0, 0, out_file, "IMG-TC12");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC12 RANDOM KERNEL: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
