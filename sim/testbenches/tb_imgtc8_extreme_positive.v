`timescale 1ns/1ps
// =============================================================================
// IMG-TC8 - EXTREME POSITIVE
// -----------------------------------------------------------------------------
// Every weight is +127 on an all-255 image: the largest positive
// accumulator value the datapath can ever see (9*255*127).
// Golden data: python/golden_model_image_flow.py (imgtc8_*.hex).
// =============================================================================
module tb_imgtc8_extreme_positive #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc8_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc8_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc8_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 8; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc8_hw_output.hex", "w");
        run_pass(0, 0, 0, 0, out_file, "IMG-TC8");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC8 EXTREME POSITIVE: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
