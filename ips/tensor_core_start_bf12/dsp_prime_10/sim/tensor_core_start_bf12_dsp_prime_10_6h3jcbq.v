// (C) 2001-2021 Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions and other 
// software and tools, and its AMPP partner logic functions, and any output 
// files from any of the foregoing (including device programming or simulation 
// files), and any associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License Subscription 
// Agreement, Intel FPGA IP License Agreement, or other applicable 
// license agreement, including, without limitation, that your use is for the 
// sole purpose of programming logic devices manufactured by Intel and sold by 
// Intel or its authorized distributors.  Please refer to the applicable 
// agreement for further details.


// synopsys translate_off
`timescale 1 ps / 1 ps
// synopsys translate_on
module	tensor_core_start_bf12_dsp_prime_10_6h3jcbq	(
			clk,
			clr0,
			clr1,
			feed_sel,
			load_bb_one,
			load_bb_two,
			load_buf_sel,
			data_in_1,
			data_in_2,
			data_in_3,
			data_in_4,
			data_in_5,
			data_in_6,
			data_in_7,
			data_in_8,
			data_in_9,
			data_in_10,
			data_in_11,
			data_in_12,
			data_in_13,
			data_in_14,
			data_in_15,
			data_in_16,
			data_in_17,
			data_in_18,
			data_in_19,
			data_in_20,
			side_in_1,
			side_in_2,
			side_in_3,
			side_in_4,
			shared_exponent_data,
			cascade_weight_in,
			cascade_weight_out,
			cascade_data_out_col_1,
			cascade_data_out_col_2,
			cascade_data_out_col_3,
			bf24_col_1,
			bf24_col_2,
			bf24_col_3);
 
			input  clk;
			input  clr0;
			input  clr1;
			input [1:0] feed_sel;
			input  load_bb_one;
			input  load_bb_two;
			input  load_buf_sel;
			input [3:0] data_in_1;
			input [3:0] data_in_2;
			input [3:0] data_in_3;
			input [3:0] data_in_4;
			input [3:0] data_in_5;
			input [3:0] data_in_6;
			input [3:0] data_in_7;
			input [3:0] data_in_8;
			input [3:0] data_in_9;
			input [3:0] data_in_10;
			input [3:0] data_in_11;
			input [3:0] data_in_12;
			input [3:0] data_in_13;
			input [3:0] data_in_14;
			input [3:0] data_in_15;
			input [3:0] data_in_16;
			input [3:0] data_in_17;
			input [3:0] data_in_18;
			input [3:0] data_in_19;
			input [3:0] data_in_20;
			input [3:0] side_in_1;
			input [3:0] side_in_2;
			input [3:0] side_in_3;
			input [3:0] side_in_4;
			input [7:0] shared_exponent_data;
			input [87:0] cascade_weight_in;
			output [87:0] cascade_weight_out;
			output [31:0] cascade_data_out_col_1;
			output [31:0] cascade_data_out_col_2;
			output [31:0] cascade_data_out_col_3;
			output [23:0] bf24_col_1;
			output [23:0] bf24_col_2;
			output [23:0] bf24_col_3;
 
			wire [87:0] cascade_weight_out_w ;
			wire [31:0] cascade_data_out_col_1_w ;
			wire [31:0] cascade_data_out_col_2_w ;
			wire [31:0] cascade_data_out_col_3_w ;
			wire [23:0] bf24_col_1_w ;
			wire [23:0] bf24_col_2_w ;
			wire [23:0] bf24_col_3_w ;
			wire [87:0] cascade_weight_out = cascade_weight_out_w [87:0] ;
			wire [31:0] cascade_data_out_col_1 = cascade_data_out_col_1_w [31:0] ;
			wire [31:0] cascade_data_out_col_2 = cascade_data_out_col_2_w [31:0] ;
			wire [31:0] cascade_data_out_col_3 = cascade_data_out_col_3_w [31:0] ;
			wire [23:0] bf24_col_1 = bf24_col_1_w [23:0] ;
			wire [23:0] bf24_col_2 = bf24_col_2_w [23:0] ;
			wire [23:0] bf24_col_3 = bf24_col_3_w [23:0] ;
 
			fourteennm_dsp_prime		fourteennm_dsp_prime_component (
						 .clk (clk),
						 .feed_sel (feed_sel),
						 .load_bb_one (load_bb_one),
						 .load_bb_two (load_bb_two),
						 .load_buf_sel (load_buf_sel),
						 .shared_exponent (shared_exponent_data),
						 .cascade_weight_in (cascade_weight_in),
						 .clr ({clr1,clr0}),
						 .cascade_weight_out (cascade_weight_out_w),
						 .data_in({side_in_4,side_in_3,side_in_2,side_in_1,data_in_20,data_in_19,data_in_18,data_in_17,data_in_16,data_in_15,data_in_14,data_in_13,data_in_12,data_in_11,data_in_10,data_in_9,data_in_8,data_in_7,data_in_6,data_in_5,data_in_4,data_in_3,data_in_2,data_in_1}),
						 .cascade_data_out ({cascade_data_out_col_3_w,cascade_data_out_col_2_w,cascade_data_out_col_1_w}),
						 .result_l({bf24_col_2_w[23:10],bf24_col_1_w[23:0]}),
						 .result_h({bf24_col_3_w[23:0],bf24_col_2_w[9:0]}));
			defparam
						fourteennm_dsp_prime_component.dsp_mode = "tensor_fp",
						fourteennm_dsp_prime_component.dsp_sel_int4 = "select_int4",
						fourteennm_dsp_prime_component.dsp_cascade = "cascade_disabled",
						fourteennm_dsp_prime_component.dsp_fp32_sub_en = "float_sub_disabled";
 
 
endmodule
