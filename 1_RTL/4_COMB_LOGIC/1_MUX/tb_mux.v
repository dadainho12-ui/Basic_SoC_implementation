`timescale 1ns / 1ps

module tb_mux;

reg [1:0]	i_sel		;
reg		i_tx0		;
reg		i_rx0		;
reg		i_pwm1		;
reg 		i_other_signal	;
wire		o_gpio_pin	;

mux dut (
.i_sel		(i_sel)		,
.i_tx0		(i_tx0)		,
.i_rx0		(i_rx0)		,
.i_pwm1		(i_pwm1)	,
.i_other_signal	(i_other_signal),
.o_gpio_pin	(o_gpio_pin)	
);

// dumpfile generation
initial begin
	$dumpfile("./mux.vcd")		;
	$dumpvars(0, tb_mux)	;
end

// apply stimulus
	//init
initial begin
	i_tx0 = 1'b0; i_rx0 = 1'b1; i_pwm1 = 1'b0; i_other_signal = 1'b1;

	i_sel = 2'b00; #10;
	i_sel = 2'b01; #10;
	i_sel = 2'b11; #10;
	i_sel = 2'b10; #10;

	$finish;
end

endmodule	
