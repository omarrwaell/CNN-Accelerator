`timescale 1ns/1ps
// =============================================================================
// IMG-TC11 - ROUNDING
// -----------------------------------------------------------------------------
// All weights = 1 (1/16): output = round-half-up(sum of 9 pixels / 16),
// which exercises M5's rounding on many exact .5 ties.
// Golden data: python/golden_model_image_flow.py (imgtc11_*.hex).
// =============================================================================
module tb_imgtc11_rounding #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc11_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc11_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc11_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 11; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc11_hw_output.hex", "w");
        run_pass(0, 0, 0, 0, out_file, "IMG-TC11");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC11 ROUNDING: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
