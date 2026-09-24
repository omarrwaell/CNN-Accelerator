`timescale 1ns/1ps
// =============================================================================
// IMG-TC16 - BANK SWITCH, RELU, INVALID ADDRESSES
// -----------------------------------------------------------------------------
// bank 0 = kernel A (sharpen), bank 1 = kernel B (emboss). Junk is then
// written to the non-existent taps 9..15 of both banks; kernel_storage must
// ignore it. Pass 1 runs bank 1 with ReLU on, pass 2 runs bank 0 with ReLU
// off, so the bank mux and ReLU are both switched between passes.
// Golden data: python/golden_model_image_flow.py (imgtc16_*.hex).
// =============================================================================
module tb_imgtc16_bank_relu_badaddr #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
`include "tb_img_common.vh"

    integer f1, f2;

    initial begin
        $readmemh("../results_hex/imgtc16_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc16_kernel_a.hex", kern_a);
        $readmemh("../results_hex/imgtc16_kernel_b.hex", kern_b);
        $readmemh("../results_hex/imgtc16_exp_a.hex",    exp_a);   // A, ReLU off
        $readmemh("../results_hex/imgtc16_exp_b.hex",    exp_b);   // B, ReLU on
        errors = 0; stall_seed = 16; stall_cycles = 0;

        init_and_reset;
        load_kernel(0, 0);
        load_kernel(1, 1);
        write_bad_addresses(0);
        write_bad_addresses(1);

        f1 = $fopen("../results_hex/imgtc16_hw_bank1_relu.hex", "w");
        f2 = $fopen("../results_hex/imgtc16_hw_bank0.hex", "w");
        run_pass(1, 1, 1, 0, f1, "IMG-TC16 P1");
        run_pass(0, 0, 0, 0, f2, "IMG-TC16 P2");
        $fclose(f1); $fclose(f2);

        $display("------------------------------------------");
        $display("IMG-TC16 BANK/RELU/BADADDR: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
