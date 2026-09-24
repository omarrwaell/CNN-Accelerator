`timescale 1ns/1ps
module tb_imgtc6_stall_handling #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
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

    reg [7:0]  image_mem    [0:TOTAL_PIX-1];
    reg [7:0]  kernel_mem   [0:KERNEL_TAPS-1];
    reg [15:0] expected_mem [0:TOTAL_OUT-1];

    integer i, o, errors;
    integer stall_remaining, stall1_done, stall2_done;
    integer stall_cycles_injected;
    integer hw_out_file;
    integer stall1_point, stall2_point;

    initial begin
        $readmemh("../results_hex/imgtc6_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc6_kernel.hex",   kernel_mem);
        $readmemh("../results_hex/imgtc6_expected.hex", expected_mem);

        rst=1; start=0; kernel_wr_en=0; kernel_wr_bank=0; kernel_wr_addr=0;
        kernel_wr_data=0; kernel_select=0; relu_enable=0; pixel_in=0; pixel_in_valid=0;
        errors = 0; stall_remaining = 0; stall1_done = 0; stall2_done = 0;
        stall_cycles_injected = 0;
        // Scale the two stall injection points with image size instead of
        // fixed pixel indices, so small images still exercise both stalls.
        stall1_point = TOTAL_PIX / 20;   // ~5% in
        stall2_point = TOTAL_PIX / 2;    // ~50% in
        if (stall1_point < 1) stall1_point = 1;
        if (stall2_point <= stall1_point) stall2_point = stall1_point + 1;

        repeat (3) @(negedge clk);
        rst = 0;
        repeat (2) @(negedge clk);

        for (i = 0; i < KERNEL_TAPS; i = i + 1) begin
            @(negedge clk);
            kernel_wr_en = 1; kernel_wr_bank = 0; kernel_wr_addr = i[3:0];
            kernel_wr_data = $signed(kernel_mem[i]);
        end
        @(negedge clk); kernel_wr_en = 0; kernel_select = 0;

        @(negedge clk); start = 1;
        @(negedge clk); start = 0;

        hw_out_file = $fopen("../results_hex/imgtc6_hw_output.hex", "w");

        // Single loop, stall via a simple countdown -- proven-safe pattern.
        i = 0; o = 0;
        while (o < TOTAL_OUT) begin
            @(negedge clk);

            if (i == stall1_point && !stall1_done) begin
                $display("--- stall #1: withholding pixel_in_valid for 6 cycles at pixel #%0d ---", stall1_point);
                stall_remaining = 6;
                stall1_done = 1;
            end
            if (i == stall2_point && !stall2_done) begin
                $display("--- stall #2: withholding pixel_in_valid for 6 cycles at pixel #%0d ---", stall2_point);
                stall_remaining = 6;
                stall2_done = 1;
            end

            if (stall_remaining > 0) begin
                pixel_in_valid = 0;
                stall_remaining = stall_remaining - 1;
                stall_cycles_injected = stall_cycles_injected + 1;
            end
            else if (i < TOTAL_PIX && pixel_req) begin
                pixel_in = image_mem[i]; pixel_in_valid = 1; i = i + 1;
            end else begin
                pixel_in_valid = 0;
            end

            if (output_valid) begin
                $fdisplay(hw_out_file, "%04x", output_pixel[15:0]);
                if (output_pixel !== $signed(expected_mem[o])) begin
                    errors = errors + 1;
                    if (errors <= 10)
                        $display("*** MISMATCH #%0d: got=%0d expected=%0d ***", o, output_pixel, $signed(expected_mem[o]));
                end
                o = o + 1;
            end
        end
        $fclose(hw_out_file);

        if (i !== TOTAL_PIX) begin errors = errors + 1; $display("*** FAIL: only %0d/%0d pixels sent ***", i, TOTAL_PIX); end
        else $display("PASS: all %0d pixels sent despite %0d stall cycles", TOTAL_PIX, stall_cycles_injected);

        @(negedge clk);
        if (!frame_done) begin errors = errors + 1; $display("*** FAIL: frame_done not asserted ***"); end
        else $display("PASS: frame_done asserted");

        $display("------------------------------------------");
        $display("IMG-TC6 STALL HANDLING: %0d/%0d outputs checked, stall cycles=%0d, TOTAL ERRORS: %0d",
                   o, TOTAL_OUT, stall_cycles_injected, errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
