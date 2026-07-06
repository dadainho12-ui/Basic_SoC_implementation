`timescale 1ns/1ps

module tb_d_latch();

reg [31:0]	i_d	;
reg		clk	;
wire[31:0]	o_q	;

d_latch DUT(
	.i_d	(i_d),
	.clk	(clk),
	.o_q	(o_q),
);

always #5 clk = ~clk

initial begin
	clk = 1'b0	;
	i_d = 32'b0	;
	
	#15 i_d=32'b1; #20 i_d=32'b0;
	#10 i_d=32'b1; #20 i_d=32'b0;
	#15 i_d=32'b1; #20 i_d=32'b0;
			
	#50; finish;

end

endmodule

	
