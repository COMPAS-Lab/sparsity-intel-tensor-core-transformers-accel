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
module	tensor_core_accu_dsp_prime_10_exjexwi	(
			clk,
			clr0,
			acc_en,
			zero_en,
			bf24_a1,
			cascade_data_in_col_1,
			bf24_a2,
			cascade_data_in_col_2,
			bf24_a3,
			cascade_data_in_col_3,
			bf24_col_1,
			bf24_col_2,
			bf24_col_3);

			input  clk;
			input  clr0;
			input  acc_en;
			input  zero_en;
			input [23:0] bf24_a1;
			input [31:0] cascade_data_in_col_1;
			input [23:0] bf24_a2;
			input [31:0] cascade_data_in_col_2;
			input [23:0] bf24_a3;
			input [31:0] cascade_data_in_col_3;
			output [23:0] bf24_col_1;
			output [23:0] bf24_col_2;
			output [23:0] bf24_col_3;

			wire [23:0] bf24_col_1_w ;
			wire [23:0] bf24_col_2_w ;
			wire [23:0] bf24_col_3_w ;
			wire [23:0] bf24_col_1 = bf24_col_1_w [23:0] ;
			wire [23:0] bf24_col_2 = bf24_col_2_w [23:0] ;
			wire [23:0] bf24_col_3 = bf24_col_3_w [23:0] ;

			fourteennm_dsp_prime		fourteennm_dsp_prime_component (
						 .clk (clk),
						 .acc_en (acc_en),
						 .zero_en (zero_en),
						 .clr ({1'b0,clr0}),
						 .data_in({bf24_a3,bf24_a2,bf24_a1}),
						 .cascade_data_in ({cascade_data_in_col_3,cascade_data_in_col_2,cascade_data_in_col_1}),
						 .result_l({bf24_col_2_w[23:10],bf24_col_1_w[23:0]}),
						 .result_h({bf24_col_3_w[23:0],bf24_col_2_w[9:0]}));
			defparam
						fourteennm_dsp_prime_component.dsp_mode = "tensor_acc_bf24",
						fourteennm_dsp_prime_component.dsp_sel_int4 = "select_int8",
						fourteennm_dsp_prime_component.dsp_cascade = "cascade_enabled",
						fourteennm_dsp_prime_component.dsp_fp32_sub_en = "float_sub_disabled";


endmodule




