module tensor_core_start_bf12 (
		input  wire        clk,                    //                    clk.clk
		input  wire        clr0,                   //                   clr0.clr
		input  wire        clr1,                   //                   clr1.clr
		input  wire [1:0]  feed_sel,               //               feed_sel.feed_sel
		input  wire        load_bb_one,            //            load_bb_one.load_bb_one
		input  wire        load_bb_two,            //            load_bb_two.load_bb_two
		input  wire        load_buf_sel,           //           load_buf_sel.load_buf_sel
		input  wire [3:0]  data_in_1,              //              data_in_1.data_in
		input  wire [3:0]  data_in_2,              //              data_in_2.data_in
		input  wire [3:0]  data_in_3,              //              data_in_3.data_in
		input  wire [3:0]  data_in_4,              //              data_in_4.data_in
		input  wire [3:0]  data_in_5,              //              data_in_5.data_in
		input  wire [3:0]  data_in_6,              //              data_in_6.data_in
		input  wire [3:0]  data_in_7,              //              data_in_7.data_in
		input  wire [3:0]  data_in_8,              //              data_in_8.data_in
		input  wire [3:0]  data_in_9,              //              data_in_9.data_in
		input  wire [3:0]  data_in_10,             //             data_in_10.data_in
		input  wire [3:0]  data_in_11,             //             data_in_11.data_in
		input  wire [3:0]  data_in_12,             //             data_in_12.data_in
		input  wire [3:0]  data_in_13,             //             data_in_13.data_in
		input  wire [3:0]  data_in_14,             //             data_in_14.data_in
		input  wire [3:0]  data_in_15,             //             data_in_15.data_in
		input  wire [3:0]  data_in_16,             //             data_in_16.data_in
		input  wire [3:0]  data_in_17,             //             data_in_17.data_in
		input  wire [3:0]  data_in_18,             //             data_in_18.data_in
		input  wire [3:0]  data_in_19,             //             data_in_19.data_in
		input  wire [3:0]  data_in_20,             //             data_in_20.data_in
		input  wire [3:0]  side_in_1,              //              side_in_1.data_in
		input  wire [3:0]  side_in_2,              //              side_in_2.data_in
		input  wire [3:0]  side_in_3,              //              side_in_3.data_in
		input  wire [3:0]  side_in_4,              //              side_in_4.data_in
		input  wire [7:0]  shared_exponent_data,   //   shared_exponent_data.shared_exponent
		input  wire [87:0] cascade_weight_in,      //      cascade_weight_in.cascade_weight_in
		output wire [87:0] cascade_weight_out,     //     cascade_weight_out.cascade_weight_out
		output wire [31:0] cascade_data_out_col_1, // cascade_data_out_col_1.cascade_data_out
		output wire [31:0] cascade_data_out_col_2, // cascade_data_out_col_2.cascade_data_out
		output wire [31:0] cascade_data_out_col_3, // cascade_data_out_col_3.cascade_data_out
		output wire [23:0] bf24_col_1,             //             bf24_col_1.result_l
		output wire [23:0] bf24_col_2,             //             bf24_col_2.result_l,result_h
		output wire [23:0] bf24_col_3              //             bf24_col_3.result_h
	);
endmodule

