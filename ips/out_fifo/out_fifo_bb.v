module out_fifo (
		input  wire [431:0] data,  //  fifo_input.datain
		input  wire         wrreq, //            .wrreq
		input  wire         rdreq, //            .rdreq
		input  wire         clock, //            .clk
		output wire [431:0] q,     // fifo_output.dataout
		output wire         full,  //            .full
		output wire         empty  //            .empty
	);
endmodule

