	tensor_core_accu u0 (
		.clk                    (_connected_to_clk_),                    //   input,   width = 1,                    clk.clk
		.acc_en                 (_connected_to_acc_en_),                 //   input,   width = 1,                 acc_en.acc_en
		.zero_en                (_connected_to_zero_en_),                //   input,   width = 1,                zero_en.zero_en
		.bf24_a1                (_connected_to_bf24_a1_),                //   input,  width = 24,                bf24_a1.data_in
		.cascade_data_in_col_1  (_connected_to_cascade_data_in_col_1_),  //   input,  width = 32,  cascade_data_in_col_1.cascade_data_in
		.cascade_data_out_col_1 (_connected_to_cascade_data_out_col_1_), //  output,  width = 32, cascade_data_out_col_1.cascade_data_out
		.bf24_a2                (_connected_to_bf24_a2_),                //   input,  width = 24,                bf24_a2.data_in
		.cascade_data_in_col_2  (_connected_to_cascade_data_in_col_2_),  //   input,  width = 32,  cascade_data_in_col_2.cascade_data_in
		.cascade_data_out_col_2 (_connected_to_cascade_data_out_col_2_), //  output,  width = 32, cascade_data_out_col_2.cascade_data_out
		.bf24_a3                (_connected_to_bf24_a3_),                //   input,  width = 24,                bf24_a3.data_in
		.cascade_data_in_col_3  (_connected_to_cascade_data_in_col_3_),  //   input,  width = 32,  cascade_data_in_col_3.cascade_data_in
		.cascade_data_out_col_3 (_connected_to_cascade_data_out_col_3_), //  output,  width = 32, cascade_data_out_col_3.cascade_data_out
		.bf24_col_1             (_connected_to_bf24_col_1_),             //  output,  width = 24,             bf24_col_1.result_l
		.bf24_col_2             (_connected_to_bf24_col_2_),             //  output,  width = 24,             bf24_col_2.result_l,result_h
		.bf24_col_3             (_connected_to_bf24_col_3_)              //  output,  width = 24,             bf24_col_3.result_h
	);

