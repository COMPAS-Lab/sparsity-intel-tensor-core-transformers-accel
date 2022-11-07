module tensor_core_accu (
		input  wire        clk,                    //                    clk.clk
		input  wire        clr0,                   //                   clr0.clr
		input  wire        acc_en,                 //                 acc_en.acc_en
		input  wire        zero_en,                //                zero_en.zero_en
		input  wire [23:0] bf24_a1,                //                bf24_a1.data_in
		input  wire [31:0] cascade_data_in_col_1,  //  cascade_data_in_col_1.cascade_data_in
		output wire [31:0] cascade_data_out_col_1, // cascade_data_out_col_1.cascade_data_out
		input  wire [23:0] bf24_a2,                //                bf24_a2.data_in
		input  wire [31:0] cascade_data_in_col_2,  //  cascade_data_in_col_2.cascade_data_in
		output wire [31:0] cascade_data_out_col_2, // cascade_data_out_col_2.cascade_data_out
		input  wire [23:0] bf24_a3,                //                bf24_a3.data_in
		input  wire [31:0] cascade_data_in_col_3,  //  cascade_data_in_col_3.cascade_data_in
		output wire [31:0] cascade_data_out_col_3, // cascade_data_out_col_3.cascade_data_out
		output wire [23:0] bf24_col_1,             //             bf24_col_1.result_l
		output wire [23:0] bf24_col_2,             //             bf24_col_2.result_l,result_h
		output wire [23:0] bf24_col_3              //             bf24_col_3.result_h
	);
endmodule

