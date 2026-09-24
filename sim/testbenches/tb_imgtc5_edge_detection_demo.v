`timescale 1ns/1ps
module tb_imgtc5_edge_detection_demo #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
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

    integer gx_out_file, gy_out_file;
    integer i, o, errors;

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

    task run_pass(input [0:0] sel, input integer out_file, input is_gx);
        begin
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
                    if (is_gx) begin
                        if (output_pixel !== $signed(exp_gx[o])) errors = errors + 1;
                    end else begin
                        if (output_pixel !== $signed(exp_gy[o])) errors = errors + 1;
                    end
                    o = o + 1;
                end
            end
            @(negedge clk);
        end
    endtask

    initial begin
        $readmemh("../results_hex/imgtc5_image.hex",     image_mem);
        $readmemh("../results_hex/imgtc5_gx_kernel.hex", gx_mem);
        $readmemh("../results_hex/imgtc5_gy_kernel.hex", gy_mem);
        $readmemh("../results_hex/imgtc5_exp_gx.hex",    exp_gx);
        $readmemh("../results_hex/imgtc5_exp_gy.hex",    exp_gy);

        rst=1; start=0; kernel_wr_en=0; kernel_wr_bank=0; kernel_wr_addr=0;
        kernel_wr_data=0; kernel_select=0; relu_enable=0; pixel_in=0; pixel_in_valid=0;
        errors = 0;

        repeat (3) @(negedge clk);
        rst = 0;
        repeat (2) @(negedge clk);

        load_kernel(0, 0);
        load_kernel(1, 1);

        gx_out_file = $fopen("../results_hex/imgtc5_hw_gx.hex", "w");
        gy_out_file = $fopen("../results_hex/imgtc5_hw_gy.hex", "w");

        $display("=== IMG-TC5: Running Gx pass through real RTL ===");
        run_pass(0, gx_out_file, 1);
        $display("=== IMG-TC5: Running Gy pass through real RTL ===");
        run_pass(1, gy_out_file, 0);

        $fclose(gx_out_file);
        $fclose(gy_out_file);

        $display("------------------------------------------");
        $display("IMG-TC5 EDGE-DETECTION DEMO: TOTAL ERRORS vs golden model: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
