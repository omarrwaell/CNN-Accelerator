`timescale 1ns/1ps
// =============================================================================
// IMG-TC14 - RANDOM STALL
// -----------------------------------------------------------------------------
// Laplacian kernel with ~30% of pixel_req cycles withheld at random:
// the transposed MAC's partial sums must advance only on accepted pixels.
// Golden data: python/golden_model_image_flow.py (imgtc14_*.hex).
// =============================================================================
module tb_imgtc14_random_stall #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer out_file;

    initial begin
        $readmemh("../results_hex/imgtc14_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc14_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc14_exp_a.hex",    exp_a);
        errors = 0; stall_seed = 14; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);

        out_file = $fopen("../results_hex/imgtc14_hw_output.hex", "w");
        run_pass(0, 0, 0, 30, out_file, "IMG-TC14");
        $fclose(out_file);
        $display("IMG-TC14: %0d stall cycles injected", stall_cycles);
        if (stall_cycles == 0) begin
            errors = errors + 1;
            $display("*** IMG-TC14 FAIL: no stalls were injected ***");
        end

        $display("------------------------------------------");
        $display("IMG-TC14 RANDOM STALL: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
