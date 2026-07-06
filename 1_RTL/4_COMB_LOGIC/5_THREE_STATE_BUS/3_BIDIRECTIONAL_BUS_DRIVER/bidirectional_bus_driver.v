`timescale 1ns/1ps

module bidirectional_bus_driver (
	// port lis
	i_data_to_bus	,
	i_send		,
	i_rcv		,
	io_bus_data	,
	o_data_from_bus
);

// port declaration
	input	[7:0]	i_data_to_bus	;
	input 		i_send		;
	input		i_rcv		;
	inout	[7:0]	io_bus_data	;
	output	[7:0]	o_data_from_bus	;

// modeling : 3-state buffer
	assign io_bus_data		= (i_send) ? i_data_to_bus 	: 8'bz		;


	assign o_data_from_bus		= (i_rcv ) ? io_bus_data 	: 8'b0		;

// modeling : data receive logic
//	reg	[7:0] o_data_from_bus		;
//	always @(*) begin
//		if (i_rcv) begin
//			o_data_from_bus = io_bus_data	;
//		end else begin
//			o_data_from_bus = 8'b0		; //default
//		end
//	end

endmodule
	

