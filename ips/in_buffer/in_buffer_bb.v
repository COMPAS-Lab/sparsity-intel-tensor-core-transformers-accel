module in_buffer (
		input  wire [87:0] data,      //      data.datain
		output wire [87:0] q,         //         q.dataout
		input  wire [6:0]  wraddress, // wraddress.wraddress
		input  wire [6:0]  rdaddress, // rdaddress.rdaddress
		input  wire        wren,      //      wren.wren
		input  wire        clock      //     clock.clk
	);
endmodule

