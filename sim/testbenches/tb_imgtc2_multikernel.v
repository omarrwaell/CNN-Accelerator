`timescale 1ns/1ps
module tb_imgtc2_multikernel #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
    parameter TOTAL_PIX = IMG_WIDTH*IMG_WIDTH;
    parameter OUT_WIDTH_PIX = IMG_WIDTH-KERNEL_SIZE+1;
    parameter TOTAL_OUT = OUT_WIDTH_PIX*OUT_WIDTH_PIX;
    parameter KERNEL_TAPS = KERNEL_SIZE*KERNEL_SIZE;

    // 6x multi-pumped DUT: drive the 6x reference clock, and run all stimulus
    // and checks on the system clock the DUT derives from it (clk_in / 6).
    reg  clk_in = 0;
    wire clk = dut.clk_sys;
    reg rst, start, kernel_wr_en, relu_enable;
    reg [0:0] kernel_wr_bank, kernel_select;
    reg [3:0] kernel_wr_addr;
    reg signed [7:0] kernel_wr_data;
    reg [7:0] pixel_in;
    reg pixel_in_valid;
    wire busy, done, pixel_req;
    wire signed [15:0] output_pixel;
    wire output_valid, frame_done;

    cnn_accelerator_top #(.IMG_WIDTH(IMG_WIDTH), .NUM_KERNELS(2)) dut (
        .clk(clk_in), .rst(rst), .start(start), .busy(busy), .done(done),
        .kernel_wr_en(kernel_wr_en), .kernel_wr_bank(kernel_wr_bank),
        .kernel_wr_addr(kernel_wr_addr), .kernel_wr_data(kernel_wr_data),
        .kernel_select(kernel_select), .relu_enable(relu_enable),
        .pixel_in(pixel_in), .pixel_in_valid(pixel_in_valid), .pixel_req(pixel_req),
        .output_pixel(output_pixel), .output_valid(output_valid), .frame_done(frame_done)
    );
    always #(5.0/6.0) clk_in = ~clk_in;   // system clock period = 10 ns

    reg [7:0]  image_mem [0:TOTAL_PIX-1];
    reg [7:0]  gx_mem [0:KERNEL_TAPS-1], gy_mem [0:KERNEL_TAPS-1];
    reg [15:0] exp_gx [0:TOTAL_OUT-1], exp_gy [0:TOTAL_OUT-1];
    integer i, o, errors;
    integer gx_out_file, gy_out_file;

    task load_kernel(input [0:0] bank, input use_gy);
        integer k;
        begin
            for (k = 0; k < KERNEL_TAPS; k = k + 1) begin
                @(negedge clk);
                kernel_wr_en = 1; kernel_wr_bank = bank; kernel_wr_addr = k[3:0];
                kernel_wr_data = use_gy ? $signed(gy_mem[k]) : $signed(gx_mem[k]);
            end
            @(negedge clk); kernel_wr_en = 0;
        end
    endtask

    task run_pass(input [0:0] sel, input use_gy_exp, input integer pass_num, input integer out_file);
        begin
            $display("--- IMG-TC2 PASS %0d: kernel_select=%0d ---", pass_num, sel);
            kernel_select = sel;
            @(negedge clk); start = 1;
            @(negedge clk); start = 0;

            i = 0; o = 0;
            while (o < TOTAL_OUT) begin
                @(negedge clk);
                if (i < TOTAL_PIX && pixel_req) begin
                    pixel_in = image_mem[i]; pixel_in_valid = 1; i = i + 1;
                end else pixel_in_valid = 0;

                if (output_valid) begin
                    $fdisplay(out_file, "%04x", output_pixel[15:0]);
                    if ((use_gy_exp && output_pixel !== $signed(exp_gy[o])) ||
                        (!use_gy_exp && output_pixel !== $signed(exp_gx[o]))) begin
                        errors = errors + 1;
                        if (errors <= 10)
                            $display("*** PASS %0d MISMATCH #%0d: got=%0d ***", pass_num, o, output_pixel);
                    end
                    o = o + 1;
                end
            end

            if (i !== TOTAL_PIX) begin errors = errors + 1; $display("*** FAIL pass %0d: only %0d/%0d pixels sent ***", pass_num, i, TOTAL_PIX); end
            else $display("PASS %0d: all %0d pixels sent", pass_num, TOTAL_PIX);

            @(negedge clk);
            if (!frame_done) begin errors = errors + 1; $display("*** FAIL pass %0d: frame_done not asserted ***", pass_num); end
            else $display("PASS %0d: frame_done asserted", pass_num);
        end
    endtask

    initial begin
        $readmemh("../results_hex/imgtc2_image.hex",     image_mem);
        $readmemh("../results_hex/imgtc2_gx_kernel.hex", gx_mem);
        $readmemh("../results_hex/imgtc2_gy_kernel.hex", gy_mem);
        $readmemh("../results_hex/imgtc2_exp_gx.hex",    exp_gx);
        $readmemh("../results_hex/imgtc2_exp_gy.hex",    exp_gy);

        rst=1; start=0; kernel_wr_en=0; kernel_wr_bank=0; kernel_wr_addr=0;
        kernel_wr_data=0; kernel_select=0; relu_enable=0; pixel_in=0; pixel_in_valid=0;
        errors = 0;

        repeat (3) @(negedge clk);
        rst = 0;
        repeat (2) @(negedge clk);

        load_kernel(0, 0);
        load_kernel(1, 1);

        gx_out_file = $fopen("../results_hex/imgtc2_hw_gx.hex", "w");
        gy_out_file = $fopen("../results_hex/imgtc2_hw_gy.hex", "w");

        run_pass(0, 0, 1, gx_out_file);
        run_pass(1, 1, 2, gy_out_file);

        $fclose(gx_out_file);
        $fclose(gy_out_file);

        $display("------------------------------------------");
        $display("IMG-TC2 MULTI-KERNEL: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
