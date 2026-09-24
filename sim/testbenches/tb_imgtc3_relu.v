`timescale 1ns/1ps
module tb_imgtc3_relu #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
    parameter TOTAL_PIX = IMG_WIDTH*IMG_WIDTH;
    parameter OUT_WIDTH_PIX = IMG_WIDTH-KERNEL_SIZE+1;
    parameter TOTAL_OUT = OUT_WIDTH_PIX*OUT_WIDTH_PIX;
    parameter KERNEL_TAPS = KERNEL_SIZE*KERNEL_SIZE;

    // 6x multi-pumped DUT: drive the 6x reference clock, and run all stimulus
    // and checks on the system clock the DUT derives from it (clk_in / 6).
    reg  clk_in = 0;
    wire clk = dut.clk_sys;
    reg rst, start, kernel_wr_en, kernel_select, relu_enable;
    reg [0:0] kernel_wr_bank;
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

    reg [7:0]  image_mem  [0:TOTAL_PIX-1];
    reg [7:0]  kernel_mem [0:KERNEL_TAPS-1];
    reg [15:0] exp_norelu [0:TOTAL_OUT-1];
    reg [15:0] exp_relu   [0:TOTAL_OUT-1];
    integer i, o, errors;
    integer out_file_norelu, out_file_relu;

    task run_pass(input use_relu, input integer pass_num, input integer out_file);
        begin
            $display("--- IMG-TC3 PASS %0d: relu_enable=%0d ---", pass_num, use_relu);
            relu_enable = use_relu;
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
                    if ((use_relu && output_pixel !== $signed(exp_relu[o])) ||
                        (!use_relu && output_pixel !== $signed(exp_norelu[o]))) begin
                        errors = errors + 1;
                        if (errors <= 10)
                            $display("*** PASS %0d MISMATCH #%0d: got=%0d ***", pass_num, o, output_pixel);
                    end
                    if (use_relu && output_pixel < 0) begin
                        errors = errors + 1;
                        $display("*** RELU FAIL: negative value %0d escaped at #%0d ***", output_pixel, o);
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
        $readmemh("../results_hex/imgtc3_image.hex",       image_mem);
        $readmemh("../results_hex/imgtc3_kernel.hex",      kernel_mem);
        $readmemh("../results_hex/imgtc3_exp_norelu.hex",  exp_norelu);
        $readmemh("../results_hex/imgtc3_exp_relu.hex",    exp_relu);

        rst=1; start=0; kernel_wr_en=0; kernel_wr_bank=0; kernel_wr_addr=0;
        kernel_wr_data=0; kernel_select=0; relu_enable=0; pixel_in=0; pixel_in_valid=0;
        errors = 0;

        repeat (3) @(negedge clk);
        rst = 0;
        repeat (2) @(negedge clk);

        for (i = 0; i < KERNEL_TAPS; i = i + 1) begin
            @(negedge clk);
            kernel_wr_en = 1; kernel_wr_bank = 0; kernel_wr_addr = i[3:0];
            kernel_wr_data = $signed(kernel_mem[i]);
        end
        @(negedge clk); kernel_wr_en = 0; kernel_select = 0;

        out_file_norelu = $fopen("../results_hex/imgtc3_hw_norelu.hex", "w");
        out_file_relu   = $fopen("../results_hex/imgtc3_hw_relu.hex", "w");

        run_pass(0, 1, out_file_norelu);
        run_pass(1, 2, out_file_relu);

        $fclose(out_file_norelu);
        $fclose(out_file_relu);

        $display("------------------------------------------");
        $display("IMG-TC3 RELU BONUS: TOTAL ERRORS: %0d", errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
