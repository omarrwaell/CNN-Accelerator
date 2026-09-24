`timescale 1ns/1ps
// =============================================================================
// IMG-TC10 - IDENTITY
// -----------------------------------------------------------------------------
// Identity kernel (centre = 16 = 1.0 in Q3.4): every output must equal
// the centre pixel of its window exactly.
// Golden data: python/golden_model_image_flow.py (imgtc10_*.hex).
// =============================================================================
module tb_imgtc10_identity #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc10_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc10_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc10_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 10; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc10_hw_output.hex", "w");
        run_pass(0, 0, 0, 0, out_file, "IMG-TC10");
        $fclose(out_file);

        $display("------------------------------------------");
        $display("IMG-TC10 IDENTITY: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
