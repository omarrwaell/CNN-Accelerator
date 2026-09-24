`timescale 1ns/1ps
// =============================================================================
// IMG-TC9 - LANE MIX
// -----------------------------------------------------------------------------
// Mixed extreme weights (-128/127/-1/0/1) on a noise image, arranged so
// each packed DSP sees a different high/low lane sign combination.
// Golden data: python/golden_model_image_flow.py (imgtc9_*.hex).
// =============================================================================
module tb_imgtc9_lane_mix #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc9_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc9_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc9_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 9; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc9_hw_output.hex", "w");
        run_pass(0, 0, 0, 0, out_file, "IMG-TC9");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC9 LANE MIX: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
