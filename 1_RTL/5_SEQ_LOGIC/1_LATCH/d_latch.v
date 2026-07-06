`timescale 1ns/1ps

module d_latch(
	i_d,
	 clk,
	_q  
);

input [31:0] i_d	;
input clk ;
output [31:0] o_q 	;


reg [31:0] o_q;
always@(*) begin
	if (clk) begin
		o_q <= i_d ;
	end
end


endmodule
