// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : TensorCoreChainBf12_13
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module TensorCoreChainBf12_13 (
  input  wire          io_dataIn_0_valid,
  input  wire [79:0]   io_dataIn_0_payload,
  input  wire          io_dataIn_1_valid,
  input  wire [79:0]   io_dataIn_1_payload,
  input  wire          io_dataIn_2_valid,
  input  wire [79:0]   io_dataIn_2_payload,
  input  wire          io_dataIn_3_valid,
  input  wire [79:0]   io_dataIn_3_payload,
  input  wire          io_dataIn_4_valid,
  input  wire [79:0]   io_dataIn_4_payload,
  input  wire          io_dataIn_5_valid,
  input  wire [79:0]   io_dataIn_5_payload,
  input  wire          io_dataIn_6_valid,
  input  wire [79:0]   io_dataIn_6_payload,
  input  wire          io_dataIn_7_valid,
  input  wire [79:0]   io_dataIn_7_payload,
  input  wire          io_dataIn_8_valid,
  input  wire [79:0]   io_dataIn_8_payload,
  input  wire          io_dataIn_9_valid,
  input  wire [79:0]   io_dataIn_9_payload,
  input  wire          io_dataIn_10_valid,
  input  wire [79:0]   io_dataIn_10_payload,
  input  wire          io_dataIn_11_valid,
  input  wire [79:0]   io_dataIn_11_payload,
  input  wire [79:0]   io_loadCascadeIn,
  input  wire [7:0]    io_expIn_0,
  input  wire [7:0]    io_expIn_1,
  input  wire [7:0]    io_expIn_2,
  input  wire [7:0]    io_expIn_3,
  input  wire [7:0]    io_expIn_4,
  input  wire [7:0]    io_expIn_5,
  input  wire [7:0]    io_expIn_6,
  input  wire [7:0]    io_expIn_7,
  input  wire [7:0]    io_expIn_8,
  input  wire [7:0]    io_expIn_9,
  input  wire [7:0]    io_expIn_10,
  input  wire [7:0]    io_expIn_11,
  input  wire [7:0]    io_expCascadeIn,
  input  wire          io_dataValid,
  input  wire          io_loadValid,
  input  wire          io_res_ready,
  output wire [23:0]   io_res_payload_0,
  output wire [23:0]   io_res_payload_1,
  output wire [23:0]   io_res_payload_2,
  input  wire [15:0]   io_inputIters,
  input  wire [15:0]   io_matAColSubGrpLen,
  output wire          io_outValid,
  input  wire          clk,
  input  wire          clrn
);

  wire       [3:0]    tcEntry_data_in_1;
  wire       [3:0]    tcEntry_data_in_2;
  wire       [3:0]    tcEntry_data_in_3;
  wire       [3:0]    tcEntry_data_in_4;
  wire       [3:0]    tcEntry_data_in_5;
  wire       [3:0]    tcEntry_data_in_6;
  wire       [3:0]    tcEntry_data_in_7;
  wire       [3:0]    tcEntry_data_in_8;
  wire       [3:0]    tcEntry_data_in_9;
  wire       [3:0]    tcEntry_data_in_10;
  wire       [3:0]    tcEntry_data_in_11;
  wire       [3:0]    tcEntry_data_in_12;
  wire       [3:0]    tcEntry_data_in_13;
  wire       [3:0]    tcEntry_data_in_14;
  wire       [3:0]    tcEntry_data_in_15;
  wire       [3:0]    tcEntry_data_in_16;
  wire       [3:0]    tcEntry_data_in_17;
  wire       [3:0]    tcEntry_data_in_18;
  wire       [3:0]    tcEntry_data_in_19;
  wire       [3:0]    tcEntry_data_in_20;
  wire       [3:0]    tcEntry_side_in_1;
  wire       [3:0]    tcEntry_side_in_2;
  wire       [3:0]    tcEntry_side_in_3;
  wire       [3:0]    tcEntry_side_in_4;
  wire       [1:0]    tcEntry_feed_sel;
  wire                tcEntry_load_bb_one;
  wire                tcEntry_load_bb_two;
  wire                tcEntry_load_buf_sel;
  wire                tcEntry_clr0;
  wire                tcEntry_clr1;
  wire       [3:0]    tcStartPoint_data_in_1;
  wire       [3:0]    tcStartPoint_data_in_2;
  wire       [3:0]    tcStartPoint_data_in_3;
  wire       [3:0]    tcStartPoint_data_in_4;
  wire       [3:0]    tcStartPoint_data_in_5;
  wire       [3:0]    tcStartPoint_data_in_6;
  wire       [3:0]    tcStartPoint_data_in_7;
  wire       [3:0]    tcStartPoint_data_in_8;
  wire       [3:0]    tcStartPoint_data_in_9;
  wire       [3:0]    tcStartPoint_data_in_10;
  wire       [3:0]    tcStartPoint_data_in_11;
  wire       [3:0]    tcStartPoint_data_in_12;
  wire       [3:0]    tcStartPoint_data_in_13;
  wire       [3:0]    tcStartPoint_data_in_14;
  wire       [3:0]    tcStartPoint_data_in_15;
  wire       [3:0]    tcStartPoint_data_in_16;
  wire       [3:0]    tcStartPoint_data_in_17;
  wire       [3:0]    tcStartPoint_data_in_18;
  wire       [3:0]    tcStartPoint_data_in_19;
  wire       [3:0]    tcStartPoint_data_in_20;
  wire       [3:0]    tcStartPoint_side_in_1;
  wire       [3:0]    tcStartPoint_side_in_2;
  wire       [3:0]    tcStartPoint_side_in_3;
  wire       [3:0]    tcStartPoint_side_in_4;
  wire       [1:0]    tcStartPoint_feed_sel;
  wire                tcStartPoint_load_bb_one;
  wire                tcStartPoint_load_bb_two;
  wire                tcStartPoint_clr1;
  wire                tcAccu_acc_en;
  wire                tcAccu_zero_en;
  wire       [3:0]    tensor_core_bf12_1_data_in_1;
  wire       [3:0]    tensor_core_bf12_1_data_in_2;
  wire       [3:0]    tensor_core_bf12_1_data_in_3;
  wire       [3:0]    tensor_core_bf12_1_data_in_4;
  wire       [3:0]    tensor_core_bf12_1_data_in_5;
  wire       [3:0]    tensor_core_bf12_1_data_in_6;
  wire       [3:0]    tensor_core_bf12_1_data_in_7;
  wire       [3:0]    tensor_core_bf12_1_data_in_8;
  wire       [3:0]    tensor_core_bf12_1_data_in_9;
  wire       [3:0]    tensor_core_bf12_1_data_in_10;
  wire       [3:0]    tensor_core_bf12_1_data_in_11;
  wire       [3:0]    tensor_core_bf12_1_data_in_12;
  wire       [3:0]    tensor_core_bf12_1_data_in_13;
  wire       [3:0]    tensor_core_bf12_1_data_in_14;
  wire       [3:0]    tensor_core_bf12_1_data_in_15;
  wire       [3:0]    tensor_core_bf12_1_data_in_16;
  wire       [3:0]    tensor_core_bf12_1_data_in_17;
  wire       [3:0]    tensor_core_bf12_1_data_in_18;
  wire       [3:0]    tensor_core_bf12_1_data_in_19;
  wire       [3:0]    tensor_core_bf12_1_data_in_20;
  wire       [3:0]    tensor_core_bf12_1_side_in_1;
  wire       [3:0]    tensor_core_bf12_1_side_in_2;
  wire       [3:0]    tensor_core_bf12_1_side_in_3;
  wire       [3:0]    tensor_core_bf12_1_side_in_4;
  wire       [1:0]    tensor_core_bf12_1_feed_sel;
  wire                tensor_core_bf12_1_load_bb_one;
  wire                tensor_core_bf12_1_load_bb_two;
  wire                tensor_core_bf12_1_acc_en;
  wire                tensor_core_bf12_1_zero_en;
  wire                tensor_core_bf12_1_clr1;
  wire       [3:0]    tensor_core_bf12_2_data_in_1;
  wire       [3:0]    tensor_core_bf12_2_data_in_2;
  wire       [3:0]    tensor_core_bf12_2_data_in_3;
  wire       [3:0]    tensor_core_bf12_2_data_in_4;
  wire       [3:0]    tensor_core_bf12_2_data_in_5;
  wire       [3:0]    tensor_core_bf12_2_data_in_6;
  wire       [3:0]    tensor_core_bf12_2_data_in_7;
  wire       [3:0]    tensor_core_bf12_2_data_in_8;
  wire       [3:0]    tensor_core_bf12_2_data_in_9;
  wire       [3:0]    tensor_core_bf12_2_data_in_10;
  wire       [3:0]    tensor_core_bf12_2_data_in_11;
  wire       [3:0]    tensor_core_bf12_2_data_in_12;
  wire       [3:0]    tensor_core_bf12_2_data_in_13;
  wire       [3:0]    tensor_core_bf12_2_data_in_14;
  wire       [3:0]    tensor_core_bf12_2_data_in_15;
  wire       [3:0]    tensor_core_bf12_2_data_in_16;
  wire       [3:0]    tensor_core_bf12_2_data_in_17;
  wire       [3:0]    tensor_core_bf12_2_data_in_18;
  wire       [3:0]    tensor_core_bf12_2_data_in_19;
  wire       [3:0]    tensor_core_bf12_2_data_in_20;
  wire       [3:0]    tensor_core_bf12_2_side_in_1;
  wire       [3:0]    tensor_core_bf12_2_side_in_2;
  wire       [3:0]    tensor_core_bf12_2_side_in_3;
  wire       [3:0]    tensor_core_bf12_2_side_in_4;
  wire       [1:0]    tensor_core_bf12_2_feed_sel;
  wire                tensor_core_bf12_2_load_bb_one;
  wire                tensor_core_bf12_2_load_bb_two;
  wire                tensor_core_bf12_2_acc_en;
  wire                tensor_core_bf12_2_zero_en;
  wire                tensor_core_bf12_2_clr1;
  wire       [3:0]    tensor_core_bf12_3_data_in_1;
  wire       [3:0]    tensor_core_bf12_3_data_in_2;
  wire       [3:0]    tensor_core_bf12_3_data_in_3;
  wire       [3:0]    tensor_core_bf12_3_data_in_4;
  wire       [3:0]    tensor_core_bf12_3_data_in_5;
  wire       [3:0]    tensor_core_bf12_3_data_in_6;
  wire       [3:0]    tensor_core_bf12_3_data_in_7;
  wire       [3:0]    tensor_core_bf12_3_data_in_8;
  wire       [3:0]    tensor_core_bf12_3_data_in_9;
  wire       [3:0]    tensor_core_bf12_3_data_in_10;
  wire       [3:0]    tensor_core_bf12_3_data_in_11;
  wire       [3:0]    tensor_core_bf12_3_data_in_12;
  wire       [3:0]    tensor_core_bf12_3_data_in_13;
  wire       [3:0]    tensor_core_bf12_3_data_in_14;
  wire       [3:0]    tensor_core_bf12_3_data_in_15;
  wire       [3:0]    tensor_core_bf12_3_data_in_16;
  wire       [3:0]    tensor_core_bf12_3_data_in_17;
  wire       [3:0]    tensor_core_bf12_3_data_in_18;
  wire       [3:0]    tensor_core_bf12_3_data_in_19;
  wire       [3:0]    tensor_core_bf12_3_data_in_20;
  wire       [3:0]    tensor_core_bf12_3_side_in_1;
  wire       [3:0]    tensor_core_bf12_3_side_in_2;
  wire       [3:0]    tensor_core_bf12_3_side_in_3;
  wire       [3:0]    tensor_core_bf12_3_side_in_4;
  wire       [1:0]    tensor_core_bf12_3_feed_sel;
  wire                tensor_core_bf12_3_load_bb_one;
  wire                tensor_core_bf12_3_load_bb_two;
  wire                tensor_core_bf12_3_acc_en;
  wire                tensor_core_bf12_3_zero_en;
  wire                tensor_core_bf12_3_clr1;
  wire       [3:0]    tensor_core_bf12_4_data_in_1;
  wire       [3:0]    tensor_core_bf12_4_data_in_2;
  wire       [3:0]    tensor_core_bf12_4_data_in_3;
  wire       [3:0]    tensor_core_bf12_4_data_in_4;
  wire       [3:0]    tensor_core_bf12_4_data_in_5;
  wire       [3:0]    tensor_core_bf12_4_data_in_6;
  wire       [3:0]    tensor_core_bf12_4_data_in_7;
  wire       [3:0]    tensor_core_bf12_4_data_in_8;
  wire       [3:0]    tensor_core_bf12_4_data_in_9;
  wire       [3:0]    tensor_core_bf12_4_data_in_10;
  wire       [3:0]    tensor_core_bf12_4_data_in_11;
  wire       [3:0]    tensor_core_bf12_4_data_in_12;
  wire       [3:0]    tensor_core_bf12_4_data_in_13;
  wire       [3:0]    tensor_core_bf12_4_data_in_14;
  wire       [3:0]    tensor_core_bf12_4_data_in_15;
  wire       [3:0]    tensor_core_bf12_4_data_in_16;
  wire       [3:0]    tensor_core_bf12_4_data_in_17;
  wire       [3:0]    tensor_core_bf12_4_data_in_18;
  wire       [3:0]    tensor_core_bf12_4_data_in_19;
  wire       [3:0]    tensor_core_bf12_4_data_in_20;
  wire       [3:0]    tensor_core_bf12_4_side_in_1;
  wire       [3:0]    tensor_core_bf12_4_side_in_2;
  wire       [3:0]    tensor_core_bf12_4_side_in_3;
  wire       [3:0]    tensor_core_bf12_4_side_in_4;
  wire       [1:0]    tensor_core_bf12_4_feed_sel;
  wire                tensor_core_bf12_4_load_bb_one;
  wire                tensor_core_bf12_4_load_bb_two;
  wire                tensor_core_bf12_4_acc_en;
  wire                tensor_core_bf12_4_zero_en;
  wire                tensor_core_bf12_4_clr1;
  wire       [3:0]    tensor_core_bf12_5_data_in_1;
  wire       [3:0]    tensor_core_bf12_5_data_in_2;
  wire       [3:0]    tensor_core_bf12_5_data_in_3;
  wire       [3:0]    tensor_core_bf12_5_data_in_4;
  wire       [3:0]    tensor_core_bf12_5_data_in_5;
  wire       [3:0]    tensor_core_bf12_5_data_in_6;
  wire       [3:0]    tensor_core_bf12_5_data_in_7;
  wire       [3:0]    tensor_core_bf12_5_data_in_8;
  wire       [3:0]    tensor_core_bf12_5_data_in_9;
  wire       [3:0]    tensor_core_bf12_5_data_in_10;
  wire       [3:0]    tensor_core_bf12_5_data_in_11;
  wire       [3:0]    tensor_core_bf12_5_data_in_12;
  wire       [3:0]    tensor_core_bf12_5_data_in_13;
  wire       [3:0]    tensor_core_bf12_5_data_in_14;
  wire       [3:0]    tensor_core_bf12_5_data_in_15;
  wire       [3:0]    tensor_core_bf12_5_data_in_16;
  wire       [3:0]    tensor_core_bf12_5_data_in_17;
  wire       [3:0]    tensor_core_bf12_5_data_in_18;
  wire       [3:0]    tensor_core_bf12_5_data_in_19;
  wire       [3:0]    tensor_core_bf12_5_data_in_20;
  wire       [3:0]    tensor_core_bf12_5_side_in_1;
  wire       [3:0]    tensor_core_bf12_5_side_in_2;
  wire       [3:0]    tensor_core_bf12_5_side_in_3;
  wire       [3:0]    tensor_core_bf12_5_side_in_4;
  wire       [1:0]    tensor_core_bf12_5_feed_sel;
  wire                tensor_core_bf12_5_load_bb_one;
  wire                tensor_core_bf12_5_load_bb_two;
  wire                tensor_core_bf12_5_acc_en;
  wire                tensor_core_bf12_5_zero_en;
  wire                tensor_core_bf12_5_clr1;
  wire       [3:0]    tensor_core_bf12_6_data_in_1;
  wire       [3:0]    tensor_core_bf12_6_data_in_2;
  wire       [3:0]    tensor_core_bf12_6_data_in_3;
  wire       [3:0]    tensor_core_bf12_6_data_in_4;
  wire       [3:0]    tensor_core_bf12_6_data_in_5;
  wire       [3:0]    tensor_core_bf12_6_data_in_6;
  wire       [3:0]    tensor_core_bf12_6_data_in_7;
  wire       [3:0]    tensor_core_bf12_6_data_in_8;
  wire       [3:0]    tensor_core_bf12_6_data_in_9;
  wire       [3:0]    tensor_core_bf12_6_data_in_10;
  wire       [3:0]    tensor_core_bf12_6_data_in_11;
  wire       [3:0]    tensor_core_bf12_6_data_in_12;
  wire       [3:0]    tensor_core_bf12_6_data_in_13;
  wire       [3:0]    tensor_core_bf12_6_data_in_14;
  wire       [3:0]    tensor_core_bf12_6_data_in_15;
  wire       [3:0]    tensor_core_bf12_6_data_in_16;
  wire       [3:0]    tensor_core_bf12_6_data_in_17;
  wire       [3:0]    tensor_core_bf12_6_data_in_18;
  wire       [3:0]    tensor_core_bf12_6_data_in_19;
  wire       [3:0]    tensor_core_bf12_6_data_in_20;
  wire       [3:0]    tensor_core_bf12_6_side_in_1;
  wire       [3:0]    tensor_core_bf12_6_side_in_2;
  wire       [3:0]    tensor_core_bf12_6_side_in_3;
  wire       [3:0]    tensor_core_bf12_6_side_in_4;
  wire       [1:0]    tensor_core_bf12_6_feed_sel;
  wire                tensor_core_bf12_6_load_bb_one;
  wire                tensor_core_bf12_6_load_bb_two;
  wire                tensor_core_bf12_6_acc_en;
  wire                tensor_core_bf12_6_zero_en;
  wire                tensor_core_bf12_6_clr1;
  wire       [3:0]    tensor_core_bf12_7_data_in_1;
  wire       [3:0]    tensor_core_bf12_7_data_in_2;
  wire       [3:0]    tensor_core_bf12_7_data_in_3;
  wire       [3:0]    tensor_core_bf12_7_data_in_4;
  wire       [3:0]    tensor_core_bf12_7_data_in_5;
  wire       [3:0]    tensor_core_bf12_7_data_in_6;
  wire       [3:0]    tensor_core_bf12_7_data_in_7;
  wire       [3:0]    tensor_core_bf12_7_data_in_8;
  wire       [3:0]    tensor_core_bf12_7_data_in_9;
  wire       [3:0]    tensor_core_bf12_7_data_in_10;
  wire       [3:0]    tensor_core_bf12_7_data_in_11;
  wire       [3:0]    tensor_core_bf12_7_data_in_12;
  wire       [3:0]    tensor_core_bf12_7_data_in_13;
  wire       [3:0]    tensor_core_bf12_7_data_in_14;
  wire       [3:0]    tensor_core_bf12_7_data_in_15;
  wire       [3:0]    tensor_core_bf12_7_data_in_16;
  wire       [3:0]    tensor_core_bf12_7_data_in_17;
  wire       [3:0]    tensor_core_bf12_7_data_in_18;
  wire       [3:0]    tensor_core_bf12_7_data_in_19;
  wire       [3:0]    tensor_core_bf12_7_data_in_20;
  wire       [3:0]    tensor_core_bf12_7_side_in_1;
  wire       [3:0]    tensor_core_bf12_7_side_in_2;
  wire       [3:0]    tensor_core_bf12_7_side_in_3;
  wire       [3:0]    tensor_core_bf12_7_side_in_4;
  wire       [1:0]    tensor_core_bf12_7_feed_sel;
  wire                tensor_core_bf12_7_load_bb_one;
  wire                tensor_core_bf12_7_load_bb_two;
  wire                tensor_core_bf12_7_acc_en;
  wire                tensor_core_bf12_7_zero_en;
  wire                tensor_core_bf12_7_clr1;
  wire       [3:0]    tensor_core_bf12_8_data_in_1;
  wire       [3:0]    tensor_core_bf12_8_data_in_2;
  wire       [3:0]    tensor_core_bf12_8_data_in_3;
  wire       [3:0]    tensor_core_bf12_8_data_in_4;
  wire       [3:0]    tensor_core_bf12_8_data_in_5;
  wire       [3:0]    tensor_core_bf12_8_data_in_6;
  wire       [3:0]    tensor_core_bf12_8_data_in_7;
  wire       [3:0]    tensor_core_bf12_8_data_in_8;
  wire       [3:0]    tensor_core_bf12_8_data_in_9;
  wire       [3:0]    tensor_core_bf12_8_data_in_10;
  wire       [3:0]    tensor_core_bf12_8_data_in_11;
  wire       [3:0]    tensor_core_bf12_8_data_in_12;
  wire       [3:0]    tensor_core_bf12_8_data_in_13;
  wire       [3:0]    tensor_core_bf12_8_data_in_14;
  wire       [3:0]    tensor_core_bf12_8_data_in_15;
  wire       [3:0]    tensor_core_bf12_8_data_in_16;
  wire       [3:0]    tensor_core_bf12_8_data_in_17;
  wire       [3:0]    tensor_core_bf12_8_data_in_18;
  wire       [3:0]    tensor_core_bf12_8_data_in_19;
  wire       [3:0]    tensor_core_bf12_8_data_in_20;
  wire       [3:0]    tensor_core_bf12_8_side_in_1;
  wire       [3:0]    tensor_core_bf12_8_side_in_2;
  wire       [3:0]    tensor_core_bf12_8_side_in_3;
  wire       [3:0]    tensor_core_bf12_8_side_in_4;
  wire       [1:0]    tensor_core_bf12_8_feed_sel;
  wire                tensor_core_bf12_8_load_bb_one;
  wire                tensor_core_bf12_8_load_bb_two;
  wire                tensor_core_bf12_8_acc_en;
  wire                tensor_core_bf12_8_zero_en;
  wire                tensor_core_bf12_8_clr1;
  wire       [3:0]    tensor_core_bf12_9_data_in_1;
  wire       [3:0]    tensor_core_bf12_9_data_in_2;
  wire       [3:0]    tensor_core_bf12_9_data_in_3;
  wire       [3:0]    tensor_core_bf12_9_data_in_4;
  wire       [3:0]    tensor_core_bf12_9_data_in_5;
  wire       [3:0]    tensor_core_bf12_9_data_in_6;
  wire       [3:0]    tensor_core_bf12_9_data_in_7;
  wire       [3:0]    tensor_core_bf12_9_data_in_8;
  wire       [3:0]    tensor_core_bf12_9_data_in_9;
  wire       [3:0]    tensor_core_bf12_9_data_in_10;
  wire       [3:0]    tensor_core_bf12_9_data_in_11;
  wire       [3:0]    tensor_core_bf12_9_data_in_12;
  wire       [3:0]    tensor_core_bf12_9_data_in_13;
  wire       [3:0]    tensor_core_bf12_9_data_in_14;
  wire       [3:0]    tensor_core_bf12_9_data_in_15;
  wire       [3:0]    tensor_core_bf12_9_data_in_16;
  wire       [3:0]    tensor_core_bf12_9_data_in_17;
  wire       [3:0]    tensor_core_bf12_9_data_in_18;
  wire       [3:0]    tensor_core_bf12_9_data_in_19;
  wire       [3:0]    tensor_core_bf12_9_data_in_20;
  wire       [3:0]    tensor_core_bf12_9_side_in_1;
  wire       [3:0]    tensor_core_bf12_9_side_in_2;
  wire       [3:0]    tensor_core_bf12_9_side_in_3;
  wire       [3:0]    tensor_core_bf12_9_side_in_4;
  wire       [1:0]    tensor_core_bf12_9_feed_sel;
  wire                tensor_core_bf12_9_load_bb_one;
  wire                tensor_core_bf12_9_load_bb_two;
  wire                tensor_core_bf12_9_acc_en;
  wire                tensor_core_bf12_9_zero_en;
  wire                tensor_core_bf12_9_clr1;
  wire       [3:0]    tensor_core_bf12_10_data_in_1;
  wire       [3:0]    tensor_core_bf12_10_data_in_2;
  wire       [3:0]    tensor_core_bf12_10_data_in_3;
  wire       [3:0]    tensor_core_bf12_10_data_in_4;
  wire       [3:0]    tensor_core_bf12_10_data_in_5;
  wire       [3:0]    tensor_core_bf12_10_data_in_6;
  wire       [3:0]    tensor_core_bf12_10_data_in_7;
  wire       [3:0]    tensor_core_bf12_10_data_in_8;
  wire       [3:0]    tensor_core_bf12_10_data_in_9;
  wire       [3:0]    tensor_core_bf12_10_data_in_10;
  wire       [3:0]    tensor_core_bf12_10_data_in_11;
  wire       [3:0]    tensor_core_bf12_10_data_in_12;
  wire       [3:0]    tensor_core_bf12_10_data_in_13;
  wire       [3:0]    tensor_core_bf12_10_data_in_14;
  wire       [3:0]    tensor_core_bf12_10_data_in_15;
  wire       [3:0]    tensor_core_bf12_10_data_in_16;
  wire       [3:0]    tensor_core_bf12_10_data_in_17;
  wire       [3:0]    tensor_core_bf12_10_data_in_18;
  wire       [3:0]    tensor_core_bf12_10_data_in_19;
  wire       [3:0]    tensor_core_bf12_10_data_in_20;
  wire       [3:0]    tensor_core_bf12_10_side_in_1;
  wire       [3:0]    tensor_core_bf12_10_side_in_2;
  wire       [3:0]    tensor_core_bf12_10_side_in_3;
  wire       [3:0]    tensor_core_bf12_10_side_in_4;
  wire       [1:0]    tensor_core_bf12_10_feed_sel;
  wire                tensor_core_bf12_10_load_bb_one;
  wire                tensor_core_bf12_10_load_bb_two;
  wire                tensor_core_bf12_10_acc_en;
  wire                tensor_core_bf12_10_zero_en;
  wire                tensor_core_bf12_10_clr1;
  wire       [3:0]    tensor_core_bf12_11_data_in_1;
  wire       [3:0]    tensor_core_bf12_11_data_in_2;
  wire       [3:0]    tensor_core_bf12_11_data_in_3;
  wire       [3:0]    tensor_core_bf12_11_data_in_4;
  wire       [3:0]    tensor_core_bf12_11_data_in_5;
  wire       [3:0]    tensor_core_bf12_11_data_in_6;
  wire       [3:0]    tensor_core_bf12_11_data_in_7;
  wire       [3:0]    tensor_core_bf12_11_data_in_8;
  wire       [3:0]    tensor_core_bf12_11_data_in_9;
  wire       [3:0]    tensor_core_bf12_11_data_in_10;
  wire       [3:0]    tensor_core_bf12_11_data_in_11;
  wire       [3:0]    tensor_core_bf12_11_data_in_12;
  wire       [3:0]    tensor_core_bf12_11_data_in_13;
  wire       [3:0]    tensor_core_bf12_11_data_in_14;
  wire       [3:0]    tensor_core_bf12_11_data_in_15;
  wire       [3:0]    tensor_core_bf12_11_data_in_16;
  wire       [3:0]    tensor_core_bf12_11_data_in_17;
  wire       [3:0]    tensor_core_bf12_11_data_in_18;
  wire       [3:0]    tensor_core_bf12_11_data_in_19;
  wire       [3:0]    tensor_core_bf12_11_data_in_20;
  wire       [3:0]    tensor_core_bf12_11_side_in_1;
  wire       [3:0]    tensor_core_bf12_11_side_in_2;
  wire       [3:0]    tensor_core_bf12_11_side_in_3;
  wire       [3:0]    tensor_core_bf12_11_side_in_4;
  wire       [1:0]    tensor_core_bf12_11_feed_sel;
  wire                tensor_core_bf12_11_load_bb_one;
  wire                tensor_core_bf12_11_load_bb_two;
  wire                tensor_core_bf12_11_acc_en;
  wire                tensor_core_bf12_11_zero_en;
  wire                tensor_core_bf12_11_clr1;
  wire       [71:0]   AccuDelayInst_io_push_payload;
  reg                 AccuDelayInst_io_pop_ready;
  wire       [87:0]   tcEntry_cascade_weight_out;
  wire       [87:0]   tcStartPoint_cascade_weight_out;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_1;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_2;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_3;
  wire       [23:0]   tcAccu_bf24_col_1;
  wire       [23:0]   tcAccu_bf24_col_2;
  wire       [23:0]   tcAccu_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_1_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_1_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_1_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_1_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_2_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_2_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_2_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_2_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_3_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_3_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_3_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_3_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_4_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_4_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_4_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_4_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_5_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_5_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_5_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_5_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_6_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_6_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_6_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_6_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_7_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_7_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_7_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_7_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_8_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_8_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_8_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_8_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_9_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_9_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_9_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_9_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_bf12_10_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_10_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_10_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_10_cascade_data_out_col_3;
  wire       [31:0]   tensor_core_bf12_11_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_11_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_11_cascade_data_out_col_3;
  wire       [71:0]   AccuDelayInst_io_pop_payload;
  wire       [5:0]    _zz_loadSelCounter_valueNext;
  wire       [0:0]    _zz_loadSelCounter_valueNext_1;
  wire       [15:0]   _zz_inputCounter_valueNext;
  wire       [0:0]    _zz_inputCounter_valueNext_1;
  wire       [15:0]   _zz_outValidCounter_valueNext;
  wire       [0:0]    _zz_outValidCounter_valueNext_1;
  wire       [15:0]   _zz_resValidCounter_valueNext;
  wire       [0:0]    _zz_resValidCounter_valueNext_1;
  wire       [15:0]   _zz_resValidCounter_overflowVal;
  reg                 io_loadValid_delay_1;
  reg                 loadValidD2t;
  reg                 loadSelCounter_willIncrement;
  wire                loadSelCounter_willClear;
  reg        [5:0]    loadSelCounter_valueNext;
  reg        [5:0]    loadSelCounter_value;
  wire                loadSelCounter_willOverflowIfInc;
  wire                loadSelCounter_willOverflow;
  reg        [1:0]    loadBufCtrlReg;
  wire       [1:0]    loadBufCtrl;
  wire       [15:0]   inputCounter_overflowVal;
  reg                 inputCounter_willIncrement;
  wire                inputCounter_willClear;
  reg        [15:0]   inputCounter_valueNext;
  reg        [15:0]   inputCounter_value;
  wire                inputCounter_willOverflowIfInc;
  wire                inputCounter_willOverflow;
  reg                 loadBufSel;
  reg                 io_dataValid_delay_1;
  reg                 io_dataValid_delay_2;
  reg                 io_dataValid_delay_3;
  reg                 io_dataValid_delay_4;
  reg                 io_dataValid_delay_5;
  reg                 io_dataValid_delay_6;
  reg                 io_dataValid_delay_7;
  reg                 io_dataValid_delay_8;
  reg                 io_dataValid_delay_9;
  reg                 io_dataValid_delay_10;
  reg                 io_dataValid_delay_11;
  reg                 io_dataValid_delay_12;
  reg                 io_dataValid_delay_13;
  reg                 io_dataValid_delay_14;
  reg                 io_dataValid_delay_15;
  reg                 io_dataValid_delay_16;
  reg                 io_dataValid_delay_17;
  reg                 io_dataValid_delay_18;
  reg                 io_dataValid_delay_19;
  reg                 io_dataValid_delay_20;
  reg                 io_dataValid_delay_21;
  reg                 io_dataValid_delay_22;
  reg                 io_dataValid_delay_23;
  reg                 io_dataValid_delay_24;
  reg                 io_dataValid_delay_25;
  reg                 io_dataValid_delay_26;
  reg                 io_dataValid_delay_27;
  reg                 oBufferLoadValid;
  wire       [15:0]   outValidCounter_overflowVal;
  reg                 outValidCounter_willIncrement;
  wire                outValidCounter_willClear;
  reg        [15:0]   outValidCounter_valueNext;
  reg        [15:0]   outValidCounter_value;
  wire                outValidCounter_willOverflowIfInc;
  wire                outValidCounter_willOverflow;
  reg                 outValidCounter_willOverflow_delay_1;
  wire       [15:0]   resValidCounter_overflowVal;
  reg                 resValidCounter_willIncrement;
  wire                resValidCounter_willClear;
  reg        [15:0]   resValidCounter_valueNext;
  reg        [15:0]   resValidCounter_value;
  wire                resValidCounter_willOverflowIfInc;
  wire                resValidCounter_willOverflow;
  reg                 resValidCounter_willOverflowIfInc_delay_1;
  reg                 resValid;
  wire       [23:0]   fbDelayFifoPayload_0;
  wire       [23:0]   fbDelayFifoPayload_1;
  wire       [23:0]   fbDelayFifoPayload_2;
  reg                 oBufferLoadValid_delay_1;
  reg                 oBufferLoadValid_delay_2;
  reg                 oBufferLoadValid_delay_3;
  reg                 oBufferLoadValid_delay_4;
  reg                 oBufferLoadValid_delay_5;
  reg                 oBufferLoadValid_delay_6;
  reg                 oBufferLoadValid_delay_7;
  reg                 oBufferLoadValid_delay_8;
  reg                 oBufferLoadValid_delay_9;
  reg                 oBufferLoadValid_delay_10;
  reg                 oBufferLoadValid_delay_11;
  reg                 oBufferLoadValid_delay_12;
  reg                 oBufferLoadValid_delay_13;
  reg                 oBufferLoadValid_delay_14;
  reg                 oBufferLoadValid_delay_15;
  reg                 oBufferLoadValid_delay_16;
  reg                 oBufferLoadValid_delay_17;
  reg                 oBufferLoadValid_delay_18;
  reg                 oBufferLoadValid_delay_19;
  reg                 oBufferLoadValid_delay_20;
  reg                 oBufferLoadValid_delay_21;
  reg                 oBufferLoadValid_delay_22;
  reg                 oBufferLoadValid_delay_23;
  reg                 oBufferLoadValid_delay_24;
  reg                 oBufferLoadValid_delay_25;
  reg                 oBufferLoadValid_delay_26;
  reg                 oBufferLoadValid_delay_27;
  reg                 oBufferLoadValid_delay_28;
  reg                 oBufferLoadValid_delay_29;
  reg        [23:0]   fbDelayFifoPayload_0_delay_1;
  reg        [23:0]   fbDelayFifoPayload_0_delay_2;
  reg        [23:0]   fbDelayFifoPayload_1_delay_1;
  reg        [23:0]   fbDelayFifoPayload_1_delay_2;
  reg        [23:0]   fbDelayFifoPayload_2_delay_1;
  reg        [23:0]   fbDelayFifoPayload_2_delay_2;

  assign _zz_loadSelCounter_valueNext_1 = loadSelCounter_willIncrement;
  assign _zz_loadSelCounter_valueNext = {5'd0, _zz_loadSelCounter_valueNext_1};
  assign _zz_inputCounter_valueNext_1 = inputCounter_willIncrement;
  assign _zz_inputCounter_valueNext = {15'd0, _zz_inputCounter_valueNext_1};
  assign _zz_outValidCounter_valueNext_1 = outValidCounter_willIncrement;
  assign _zz_outValidCounter_valueNext = {15'd0, _zz_outValidCounter_valueNext_1};
  assign _zz_resValidCounter_valueNext_1 = resValidCounter_willIncrement;
  assign _zz_resValidCounter_valueNext = {15'd0, _zz_resValidCounter_valueNext_1};
  assign _zz_resValidCounter_overflowVal = (io_matAColSubGrpLen - 16'h0002);
  tensor_core_entry_bf12 tcEntry (
    .clk                  (clk                             ), //i
    .data_in_1            (tcEntry_data_in_1[3:0]          ), //i
    .data_in_2            (tcEntry_data_in_2[3:0]          ), //i
    .data_in_3            (tcEntry_data_in_3[3:0]          ), //i
    .data_in_4            (tcEntry_data_in_4[3:0]          ), //i
    .data_in_5            (tcEntry_data_in_5[3:0]          ), //i
    .data_in_6            (tcEntry_data_in_6[3:0]          ), //i
    .data_in_7            (tcEntry_data_in_7[3:0]          ), //i
    .data_in_8            (tcEntry_data_in_8[3:0]          ), //i
    .data_in_9            (tcEntry_data_in_9[3:0]          ), //i
    .data_in_10           (tcEntry_data_in_10[3:0]         ), //i
    .data_in_11           (tcEntry_data_in_11[3:0]         ), //i
    .data_in_12           (tcEntry_data_in_12[3:0]         ), //i
    .data_in_13           (tcEntry_data_in_13[3:0]         ), //i
    .data_in_14           (tcEntry_data_in_14[3:0]         ), //i
    .data_in_15           (tcEntry_data_in_15[3:0]         ), //i
    .data_in_16           (tcEntry_data_in_16[3:0]         ), //i
    .data_in_17           (tcEntry_data_in_17[3:0]         ), //i
    .data_in_18           (tcEntry_data_in_18[3:0]         ), //i
    .data_in_19           (tcEntry_data_in_19[3:0]         ), //i
    .data_in_20           (tcEntry_data_in_20[3:0]         ), //i
    .side_in_1            (tcEntry_side_in_1[3:0]          ), //i
    .side_in_2            (tcEntry_side_in_2[3:0]          ), //i
    .side_in_3            (tcEntry_side_in_3[3:0]          ), //i
    .side_in_4            (tcEntry_side_in_4[3:0]          ), //i
    .shared_exponent_data (io_expCascadeIn[7:0]            ), //i
    .feed_sel             (tcEntry_feed_sel[1:0]           ), //i
    .load_bb_one          (tcEntry_load_bb_one             ), //i
    .load_bb_two          (tcEntry_load_bb_two             ), //i
    .load_buf_sel         (tcEntry_load_buf_sel            ), //i
    .clr0                 (tcEntry_clr0                    ), //i
    .clr1                 (tcEntry_clr1                    ), //i
    .cascade_weight_out   (tcEntry_cascade_weight_out[87:0])  //o
  );
  tensor_core_start_bf12 tcStartPoint (
    .clk                    (clk                                      ), //i
    .data_in_1              (tcStartPoint_data_in_1[3:0]              ), //i
    .data_in_2              (tcStartPoint_data_in_2[3:0]              ), //i
    .data_in_3              (tcStartPoint_data_in_3[3:0]              ), //i
    .data_in_4              (tcStartPoint_data_in_4[3:0]              ), //i
    .data_in_5              (tcStartPoint_data_in_5[3:0]              ), //i
    .data_in_6              (tcStartPoint_data_in_6[3:0]              ), //i
    .data_in_7              (tcStartPoint_data_in_7[3:0]              ), //i
    .data_in_8              (tcStartPoint_data_in_8[3:0]              ), //i
    .data_in_9              (tcStartPoint_data_in_9[3:0]              ), //i
    .data_in_10             (tcStartPoint_data_in_10[3:0]             ), //i
    .data_in_11             (tcStartPoint_data_in_11[3:0]             ), //i
    .data_in_12             (tcStartPoint_data_in_12[3:0]             ), //i
    .data_in_13             (tcStartPoint_data_in_13[3:0]             ), //i
    .data_in_14             (tcStartPoint_data_in_14[3:0]             ), //i
    .data_in_15             (tcStartPoint_data_in_15[3:0]             ), //i
    .data_in_16             (tcStartPoint_data_in_16[3:0]             ), //i
    .data_in_17             (tcStartPoint_data_in_17[3:0]             ), //i
    .data_in_18             (tcStartPoint_data_in_18[3:0]             ), //i
    .data_in_19             (tcStartPoint_data_in_19[3:0]             ), //i
    .data_in_20             (tcStartPoint_data_in_20[3:0]             ), //i
    .side_in_1              (tcStartPoint_side_in_1[3:0]              ), //i
    .side_in_2              (tcStartPoint_side_in_2[3:0]              ), //i
    .side_in_3              (tcStartPoint_side_in_3[3:0]              ), //i
    .side_in_4              (tcStartPoint_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_0[7:0]                          ), //i
    .feed_sel               (tcStartPoint_feed_sel[1:0]               ), //i
    .load_bb_one            (tcStartPoint_load_bb_one                 ), //i
    .load_bb_two            (tcStartPoint_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                               ), //i
    .clr0                   (io_dataIn_0_valid                        ), //i
    .clr1                   (tcStartPoint_clr1                        ), //i
    .cascade_weight_in      (tcEntry_cascade_weight_out[87:0]         ), //i
    .cascade_weight_out     (tcStartPoint_cascade_weight_out[87:0]    ), //o
    .cascade_data_out_col_1 (tcStartPoint_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tcStartPoint_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tcStartPoint_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_accu tcAccu (
    .clk                   (clk                                             ), //i
    .acc_en                (tcAccu_acc_en                                   ), //i
    .zero_en               (tcAccu_zero_en                                  ), //i
    .clr0                  (resValid                                        ), //i
    .bf24_a1               (fbDelayFifoPayload_0_delay_2[23:0]              ), //i
    .bf24_a2               (fbDelayFifoPayload_1_delay_2[23:0]              ), //i
    .bf24_a3               (fbDelayFifoPayload_2_delay_2[23:0]              ), //i
    .cascade_data_in_col_1 (tensor_core_bf12_11_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2 (tensor_core_bf12_11_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3 (tensor_core_bf12_11_cascade_data_out_col_3[31:0]), //i
    .bf24_col_1            (tcAccu_bf24_col_1[23:0]                         ), //o
    .bf24_col_2            (tcAccu_bf24_col_2[23:0]                         ), //o
    .bf24_col_3            (tcAccu_bf24_col_3[23:0]                         )  //o
  );
  tensor_core_bf12 tensor_core_bf12_1 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_1_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_1_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_1_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_1_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_1_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_1_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_1_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_1_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_1_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_1_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_1_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_1_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_1_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_1_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_1_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_1_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_1_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_1_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_1_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_1_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_1_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_1_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_1_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_1_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_1[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_1_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_1_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_1_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_1_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_1_zero_en                     ), //i
    .clr0                   (io_dataIn_1_valid                              ), //i
    .clr1                   (tensor_core_bf12_1_clr1                        ), //i
    .cascade_weight_in      (tcStartPoint_cascade_weight_out[87:0]          ), //i
    .cascade_weight_out     (tensor_core_bf12_1_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tcStartPoint_cascade_data_out_col_1[31:0]      ), //i
    .cascade_data_in_col_2  (tcStartPoint_cascade_data_out_col_2[31:0]      ), //i
    .cascade_data_in_col_3  (tcStartPoint_cascade_data_out_col_3[31:0]      ), //i
    .cascade_data_out_col_1 (tensor_core_bf12_1_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_1_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_1_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_2 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_2_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_2_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_2_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_2_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_2_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_2_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_2_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_2_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_2_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_2_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_2_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_2_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_2_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_2_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_2_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_2_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_2_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_2_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_2_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_2_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_2_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_2_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_2_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_2_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_2[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_2_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_2_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_2_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_2_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_2_zero_en                     ), //i
    .clr0                   (io_dataIn_2_valid                              ), //i
    .clr1                   (tensor_core_bf12_2_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_1_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_2_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_1_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_1_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_1_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_2_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_2_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_2_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_3 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_3_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_3_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_3_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_3_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_3_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_3_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_3_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_3_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_3_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_3_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_3_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_3_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_3_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_3_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_3_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_3_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_3_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_3_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_3_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_3_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_3_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_3_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_3_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_3_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_3[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_3_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_3_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_3_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_3_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_3_zero_en                     ), //i
    .clr0                   (io_dataIn_3_valid                              ), //i
    .clr1                   (tensor_core_bf12_3_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_2_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_3_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_2_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_2_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_2_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_3_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_3_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_3_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_4 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_4_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_4_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_4_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_4_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_4_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_4_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_4_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_4_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_4_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_4_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_4_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_4_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_4_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_4_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_4_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_4_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_4_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_4_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_4_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_4_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_4_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_4_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_4_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_4_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_4[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_4_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_4_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_4_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_4_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_4_zero_en                     ), //i
    .clr0                   (io_dataIn_4_valid                              ), //i
    .clr1                   (tensor_core_bf12_4_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_3_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_4_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_3_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_3_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_3_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_4_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_4_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_4_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_5 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_5_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_5_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_5_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_5_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_5_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_5_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_5_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_5_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_5_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_5_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_5_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_5_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_5_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_5_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_5_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_5_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_5_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_5_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_5_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_5_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_5_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_5_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_5_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_5_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_5[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_5_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_5_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_5_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_5_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_5_zero_en                     ), //i
    .clr0                   (io_dataIn_5_valid                              ), //i
    .clr1                   (tensor_core_bf12_5_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_4_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_5_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_4_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_4_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_4_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_5_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_5_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_5_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_6 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_6_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_6_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_6_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_6_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_6_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_6_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_6_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_6_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_6_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_6_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_6_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_6_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_6_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_6_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_6_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_6_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_6_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_6_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_6_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_6_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_6_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_6_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_6_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_6_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_6[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_6_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_6_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_6_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_6_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_6_zero_en                     ), //i
    .clr0                   (io_dataIn_6_valid                              ), //i
    .clr1                   (tensor_core_bf12_6_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_5_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_6_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_5_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_5_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_5_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_6_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_6_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_6_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_7 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_7_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_7_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_7_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_7_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_7_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_7_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_7_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_7_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_7_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_7_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_7_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_7_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_7_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_7_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_7_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_7_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_7_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_7_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_7_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_7_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_7_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_7_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_7_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_7_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_7[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_7_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_7_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_7_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_7_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_7_zero_en                     ), //i
    .clr0                   (io_dataIn_7_valid                              ), //i
    .clr1                   (tensor_core_bf12_7_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_6_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_7_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_6_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_6_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_6_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_7_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_7_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_7_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_8 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_8_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_8_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_8_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_8_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_8_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_8_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_8_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_8_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_8_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_8_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_8_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_8_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_8_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_8_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_8_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_8_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_8_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_8_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_8_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_8_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_8_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_8_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_8_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_8_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_8[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_8_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_8_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_8_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_8_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_8_zero_en                     ), //i
    .clr0                   (io_dataIn_8_valid                              ), //i
    .clr1                   (tensor_core_bf12_8_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_7_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_8_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_7_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_7_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_7_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_8_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_8_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_8_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_9 (
    .clk                    (clk                                            ), //i
    .data_in_1              (tensor_core_bf12_9_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_9_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_9_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_9_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_9_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_9_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_9_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_9_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_9_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_9_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_9_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_9_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_9_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_9_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_9_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_9_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_9_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_9_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_9_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_9_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_9_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_9_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_9_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_9_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_9[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_9_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_9_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_9_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .acc_en                 (tensor_core_bf12_9_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_9_zero_en                     ), //i
    .clr0                   (io_dataIn_9_valid                              ), //i
    .clr1                   (tensor_core_bf12_9_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_8_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_9_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_8_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_8_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_8_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_9_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_9_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_9_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_10 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_10_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_10_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_10_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_10_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_10_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_10_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_10_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_10_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_10_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_10_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_10_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_10_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_10_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_10_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_10_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_10_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_10_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_10_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_10_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_10_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_10_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_10_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_10_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_10_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_10[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_10_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_10_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_10_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .acc_en                 (tensor_core_bf12_10_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_10_zero_en                     ), //i
    .clr0                   (io_dataIn_10_valid                              ), //i
    .clr1                   (tensor_core_bf12_10_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_9_cascade_weight_out[87:0]     ), //i
    .cascade_weight_out     (tensor_core_bf12_10_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_9_cascade_data_out_col_1[31:0] ), //i
    .cascade_data_in_col_2  (tensor_core_bf12_9_cascade_data_out_col_2[31:0] ), //i
    .cascade_data_in_col_3  (tensor_core_bf12_9_cascade_data_out_col_3[31:0] ), //i
    .cascade_data_out_col_1 (tensor_core_bf12_10_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_10_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_10_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_11 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_11_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_11_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_11_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_11_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_11_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_11_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_11_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_11_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_11_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_11_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_11_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_11_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_11_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_11_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_11_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_11_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_11_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_11_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_11_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_11_data_in_20[3:0]             ), //i
    .side_in_1              (tensor_core_bf12_11_side_in_1[3:0]              ), //i
    .side_in_2              (tensor_core_bf12_11_side_in_2[3:0]              ), //i
    .side_in_3              (tensor_core_bf12_11_side_in_3[3:0]              ), //i
    .side_in_4              (tensor_core_bf12_11_side_in_4[3:0]              ), //i
    .shared_exponent_data   (io_expIn_11[7:0]                                ), //i
    .feed_sel               (tensor_core_bf12_11_feed_sel[1:0]               ), //i
    .load_bb_one            (tensor_core_bf12_11_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_11_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .acc_en                 (tensor_core_bf12_11_acc_en                      ), //i
    .zero_en                (tensor_core_bf12_11_zero_en                     ), //i
    .clr0                   (io_dataIn_11_valid                              ), //i
    .clr1                   (tensor_core_bf12_11_clr1                        ), //i
    .cascade_weight_in      (tensor_core_bf12_10_cascade_weight_out[87:0]    ), //i
    .cascade_data_in_col_1  (tensor_core_bf12_10_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_10_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_10_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_11_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_11_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_11_cascade_data_out_col_3[31:0])  //o
  );
  StreamOutFifo_46 AccuDelayInst (
    .io_push_valid   (oBufferLoadValid                   ), //i
    .io_push_payload (AccuDelayInst_io_push_payload[71:0]), //i
    .io_pop_ready    (AccuDelayInst_io_pop_ready         ), //i
    .io_pop_payload  (AccuDelayInst_io_pop_payload[71:0] ), //o
    .clk             (clk                                )  //i
  );
  always @(*) begin
    loadSelCounter_willIncrement = 1'b0;
    if(loadValidD2t) begin
      loadSelCounter_willIncrement = 1'b1;
    end
  end

  assign loadSelCounter_willClear = 1'b0;
  assign loadSelCounter_willOverflowIfInc = (loadSelCounter_value == 6'h23);
  assign loadSelCounter_willOverflow = (loadSelCounter_willOverflowIfInc && loadSelCounter_willIncrement);
  always @(*) begin
    if(loadSelCounter_willOverflow) begin
      loadSelCounter_valueNext = 6'h00;
    end else begin
      loadSelCounter_valueNext = (loadSelCounter_value + _zz_loadSelCounter_valueNext);
    end
    if(loadSelCounter_willClear) begin
      loadSelCounter_valueNext = 6'h00;
    end
  end

  assign loadBufCtrl = (loadValidD2t ? loadBufCtrlReg : 2'b00);
  always @(*) begin
    inputCounter_willIncrement = 1'b0;
    if(io_dataValid) begin
      inputCounter_willIncrement = 1'b1;
    end
  end

  assign inputCounter_willClear = 1'b0;
  assign inputCounter_willOverflowIfInc = (inputCounter_overflowVal <= inputCounter_value);
  assign inputCounter_willOverflow = (inputCounter_willOverflowIfInc && inputCounter_willIncrement);
  always @(*) begin
    if(inputCounter_willOverflow) begin
      inputCounter_valueNext = 16'h0000;
    end else begin
      inputCounter_valueNext = (inputCounter_value + _zz_inputCounter_valueNext);
    end
    if(inputCounter_willClear) begin
      inputCounter_valueNext = 16'h0000;
    end
  end

  assign inputCounter_overflowVal = (io_inputIters - 16'h0001);
  always @(*) begin
    outValidCounter_willIncrement = 1'b0;
    if(oBufferLoadValid) begin
      outValidCounter_willIncrement = 1'b1;
    end
  end

  assign outValidCounter_willClear = 1'b0;
  assign outValidCounter_willOverflowIfInc = (outValidCounter_overflowVal <= outValidCounter_value);
  assign outValidCounter_willOverflow = (outValidCounter_willOverflowIfInc && outValidCounter_willIncrement);
  always @(*) begin
    if(outValidCounter_willOverflow) begin
      outValidCounter_valueNext = 16'h0000;
    end else begin
      outValidCounter_valueNext = (outValidCounter_value + _zz_outValidCounter_valueNext);
    end
    if(outValidCounter_willClear) begin
      outValidCounter_valueNext = 16'h0000;
    end
  end

  assign outValidCounter_overflowVal = (io_inputIters - 16'h0001);
  assign io_outValid = outValidCounter_willOverflow_delay_1;
  assign tcEntry_data_in_1 = io_loadCascadeIn[3 : 0];
  assign tcEntry_data_in_2 = io_loadCascadeIn[7 : 4];
  assign tcEntry_data_in_3 = io_loadCascadeIn[11 : 8];
  assign tcEntry_data_in_4 = io_loadCascadeIn[15 : 12];
  assign tcEntry_data_in_5 = io_loadCascadeIn[19 : 16];
  assign tcEntry_data_in_6 = io_loadCascadeIn[23 : 20];
  assign tcEntry_data_in_7 = io_loadCascadeIn[27 : 24];
  assign tcEntry_data_in_8 = io_loadCascadeIn[31 : 28];
  assign tcEntry_data_in_9 = io_loadCascadeIn[35 : 32];
  assign tcEntry_data_in_10 = io_loadCascadeIn[39 : 36];
  assign tcEntry_data_in_11 = io_loadCascadeIn[43 : 40];
  assign tcEntry_data_in_12 = io_loadCascadeIn[47 : 44];
  assign tcEntry_data_in_13 = io_loadCascadeIn[51 : 48];
  assign tcEntry_data_in_14 = io_loadCascadeIn[55 : 52];
  assign tcEntry_data_in_15 = io_loadCascadeIn[59 : 56];
  assign tcEntry_data_in_16 = io_loadCascadeIn[63 : 60];
  assign tcEntry_data_in_17 = io_loadCascadeIn[67 : 64];
  assign tcEntry_data_in_18 = io_loadCascadeIn[71 : 68];
  assign tcEntry_data_in_19 = io_loadCascadeIn[75 : 72];
  assign tcEntry_data_in_20 = io_loadCascadeIn[79 : 76];
  assign tcEntry_feed_sel = 2'b00;
  assign tcEntry_load_buf_sel = 1'b0;
  assign tcEntry_load_bb_one = 1'b1;
  assign tcEntry_load_bb_two = 1'b0;
  assign tcEntry_side_in_1 = 4'b0000;
  assign tcEntry_side_in_2 = 4'b0000;
  assign tcEntry_side_in_3 = 4'b0000;
  assign tcEntry_side_in_4 = 4'b0000;
  assign tcEntry_clr0 = 1'b0;
  assign tcEntry_clr1 = 1'b0;
  assign tcStartPoint_data_in_1 = io_dataIn_0_payload[3 : 0];
  assign tcStartPoint_data_in_2 = io_dataIn_0_payload[7 : 4];
  assign tcStartPoint_data_in_3 = io_dataIn_0_payload[11 : 8];
  assign tcStartPoint_data_in_4 = io_dataIn_0_payload[15 : 12];
  assign tcStartPoint_data_in_5 = io_dataIn_0_payload[19 : 16];
  assign tcStartPoint_data_in_6 = io_dataIn_0_payload[23 : 20];
  assign tcStartPoint_data_in_7 = io_dataIn_0_payload[27 : 24];
  assign tcStartPoint_data_in_8 = io_dataIn_0_payload[31 : 28];
  assign tcStartPoint_data_in_9 = io_dataIn_0_payload[35 : 32];
  assign tcStartPoint_data_in_10 = io_dataIn_0_payload[39 : 36];
  assign tcStartPoint_data_in_11 = io_dataIn_0_payload[43 : 40];
  assign tcStartPoint_data_in_12 = io_dataIn_0_payload[47 : 44];
  assign tcStartPoint_data_in_13 = io_dataIn_0_payload[51 : 48];
  assign tcStartPoint_data_in_14 = io_dataIn_0_payload[55 : 52];
  assign tcStartPoint_data_in_15 = io_dataIn_0_payload[59 : 56];
  assign tcStartPoint_data_in_16 = io_dataIn_0_payload[63 : 60];
  assign tcStartPoint_data_in_17 = io_dataIn_0_payload[67 : 64];
  assign tcStartPoint_data_in_18 = io_dataIn_0_payload[71 : 68];
  assign tcStartPoint_data_in_19 = io_dataIn_0_payload[75 : 72];
  assign tcStartPoint_data_in_20 = io_dataIn_0_payload[79 : 76];
  assign tcStartPoint_load_bb_one = loadBufCtrl[0];
  assign tcStartPoint_load_bb_two = loadBufCtrl[1];
  assign tcStartPoint_side_in_1 = 4'b0000;
  assign tcStartPoint_side_in_2 = 4'b0000;
  assign tcStartPoint_side_in_3 = 4'b0000;
  assign tcStartPoint_side_in_4 = 4'b0000;
  assign tcStartPoint_feed_sel = 2'b01;
  assign tcStartPoint_clr1 = 1'b0;
  assign tensor_core_bf12_1_data_in_1 = io_dataIn_1_payload[3 : 0];
  assign tensor_core_bf12_1_data_in_2 = io_dataIn_1_payload[7 : 4];
  assign tensor_core_bf12_1_data_in_3 = io_dataIn_1_payload[11 : 8];
  assign tensor_core_bf12_1_data_in_4 = io_dataIn_1_payload[15 : 12];
  assign tensor_core_bf12_1_data_in_5 = io_dataIn_1_payload[19 : 16];
  assign tensor_core_bf12_1_data_in_6 = io_dataIn_1_payload[23 : 20];
  assign tensor_core_bf12_1_data_in_7 = io_dataIn_1_payload[27 : 24];
  assign tensor_core_bf12_1_data_in_8 = io_dataIn_1_payload[31 : 28];
  assign tensor_core_bf12_1_data_in_9 = io_dataIn_1_payload[35 : 32];
  assign tensor_core_bf12_1_data_in_10 = io_dataIn_1_payload[39 : 36];
  assign tensor_core_bf12_1_data_in_11 = io_dataIn_1_payload[43 : 40];
  assign tensor_core_bf12_1_data_in_12 = io_dataIn_1_payload[47 : 44];
  assign tensor_core_bf12_1_data_in_13 = io_dataIn_1_payload[51 : 48];
  assign tensor_core_bf12_1_data_in_14 = io_dataIn_1_payload[55 : 52];
  assign tensor_core_bf12_1_data_in_15 = io_dataIn_1_payload[59 : 56];
  assign tensor_core_bf12_1_data_in_16 = io_dataIn_1_payload[63 : 60];
  assign tensor_core_bf12_1_data_in_17 = io_dataIn_1_payload[67 : 64];
  assign tensor_core_bf12_1_data_in_18 = io_dataIn_1_payload[71 : 68];
  assign tensor_core_bf12_1_data_in_19 = io_dataIn_1_payload[75 : 72];
  assign tensor_core_bf12_1_data_in_20 = io_dataIn_1_payload[79 : 76];
  assign tensor_core_bf12_1_zero_en = 1'b0;
  assign tensor_core_bf12_1_acc_en = 1'b0;
  assign tensor_core_bf12_1_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_1_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_1_feed_sel = 2'b01;
  assign tensor_core_bf12_1_side_in_1 = 4'b0000;
  assign tensor_core_bf12_1_side_in_2 = 4'b0000;
  assign tensor_core_bf12_1_side_in_3 = 4'b0000;
  assign tensor_core_bf12_1_side_in_4 = 4'b0000;
  assign tensor_core_bf12_1_clr1 = 1'b0;
  assign tensor_core_bf12_2_data_in_1 = io_dataIn_2_payload[3 : 0];
  assign tensor_core_bf12_2_data_in_2 = io_dataIn_2_payload[7 : 4];
  assign tensor_core_bf12_2_data_in_3 = io_dataIn_2_payload[11 : 8];
  assign tensor_core_bf12_2_data_in_4 = io_dataIn_2_payload[15 : 12];
  assign tensor_core_bf12_2_data_in_5 = io_dataIn_2_payload[19 : 16];
  assign tensor_core_bf12_2_data_in_6 = io_dataIn_2_payload[23 : 20];
  assign tensor_core_bf12_2_data_in_7 = io_dataIn_2_payload[27 : 24];
  assign tensor_core_bf12_2_data_in_8 = io_dataIn_2_payload[31 : 28];
  assign tensor_core_bf12_2_data_in_9 = io_dataIn_2_payload[35 : 32];
  assign tensor_core_bf12_2_data_in_10 = io_dataIn_2_payload[39 : 36];
  assign tensor_core_bf12_2_data_in_11 = io_dataIn_2_payload[43 : 40];
  assign tensor_core_bf12_2_data_in_12 = io_dataIn_2_payload[47 : 44];
  assign tensor_core_bf12_2_data_in_13 = io_dataIn_2_payload[51 : 48];
  assign tensor_core_bf12_2_data_in_14 = io_dataIn_2_payload[55 : 52];
  assign tensor_core_bf12_2_data_in_15 = io_dataIn_2_payload[59 : 56];
  assign tensor_core_bf12_2_data_in_16 = io_dataIn_2_payload[63 : 60];
  assign tensor_core_bf12_2_data_in_17 = io_dataIn_2_payload[67 : 64];
  assign tensor_core_bf12_2_data_in_18 = io_dataIn_2_payload[71 : 68];
  assign tensor_core_bf12_2_data_in_19 = io_dataIn_2_payload[75 : 72];
  assign tensor_core_bf12_2_data_in_20 = io_dataIn_2_payload[79 : 76];
  assign tensor_core_bf12_2_zero_en = 1'b0;
  assign tensor_core_bf12_2_acc_en = 1'b0;
  assign tensor_core_bf12_2_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_2_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_2_feed_sel = 2'b01;
  assign tensor_core_bf12_2_side_in_1 = 4'b0000;
  assign tensor_core_bf12_2_side_in_2 = 4'b0000;
  assign tensor_core_bf12_2_side_in_3 = 4'b0000;
  assign tensor_core_bf12_2_side_in_4 = 4'b0000;
  assign tensor_core_bf12_2_clr1 = 1'b0;
  assign tensor_core_bf12_3_data_in_1 = io_dataIn_3_payload[3 : 0];
  assign tensor_core_bf12_3_data_in_2 = io_dataIn_3_payload[7 : 4];
  assign tensor_core_bf12_3_data_in_3 = io_dataIn_3_payload[11 : 8];
  assign tensor_core_bf12_3_data_in_4 = io_dataIn_3_payload[15 : 12];
  assign tensor_core_bf12_3_data_in_5 = io_dataIn_3_payload[19 : 16];
  assign tensor_core_bf12_3_data_in_6 = io_dataIn_3_payload[23 : 20];
  assign tensor_core_bf12_3_data_in_7 = io_dataIn_3_payload[27 : 24];
  assign tensor_core_bf12_3_data_in_8 = io_dataIn_3_payload[31 : 28];
  assign tensor_core_bf12_3_data_in_9 = io_dataIn_3_payload[35 : 32];
  assign tensor_core_bf12_3_data_in_10 = io_dataIn_3_payload[39 : 36];
  assign tensor_core_bf12_3_data_in_11 = io_dataIn_3_payload[43 : 40];
  assign tensor_core_bf12_3_data_in_12 = io_dataIn_3_payload[47 : 44];
  assign tensor_core_bf12_3_data_in_13 = io_dataIn_3_payload[51 : 48];
  assign tensor_core_bf12_3_data_in_14 = io_dataIn_3_payload[55 : 52];
  assign tensor_core_bf12_3_data_in_15 = io_dataIn_3_payload[59 : 56];
  assign tensor_core_bf12_3_data_in_16 = io_dataIn_3_payload[63 : 60];
  assign tensor_core_bf12_3_data_in_17 = io_dataIn_3_payload[67 : 64];
  assign tensor_core_bf12_3_data_in_18 = io_dataIn_3_payload[71 : 68];
  assign tensor_core_bf12_3_data_in_19 = io_dataIn_3_payload[75 : 72];
  assign tensor_core_bf12_3_data_in_20 = io_dataIn_3_payload[79 : 76];
  assign tensor_core_bf12_3_zero_en = 1'b0;
  assign tensor_core_bf12_3_acc_en = 1'b0;
  assign tensor_core_bf12_3_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_3_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_3_feed_sel = 2'b01;
  assign tensor_core_bf12_3_side_in_1 = 4'b0000;
  assign tensor_core_bf12_3_side_in_2 = 4'b0000;
  assign tensor_core_bf12_3_side_in_3 = 4'b0000;
  assign tensor_core_bf12_3_side_in_4 = 4'b0000;
  assign tensor_core_bf12_3_clr1 = 1'b0;
  assign tensor_core_bf12_4_data_in_1 = io_dataIn_4_payload[3 : 0];
  assign tensor_core_bf12_4_data_in_2 = io_dataIn_4_payload[7 : 4];
  assign tensor_core_bf12_4_data_in_3 = io_dataIn_4_payload[11 : 8];
  assign tensor_core_bf12_4_data_in_4 = io_dataIn_4_payload[15 : 12];
  assign tensor_core_bf12_4_data_in_5 = io_dataIn_4_payload[19 : 16];
  assign tensor_core_bf12_4_data_in_6 = io_dataIn_4_payload[23 : 20];
  assign tensor_core_bf12_4_data_in_7 = io_dataIn_4_payload[27 : 24];
  assign tensor_core_bf12_4_data_in_8 = io_dataIn_4_payload[31 : 28];
  assign tensor_core_bf12_4_data_in_9 = io_dataIn_4_payload[35 : 32];
  assign tensor_core_bf12_4_data_in_10 = io_dataIn_4_payload[39 : 36];
  assign tensor_core_bf12_4_data_in_11 = io_dataIn_4_payload[43 : 40];
  assign tensor_core_bf12_4_data_in_12 = io_dataIn_4_payload[47 : 44];
  assign tensor_core_bf12_4_data_in_13 = io_dataIn_4_payload[51 : 48];
  assign tensor_core_bf12_4_data_in_14 = io_dataIn_4_payload[55 : 52];
  assign tensor_core_bf12_4_data_in_15 = io_dataIn_4_payload[59 : 56];
  assign tensor_core_bf12_4_data_in_16 = io_dataIn_4_payload[63 : 60];
  assign tensor_core_bf12_4_data_in_17 = io_dataIn_4_payload[67 : 64];
  assign tensor_core_bf12_4_data_in_18 = io_dataIn_4_payload[71 : 68];
  assign tensor_core_bf12_4_data_in_19 = io_dataIn_4_payload[75 : 72];
  assign tensor_core_bf12_4_data_in_20 = io_dataIn_4_payload[79 : 76];
  assign tensor_core_bf12_4_zero_en = 1'b0;
  assign tensor_core_bf12_4_acc_en = 1'b0;
  assign tensor_core_bf12_4_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_4_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_4_feed_sel = 2'b01;
  assign tensor_core_bf12_4_side_in_1 = 4'b0000;
  assign tensor_core_bf12_4_side_in_2 = 4'b0000;
  assign tensor_core_bf12_4_side_in_3 = 4'b0000;
  assign tensor_core_bf12_4_side_in_4 = 4'b0000;
  assign tensor_core_bf12_4_clr1 = 1'b0;
  assign tensor_core_bf12_5_data_in_1 = io_dataIn_5_payload[3 : 0];
  assign tensor_core_bf12_5_data_in_2 = io_dataIn_5_payload[7 : 4];
  assign tensor_core_bf12_5_data_in_3 = io_dataIn_5_payload[11 : 8];
  assign tensor_core_bf12_5_data_in_4 = io_dataIn_5_payload[15 : 12];
  assign tensor_core_bf12_5_data_in_5 = io_dataIn_5_payload[19 : 16];
  assign tensor_core_bf12_5_data_in_6 = io_dataIn_5_payload[23 : 20];
  assign tensor_core_bf12_5_data_in_7 = io_dataIn_5_payload[27 : 24];
  assign tensor_core_bf12_5_data_in_8 = io_dataIn_5_payload[31 : 28];
  assign tensor_core_bf12_5_data_in_9 = io_dataIn_5_payload[35 : 32];
  assign tensor_core_bf12_5_data_in_10 = io_dataIn_5_payload[39 : 36];
  assign tensor_core_bf12_5_data_in_11 = io_dataIn_5_payload[43 : 40];
  assign tensor_core_bf12_5_data_in_12 = io_dataIn_5_payload[47 : 44];
  assign tensor_core_bf12_5_data_in_13 = io_dataIn_5_payload[51 : 48];
  assign tensor_core_bf12_5_data_in_14 = io_dataIn_5_payload[55 : 52];
  assign tensor_core_bf12_5_data_in_15 = io_dataIn_5_payload[59 : 56];
  assign tensor_core_bf12_5_data_in_16 = io_dataIn_5_payload[63 : 60];
  assign tensor_core_bf12_5_data_in_17 = io_dataIn_5_payload[67 : 64];
  assign tensor_core_bf12_5_data_in_18 = io_dataIn_5_payload[71 : 68];
  assign tensor_core_bf12_5_data_in_19 = io_dataIn_5_payload[75 : 72];
  assign tensor_core_bf12_5_data_in_20 = io_dataIn_5_payload[79 : 76];
  assign tensor_core_bf12_5_zero_en = 1'b0;
  assign tensor_core_bf12_5_acc_en = 1'b0;
  assign tensor_core_bf12_5_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_5_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_5_feed_sel = 2'b01;
  assign tensor_core_bf12_5_side_in_1 = 4'b0000;
  assign tensor_core_bf12_5_side_in_2 = 4'b0000;
  assign tensor_core_bf12_5_side_in_3 = 4'b0000;
  assign tensor_core_bf12_5_side_in_4 = 4'b0000;
  assign tensor_core_bf12_5_clr1 = 1'b0;
  assign tensor_core_bf12_6_data_in_1 = io_dataIn_6_payload[3 : 0];
  assign tensor_core_bf12_6_data_in_2 = io_dataIn_6_payload[7 : 4];
  assign tensor_core_bf12_6_data_in_3 = io_dataIn_6_payload[11 : 8];
  assign tensor_core_bf12_6_data_in_4 = io_dataIn_6_payload[15 : 12];
  assign tensor_core_bf12_6_data_in_5 = io_dataIn_6_payload[19 : 16];
  assign tensor_core_bf12_6_data_in_6 = io_dataIn_6_payload[23 : 20];
  assign tensor_core_bf12_6_data_in_7 = io_dataIn_6_payload[27 : 24];
  assign tensor_core_bf12_6_data_in_8 = io_dataIn_6_payload[31 : 28];
  assign tensor_core_bf12_6_data_in_9 = io_dataIn_6_payload[35 : 32];
  assign tensor_core_bf12_6_data_in_10 = io_dataIn_6_payload[39 : 36];
  assign tensor_core_bf12_6_data_in_11 = io_dataIn_6_payload[43 : 40];
  assign tensor_core_bf12_6_data_in_12 = io_dataIn_6_payload[47 : 44];
  assign tensor_core_bf12_6_data_in_13 = io_dataIn_6_payload[51 : 48];
  assign tensor_core_bf12_6_data_in_14 = io_dataIn_6_payload[55 : 52];
  assign tensor_core_bf12_6_data_in_15 = io_dataIn_6_payload[59 : 56];
  assign tensor_core_bf12_6_data_in_16 = io_dataIn_6_payload[63 : 60];
  assign tensor_core_bf12_6_data_in_17 = io_dataIn_6_payload[67 : 64];
  assign tensor_core_bf12_6_data_in_18 = io_dataIn_6_payload[71 : 68];
  assign tensor_core_bf12_6_data_in_19 = io_dataIn_6_payload[75 : 72];
  assign tensor_core_bf12_6_data_in_20 = io_dataIn_6_payload[79 : 76];
  assign tensor_core_bf12_6_zero_en = 1'b0;
  assign tensor_core_bf12_6_acc_en = 1'b0;
  assign tensor_core_bf12_6_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_6_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_6_feed_sel = 2'b01;
  assign tensor_core_bf12_6_side_in_1 = 4'b0000;
  assign tensor_core_bf12_6_side_in_2 = 4'b0000;
  assign tensor_core_bf12_6_side_in_3 = 4'b0000;
  assign tensor_core_bf12_6_side_in_4 = 4'b0000;
  assign tensor_core_bf12_6_clr1 = 1'b0;
  assign tensor_core_bf12_7_data_in_1 = io_dataIn_7_payload[3 : 0];
  assign tensor_core_bf12_7_data_in_2 = io_dataIn_7_payload[7 : 4];
  assign tensor_core_bf12_7_data_in_3 = io_dataIn_7_payload[11 : 8];
  assign tensor_core_bf12_7_data_in_4 = io_dataIn_7_payload[15 : 12];
  assign tensor_core_bf12_7_data_in_5 = io_dataIn_7_payload[19 : 16];
  assign tensor_core_bf12_7_data_in_6 = io_dataIn_7_payload[23 : 20];
  assign tensor_core_bf12_7_data_in_7 = io_dataIn_7_payload[27 : 24];
  assign tensor_core_bf12_7_data_in_8 = io_dataIn_7_payload[31 : 28];
  assign tensor_core_bf12_7_data_in_9 = io_dataIn_7_payload[35 : 32];
  assign tensor_core_bf12_7_data_in_10 = io_dataIn_7_payload[39 : 36];
  assign tensor_core_bf12_7_data_in_11 = io_dataIn_7_payload[43 : 40];
  assign tensor_core_bf12_7_data_in_12 = io_dataIn_7_payload[47 : 44];
  assign tensor_core_bf12_7_data_in_13 = io_dataIn_7_payload[51 : 48];
  assign tensor_core_bf12_7_data_in_14 = io_dataIn_7_payload[55 : 52];
  assign tensor_core_bf12_7_data_in_15 = io_dataIn_7_payload[59 : 56];
  assign tensor_core_bf12_7_data_in_16 = io_dataIn_7_payload[63 : 60];
  assign tensor_core_bf12_7_data_in_17 = io_dataIn_7_payload[67 : 64];
  assign tensor_core_bf12_7_data_in_18 = io_dataIn_7_payload[71 : 68];
  assign tensor_core_bf12_7_data_in_19 = io_dataIn_7_payload[75 : 72];
  assign tensor_core_bf12_7_data_in_20 = io_dataIn_7_payload[79 : 76];
  assign tensor_core_bf12_7_zero_en = 1'b0;
  assign tensor_core_bf12_7_acc_en = 1'b0;
  assign tensor_core_bf12_7_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_7_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_7_feed_sel = 2'b01;
  assign tensor_core_bf12_7_side_in_1 = 4'b0000;
  assign tensor_core_bf12_7_side_in_2 = 4'b0000;
  assign tensor_core_bf12_7_side_in_3 = 4'b0000;
  assign tensor_core_bf12_7_side_in_4 = 4'b0000;
  assign tensor_core_bf12_7_clr1 = 1'b0;
  assign tensor_core_bf12_8_data_in_1 = io_dataIn_8_payload[3 : 0];
  assign tensor_core_bf12_8_data_in_2 = io_dataIn_8_payload[7 : 4];
  assign tensor_core_bf12_8_data_in_3 = io_dataIn_8_payload[11 : 8];
  assign tensor_core_bf12_8_data_in_4 = io_dataIn_8_payload[15 : 12];
  assign tensor_core_bf12_8_data_in_5 = io_dataIn_8_payload[19 : 16];
  assign tensor_core_bf12_8_data_in_6 = io_dataIn_8_payload[23 : 20];
  assign tensor_core_bf12_8_data_in_7 = io_dataIn_8_payload[27 : 24];
  assign tensor_core_bf12_8_data_in_8 = io_dataIn_8_payload[31 : 28];
  assign tensor_core_bf12_8_data_in_9 = io_dataIn_8_payload[35 : 32];
  assign tensor_core_bf12_8_data_in_10 = io_dataIn_8_payload[39 : 36];
  assign tensor_core_bf12_8_data_in_11 = io_dataIn_8_payload[43 : 40];
  assign tensor_core_bf12_8_data_in_12 = io_dataIn_8_payload[47 : 44];
  assign tensor_core_bf12_8_data_in_13 = io_dataIn_8_payload[51 : 48];
  assign tensor_core_bf12_8_data_in_14 = io_dataIn_8_payload[55 : 52];
  assign tensor_core_bf12_8_data_in_15 = io_dataIn_8_payload[59 : 56];
  assign tensor_core_bf12_8_data_in_16 = io_dataIn_8_payload[63 : 60];
  assign tensor_core_bf12_8_data_in_17 = io_dataIn_8_payload[67 : 64];
  assign tensor_core_bf12_8_data_in_18 = io_dataIn_8_payload[71 : 68];
  assign tensor_core_bf12_8_data_in_19 = io_dataIn_8_payload[75 : 72];
  assign tensor_core_bf12_8_data_in_20 = io_dataIn_8_payload[79 : 76];
  assign tensor_core_bf12_8_zero_en = 1'b0;
  assign tensor_core_bf12_8_acc_en = 1'b0;
  assign tensor_core_bf12_8_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_8_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_8_feed_sel = 2'b01;
  assign tensor_core_bf12_8_side_in_1 = 4'b0000;
  assign tensor_core_bf12_8_side_in_2 = 4'b0000;
  assign tensor_core_bf12_8_side_in_3 = 4'b0000;
  assign tensor_core_bf12_8_side_in_4 = 4'b0000;
  assign tensor_core_bf12_8_clr1 = 1'b0;
  assign tensor_core_bf12_9_data_in_1 = io_dataIn_9_payload[3 : 0];
  assign tensor_core_bf12_9_data_in_2 = io_dataIn_9_payload[7 : 4];
  assign tensor_core_bf12_9_data_in_3 = io_dataIn_9_payload[11 : 8];
  assign tensor_core_bf12_9_data_in_4 = io_dataIn_9_payload[15 : 12];
  assign tensor_core_bf12_9_data_in_5 = io_dataIn_9_payload[19 : 16];
  assign tensor_core_bf12_9_data_in_6 = io_dataIn_9_payload[23 : 20];
  assign tensor_core_bf12_9_data_in_7 = io_dataIn_9_payload[27 : 24];
  assign tensor_core_bf12_9_data_in_8 = io_dataIn_9_payload[31 : 28];
  assign tensor_core_bf12_9_data_in_9 = io_dataIn_9_payload[35 : 32];
  assign tensor_core_bf12_9_data_in_10 = io_dataIn_9_payload[39 : 36];
  assign tensor_core_bf12_9_data_in_11 = io_dataIn_9_payload[43 : 40];
  assign tensor_core_bf12_9_data_in_12 = io_dataIn_9_payload[47 : 44];
  assign tensor_core_bf12_9_data_in_13 = io_dataIn_9_payload[51 : 48];
  assign tensor_core_bf12_9_data_in_14 = io_dataIn_9_payload[55 : 52];
  assign tensor_core_bf12_9_data_in_15 = io_dataIn_9_payload[59 : 56];
  assign tensor_core_bf12_9_data_in_16 = io_dataIn_9_payload[63 : 60];
  assign tensor_core_bf12_9_data_in_17 = io_dataIn_9_payload[67 : 64];
  assign tensor_core_bf12_9_data_in_18 = io_dataIn_9_payload[71 : 68];
  assign tensor_core_bf12_9_data_in_19 = io_dataIn_9_payload[75 : 72];
  assign tensor_core_bf12_9_data_in_20 = io_dataIn_9_payload[79 : 76];
  assign tensor_core_bf12_9_zero_en = 1'b0;
  assign tensor_core_bf12_9_acc_en = 1'b0;
  assign tensor_core_bf12_9_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_9_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_9_feed_sel = 2'b01;
  assign tensor_core_bf12_9_side_in_1 = 4'b0000;
  assign tensor_core_bf12_9_side_in_2 = 4'b0000;
  assign tensor_core_bf12_9_side_in_3 = 4'b0000;
  assign tensor_core_bf12_9_side_in_4 = 4'b0000;
  assign tensor_core_bf12_9_clr1 = 1'b0;
  assign tensor_core_bf12_10_data_in_1 = io_dataIn_10_payload[3 : 0];
  assign tensor_core_bf12_10_data_in_2 = io_dataIn_10_payload[7 : 4];
  assign tensor_core_bf12_10_data_in_3 = io_dataIn_10_payload[11 : 8];
  assign tensor_core_bf12_10_data_in_4 = io_dataIn_10_payload[15 : 12];
  assign tensor_core_bf12_10_data_in_5 = io_dataIn_10_payload[19 : 16];
  assign tensor_core_bf12_10_data_in_6 = io_dataIn_10_payload[23 : 20];
  assign tensor_core_bf12_10_data_in_7 = io_dataIn_10_payload[27 : 24];
  assign tensor_core_bf12_10_data_in_8 = io_dataIn_10_payload[31 : 28];
  assign tensor_core_bf12_10_data_in_9 = io_dataIn_10_payload[35 : 32];
  assign tensor_core_bf12_10_data_in_10 = io_dataIn_10_payload[39 : 36];
  assign tensor_core_bf12_10_data_in_11 = io_dataIn_10_payload[43 : 40];
  assign tensor_core_bf12_10_data_in_12 = io_dataIn_10_payload[47 : 44];
  assign tensor_core_bf12_10_data_in_13 = io_dataIn_10_payload[51 : 48];
  assign tensor_core_bf12_10_data_in_14 = io_dataIn_10_payload[55 : 52];
  assign tensor_core_bf12_10_data_in_15 = io_dataIn_10_payload[59 : 56];
  assign tensor_core_bf12_10_data_in_16 = io_dataIn_10_payload[63 : 60];
  assign tensor_core_bf12_10_data_in_17 = io_dataIn_10_payload[67 : 64];
  assign tensor_core_bf12_10_data_in_18 = io_dataIn_10_payload[71 : 68];
  assign tensor_core_bf12_10_data_in_19 = io_dataIn_10_payload[75 : 72];
  assign tensor_core_bf12_10_data_in_20 = io_dataIn_10_payload[79 : 76];
  assign tensor_core_bf12_10_zero_en = 1'b0;
  assign tensor_core_bf12_10_acc_en = 1'b0;
  assign tensor_core_bf12_10_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_10_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_10_feed_sel = 2'b01;
  assign tensor_core_bf12_10_side_in_1 = 4'b0000;
  assign tensor_core_bf12_10_side_in_2 = 4'b0000;
  assign tensor_core_bf12_10_side_in_3 = 4'b0000;
  assign tensor_core_bf12_10_side_in_4 = 4'b0000;
  assign tensor_core_bf12_10_clr1 = 1'b0;
  assign tensor_core_bf12_11_data_in_1 = io_dataIn_11_payload[3 : 0];
  assign tensor_core_bf12_11_data_in_2 = io_dataIn_11_payload[7 : 4];
  assign tensor_core_bf12_11_data_in_3 = io_dataIn_11_payload[11 : 8];
  assign tensor_core_bf12_11_data_in_4 = io_dataIn_11_payload[15 : 12];
  assign tensor_core_bf12_11_data_in_5 = io_dataIn_11_payload[19 : 16];
  assign tensor_core_bf12_11_data_in_6 = io_dataIn_11_payload[23 : 20];
  assign tensor_core_bf12_11_data_in_7 = io_dataIn_11_payload[27 : 24];
  assign tensor_core_bf12_11_data_in_8 = io_dataIn_11_payload[31 : 28];
  assign tensor_core_bf12_11_data_in_9 = io_dataIn_11_payload[35 : 32];
  assign tensor_core_bf12_11_data_in_10 = io_dataIn_11_payload[39 : 36];
  assign tensor_core_bf12_11_data_in_11 = io_dataIn_11_payload[43 : 40];
  assign tensor_core_bf12_11_data_in_12 = io_dataIn_11_payload[47 : 44];
  assign tensor_core_bf12_11_data_in_13 = io_dataIn_11_payload[51 : 48];
  assign tensor_core_bf12_11_data_in_14 = io_dataIn_11_payload[55 : 52];
  assign tensor_core_bf12_11_data_in_15 = io_dataIn_11_payload[59 : 56];
  assign tensor_core_bf12_11_data_in_16 = io_dataIn_11_payload[63 : 60];
  assign tensor_core_bf12_11_data_in_17 = io_dataIn_11_payload[67 : 64];
  assign tensor_core_bf12_11_data_in_18 = io_dataIn_11_payload[71 : 68];
  assign tensor_core_bf12_11_data_in_19 = io_dataIn_11_payload[75 : 72];
  assign tensor_core_bf12_11_data_in_20 = io_dataIn_11_payload[79 : 76];
  assign tensor_core_bf12_11_zero_en = 1'b0;
  assign tensor_core_bf12_11_acc_en = 1'b0;
  assign tensor_core_bf12_11_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_11_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_11_feed_sel = 2'b01;
  assign tensor_core_bf12_11_side_in_1 = 4'b0000;
  assign tensor_core_bf12_11_side_in_2 = 4'b0000;
  assign tensor_core_bf12_11_side_in_3 = 4'b0000;
  assign tensor_core_bf12_11_side_in_4 = 4'b0000;
  assign tensor_core_bf12_11_clr1 = 1'b0;
  assign AccuDelayInst_io_push_payload = {{tcAccu_bf24_col_1,tcAccu_bf24_col_2},tcAccu_bf24_col_3};
  always @(*) begin
    resValidCounter_willIncrement = 1'b0;
    if(io_outValid) begin
      resValidCounter_willIncrement = 1'b1;
    end
  end

  assign resValidCounter_willClear = 1'b0;
  assign resValidCounter_willOverflowIfInc = (resValidCounter_overflowVal <= resValidCounter_value);
  assign resValidCounter_willOverflow = (resValidCounter_willOverflowIfInc && resValidCounter_willIncrement);
  always @(*) begin
    if(resValidCounter_willOverflow) begin
      resValidCounter_valueNext = 16'h0000;
    end else begin
      resValidCounter_valueNext = (resValidCounter_value + _zz_resValidCounter_valueNext);
    end
    if(resValidCounter_willClear) begin
      resValidCounter_valueNext = 16'h0000;
    end
  end

  assign resValidCounter_overflowVal = (_zz_resValidCounter_overflowVal - 16'h0001);
  assign fbDelayFifoPayload_0 = AccuDelayInst_io_pop_payload[23 : 0];
  assign fbDelayFifoPayload_1 = AccuDelayInst_io_pop_payload[47 : 24];
  assign fbDelayFifoPayload_2 = AccuDelayInst_io_pop_payload[71 : 48];
  assign io_res_payload_0 = fbDelayFifoPayload_0;
  assign io_res_payload_1 = fbDelayFifoPayload_1;
  assign io_res_payload_2 = fbDelayFifoPayload_2;
  always @(*) begin
    if(resValid) begin
      AccuDelayInst_io_pop_ready = io_res_ready;
    end else begin
      AccuDelayInst_io_pop_ready = oBufferLoadValid_delay_29;
    end
  end

  assign tcAccu_zero_en = 1'b0;
  assign tcAccu_acc_en = 1'b0;
  always @(posedge clk) begin
    io_loadValid_delay_1 <= io_loadValid;
    loadValidD2t <= io_loadValid_delay_1;
    io_dataValid_delay_1 <= io_dataValid;
    io_dataValid_delay_2 <= io_dataValid_delay_1;
    io_dataValid_delay_3 <= io_dataValid_delay_2;
    io_dataValid_delay_4 <= io_dataValid_delay_3;
    io_dataValid_delay_5 <= io_dataValid_delay_4;
    io_dataValid_delay_6 <= io_dataValid_delay_5;
    io_dataValid_delay_7 <= io_dataValid_delay_6;
    io_dataValid_delay_8 <= io_dataValid_delay_7;
    io_dataValid_delay_9 <= io_dataValid_delay_8;
    io_dataValid_delay_10 <= io_dataValid_delay_9;
    io_dataValid_delay_11 <= io_dataValid_delay_10;
    io_dataValid_delay_12 <= io_dataValid_delay_11;
    io_dataValid_delay_13 <= io_dataValid_delay_12;
    io_dataValid_delay_14 <= io_dataValid_delay_13;
    io_dataValid_delay_15 <= io_dataValid_delay_14;
    io_dataValid_delay_16 <= io_dataValid_delay_15;
    io_dataValid_delay_17 <= io_dataValid_delay_16;
    io_dataValid_delay_18 <= io_dataValid_delay_17;
    io_dataValid_delay_19 <= io_dataValid_delay_18;
    io_dataValid_delay_20 <= io_dataValid_delay_19;
    io_dataValid_delay_21 <= io_dataValid_delay_20;
    io_dataValid_delay_22 <= io_dataValid_delay_21;
    io_dataValid_delay_23 <= io_dataValid_delay_22;
    io_dataValid_delay_24 <= io_dataValid_delay_23;
    io_dataValid_delay_25 <= io_dataValid_delay_24;
    io_dataValid_delay_26 <= io_dataValid_delay_25;
    io_dataValid_delay_27 <= io_dataValid_delay_26;
    oBufferLoadValid <= io_dataValid_delay_27;
    outValidCounter_willOverflow_delay_1 <= outValidCounter_willOverflow;
    resValidCounter_willOverflowIfInc_delay_1 <= resValidCounter_willOverflowIfInc;
    resValid <= resValidCounter_willOverflowIfInc_delay_1;
    fbDelayFifoPayload_0_delay_1 <= fbDelayFifoPayload_0;
    fbDelayFifoPayload_0_delay_2 <= fbDelayFifoPayload_0_delay_1;
    fbDelayFifoPayload_1_delay_1 <= fbDelayFifoPayload_1;
    fbDelayFifoPayload_1_delay_2 <= fbDelayFifoPayload_1_delay_1;
    fbDelayFifoPayload_2_delay_1 <= fbDelayFifoPayload_2;
    fbDelayFifoPayload_2_delay_2 <= fbDelayFifoPayload_2_delay_1;
  end

  always @(posedge clk) begin
    if(!clrn) begin
      loadSelCounter_value <= 6'h00;
      loadBufCtrlReg <= 2'b01;
      inputCounter_value <= 16'h0000;
      loadBufSel <= 1'b0;
      outValidCounter_value <= 16'h0000;
      resValidCounter_value <= 16'h0000;
    end else begin
      loadSelCounter_value <= loadSelCounter_valueNext;
      if(loadSelCounter_willOverflow) begin
        loadBufCtrlReg <= {loadBufCtrlReg[0 : 0],loadBufCtrlReg[1 : 1]};
      end
      inputCounter_value <= inputCounter_valueNext;
      if(inputCounter_willOverflow) begin
        loadBufSel <= (! loadBufSel);
      end
      outValidCounter_value <= outValidCounter_valueNext;
      resValidCounter_value <= resValidCounter_valueNext;
    end
  end

  always @(posedge clk) begin
    oBufferLoadValid_delay_1 <= oBufferLoadValid;
    oBufferLoadValid_delay_2 <= oBufferLoadValid_delay_1;
    oBufferLoadValid_delay_3 <= oBufferLoadValid_delay_2;
    oBufferLoadValid_delay_4 <= oBufferLoadValid_delay_3;
    oBufferLoadValid_delay_5 <= oBufferLoadValid_delay_4;
    oBufferLoadValid_delay_6 <= oBufferLoadValid_delay_5;
    oBufferLoadValid_delay_7 <= oBufferLoadValid_delay_6;
    oBufferLoadValid_delay_8 <= oBufferLoadValid_delay_7;
    oBufferLoadValid_delay_9 <= oBufferLoadValid_delay_8;
    oBufferLoadValid_delay_10 <= oBufferLoadValid_delay_9;
    oBufferLoadValid_delay_11 <= oBufferLoadValid_delay_10;
    oBufferLoadValid_delay_12 <= oBufferLoadValid_delay_11;
    oBufferLoadValid_delay_13 <= oBufferLoadValid_delay_12;
    oBufferLoadValid_delay_14 <= oBufferLoadValid_delay_13;
    oBufferLoadValid_delay_15 <= oBufferLoadValid_delay_14;
    oBufferLoadValid_delay_16 <= oBufferLoadValid_delay_15;
    oBufferLoadValid_delay_17 <= oBufferLoadValid_delay_16;
    oBufferLoadValid_delay_18 <= oBufferLoadValid_delay_17;
    oBufferLoadValid_delay_19 <= oBufferLoadValid_delay_18;
    oBufferLoadValid_delay_20 <= oBufferLoadValid_delay_19;
    oBufferLoadValid_delay_21 <= oBufferLoadValid_delay_20;
    oBufferLoadValid_delay_22 <= oBufferLoadValid_delay_21;
    oBufferLoadValid_delay_23 <= oBufferLoadValid_delay_22;
    oBufferLoadValid_delay_24 <= oBufferLoadValid_delay_23;
    oBufferLoadValid_delay_25 <= oBufferLoadValid_delay_24;
    oBufferLoadValid_delay_26 <= oBufferLoadValid_delay_25;
    oBufferLoadValid_delay_27 <= oBufferLoadValid_delay_26;
    oBufferLoadValid_delay_28 <= oBufferLoadValid_delay_27;
    oBufferLoadValid_delay_29 <= oBufferLoadValid_delay_28;
  end


endmodule
