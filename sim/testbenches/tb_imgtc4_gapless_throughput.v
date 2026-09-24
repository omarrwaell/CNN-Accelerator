`timescale 1ns/1ps
module tb_imgtc4_gapless_throughput #(parameter IMG_WIDTH = 32, parameter KERNEL_SIZE = 3);
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

    integer i, o, errors, gaps;
    integer release_started;

    initial begin
        $readmemh("../results_hex/imgtc4_image.hex",    image_mem);
        $readmemh("../results_hex/imgtc4_kernel.hex",   kernel_mem);
        $readmemh("../results_hex/imgtc4_expected.hex", expected_mem);

        rst=1; start=0; kernel_wr_en=0; kernel_wr_bank=0; kernel_wr_addr=0;
        kernel_wr_data=0; kernel_select=0; relu_enable=0; pixel_in=0; pixel_in_valid=0;
        errors = 0; gaps = 0; release_started = 0;

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

        i = 0; o = 0;
        while (o < TOTAL_OUT) begin
            @(negedge clk);
            if (i < TOTAL_PIX && pixel_req) begin
                pixel_in = image_mem[i]; pixel_in_valid = 1; i = i + 1;
            end else pixel_in_valid = 0;

            if (release_started && o < TOTAL_OUT && !output_valid) begin
                gaps = gaps + 1;
                if (gaps <= 5) $display("*** GAP detected before output #%0d ***", o);
            end

            if (output_valid) begin
                if (!release_started) begin
                    release_started = 1;
                    $display("Release began at output #0");
                end
                if (output_pixel !== $signed(expected_mem[o])) begin
                    errors = errors + 1;
                    if (errors <= 10)
                        $display("*** MISMATCH #%0d: got=%0d expected=%0d ***", o, output_pixel, $signed(expected_mem[o]));
                end
                o = o + 1;
            end
        end

        if (i !== TOTAL_PIX) begin errors = errors + 1; $display("*** FAIL: only %0d/%0d pixels sent ***", i, TOTAL_PIX); end
        else $display("PASS: all %0d pixels sent", TOTAL_PIX);

        @(negedge clk);
        if (!frame_done) begin errors = errors + 1; $display("*** FAIL: frame_done not asserted ***"); end
        else $display("PASS: frame_done asserted");

        if (gaps > 0) begin
            errors = errors + 1;
            $display("*** FAIL: %0d gap(s) detected -- NOT gapless ***", gaps);
        end else
            $display("PASS: zero gaps -- sustained 1 pixel/cycle confirmed across all %0d outputs", TOTAL_OUT);

        $display("------------------------------------------");
        $display("IMG-TC4 GAPLESS THROUGHPUT: %0d/%0d outputs checked, gaps=%0d, TOTAL ERRORS: %0d", o, TOTAL_OUT, gaps, errors);
        $display("------------------------------------------");
        $stop;
    end
endmodule
