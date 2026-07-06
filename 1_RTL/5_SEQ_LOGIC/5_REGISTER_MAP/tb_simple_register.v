`timescale 1ns / 1ps
module tb_simple_register;

reg		clk	;
reg		rst_n	;
reg		wen	;
reg	[31:0]	i_wdata	;
wire 	[31:0]	o_rdata	;

// DUT instantiation
simple_register uut(
	.clk		(clk		),
	.rst_n		(rst_n		),
	.wen		(wen		),
	.i_wdata	(i_wdata	),
	.o_rdata	(o_rdata	)
);

// clock gen

initial begin
	clk = 0;
	forever #5 clk = ~clk; //10ns(100MHz)
end

initial begin	

	
