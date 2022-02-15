`timescale 1ns / 100ps

module tensor_core_accu_tb();
	logic clk;
	logic [1:0] feed_sel;
					
	logic [23:0] bf24_col_1, bf24_col_2, bf24_col_3;
	logic [23:0] bf24_a1, bf24_a2, bf24_a3;
	logic [31:0] cascade_data_in_col_1, cascade_data_in_col_2, cascade_data_in_col_3;
	logic [31:0] cascade_data_out_col_1, cascade_data_out_col_2, cascade_data_out_col_3;	
	
	always #5 clk = ~clk;
	
	tensor_core_accu u0 (
		.clk                    (clk),                    //   input,   width = 1,                    clk.clk
		.acc_en                 (1'b0),                 //   input,   width = 1,                 acc_en.acc_en
		.zero_en                (1'b0),                //   input,   width = 1,                zero_en.zero_en
		.bf24_a1                (bf24_col_1),                //   input,  width = 24,                bf24_a1.data_in
		.cascade_data_in_col_1  (cascade_data_in_col_1),  //   input,  width = 32,  cascade_data_in_col_1.cascade_data_in
		.cascade_data_out_col_1 (cascade_data_out_col_1), //  output,  width = 32, cascade_data_out_col_1.cascade_data_out
		.bf24_a2                (bf24_col_2),                //   input,  width = 24,                bf24_a2.data_in
		.cascade_data_in_col_2  (cascade_data_in_col_2),  //   input,  width = 32,  cascade_data_in_col_2.cascade_data_in
		.cascade_data_out_col_2 (cascade_data_out_col_2), //  output,  width = 32, cascade_data_out_col_2.cascade_data_out
		.bf24_a3                (bf24_col_3),                //   input,  width = 24,                bf24_a3.data_in
		.cascade_data_in_col_3  (cascade_data_in_col_3),  //   input,  width = 32,  cascade_data_in_col_3.cascade_data_in
		.cascade_data_out_col_3 (cascade_data_out_col_3), //  output,  width = 32, cascade_data_out_col_3.cascade_data_out
		.bf24_col_1             (bf24_col_1),             //  output,  width = 24,             bf24_col_1.result_l
		.bf24_col_2             (bf24_col_2),             //  output,  width = 24,             bf24_col_2.result_l,result_h
		.bf24_col_3             (bf24_col_3)              //  output,  width = 24,             bf24_col_3.result_h
	);

	initial begin
		clk = 0;
		cascade_data_in_col_1 = 32'b0;
		cascade_data_in_col_2 = 32'b0;
		cascade_data_in_col_3 = 32'b0;
		bf24_a1 = 24'd0;
		bf24_a2 = 24'd0;
		bf24_a3 = 24'd0;
		
		#34
		cascade_data_in_col_1 = 32'h3f800000;
		cascade_data_in_col_2 = 32'h3f800000;
		cascade_data_in_col_3 = 32'h3fb00000;
		bf24_a1 = 24'd0;
		bf24_a2 = 24'd0;
		bf24_a3 = 24'd0;
		
		
	end
	
endmodule