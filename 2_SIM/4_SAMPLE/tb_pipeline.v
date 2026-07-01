`timescale 1ns / 1ps

module tb_pipeline;

reg clk;
reg rst;
reg [9:0] a;
reg [9:0] b;
reg [9:0] c;

wire [10:0] out1;
wire [11:0] out2;

pipeline uut (
    .clk(clk),
    .rst(rst),
    .a(a),
    .b(b),
    .c(c),
    .out1(out1),
    .out2(out2)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 0;
    a = 0;
    b = 0;
    c = 0;

    #20;
    rst = 1;

    #10;
    a = 10'd10;
    b = 10'd20;
    c = 10'd30;

    #10;
    a = 10'd100;
    b = 10'd200;
    c = 10'd300;

    #10;
    a = 10'd500;
    b = 10'd400;
    c = 10'd100;

    #10;
    a = 10'd1023;
    b = 10'd1023;
    c = 10'd1023;

    #50;
    $stop;
end

// Dumpfile generation
initial begin
	$dumpfile("./pipeline.vcd");
	$dumpvars(1, uut);
end


endmodule
