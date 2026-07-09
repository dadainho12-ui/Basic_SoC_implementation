`timescale 1ns / 1ps

module tb_traffic_light ();

// signal def
	//stimulus signal
reg clk		;
reg rst_n	;
	//monitor signal
wire o_red	;
wire o_left	;
wire o_green	;
wire o_yellow	;

// DUT instantiation
traffic_light dut (
    .clk        (clk		),
    .rst_n      (rst_n		),
    .o_red      (o_red		),
    .o_left     (o_left		),
    .o_green    (o_green	),
    .o_yellow   (o_yellow	)
);

// clock generation
always #5 clk = ~clk;   // 10ns period

// stimulus
initial begin
    clk   = 1'b0;
    rst_n = 1'b0;

   
    #20;
    rst_n = 1'b1;

    #190;

    $stop;
end

endmodule
