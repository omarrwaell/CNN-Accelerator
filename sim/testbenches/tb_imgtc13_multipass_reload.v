`timescale 1ns/1ps
// =============================================================================
// IMG-TC13 - MULTIPASS RELOAD
// -----------------------------------------------------------------------------
// Three back-to-back passes with no reset between them:
//   pass 1: bank 0 = kernel A (Sobel Gx)
//   pass 2: bank 1 = kernel B (Laplacian)
//   pass 3: bank 0 reloaded with kernel C (sharpen) while the FSM sits in DONE
// Checks that no partial sum, FIFO entry or old weight leaks between passes.
// Golden data: python/golden_model_image_flow.py (imgtc13_*.hex).
// =============================================================================
module tb_imgtc13_multipass_reload #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer f1, f2, f3;

    initial begin
        $readmemh("../results_hex/imgtc13_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc13_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc13_kernel_b.hex", kern_b);
        $readmemh("../results_hex/imgtc13_kernel_c.hex", kern_c);
        $readmemh("../results_hex/imgtc13_exp_a.hex",    exp_a);
        $readmemh("../results_hex/imgtc13_exp_b.hex",    exp_b);
        $readmemh("../results_hex/imgtc13_exp_c.hex",    exp_c);
        errors = 0; stall_seed = 13; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);
        load_kernel(1, 1);

        f1 = $fopen("../results_hex/imgtc13_hw_pass1.hex", "w");
        f2 = $fopen("../results_hex/imgtc13_hw_pass2.hex", "w");
        f3 = $fopen("../results_hex/imgtc13_hw_pass3.hex", "w");

        run_pass(0, 0, 0, 0, f1, "IMG-TC13 P1");
        run_pass(1, 0, 1, 0, f2, "IMG-TC13 P2");
        load_kernel(0, 2);
        run_pass(0, 0, 2, 0, f3, "IMG-TC13 P3");

        $fclose(f1); $fclose(f2); $fclose(f3);

        $display("------------------------------------------");
        $display("IMG-TC13 MULTIPASS RELOAD: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
