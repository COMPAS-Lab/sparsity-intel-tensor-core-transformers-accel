// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : TensorCoreChainBf12
// Git hash  : 49d0755e1ebad225e157f484ef3544456c6ad7b5

`timescale 1ns/1ps 
module TensorCoreChainBf12 (
  input               io_dataIn_0_valid,
  input      [79:0]   io_dataIn_0_payload,
  input               io_dataIn_1_valid,
  input      [79:0]   io_dataIn_1_payload,
  input               io_dataIn_2_valid,
  input      [79:0]   io_dataIn_2_payload,
  input               io_dataIn_3_valid,
  input      [79:0]   io_dataIn_3_payload,
  input               io_dataIn_4_valid,
  input      [79:0]   io_dataIn_4_payload,
  input               io_dataIn_5_valid,
  input      [79:0]   io_dataIn_5_payload,
  input               io_dataIn_6_valid,
  input      [79:0]   io_dataIn_6_payload,
  input               io_dataIn_7_valid,
  input      [79:0]   io_dataIn_7_payload,
  input               io_dataIn_8_valid,
  input      [79:0]   io_dataIn_8_payload,
  input               io_dataIn_9_valid,
  input      [79:0]   io_dataIn_9_payload,
  input               io_dataIn_10_valid,
  input      [79:0]   io_dataIn_10_payload,
  input               io_dataIn_11_valid,
  input      [79:0]   io_dataIn_11_payload,
  input               io_dataIn_12_valid,
  input      [79:0]   io_dataIn_12_payload,
  input               io_dataIn_13_valid,
  input      [79:0]   io_dataIn_13_payload,
  input               io_dataIn_14_valid,
  input      [79:0]   io_dataIn_14_payload,
  input               io_dataIn_15_valid,
  input      [79:0]   io_dataIn_15_payload,
  input               io_dataIn_16_valid,
  input      [79:0]   io_dataIn_16_payload,
  input               io_dataIn_17_valid,
  input      [79:0]   io_dataIn_17_payload,
  input               io_dataIn_18_valid,
  input      [79:0]   io_dataIn_18_payload,
  input               io_dataIn_19_valid,
  input      [79:0]   io_dataIn_19_payload,
  input               io_dataIn_20_valid,
  input      [79:0]   io_dataIn_20_payload,
  input               io_dataIn_21_valid,
  input      [79:0]   io_dataIn_21_payload,
  input               io_dataIn_22_valid,
  input      [79:0]   io_dataIn_22_payload,
  input               io_dataIn_23_valid,
  input      [79:0]   io_dataIn_23_payload,
  input               io_dataIn_24_valid,
  input      [79:0]   io_dataIn_24_payload,
  input               io_dataIn_25_valid,
  input      [79:0]   io_dataIn_25_payload,
  input               io_dataIn_26_valid,
  input      [79:0]   io_dataIn_26_payload,
  input               io_dataIn_27_valid,
  input      [79:0]   io_dataIn_27_payload,
  input               io_dataIn_28_valid,
  input      [79:0]   io_dataIn_28_payload,
  input               io_dataIn_29_valid,
  input      [79:0]   io_dataIn_29_payload,
  input               io_dataIn_30_valid,
  input      [79:0]   io_dataIn_30_payload,
  input               io_dataIn_31_valid,
  input      [79:0]   io_dataIn_31_payload,
  input      [79:0]   io_loadCascadeIn,
  input      [7:0]    io_expIn_0,
  input      [7:0]    io_expIn_1,
  input      [7:0]    io_expIn_2,
  input      [7:0]    io_expIn_3,
  input      [7:0]    io_expIn_4,
  input      [7:0]    io_expIn_5,
  input      [7:0]    io_expIn_6,
  input      [7:0]    io_expIn_7,
  input      [7:0]    io_expIn_8,
  input      [7:0]    io_expIn_9,
  input      [7:0]    io_expIn_10,
  input      [7:0]    io_expIn_11,
  input      [7:0]    io_expIn_12,
  input      [7:0]    io_expIn_13,
  input      [7:0]    io_expIn_14,
  input      [7:0]    io_expIn_15,
  input      [7:0]    io_expIn_16,
  input      [7:0]    io_expIn_17,
  input      [7:0]    io_expIn_18,
  input      [7:0]    io_expIn_19,
  input      [7:0]    io_expIn_20,
  input      [7:0]    io_expIn_21,
  input      [7:0]    io_expIn_22,
  input      [7:0]    io_expIn_23,
  input      [7:0]    io_expIn_24,
  input      [7:0]    io_expIn_25,
  input      [7:0]    io_expIn_26,
  input      [7:0]    io_expIn_27,
  input      [7:0]    io_expIn_28,
  input      [7:0]    io_expIn_29,
  input      [7:0]    io_expIn_30,
  input      [7:0]    io_expIn_31,
  input      [7:0]    io_expCascadeIn,
  input               io_dataValid,
  output              io_dataIterReady,
  input               io_loadValid,
  output              io_loadReady,
  output reg          io_res_valid,
  input               io_res_ready,
  output reg [23:0]   io_res_payload_0,
  output reg [23:0]   io_res_payload_1,
  output reg [23:0]   io_res_payload_2,
  input      [15:0]   io_inputIters,
  input      [15:0]   io_matAColSubGrpLen,
  output              io_outValid,
  input               clk,
  input               clrn
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
  wire                tcStartPoint_load_bb_one;
  wire                tcStartPoint_load_bb_two;
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
  wire                tensor_core_bf12_1_load_bb_one;
  wire                tensor_core_bf12_1_load_bb_two;
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
  wire                tensor_core_bf12_2_load_bb_one;
  wire                tensor_core_bf12_2_load_bb_two;
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
  wire                tensor_core_bf12_3_load_bb_one;
  wire                tensor_core_bf12_3_load_bb_two;
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
  wire                tensor_core_bf12_4_load_bb_one;
  wire                tensor_core_bf12_4_load_bb_two;
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
  wire                tensor_core_bf12_5_load_bb_one;
  wire                tensor_core_bf12_5_load_bb_two;
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
  wire                tensor_core_bf12_6_load_bb_one;
  wire                tensor_core_bf12_6_load_bb_two;
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
  wire                tensor_core_bf12_7_load_bb_one;
  wire                tensor_core_bf12_7_load_bb_two;
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
  wire                tensor_core_bf12_8_load_bb_one;
  wire                tensor_core_bf12_8_load_bb_two;
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
  wire                tensor_core_bf12_9_load_bb_one;
  wire                tensor_core_bf12_9_load_bb_two;
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
  wire                tensor_core_bf12_10_load_bb_one;
  wire                tensor_core_bf12_10_load_bb_two;
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
  wire                tensor_core_bf12_11_load_bb_one;
  wire                tensor_core_bf12_11_load_bb_two;
  wire       [3:0]    tensor_core_bf12_12_data_in_1;
  wire       [3:0]    tensor_core_bf12_12_data_in_2;
  wire       [3:0]    tensor_core_bf12_12_data_in_3;
  wire       [3:0]    tensor_core_bf12_12_data_in_4;
  wire       [3:0]    tensor_core_bf12_12_data_in_5;
  wire       [3:0]    tensor_core_bf12_12_data_in_6;
  wire       [3:0]    tensor_core_bf12_12_data_in_7;
  wire       [3:0]    tensor_core_bf12_12_data_in_8;
  wire       [3:0]    tensor_core_bf12_12_data_in_9;
  wire       [3:0]    tensor_core_bf12_12_data_in_10;
  wire       [3:0]    tensor_core_bf12_12_data_in_11;
  wire       [3:0]    tensor_core_bf12_12_data_in_12;
  wire       [3:0]    tensor_core_bf12_12_data_in_13;
  wire       [3:0]    tensor_core_bf12_12_data_in_14;
  wire       [3:0]    tensor_core_bf12_12_data_in_15;
  wire       [3:0]    tensor_core_bf12_12_data_in_16;
  wire       [3:0]    tensor_core_bf12_12_data_in_17;
  wire       [3:0]    tensor_core_bf12_12_data_in_18;
  wire       [3:0]    tensor_core_bf12_12_data_in_19;
  wire       [3:0]    tensor_core_bf12_12_data_in_20;
  wire                tensor_core_bf12_12_load_bb_one;
  wire                tensor_core_bf12_12_load_bb_two;
  wire       [3:0]    tensor_core_bf12_13_data_in_1;
  wire       [3:0]    tensor_core_bf12_13_data_in_2;
  wire       [3:0]    tensor_core_bf12_13_data_in_3;
  wire       [3:0]    tensor_core_bf12_13_data_in_4;
  wire       [3:0]    tensor_core_bf12_13_data_in_5;
  wire       [3:0]    tensor_core_bf12_13_data_in_6;
  wire       [3:0]    tensor_core_bf12_13_data_in_7;
  wire       [3:0]    tensor_core_bf12_13_data_in_8;
  wire       [3:0]    tensor_core_bf12_13_data_in_9;
  wire       [3:0]    tensor_core_bf12_13_data_in_10;
  wire       [3:0]    tensor_core_bf12_13_data_in_11;
  wire       [3:0]    tensor_core_bf12_13_data_in_12;
  wire       [3:0]    tensor_core_bf12_13_data_in_13;
  wire       [3:0]    tensor_core_bf12_13_data_in_14;
  wire       [3:0]    tensor_core_bf12_13_data_in_15;
  wire       [3:0]    tensor_core_bf12_13_data_in_16;
  wire       [3:0]    tensor_core_bf12_13_data_in_17;
  wire       [3:0]    tensor_core_bf12_13_data_in_18;
  wire       [3:0]    tensor_core_bf12_13_data_in_19;
  wire       [3:0]    tensor_core_bf12_13_data_in_20;
  wire                tensor_core_bf12_13_load_bb_one;
  wire                tensor_core_bf12_13_load_bb_two;
  wire       [3:0]    tensor_core_bf12_14_data_in_1;
  wire       [3:0]    tensor_core_bf12_14_data_in_2;
  wire       [3:0]    tensor_core_bf12_14_data_in_3;
  wire       [3:0]    tensor_core_bf12_14_data_in_4;
  wire       [3:0]    tensor_core_bf12_14_data_in_5;
  wire       [3:0]    tensor_core_bf12_14_data_in_6;
  wire       [3:0]    tensor_core_bf12_14_data_in_7;
  wire       [3:0]    tensor_core_bf12_14_data_in_8;
  wire       [3:0]    tensor_core_bf12_14_data_in_9;
  wire       [3:0]    tensor_core_bf12_14_data_in_10;
  wire       [3:0]    tensor_core_bf12_14_data_in_11;
  wire       [3:0]    tensor_core_bf12_14_data_in_12;
  wire       [3:0]    tensor_core_bf12_14_data_in_13;
  wire       [3:0]    tensor_core_bf12_14_data_in_14;
  wire       [3:0]    tensor_core_bf12_14_data_in_15;
  wire       [3:0]    tensor_core_bf12_14_data_in_16;
  wire       [3:0]    tensor_core_bf12_14_data_in_17;
  wire       [3:0]    tensor_core_bf12_14_data_in_18;
  wire       [3:0]    tensor_core_bf12_14_data_in_19;
  wire       [3:0]    tensor_core_bf12_14_data_in_20;
  wire                tensor_core_bf12_14_load_bb_one;
  wire                tensor_core_bf12_14_load_bb_two;
  wire       [3:0]    tensor_core_bf12_15_data_in_1;
  wire       [3:0]    tensor_core_bf12_15_data_in_2;
  wire       [3:0]    tensor_core_bf12_15_data_in_3;
  wire       [3:0]    tensor_core_bf12_15_data_in_4;
  wire       [3:0]    tensor_core_bf12_15_data_in_5;
  wire       [3:0]    tensor_core_bf12_15_data_in_6;
  wire       [3:0]    tensor_core_bf12_15_data_in_7;
  wire       [3:0]    tensor_core_bf12_15_data_in_8;
  wire       [3:0]    tensor_core_bf12_15_data_in_9;
  wire       [3:0]    tensor_core_bf12_15_data_in_10;
  wire       [3:0]    tensor_core_bf12_15_data_in_11;
  wire       [3:0]    tensor_core_bf12_15_data_in_12;
  wire       [3:0]    tensor_core_bf12_15_data_in_13;
  wire       [3:0]    tensor_core_bf12_15_data_in_14;
  wire       [3:0]    tensor_core_bf12_15_data_in_15;
  wire       [3:0]    tensor_core_bf12_15_data_in_16;
  wire       [3:0]    tensor_core_bf12_15_data_in_17;
  wire       [3:0]    tensor_core_bf12_15_data_in_18;
  wire       [3:0]    tensor_core_bf12_15_data_in_19;
  wire       [3:0]    tensor_core_bf12_15_data_in_20;
  wire                tensor_core_bf12_15_load_bb_one;
  wire                tensor_core_bf12_15_load_bb_two;
  wire       [3:0]    tensor_core_bf12_16_data_in_1;
  wire       [3:0]    tensor_core_bf12_16_data_in_2;
  wire       [3:0]    tensor_core_bf12_16_data_in_3;
  wire       [3:0]    tensor_core_bf12_16_data_in_4;
  wire       [3:0]    tensor_core_bf12_16_data_in_5;
  wire       [3:0]    tensor_core_bf12_16_data_in_6;
  wire       [3:0]    tensor_core_bf12_16_data_in_7;
  wire       [3:0]    tensor_core_bf12_16_data_in_8;
  wire       [3:0]    tensor_core_bf12_16_data_in_9;
  wire       [3:0]    tensor_core_bf12_16_data_in_10;
  wire       [3:0]    tensor_core_bf12_16_data_in_11;
  wire       [3:0]    tensor_core_bf12_16_data_in_12;
  wire       [3:0]    tensor_core_bf12_16_data_in_13;
  wire       [3:0]    tensor_core_bf12_16_data_in_14;
  wire       [3:0]    tensor_core_bf12_16_data_in_15;
  wire       [3:0]    tensor_core_bf12_16_data_in_16;
  wire       [3:0]    tensor_core_bf12_16_data_in_17;
  wire       [3:0]    tensor_core_bf12_16_data_in_18;
  wire       [3:0]    tensor_core_bf12_16_data_in_19;
  wire       [3:0]    tensor_core_bf12_16_data_in_20;
  wire                tensor_core_bf12_16_load_bb_one;
  wire                tensor_core_bf12_16_load_bb_two;
  wire       [3:0]    tensor_core_bf12_17_data_in_1;
  wire       [3:0]    tensor_core_bf12_17_data_in_2;
  wire       [3:0]    tensor_core_bf12_17_data_in_3;
  wire       [3:0]    tensor_core_bf12_17_data_in_4;
  wire       [3:0]    tensor_core_bf12_17_data_in_5;
  wire       [3:0]    tensor_core_bf12_17_data_in_6;
  wire       [3:0]    tensor_core_bf12_17_data_in_7;
  wire       [3:0]    tensor_core_bf12_17_data_in_8;
  wire       [3:0]    tensor_core_bf12_17_data_in_9;
  wire       [3:0]    tensor_core_bf12_17_data_in_10;
  wire       [3:0]    tensor_core_bf12_17_data_in_11;
  wire       [3:0]    tensor_core_bf12_17_data_in_12;
  wire       [3:0]    tensor_core_bf12_17_data_in_13;
  wire       [3:0]    tensor_core_bf12_17_data_in_14;
  wire       [3:0]    tensor_core_bf12_17_data_in_15;
  wire       [3:0]    tensor_core_bf12_17_data_in_16;
  wire       [3:0]    tensor_core_bf12_17_data_in_17;
  wire       [3:0]    tensor_core_bf12_17_data_in_18;
  wire       [3:0]    tensor_core_bf12_17_data_in_19;
  wire       [3:0]    tensor_core_bf12_17_data_in_20;
  wire                tensor_core_bf12_17_load_bb_one;
  wire                tensor_core_bf12_17_load_bb_two;
  wire       [3:0]    tensor_core_bf12_18_data_in_1;
  wire       [3:0]    tensor_core_bf12_18_data_in_2;
  wire       [3:0]    tensor_core_bf12_18_data_in_3;
  wire       [3:0]    tensor_core_bf12_18_data_in_4;
  wire       [3:0]    tensor_core_bf12_18_data_in_5;
  wire       [3:0]    tensor_core_bf12_18_data_in_6;
  wire       [3:0]    tensor_core_bf12_18_data_in_7;
  wire       [3:0]    tensor_core_bf12_18_data_in_8;
  wire       [3:0]    tensor_core_bf12_18_data_in_9;
  wire       [3:0]    tensor_core_bf12_18_data_in_10;
  wire       [3:0]    tensor_core_bf12_18_data_in_11;
  wire       [3:0]    tensor_core_bf12_18_data_in_12;
  wire       [3:0]    tensor_core_bf12_18_data_in_13;
  wire       [3:0]    tensor_core_bf12_18_data_in_14;
  wire       [3:0]    tensor_core_bf12_18_data_in_15;
  wire       [3:0]    tensor_core_bf12_18_data_in_16;
  wire       [3:0]    tensor_core_bf12_18_data_in_17;
  wire       [3:0]    tensor_core_bf12_18_data_in_18;
  wire       [3:0]    tensor_core_bf12_18_data_in_19;
  wire       [3:0]    tensor_core_bf12_18_data_in_20;
  wire                tensor_core_bf12_18_load_bb_one;
  wire                tensor_core_bf12_18_load_bb_two;
  wire       [3:0]    tensor_core_bf12_19_data_in_1;
  wire       [3:0]    tensor_core_bf12_19_data_in_2;
  wire       [3:0]    tensor_core_bf12_19_data_in_3;
  wire       [3:0]    tensor_core_bf12_19_data_in_4;
  wire       [3:0]    tensor_core_bf12_19_data_in_5;
  wire       [3:0]    tensor_core_bf12_19_data_in_6;
  wire       [3:0]    tensor_core_bf12_19_data_in_7;
  wire       [3:0]    tensor_core_bf12_19_data_in_8;
  wire       [3:0]    tensor_core_bf12_19_data_in_9;
  wire       [3:0]    tensor_core_bf12_19_data_in_10;
  wire       [3:0]    tensor_core_bf12_19_data_in_11;
  wire       [3:0]    tensor_core_bf12_19_data_in_12;
  wire       [3:0]    tensor_core_bf12_19_data_in_13;
  wire       [3:0]    tensor_core_bf12_19_data_in_14;
  wire       [3:0]    tensor_core_bf12_19_data_in_15;
  wire       [3:0]    tensor_core_bf12_19_data_in_16;
  wire       [3:0]    tensor_core_bf12_19_data_in_17;
  wire       [3:0]    tensor_core_bf12_19_data_in_18;
  wire       [3:0]    tensor_core_bf12_19_data_in_19;
  wire       [3:0]    tensor_core_bf12_19_data_in_20;
  wire                tensor_core_bf12_19_load_bb_one;
  wire                tensor_core_bf12_19_load_bb_two;
  wire       [3:0]    tensor_core_bf12_20_data_in_1;
  wire       [3:0]    tensor_core_bf12_20_data_in_2;
  wire       [3:0]    tensor_core_bf12_20_data_in_3;
  wire       [3:0]    tensor_core_bf12_20_data_in_4;
  wire       [3:0]    tensor_core_bf12_20_data_in_5;
  wire       [3:0]    tensor_core_bf12_20_data_in_6;
  wire       [3:0]    tensor_core_bf12_20_data_in_7;
  wire       [3:0]    tensor_core_bf12_20_data_in_8;
  wire       [3:0]    tensor_core_bf12_20_data_in_9;
  wire       [3:0]    tensor_core_bf12_20_data_in_10;
  wire       [3:0]    tensor_core_bf12_20_data_in_11;
  wire       [3:0]    tensor_core_bf12_20_data_in_12;
  wire       [3:0]    tensor_core_bf12_20_data_in_13;
  wire       [3:0]    tensor_core_bf12_20_data_in_14;
  wire       [3:0]    tensor_core_bf12_20_data_in_15;
  wire       [3:0]    tensor_core_bf12_20_data_in_16;
  wire       [3:0]    tensor_core_bf12_20_data_in_17;
  wire       [3:0]    tensor_core_bf12_20_data_in_18;
  wire       [3:0]    tensor_core_bf12_20_data_in_19;
  wire       [3:0]    tensor_core_bf12_20_data_in_20;
  wire                tensor_core_bf12_20_load_bb_one;
  wire                tensor_core_bf12_20_load_bb_two;
  wire       [3:0]    tensor_core_bf12_21_data_in_1;
  wire       [3:0]    tensor_core_bf12_21_data_in_2;
  wire       [3:0]    tensor_core_bf12_21_data_in_3;
  wire       [3:0]    tensor_core_bf12_21_data_in_4;
  wire       [3:0]    tensor_core_bf12_21_data_in_5;
  wire       [3:0]    tensor_core_bf12_21_data_in_6;
  wire       [3:0]    tensor_core_bf12_21_data_in_7;
  wire       [3:0]    tensor_core_bf12_21_data_in_8;
  wire       [3:0]    tensor_core_bf12_21_data_in_9;
  wire       [3:0]    tensor_core_bf12_21_data_in_10;
  wire       [3:0]    tensor_core_bf12_21_data_in_11;
  wire       [3:0]    tensor_core_bf12_21_data_in_12;
  wire       [3:0]    tensor_core_bf12_21_data_in_13;
  wire       [3:0]    tensor_core_bf12_21_data_in_14;
  wire       [3:0]    tensor_core_bf12_21_data_in_15;
  wire       [3:0]    tensor_core_bf12_21_data_in_16;
  wire       [3:0]    tensor_core_bf12_21_data_in_17;
  wire       [3:0]    tensor_core_bf12_21_data_in_18;
  wire       [3:0]    tensor_core_bf12_21_data_in_19;
  wire       [3:0]    tensor_core_bf12_21_data_in_20;
  wire                tensor_core_bf12_21_load_bb_one;
  wire                tensor_core_bf12_21_load_bb_two;
  wire       [3:0]    tensor_core_bf12_22_data_in_1;
  wire       [3:0]    tensor_core_bf12_22_data_in_2;
  wire       [3:0]    tensor_core_bf12_22_data_in_3;
  wire       [3:0]    tensor_core_bf12_22_data_in_4;
  wire       [3:0]    tensor_core_bf12_22_data_in_5;
  wire       [3:0]    tensor_core_bf12_22_data_in_6;
  wire       [3:0]    tensor_core_bf12_22_data_in_7;
  wire       [3:0]    tensor_core_bf12_22_data_in_8;
  wire       [3:0]    tensor_core_bf12_22_data_in_9;
  wire       [3:0]    tensor_core_bf12_22_data_in_10;
  wire       [3:0]    tensor_core_bf12_22_data_in_11;
  wire       [3:0]    tensor_core_bf12_22_data_in_12;
  wire       [3:0]    tensor_core_bf12_22_data_in_13;
  wire       [3:0]    tensor_core_bf12_22_data_in_14;
  wire       [3:0]    tensor_core_bf12_22_data_in_15;
  wire       [3:0]    tensor_core_bf12_22_data_in_16;
  wire       [3:0]    tensor_core_bf12_22_data_in_17;
  wire       [3:0]    tensor_core_bf12_22_data_in_18;
  wire       [3:0]    tensor_core_bf12_22_data_in_19;
  wire       [3:0]    tensor_core_bf12_22_data_in_20;
  wire                tensor_core_bf12_22_load_bb_one;
  wire                tensor_core_bf12_22_load_bb_two;
  wire       [3:0]    tensor_core_bf12_23_data_in_1;
  wire       [3:0]    tensor_core_bf12_23_data_in_2;
  wire       [3:0]    tensor_core_bf12_23_data_in_3;
  wire       [3:0]    tensor_core_bf12_23_data_in_4;
  wire       [3:0]    tensor_core_bf12_23_data_in_5;
  wire       [3:0]    tensor_core_bf12_23_data_in_6;
  wire       [3:0]    tensor_core_bf12_23_data_in_7;
  wire       [3:0]    tensor_core_bf12_23_data_in_8;
  wire       [3:0]    tensor_core_bf12_23_data_in_9;
  wire       [3:0]    tensor_core_bf12_23_data_in_10;
  wire       [3:0]    tensor_core_bf12_23_data_in_11;
  wire       [3:0]    tensor_core_bf12_23_data_in_12;
  wire       [3:0]    tensor_core_bf12_23_data_in_13;
  wire       [3:0]    tensor_core_bf12_23_data_in_14;
  wire       [3:0]    tensor_core_bf12_23_data_in_15;
  wire       [3:0]    tensor_core_bf12_23_data_in_16;
  wire       [3:0]    tensor_core_bf12_23_data_in_17;
  wire       [3:0]    tensor_core_bf12_23_data_in_18;
  wire       [3:0]    tensor_core_bf12_23_data_in_19;
  wire       [3:0]    tensor_core_bf12_23_data_in_20;
  wire                tensor_core_bf12_23_load_bb_one;
  wire                tensor_core_bf12_23_load_bb_two;
  wire       [3:0]    tensor_core_bf12_24_data_in_1;
  wire       [3:0]    tensor_core_bf12_24_data_in_2;
  wire       [3:0]    tensor_core_bf12_24_data_in_3;
  wire       [3:0]    tensor_core_bf12_24_data_in_4;
  wire       [3:0]    tensor_core_bf12_24_data_in_5;
  wire       [3:0]    tensor_core_bf12_24_data_in_6;
  wire       [3:0]    tensor_core_bf12_24_data_in_7;
  wire       [3:0]    tensor_core_bf12_24_data_in_8;
  wire       [3:0]    tensor_core_bf12_24_data_in_9;
  wire       [3:0]    tensor_core_bf12_24_data_in_10;
  wire       [3:0]    tensor_core_bf12_24_data_in_11;
  wire       [3:0]    tensor_core_bf12_24_data_in_12;
  wire       [3:0]    tensor_core_bf12_24_data_in_13;
  wire       [3:0]    tensor_core_bf12_24_data_in_14;
  wire       [3:0]    tensor_core_bf12_24_data_in_15;
  wire       [3:0]    tensor_core_bf12_24_data_in_16;
  wire       [3:0]    tensor_core_bf12_24_data_in_17;
  wire       [3:0]    tensor_core_bf12_24_data_in_18;
  wire       [3:0]    tensor_core_bf12_24_data_in_19;
  wire       [3:0]    tensor_core_bf12_24_data_in_20;
  wire                tensor_core_bf12_24_load_bb_one;
  wire                tensor_core_bf12_24_load_bb_two;
  wire       [3:0]    tensor_core_bf12_25_data_in_1;
  wire       [3:0]    tensor_core_bf12_25_data_in_2;
  wire       [3:0]    tensor_core_bf12_25_data_in_3;
  wire       [3:0]    tensor_core_bf12_25_data_in_4;
  wire       [3:0]    tensor_core_bf12_25_data_in_5;
  wire       [3:0]    tensor_core_bf12_25_data_in_6;
  wire       [3:0]    tensor_core_bf12_25_data_in_7;
  wire       [3:0]    tensor_core_bf12_25_data_in_8;
  wire       [3:0]    tensor_core_bf12_25_data_in_9;
  wire       [3:0]    tensor_core_bf12_25_data_in_10;
  wire       [3:0]    tensor_core_bf12_25_data_in_11;
  wire       [3:0]    tensor_core_bf12_25_data_in_12;
  wire       [3:0]    tensor_core_bf12_25_data_in_13;
  wire       [3:0]    tensor_core_bf12_25_data_in_14;
  wire       [3:0]    tensor_core_bf12_25_data_in_15;
  wire       [3:0]    tensor_core_bf12_25_data_in_16;
  wire       [3:0]    tensor_core_bf12_25_data_in_17;
  wire       [3:0]    tensor_core_bf12_25_data_in_18;
  wire       [3:0]    tensor_core_bf12_25_data_in_19;
  wire       [3:0]    tensor_core_bf12_25_data_in_20;
  wire                tensor_core_bf12_25_load_bb_one;
  wire                tensor_core_bf12_25_load_bb_two;
  wire       [3:0]    tensor_core_bf12_26_data_in_1;
  wire       [3:0]    tensor_core_bf12_26_data_in_2;
  wire       [3:0]    tensor_core_bf12_26_data_in_3;
  wire       [3:0]    tensor_core_bf12_26_data_in_4;
  wire       [3:0]    tensor_core_bf12_26_data_in_5;
  wire       [3:0]    tensor_core_bf12_26_data_in_6;
  wire       [3:0]    tensor_core_bf12_26_data_in_7;
  wire       [3:0]    tensor_core_bf12_26_data_in_8;
  wire       [3:0]    tensor_core_bf12_26_data_in_9;
  wire       [3:0]    tensor_core_bf12_26_data_in_10;
  wire       [3:0]    tensor_core_bf12_26_data_in_11;
  wire       [3:0]    tensor_core_bf12_26_data_in_12;
  wire       [3:0]    tensor_core_bf12_26_data_in_13;
  wire       [3:0]    tensor_core_bf12_26_data_in_14;
  wire       [3:0]    tensor_core_bf12_26_data_in_15;
  wire       [3:0]    tensor_core_bf12_26_data_in_16;
  wire       [3:0]    tensor_core_bf12_26_data_in_17;
  wire       [3:0]    tensor_core_bf12_26_data_in_18;
  wire       [3:0]    tensor_core_bf12_26_data_in_19;
  wire       [3:0]    tensor_core_bf12_26_data_in_20;
  wire                tensor_core_bf12_26_load_bb_one;
  wire                tensor_core_bf12_26_load_bb_two;
  wire       [3:0]    tensor_core_bf12_27_data_in_1;
  wire       [3:0]    tensor_core_bf12_27_data_in_2;
  wire       [3:0]    tensor_core_bf12_27_data_in_3;
  wire       [3:0]    tensor_core_bf12_27_data_in_4;
  wire       [3:0]    tensor_core_bf12_27_data_in_5;
  wire       [3:0]    tensor_core_bf12_27_data_in_6;
  wire       [3:0]    tensor_core_bf12_27_data_in_7;
  wire       [3:0]    tensor_core_bf12_27_data_in_8;
  wire       [3:0]    tensor_core_bf12_27_data_in_9;
  wire       [3:0]    tensor_core_bf12_27_data_in_10;
  wire       [3:0]    tensor_core_bf12_27_data_in_11;
  wire       [3:0]    tensor_core_bf12_27_data_in_12;
  wire       [3:0]    tensor_core_bf12_27_data_in_13;
  wire       [3:0]    tensor_core_bf12_27_data_in_14;
  wire       [3:0]    tensor_core_bf12_27_data_in_15;
  wire       [3:0]    tensor_core_bf12_27_data_in_16;
  wire       [3:0]    tensor_core_bf12_27_data_in_17;
  wire       [3:0]    tensor_core_bf12_27_data_in_18;
  wire       [3:0]    tensor_core_bf12_27_data_in_19;
  wire       [3:0]    tensor_core_bf12_27_data_in_20;
  wire                tensor_core_bf12_27_load_bb_one;
  wire                tensor_core_bf12_27_load_bb_two;
  wire       [3:0]    tensor_core_bf12_28_data_in_1;
  wire       [3:0]    tensor_core_bf12_28_data_in_2;
  wire       [3:0]    tensor_core_bf12_28_data_in_3;
  wire       [3:0]    tensor_core_bf12_28_data_in_4;
  wire       [3:0]    tensor_core_bf12_28_data_in_5;
  wire       [3:0]    tensor_core_bf12_28_data_in_6;
  wire       [3:0]    tensor_core_bf12_28_data_in_7;
  wire       [3:0]    tensor_core_bf12_28_data_in_8;
  wire       [3:0]    tensor_core_bf12_28_data_in_9;
  wire       [3:0]    tensor_core_bf12_28_data_in_10;
  wire       [3:0]    tensor_core_bf12_28_data_in_11;
  wire       [3:0]    tensor_core_bf12_28_data_in_12;
  wire       [3:0]    tensor_core_bf12_28_data_in_13;
  wire       [3:0]    tensor_core_bf12_28_data_in_14;
  wire       [3:0]    tensor_core_bf12_28_data_in_15;
  wire       [3:0]    tensor_core_bf12_28_data_in_16;
  wire       [3:0]    tensor_core_bf12_28_data_in_17;
  wire       [3:0]    tensor_core_bf12_28_data_in_18;
  wire       [3:0]    tensor_core_bf12_28_data_in_19;
  wire       [3:0]    tensor_core_bf12_28_data_in_20;
  wire                tensor_core_bf12_28_load_bb_one;
  wire                tensor_core_bf12_28_load_bb_two;
  wire       [3:0]    tensor_core_bf12_29_data_in_1;
  wire       [3:0]    tensor_core_bf12_29_data_in_2;
  wire       [3:0]    tensor_core_bf12_29_data_in_3;
  wire       [3:0]    tensor_core_bf12_29_data_in_4;
  wire       [3:0]    tensor_core_bf12_29_data_in_5;
  wire       [3:0]    tensor_core_bf12_29_data_in_6;
  wire       [3:0]    tensor_core_bf12_29_data_in_7;
  wire       [3:0]    tensor_core_bf12_29_data_in_8;
  wire       [3:0]    tensor_core_bf12_29_data_in_9;
  wire       [3:0]    tensor_core_bf12_29_data_in_10;
  wire       [3:0]    tensor_core_bf12_29_data_in_11;
  wire       [3:0]    tensor_core_bf12_29_data_in_12;
  wire       [3:0]    tensor_core_bf12_29_data_in_13;
  wire       [3:0]    tensor_core_bf12_29_data_in_14;
  wire       [3:0]    tensor_core_bf12_29_data_in_15;
  wire       [3:0]    tensor_core_bf12_29_data_in_16;
  wire       [3:0]    tensor_core_bf12_29_data_in_17;
  wire       [3:0]    tensor_core_bf12_29_data_in_18;
  wire       [3:0]    tensor_core_bf12_29_data_in_19;
  wire       [3:0]    tensor_core_bf12_29_data_in_20;
  wire                tensor_core_bf12_29_load_bb_one;
  wire                tensor_core_bf12_29_load_bb_two;
  wire       [3:0]    tensor_core_bf12_30_data_in_1;
  wire       [3:0]    tensor_core_bf12_30_data_in_2;
  wire       [3:0]    tensor_core_bf12_30_data_in_3;
  wire       [3:0]    tensor_core_bf12_30_data_in_4;
  wire       [3:0]    tensor_core_bf12_30_data_in_5;
  wire       [3:0]    tensor_core_bf12_30_data_in_6;
  wire       [3:0]    tensor_core_bf12_30_data_in_7;
  wire       [3:0]    tensor_core_bf12_30_data_in_8;
  wire       [3:0]    tensor_core_bf12_30_data_in_9;
  wire       [3:0]    tensor_core_bf12_30_data_in_10;
  wire       [3:0]    tensor_core_bf12_30_data_in_11;
  wire       [3:0]    tensor_core_bf12_30_data_in_12;
  wire       [3:0]    tensor_core_bf12_30_data_in_13;
  wire       [3:0]    tensor_core_bf12_30_data_in_14;
  wire       [3:0]    tensor_core_bf12_30_data_in_15;
  wire       [3:0]    tensor_core_bf12_30_data_in_16;
  wire       [3:0]    tensor_core_bf12_30_data_in_17;
  wire       [3:0]    tensor_core_bf12_30_data_in_18;
  wire       [3:0]    tensor_core_bf12_30_data_in_19;
  wire       [3:0]    tensor_core_bf12_30_data_in_20;
  wire                tensor_core_bf12_30_load_bb_one;
  wire                tensor_core_bf12_30_load_bb_two;
  wire       [3:0]    tensor_core_bf12_31_data_in_1;
  wire       [3:0]    tensor_core_bf12_31_data_in_2;
  wire       [3:0]    tensor_core_bf12_31_data_in_3;
  wire       [3:0]    tensor_core_bf12_31_data_in_4;
  wire       [3:0]    tensor_core_bf12_31_data_in_5;
  wire       [3:0]    tensor_core_bf12_31_data_in_6;
  wire       [3:0]    tensor_core_bf12_31_data_in_7;
  wire       [3:0]    tensor_core_bf12_31_data_in_8;
  wire       [3:0]    tensor_core_bf12_31_data_in_9;
  wire       [3:0]    tensor_core_bf12_31_data_in_10;
  wire       [3:0]    tensor_core_bf12_31_data_in_11;
  wire       [3:0]    tensor_core_bf12_31_data_in_12;
  wire       [3:0]    tensor_core_bf12_31_data_in_13;
  wire       [3:0]    tensor_core_bf12_31_data_in_14;
  wire       [3:0]    tensor_core_bf12_31_data_in_15;
  wire       [3:0]    tensor_core_bf12_31_data_in_16;
  wire       [3:0]    tensor_core_bf12_31_data_in_17;
  wire       [3:0]    tensor_core_bf12_31_data_in_18;
  wire       [3:0]    tensor_core_bf12_31_data_in_19;
  wire       [3:0]    tensor_core_bf12_31_data_in_20;
  wire                tensor_core_bf12_31_load_bb_one;
  wire                tensor_core_bf12_31_load_bb_two;
  reg                 AccuDelayInst_io_pop_ready;
  wire       [23:0]   tcEntry_bf24_col_1;
  wire       [23:0]   tcEntry_bf24_col_2;
  wire       [23:0]   tcEntry_bf24_col_3;
  wire       [87:0]   tcEntry_cascade_weight_out;
  wire       [31:0]   tcEntry_cascade_data_out_col_1;
  wire       [31:0]   tcEntry_cascade_data_out_col_2;
  wire       [31:0]   tcEntry_cascade_data_out_col_3;
  wire       [23:0]   tcStartPoint_bf24_col_1;
  wire       [23:0]   tcStartPoint_bf24_col_2;
  wire       [23:0]   tcStartPoint_bf24_col_3;
  wire       [87:0]   tcStartPoint_cascade_weight_out;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_1;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_2;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_3;
  wire       [23:0]   tcAccu_bf24_col_1;
  wire       [23:0]   tcAccu_bf24_col_2;
  wire       [23:0]   tcAccu_bf24_col_3;
  wire       [31:0]   tcAccu_cascade_data_out_col_1;
  wire       [31:0]   tcAccu_cascade_data_out_col_2;
  wire       [31:0]   tcAccu_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_1_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_1_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_1_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_1_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_1_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_1_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_1_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_2_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_2_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_2_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_2_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_2_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_2_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_2_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_3_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_3_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_3_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_3_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_3_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_3_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_3_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_4_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_4_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_4_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_4_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_4_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_4_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_4_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_5_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_5_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_5_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_5_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_5_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_5_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_5_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_6_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_6_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_6_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_6_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_6_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_6_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_6_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_7_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_7_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_7_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_7_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_7_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_7_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_7_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_8_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_8_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_8_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_8_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_8_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_8_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_8_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_9_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_9_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_9_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_9_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_9_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_9_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_9_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_10_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_10_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_10_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_10_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_10_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_10_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_10_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_11_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_11_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_11_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_11_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_11_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_11_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_11_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_12_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_12_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_12_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_12_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_12_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_12_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_12_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_13_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_13_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_13_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_13_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_13_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_13_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_13_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_14_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_14_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_14_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_14_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_14_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_14_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_14_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_15_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_15_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_15_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_15_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_15_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_15_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_15_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_16_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_16_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_16_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_16_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_16_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_16_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_16_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_17_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_17_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_17_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_17_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_17_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_17_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_17_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_18_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_18_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_18_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_18_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_18_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_18_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_18_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_19_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_19_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_19_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_19_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_19_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_19_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_19_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_20_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_20_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_20_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_20_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_20_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_20_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_20_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_21_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_21_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_21_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_21_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_21_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_21_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_21_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_22_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_22_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_22_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_22_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_22_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_22_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_22_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_23_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_23_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_23_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_23_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_23_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_23_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_23_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_24_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_24_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_24_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_24_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_24_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_24_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_24_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_25_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_25_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_25_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_25_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_25_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_25_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_25_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_26_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_26_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_26_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_26_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_26_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_26_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_26_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_27_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_27_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_27_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_27_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_27_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_27_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_27_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_28_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_28_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_28_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_28_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_28_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_28_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_28_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_29_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_29_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_29_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_29_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_29_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_29_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_29_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_30_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_30_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_30_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_30_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_30_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_30_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_30_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_bf12_31_bf24_col_1;
  wire       [23:0]   tensor_core_bf12_31_bf24_col_2;
  wire       [23:0]   tensor_core_bf12_31_bf24_col_3;
  wire       [87:0]   tensor_core_bf12_31_cascade_weight_out;
  wire       [31:0]   tensor_core_bf12_31_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_bf12_31_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_bf12_31_cascade_data_out_col_3;
  wire                AccuDelayInst_io_push_ready;
  wire                AccuDelayInst_io_pop_valid;
  wire       [23:0]   AccuDelayInst_io_pop_payload_0;
  wire       [23:0]   AccuDelayInst_io_pop_payload_1;
  wire       [23:0]   AccuDelayInst_io_pop_payload_2;
  wire       [7:0]    AccuDelayInst_io_occupancy;
  wire       [7:0]    AccuDelayInst_io_availability;
  wire       [6:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [6:0]    _zz_loadSelCounter_valueNext;
  wire       [0:0]    _zz_loadSelCounter_valueNext_1;
  wire       [15:0]   _zz_inputCounter_valueNext;
  wire       [0:0]    _zz_inputCounter_valueNext_1;
  wire       [15:0]   _zz_outValidCounter_valueNext;
  wire       [0:0]    _zz_outValidCounter_valueNext_1;
  wire       [15:0]   _zz_resValidCounter_valueNext;
  wire       [0:0]    _zz_resValidCounter_valueNext_1;
  reg                 io_loadValid_delay_1;
  reg                 io_loadValid_delay_2;
  reg                 loadValidD3t;
  reg                 io_loadValid_delay_1_1;
  reg                 loadValidD2t;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willClear;
  reg        [6:0]    loadCounter_valueNext;
  reg        [6:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willOverflow;
  reg                 loadSelCounter_willIncrement;
  wire                loadSelCounter_willClear;
  reg        [6:0]    loadSelCounter_valueNext;
  reg        [6:0]    loadSelCounter_value;
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
  reg                 io_dataValid_delay_28;
  reg                 io_dataValid_delay_29;
  reg                 io_dataValid_delay_30;
  reg                 io_dataValid_delay_31;
  reg                 io_dataValid_delay_32;
  reg                 io_dataValid_delay_33;
  reg                 io_dataValid_delay_34;
  reg                 io_dataValid_delay_35;
  reg                 io_dataValid_delay_36;
  reg                 io_dataValid_delay_37;
  reg                 io_dataValid_delay_38;
  reg                 io_dataValid_delay_39;
  reg                 io_dataValid_delay_40;
  reg                 io_dataValid_delay_41;
  reg                 io_dataValid_delay_42;
  reg                 io_dataValid_delay_43;
  reg                 io_dataValid_delay_44;
  reg                 io_dataValid_delay_45;
  reg                 io_dataValid_delay_46;
  reg                 io_dataValid_delay_47;
  reg                 io_dataValid_delay_48;
  reg                 io_dataValid_delay_49;
  reg                 io_dataValid_delay_50;
  reg                 io_dataValid_delay_51;
  reg                 io_dataValid_delay_52;
  reg                 io_dataValid_delay_53;
  reg                 io_dataValid_delay_54;
  reg                 io_dataValid_delay_55;
  reg                 io_dataValid_delay_56;
  reg                 io_dataValid_delay_57;
  reg                 io_dataValid_delay_58;
  reg                 io_dataValid_delay_59;
  reg                 io_dataValid_delay_60;
  reg                 io_dataValid_delay_61;
  reg                 io_dataValid_delay_62;
  reg                 io_dataValid_delay_63;
  reg                 io_dataValid_delay_64;
  reg                 io_dataValid_delay_65;
  reg                 io_dataValid_delay_66;
  reg                 io_dataValid_delay_67;
  reg                 oBufferLoadValid;
  wire       [15:0]   outValidCounter_overflowVal;
  reg                 outValidCounter_willIncrement;
  wire                outValidCounter_willClear;
  reg        [15:0]   outValidCounter_valueNext;
  reg        [15:0]   outValidCounter_value;
  wire                outValidCounter_willOverflowIfInc;
  wire                outValidCounter_willOverflow;
  wire       [15:0]   resValidCounter_overflowVal;
  reg                 resValidCounter_willIncrement;
  wire                resValidCounter_willClear;
  reg        [15:0]   resValidCounter_valueNext;
  reg        [15:0]   resValidCounter_value;
  wire                resValidCounter_willOverflowIfInc;
  wire                resValidCounter_willOverflow;
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
  reg                 oBufferLoadValid_delay_30;
  reg                 oBufferLoadValid_delay_31;
  reg                 oBufferLoadValid_delay_32;
  reg                 oBufferLoadValid_delay_33;
  reg                 oBufferLoadValid_delay_34;
  reg                 oBufferLoadValid_delay_35;
  reg                 oBufferLoadValid_delay_36;
  reg                 oBufferLoadValid_delay_37;
  reg                 oBufferLoadValid_delay_38;
  reg                 oBufferLoadValid_delay_39;
  reg                 oBufferLoadValid_delay_40;
  reg                 oBufferLoadValid_delay_41;
  reg                 oBufferLoadValid_delay_42;
  reg                 oBufferLoadValid_delay_43;
  reg                 oBufferLoadValid_delay_44;
  reg                 oBufferLoadValid_delay_45;
  reg                 oBufferLoadValid_delay_46;
  reg                 oBufferLoadValid_delay_47;
  reg                 oBufferLoadValid_delay_48;
  reg                 oBufferLoadValid_delay_49;
  reg                 oBufferLoadValid_delay_50;
  reg                 oBufferLoadValid_delay_51;
  reg                 oBufferLoadValid_delay_52;
  reg                 oBufferLoadValid_delay_53;
  reg                 oBufferLoadValid_delay_54;
  reg                 oBufferLoadValid_delay_55;
  reg                 oBufferLoadValid_delay_56;
  reg                 oBufferLoadValid_delay_57;
  reg                 oBufferLoadValid_delay_58;
  reg                 oBufferLoadValid_delay_59;
  reg                 oBufferLoadValid_delay_60;
  reg                 oBufferLoadValid_delay_61;
  reg                 oBufferLoadValid_delay_62;
  reg                 oBufferLoadValid_delay_63;
  reg                 oBufferLoadValid_delay_64;
  reg                 oBufferLoadValid_delay_65;
  reg                 oBufferLoadValid_delay_66;
  reg                 oBufferLoadValid_delay_67;
  reg                 oBufferLoadValid_delay_68;
  reg                 oBufferLoadValid_delay_69;
  reg                 oBufferLoadValid_delay_70;
  reg                 oBufferLoadValid_delay_71;
  reg                 oBufferLoadValid_delay_72;
  reg                 oBufferLoadValid_delay_73;
  reg                 oBufferLoadValid_delay_74;
  reg                 oBufferLoadValid_delay_75;
  reg                 oBufferLoadValid_delay_76;
  reg                 oBufferLoadValid_delay_77;
  reg                 oBufferLoadValid_delay_78;
  reg                 oBufferLoadValid_delay_79;
  reg                 oBufferLoadValid_delay_80;
  reg                 oBufferLoadValid_delay_81;
  reg                 oBufferLoadValid_delay_82;
  reg                 oBufferLoadValid_delay_83;
  reg                 oBufferLoadValid_delay_84;
  reg                 oBufferLoadValid_delay_85;
  reg                 oBufferLoadValid_delay_86;
  reg                 oBufferLoadValid_delay_87;
  reg                 oBufferLoadValid_delay_88;
  reg                 oBufferLoadValid_delay_89;
  reg        [23:0]   AccuDelayInst_io_pop_payload_0_delay_1;
  reg        [23:0]   AccuDelayInst_io_pop_payload_0_delay_2;
  reg        [23:0]   AccuDelayInst_io_pop_payload_1_delay_1;
  reg        [23:0]   AccuDelayInst_io_pop_payload_1_delay_2;
  reg        [23:0]   AccuDelayInst_io_pop_payload_2_delay_1;
  reg        [23:0]   AccuDelayInst_io_pop_payload_2_delay_2;

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {6'd0, _zz_loadCounter_valueNext_1};
  assign _zz_loadSelCounter_valueNext_1 = loadSelCounter_willIncrement;
  assign _zz_loadSelCounter_valueNext = {6'd0, _zz_loadSelCounter_valueNext_1};
  assign _zz_inputCounter_valueNext_1 = inputCounter_willIncrement;
  assign _zz_inputCounter_valueNext = {15'd0, _zz_inputCounter_valueNext_1};
  assign _zz_outValidCounter_valueNext_1 = outValidCounter_willIncrement;
  assign _zz_outValidCounter_valueNext = {15'd0, _zz_outValidCounter_valueNext_1};
  assign _zz_resValidCounter_valueNext_1 = resValidCounter_willIncrement;
  assign _zz_resValidCounter_valueNext = {15'd0, _zz_resValidCounter_valueNext_1};
  tensor_core_entry_bf12 tcEntry (
    .clk                    (clk                                 ), //i
    .data_in_1              (tcEntry_data_in_1[3:0]              ), //i
    .data_in_2              (tcEntry_data_in_2[3:0]              ), //i
    .data_in_3              (tcEntry_data_in_3[3:0]              ), //i
    .data_in_4              (tcEntry_data_in_4[3:0]              ), //i
    .data_in_5              (tcEntry_data_in_5[3:0]              ), //i
    .data_in_6              (tcEntry_data_in_6[3:0]              ), //i
    .data_in_7              (tcEntry_data_in_7[3:0]              ), //i
    .data_in_8              (tcEntry_data_in_8[3:0]              ), //i
    .data_in_9              (tcEntry_data_in_9[3:0]              ), //i
    .data_in_10             (tcEntry_data_in_10[3:0]             ), //i
    .data_in_11             (tcEntry_data_in_11[3:0]             ), //i
    .data_in_12             (tcEntry_data_in_12[3:0]             ), //i
    .data_in_13             (tcEntry_data_in_13[3:0]             ), //i
    .data_in_14             (tcEntry_data_in_14[3:0]             ), //i
    .data_in_15             (tcEntry_data_in_15[3:0]             ), //i
    .data_in_16             (tcEntry_data_in_16[3:0]             ), //i
    .data_in_17             (tcEntry_data_in_17[3:0]             ), //i
    .data_in_18             (tcEntry_data_in_18[3:0]             ), //i
    .data_in_19             (tcEntry_data_in_19[3:0]             ), //i
    .data_in_20             (tcEntry_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                             ), //i
    .side_in_2              (4'b0000                             ), //i
    .side_in_3              (4'b0000                             ), //i
    .side_in_4              (4'b0000                             ), //i
    .shared_exponent_data   (io_expCascadeIn[7:0]                ), //i
    .feed_sel               (2'b00                               ), //i
    .load_bb_one            (1'b1                                ), //i
    .load_bb_two            (1'b0                                ), //i
    .load_buf_sel           (1'b0                                ), //i
    .bf24_col_1             (tcEntry_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tcEntry_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tcEntry_bf24_col_3[23:0]            ), //o
    .clr0                   (1'b0                                ), //i
    .clr1                   (1'b0                                ), //i
    .cascade_weight_out     (tcEntry_cascade_weight_out[87:0]    ), //o
    .cascade_data_out_col_1 (tcEntry_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tcEntry_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tcEntry_cascade_data_out_col_3[31:0])  //o
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
    .side_in_1              (4'b0000                                  ), //i
    .side_in_2              (4'b0000                                  ), //i
    .side_in_3              (4'b0000                                  ), //i
    .side_in_4              (4'b0000                                  ), //i
    .shared_exponent_data   (io_expIn_0[7:0]                          ), //i
    .feed_sel               (2'b01                                    ), //i
    .load_bb_one            (tcStartPoint_load_bb_one                 ), //i
    .load_bb_two            (tcStartPoint_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                               ), //i
    .bf24_col_1             (tcStartPoint_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tcStartPoint_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tcStartPoint_bf24_col_3[23:0]            ), //o
    .clr0                   (io_dataIn_0_valid                        ), //i
    .clr1                   (1'b0                                     ), //i
    .cascade_weight_in      (tcEntry_cascade_weight_out[87:0]         ), //i
    .cascade_weight_out     (tcStartPoint_cascade_weight_out[87:0]    ), //o
    .cascade_data_out_col_1 (tcStartPoint_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tcStartPoint_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tcStartPoint_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_accu tcAccu (
    .clk                    (clk                                             ), //i
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (resValidCounter_willOverflowIfInc               ), //i
    .bf24_a1                (AccuDelayInst_io_pop_payload_0_delay_2[23:0]    ), //i
    .bf24_a2                (AccuDelayInst_io_pop_payload_1_delay_2[23:0]    ), //i
    .bf24_a3                (AccuDelayInst_io_pop_payload_2_delay_2[23:0]    ), //i
    .cascade_data_in_col_1  (tensor_core_bf12_31_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_31_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_31_cascade_data_out_col_3[31:0]), //i
    .bf24_col_1             (tcAccu_bf24_col_1[23:0]                         ), //o
    .bf24_col_2             (tcAccu_bf24_col_2[23:0]                         ), //o
    .bf24_col_3             (tcAccu_bf24_col_3[23:0]                         ), //o
    .cascade_data_out_col_1 (tcAccu_cascade_data_out_col_1[31:0]             ), //o
    .cascade_data_out_col_2 (tcAccu_cascade_data_out_col_2[31:0]             ), //o
    .cascade_data_out_col_3 (tcAccu_cascade_data_out_col_3[31:0]             )  //o
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_1[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_1_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_1_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_1_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_1_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_1_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_1_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_2[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_2_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_2_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_2_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_2_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_2_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_2_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_3[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_3_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_3_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_3_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_3_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_3_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_3_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_4[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_4_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_4_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_4_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_4_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_4_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_4_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_5[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_5_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_5_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_5_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_5_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_5_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_5_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_6[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_6_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_6_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_6_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_6_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_6_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_6_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_7[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_7_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_7_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_7_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_7_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_7_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_7_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_8[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_8_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_8_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_8_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_8_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_8_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_8_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                        ), //i
    .side_in_2              (4'b0000                                        ), //i
    .side_in_3              (4'b0000                                        ), //i
    .side_in_4              (4'b0000                                        ), //i
    .shared_exponent_data   (io_expIn_9[7:0]                                ), //i
    .feed_sel               (2'b01                                          ), //i
    .load_bb_one            (tensor_core_bf12_9_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_9_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                     ), //i
    .bf24_col_1             (tensor_core_bf12_9_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_9_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_9_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (io_dataIn_9_valid                              ), //i
    .clr1                   (1'b0                                           ), //i
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
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_10[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_10_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_10_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_10_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_10_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_10_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_10_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
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
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_11[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_11_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_11_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_11_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_11_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_11_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_11_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_10_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_11_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_10_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_10_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_10_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_11_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_11_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_11_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_12 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_12_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_12_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_12_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_12_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_12_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_12_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_12_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_12_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_12_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_12_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_12_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_12_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_12_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_12_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_12_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_12_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_12_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_12_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_12_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_12_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_12[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_12_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_12_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_12_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_12_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_12_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_12_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_11_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_12_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_11_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_11_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_11_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_12_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_12_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_12_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_13 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_13_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_13_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_13_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_13_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_13_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_13_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_13_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_13_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_13_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_13_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_13_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_13_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_13_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_13_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_13_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_13_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_13_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_13_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_13_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_13_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_13[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_13_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_13_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_13_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_13_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_13_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_13_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_12_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_13_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_12_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_12_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_12_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_13_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_13_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_13_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_14 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_14_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_14_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_14_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_14_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_14_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_14_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_14_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_14_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_14_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_14_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_14_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_14_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_14_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_14_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_14_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_14_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_14_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_14_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_14_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_14_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_14[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_14_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_14_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_14_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_14_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_14_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_14_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_13_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_14_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_13_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_13_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_13_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_14_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_14_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_14_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_15 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_15_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_15_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_15_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_15_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_15_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_15_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_15_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_15_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_15_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_15_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_15_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_15_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_15_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_15_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_15_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_15_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_15_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_15_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_15_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_15_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_15[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_15_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_15_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_15_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_15_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_15_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_15_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_14_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_15_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_14_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_14_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_14_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_15_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_15_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_15_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_16 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_16_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_16_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_16_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_16_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_16_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_16_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_16_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_16_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_16_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_16_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_16_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_16_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_16_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_16_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_16_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_16_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_16_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_16_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_16_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_16_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_16[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_16_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_16_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_16_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_16_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_16_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_16_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_15_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_16_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_15_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_15_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_15_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_16_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_16_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_16_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_17 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_17_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_17_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_17_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_17_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_17_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_17_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_17_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_17_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_17_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_17_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_17_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_17_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_17_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_17_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_17_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_17_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_17_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_17_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_17_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_17_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_17[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_17_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_17_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_17_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_17_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_17_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_17_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_16_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_17_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_16_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_16_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_16_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_17_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_17_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_17_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_18 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_18_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_18_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_18_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_18_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_18_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_18_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_18_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_18_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_18_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_18_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_18_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_18_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_18_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_18_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_18_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_18_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_18_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_18_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_18_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_18_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_18[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_18_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_18_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_18_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_18_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_18_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_18_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_17_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_18_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_17_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_17_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_17_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_18_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_18_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_18_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_19 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_19_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_19_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_19_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_19_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_19_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_19_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_19_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_19_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_19_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_19_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_19_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_19_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_19_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_19_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_19_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_19_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_19_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_19_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_19_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_19_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_19[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_19_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_19_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_19_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_19_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_19_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_19_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_18_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_19_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_18_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_18_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_18_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_19_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_19_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_19_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_20 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_20_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_20_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_20_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_20_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_20_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_20_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_20_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_20_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_20_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_20_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_20_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_20_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_20_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_20_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_20_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_20_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_20_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_20_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_20_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_20_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_20[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_20_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_20_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_20_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_20_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_20_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_20_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_19_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_20_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_19_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_19_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_19_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_20_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_20_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_20_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_21 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_21_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_21_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_21_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_21_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_21_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_21_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_21_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_21_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_21_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_21_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_21_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_21_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_21_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_21_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_21_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_21_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_21_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_21_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_21_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_21_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_21[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_21_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_21_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_21_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_21_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_21_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_21_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_20_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_21_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_20_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_20_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_20_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_21_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_21_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_21_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_22 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_22_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_22_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_22_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_22_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_22_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_22_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_22_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_22_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_22_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_22_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_22_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_22_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_22_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_22_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_22_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_22_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_22_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_22_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_22_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_22_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_22[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_22_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_22_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_22_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_22_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_22_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_22_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_21_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_22_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_21_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_21_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_21_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_22_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_22_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_22_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_23 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_23_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_23_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_23_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_23_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_23_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_23_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_23_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_23_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_23_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_23_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_23_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_23_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_23_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_23_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_23_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_23_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_23_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_23_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_23_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_23_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_23[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_23_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_23_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_23_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_23_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_23_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_23_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_22_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_23_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_22_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_22_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_22_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_23_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_23_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_23_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_24 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_24_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_24_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_24_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_24_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_24_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_24_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_24_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_24_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_24_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_24_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_24_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_24_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_24_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_24_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_24_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_24_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_24_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_24_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_24_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_24_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_24[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_24_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_24_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_24_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_24_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_24_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_24_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_23_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_24_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_23_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_23_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_23_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_24_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_24_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_24_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_25 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_25_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_25_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_25_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_25_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_25_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_25_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_25_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_25_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_25_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_25_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_25_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_25_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_25_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_25_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_25_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_25_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_25_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_25_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_25_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_25_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_25[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_25_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_25_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_25_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_25_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_25_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_25_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_24_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_25_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_24_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_24_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_24_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_25_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_25_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_25_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_26 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_26_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_26_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_26_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_26_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_26_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_26_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_26_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_26_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_26_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_26_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_26_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_26_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_26_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_26_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_26_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_26_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_26_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_26_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_26_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_26_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_26[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_26_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_26_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_26_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_26_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_26_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_26_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_25_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_26_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_25_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_25_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_25_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_26_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_26_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_26_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_27 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_27_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_27_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_27_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_27_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_27_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_27_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_27_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_27_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_27_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_27_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_27_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_27_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_27_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_27_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_27_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_27_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_27_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_27_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_27_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_27_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_27[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_27_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_27_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_27_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_27_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_27_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_27_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_26_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_27_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_26_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_26_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_26_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_27_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_27_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_27_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_28 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_28_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_28_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_28_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_28_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_28_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_28_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_28_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_28_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_28_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_28_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_28_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_28_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_28_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_28_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_28_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_28_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_28_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_28_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_28_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_28_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_28[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_28_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_28_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_28_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_28_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_28_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_28_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_27_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_28_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_27_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_27_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_27_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_28_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_28_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_28_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_29 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_29_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_29_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_29_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_29_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_29_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_29_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_29_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_29_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_29_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_29_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_29_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_29_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_29_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_29_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_29_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_29_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_29_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_29_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_29_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_29_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_29[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_29_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_29_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_29_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_29_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_29_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_29_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_28_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_29_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_28_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_28_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_28_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_29_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_29_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_29_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_30 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_30_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_30_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_30_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_30_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_30_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_30_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_30_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_30_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_30_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_30_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_30_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_30_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_30_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_30_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_30_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_30_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_30_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_30_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_30_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_30_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_30[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_30_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_30_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_30_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_30_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_30_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_30_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_29_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_30_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_29_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_29_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_29_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_30_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_30_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_30_cascade_data_out_col_3[31:0])  //o
  );
  tensor_core_bf12 tensor_core_bf12_31 (
    .clk                    (clk                                             ), //i
    .data_in_1              (tensor_core_bf12_31_data_in_1[3:0]              ), //i
    .data_in_2              (tensor_core_bf12_31_data_in_2[3:0]              ), //i
    .data_in_3              (tensor_core_bf12_31_data_in_3[3:0]              ), //i
    .data_in_4              (tensor_core_bf12_31_data_in_4[3:0]              ), //i
    .data_in_5              (tensor_core_bf12_31_data_in_5[3:0]              ), //i
    .data_in_6              (tensor_core_bf12_31_data_in_6[3:0]              ), //i
    .data_in_7              (tensor_core_bf12_31_data_in_7[3:0]              ), //i
    .data_in_8              (tensor_core_bf12_31_data_in_8[3:0]              ), //i
    .data_in_9              (tensor_core_bf12_31_data_in_9[3:0]              ), //i
    .data_in_10             (tensor_core_bf12_31_data_in_10[3:0]             ), //i
    .data_in_11             (tensor_core_bf12_31_data_in_11[3:0]             ), //i
    .data_in_12             (tensor_core_bf12_31_data_in_12[3:0]             ), //i
    .data_in_13             (tensor_core_bf12_31_data_in_13[3:0]             ), //i
    .data_in_14             (tensor_core_bf12_31_data_in_14[3:0]             ), //i
    .data_in_15             (tensor_core_bf12_31_data_in_15[3:0]             ), //i
    .data_in_16             (tensor_core_bf12_31_data_in_16[3:0]             ), //i
    .data_in_17             (tensor_core_bf12_31_data_in_17[3:0]             ), //i
    .data_in_18             (tensor_core_bf12_31_data_in_18[3:0]             ), //i
    .data_in_19             (tensor_core_bf12_31_data_in_19[3:0]             ), //i
    .data_in_20             (tensor_core_bf12_31_data_in_20[3:0]             ), //i
    .side_in_1              (4'b0000                                         ), //i
    .side_in_2              (4'b0000                                         ), //i
    .side_in_3              (4'b0000                                         ), //i
    .side_in_4              (4'b0000                                         ), //i
    .shared_exponent_data   (io_expIn_31[7:0]                                ), //i
    .feed_sel               (2'b01                                           ), //i
    .load_bb_one            (tensor_core_bf12_31_load_bb_one                 ), //i
    .load_bb_two            (tensor_core_bf12_31_load_bb_two                 ), //i
    .load_buf_sel           (loadBufSel                                      ), //i
    .bf24_col_1             (tensor_core_bf12_31_bf24_col_1[23:0]            ), //o
    .bf24_col_2             (tensor_core_bf12_31_bf24_col_2[23:0]            ), //o
    .bf24_col_3             (tensor_core_bf12_31_bf24_col_3[23:0]            ), //o
    .acc_en                 (1'b0                                            ), //i
    .zero_en                (1'b0                                            ), //i
    .clr0                   (io_dataIn_31_valid                              ), //i
    .clr1                   (1'b0                                            ), //i
    .cascade_weight_in      (tensor_core_bf12_30_cascade_weight_out[87:0]    ), //i
    .cascade_weight_out     (tensor_core_bf12_31_cascade_weight_out[87:0]    ), //o
    .cascade_data_in_col_1  (tensor_core_bf12_30_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_30_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_30_cascade_data_out_col_3[31:0]), //i
    .cascade_data_out_col_1 (tensor_core_bf12_31_cascade_data_out_col_1[31:0]), //o
    .cascade_data_out_col_2 (tensor_core_bf12_31_cascade_data_out_col_2[31:0]), //o
    .cascade_data_out_col_3 (tensor_core_bf12_31_cascade_data_out_col_3[31:0])  //o
  );
  StreamFifo AccuDelayInst (
    .io_push_valid     (oBufferLoadValid                    ), //i
    .io_push_ready     (AccuDelayInst_io_push_ready         ), //o
    .io_push_payload_0 (tcAccu_bf24_col_1[23:0]             ), //i
    .io_push_payload_1 (tcAccu_bf24_col_2[23:0]             ), //i
    .io_push_payload_2 (tcAccu_bf24_col_3[23:0]             ), //i
    .io_pop_valid      (AccuDelayInst_io_pop_valid          ), //o
    .io_pop_ready      (AccuDelayInst_io_pop_ready          ), //i
    .io_pop_payload_0  (AccuDelayInst_io_pop_payload_0[23:0]), //o
    .io_pop_payload_1  (AccuDelayInst_io_pop_payload_1[23:0]), //o
    .io_pop_payload_2  (AccuDelayInst_io_pop_payload_2[23:0]), //o
    .io_flush          (1'b0                                ), //i
    .io_occupancy      (AccuDelayInst_io_occupancy[7:0]     ), //o
    .io_availability   (AccuDelayInst_io_availability[7:0]  ), //o
    .clk               (clk                                 ), //i
    .clrn              (clrn                                )  //i
  );
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(loadValidD3t) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willClear = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 7'h5f);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 7'h0;
    end else begin
      loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 7'h0;
    end
  end

  always @(*) begin
    loadSelCounter_willIncrement = 1'b0;
    if(loadValidD2t) begin
      loadSelCounter_willIncrement = 1'b1;
    end
  end

  assign loadSelCounter_willClear = 1'b0;
  assign loadSelCounter_willOverflowIfInc = (loadSelCounter_value == 7'h5f);
  assign loadSelCounter_willOverflow = (loadSelCounter_willOverflowIfInc && loadSelCounter_willIncrement);
  always @(*) begin
    if(loadSelCounter_willOverflow) begin
      loadSelCounter_valueNext = 7'h0;
    end else begin
      loadSelCounter_valueNext = (loadSelCounter_value + _zz_loadSelCounter_valueNext);
    end
    if(loadSelCounter_willClear) begin
      loadSelCounter_valueNext = 7'h0;
    end
  end

  assign loadBufCtrl = (loadValidD2t ? loadBufCtrlReg : 2'b00);
  assign io_loadReady = loadCounter_willOverflow;
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
      inputCounter_valueNext = 16'h0;
    end else begin
      inputCounter_valueNext = (inputCounter_value + _zz_inputCounter_valueNext);
    end
    if(inputCounter_willClear) begin
      inputCounter_valueNext = 16'h0;
    end
  end

  assign inputCounter_overflowVal = (io_inputIters - 16'h0001);
  assign io_dataIterReady = inputCounter_willOverflow;
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
      outValidCounter_valueNext = 16'h0;
    end else begin
      outValidCounter_valueNext = (outValidCounter_value + _zz_outValidCounter_valueNext);
    end
    if(outValidCounter_willClear) begin
      outValidCounter_valueNext = 16'h0;
    end
  end

  assign outValidCounter_overflowVal = (io_inputIters - 16'h0001);
  assign io_outValid = outValidCounter_willOverflow;
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
  assign tensor_core_bf12_1_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_1_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_2_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_2_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_3_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_3_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_4_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_4_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_5_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_5_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_6_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_6_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_7_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_7_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_8_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_8_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_9_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_9_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_10_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_10_load_bb_two = loadBufCtrl[1];
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
  assign tensor_core_bf12_11_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_11_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_12_data_in_1 = io_dataIn_12_payload[3 : 0];
  assign tensor_core_bf12_12_data_in_2 = io_dataIn_12_payload[7 : 4];
  assign tensor_core_bf12_12_data_in_3 = io_dataIn_12_payload[11 : 8];
  assign tensor_core_bf12_12_data_in_4 = io_dataIn_12_payload[15 : 12];
  assign tensor_core_bf12_12_data_in_5 = io_dataIn_12_payload[19 : 16];
  assign tensor_core_bf12_12_data_in_6 = io_dataIn_12_payload[23 : 20];
  assign tensor_core_bf12_12_data_in_7 = io_dataIn_12_payload[27 : 24];
  assign tensor_core_bf12_12_data_in_8 = io_dataIn_12_payload[31 : 28];
  assign tensor_core_bf12_12_data_in_9 = io_dataIn_12_payload[35 : 32];
  assign tensor_core_bf12_12_data_in_10 = io_dataIn_12_payload[39 : 36];
  assign tensor_core_bf12_12_data_in_11 = io_dataIn_12_payload[43 : 40];
  assign tensor_core_bf12_12_data_in_12 = io_dataIn_12_payload[47 : 44];
  assign tensor_core_bf12_12_data_in_13 = io_dataIn_12_payload[51 : 48];
  assign tensor_core_bf12_12_data_in_14 = io_dataIn_12_payload[55 : 52];
  assign tensor_core_bf12_12_data_in_15 = io_dataIn_12_payload[59 : 56];
  assign tensor_core_bf12_12_data_in_16 = io_dataIn_12_payload[63 : 60];
  assign tensor_core_bf12_12_data_in_17 = io_dataIn_12_payload[67 : 64];
  assign tensor_core_bf12_12_data_in_18 = io_dataIn_12_payload[71 : 68];
  assign tensor_core_bf12_12_data_in_19 = io_dataIn_12_payload[75 : 72];
  assign tensor_core_bf12_12_data_in_20 = io_dataIn_12_payload[79 : 76];
  assign tensor_core_bf12_12_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_12_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_13_data_in_1 = io_dataIn_13_payload[3 : 0];
  assign tensor_core_bf12_13_data_in_2 = io_dataIn_13_payload[7 : 4];
  assign tensor_core_bf12_13_data_in_3 = io_dataIn_13_payload[11 : 8];
  assign tensor_core_bf12_13_data_in_4 = io_dataIn_13_payload[15 : 12];
  assign tensor_core_bf12_13_data_in_5 = io_dataIn_13_payload[19 : 16];
  assign tensor_core_bf12_13_data_in_6 = io_dataIn_13_payload[23 : 20];
  assign tensor_core_bf12_13_data_in_7 = io_dataIn_13_payload[27 : 24];
  assign tensor_core_bf12_13_data_in_8 = io_dataIn_13_payload[31 : 28];
  assign tensor_core_bf12_13_data_in_9 = io_dataIn_13_payload[35 : 32];
  assign tensor_core_bf12_13_data_in_10 = io_dataIn_13_payload[39 : 36];
  assign tensor_core_bf12_13_data_in_11 = io_dataIn_13_payload[43 : 40];
  assign tensor_core_bf12_13_data_in_12 = io_dataIn_13_payload[47 : 44];
  assign tensor_core_bf12_13_data_in_13 = io_dataIn_13_payload[51 : 48];
  assign tensor_core_bf12_13_data_in_14 = io_dataIn_13_payload[55 : 52];
  assign tensor_core_bf12_13_data_in_15 = io_dataIn_13_payload[59 : 56];
  assign tensor_core_bf12_13_data_in_16 = io_dataIn_13_payload[63 : 60];
  assign tensor_core_bf12_13_data_in_17 = io_dataIn_13_payload[67 : 64];
  assign tensor_core_bf12_13_data_in_18 = io_dataIn_13_payload[71 : 68];
  assign tensor_core_bf12_13_data_in_19 = io_dataIn_13_payload[75 : 72];
  assign tensor_core_bf12_13_data_in_20 = io_dataIn_13_payload[79 : 76];
  assign tensor_core_bf12_13_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_13_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_14_data_in_1 = io_dataIn_14_payload[3 : 0];
  assign tensor_core_bf12_14_data_in_2 = io_dataIn_14_payload[7 : 4];
  assign tensor_core_bf12_14_data_in_3 = io_dataIn_14_payload[11 : 8];
  assign tensor_core_bf12_14_data_in_4 = io_dataIn_14_payload[15 : 12];
  assign tensor_core_bf12_14_data_in_5 = io_dataIn_14_payload[19 : 16];
  assign tensor_core_bf12_14_data_in_6 = io_dataIn_14_payload[23 : 20];
  assign tensor_core_bf12_14_data_in_7 = io_dataIn_14_payload[27 : 24];
  assign tensor_core_bf12_14_data_in_8 = io_dataIn_14_payload[31 : 28];
  assign tensor_core_bf12_14_data_in_9 = io_dataIn_14_payload[35 : 32];
  assign tensor_core_bf12_14_data_in_10 = io_dataIn_14_payload[39 : 36];
  assign tensor_core_bf12_14_data_in_11 = io_dataIn_14_payload[43 : 40];
  assign tensor_core_bf12_14_data_in_12 = io_dataIn_14_payload[47 : 44];
  assign tensor_core_bf12_14_data_in_13 = io_dataIn_14_payload[51 : 48];
  assign tensor_core_bf12_14_data_in_14 = io_dataIn_14_payload[55 : 52];
  assign tensor_core_bf12_14_data_in_15 = io_dataIn_14_payload[59 : 56];
  assign tensor_core_bf12_14_data_in_16 = io_dataIn_14_payload[63 : 60];
  assign tensor_core_bf12_14_data_in_17 = io_dataIn_14_payload[67 : 64];
  assign tensor_core_bf12_14_data_in_18 = io_dataIn_14_payload[71 : 68];
  assign tensor_core_bf12_14_data_in_19 = io_dataIn_14_payload[75 : 72];
  assign tensor_core_bf12_14_data_in_20 = io_dataIn_14_payload[79 : 76];
  assign tensor_core_bf12_14_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_14_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_15_data_in_1 = io_dataIn_15_payload[3 : 0];
  assign tensor_core_bf12_15_data_in_2 = io_dataIn_15_payload[7 : 4];
  assign tensor_core_bf12_15_data_in_3 = io_dataIn_15_payload[11 : 8];
  assign tensor_core_bf12_15_data_in_4 = io_dataIn_15_payload[15 : 12];
  assign tensor_core_bf12_15_data_in_5 = io_dataIn_15_payload[19 : 16];
  assign tensor_core_bf12_15_data_in_6 = io_dataIn_15_payload[23 : 20];
  assign tensor_core_bf12_15_data_in_7 = io_dataIn_15_payload[27 : 24];
  assign tensor_core_bf12_15_data_in_8 = io_dataIn_15_payload[31 : 28];
  assign tensor_core_bf12_15_data_in_9 = io_dataIn_15_payload[35 : 32];
  assign tensor_core_bf12_15_data_in_10 = io_dataIn_15_payload[39 : 36];
  assign tensor_core_bf12_15_data_in_11 = io_dataIn_15_payload[43 : 40];
  assign tensor_core_bf12_15_data_in_12 = io_dataIn_15_payload[47 : 44];
  assign tensor_core_bf12_15_data_in_13 = io_dataIn_15_payload[51 : 48];
  assign tensor_core_bf12_15_data_in_14 = io_dataIn_15_payload[55 : 52];
  assign tensor_core_bf12_15_data_in_15 = io_dataIn_15_payload[59 : 56];
  assign tensor_core_bf12_15_data_in_16 = io_dataIn_15_payload[63 : 60];
  assign tensor_core_bf12_15_data_in_17 = io_dataIn_15_payload[67 : 64];
  assign tensor_core_bf12_15_data_in_18 = io_dataIn_15_payload[71 : 68];
  assign tensor_core_bf12_15_data_in_19 = io_dataIn_15_payload[75 : 72];
  assign tensor_core_bf12_15_data_in_20 = io_dataIn_15_payload[79 : 76];
  assign tensor_core_bf12_15_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_15_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_16_data_in_1 = io_dataIn_16_payload[3 : 0];
  assign tensor_core_bf12_16_data_in_2 = io_dataIn_16_payload[7 : 4];
  assign tensor_core_bf12_16_data_in_3 = io_dataIn_16_payload[11 : 8];
  assign tensor_core_bf12_16_data_in_4 = io_dataIn_16_payload[15 : 12];
  assign tensor_core_bf12_16_data_in_5 = io_dataIn_16_payload[19 : 16];
  assign tensor_core_bf12_16_data_in_6 = io_dataIn_16_payload[23 : 20];
  assign tensor_core_bf12_16_data_in_7 = io_dataIn_16_payload[27 : 24];
  assign tensor_core_bf12_16_data_in_8 = io_dataIn_16_payload[31 : 28];
  assign tensor_core_bf12_16_data_in_9 = io_dataIn_16_payload[35 : 32];
  assign tensor_core_bf12_16_data_in_10 = io_dataIn_16_payload[39 : 36];
  assign tensor_core_bf12_16_data_in_11 = io_dataIn_16_payload[43 : 40];
  assign tensor_core_bf12_16_data_in_12 = io_dataIn_16_payload[47 : 44];
  assign tensor_core_bf12_16_data_in_13 = io_dataIn_16_payload[51 : 48];
  assign tensor_core_bf12_16_data_in_14 = io_dataIn_16_payload[55 : 52];
  assign tensor_core_bf12_16_data_in_15 = io_dataIn_16_payload[59 : 56];
  assign tensor_core_bf12_16_data_in_16 = io_dataIn_16_payload[63 : 60];
  assign tensor_core_bf12_16_data_in_17 = io_dataIn_16_payload[67 : 64];
  assign tensor_core_bf12_16_data_in_18 = io_dataIn_16_payload[71 : 68];
  assign tensor_core_bf12_16_data_in_19 = io_dataIn_16_payload[75 : 72];
  assign tensor_core_bf12_16_data_in_20 = io_dataIn_16_payload[79 : 76];
  assign tensor_core_bf12_16_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_16_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_17_data_in_1 = io_dataIn_17_payload[3 : 0];
  assign tensor_core_bf12_17_data_in_2 = io_dataIn_17_payload[7 : 4];
  assign tensor_core_bf12_17_data_in_3 = io_dataIn_17_payload[11 : 8];
  assign tensor_core_bf12_17_data_in_4 = io_dataIn_17_payload[15 : 12];
  assign tensor_core_bf12_17_data_in_5 = io_dataIn_17_payload[19 : 16];
  assign tensor_core_bf12_17_data_in_6 = io_dataIn_17_payload[23 : 20];
  assign tensor_core_bf12_17_data_in_7 = io_dataIn_17_payload[27 : 24];
  assign tensor_core_bf12_17_data_in_8 = io_dataIn_17_payload[31 : 28];
  assign tensor_core_bf12_17_data_in_9 = io_dataIn_17_payload[35 : 32];
  assign tensor_core_bf12_17_data_in_10 = io_dataIn_17_payload[39 : 36];
  assign tensor_core_bf12_17_data_in_11 = io_dataIn_17_payload[43 : 40];
  assign tensor_core_bf12_17_data_in_12 = io_dataIn_17_payload[47 : 44];
  assign tensor_core_bf12_17_data_in_13 = io_dataIn_17_payload[51 : 48];
  assign tensor_core_bf12_17_data_in_14 = io_dataIn_17_payload[55 : 52];
  assign tensor_core_bf12_17_data_in_15 = io_dataIn_17_payload[59 : 56];
  assign tensor_core_bf12_17_data_in_16 = io_dataIn_17_payload[63 : 60];
  assign tensor_core_bf12_17_data_in_17 = io_dataIn_17_payload[67 : 64];
  assign tensor_core_bf12_17_data_in_18 = io_dataIn_17_payload[71 : 68];
  assign tensor_core_bf12_17_data_in_19 = io_dataIn_17_payload[75 : 72];
  assign tensor_core_bf12_17_data_in_20 = io_dataIn_17_payload[79 : 76];
  assign tensor_core_bf12_17_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_17_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_18_data_in_1 = io_dataIn_18_payload[3 : 0];
  assign tensor_core_bf12_18_data_in_2 = io_dataIn_18_payload[7 : 4];
  assign tensor_core_bf12_18_data_in_3 = io_dataIn_18_payload[11 : 8];
  assign tensor_core_bf12_18_data_in_4 = io_dataIn_18_payload[15 : 12];
  assign tensor_core_bf12_18_data_in_5 = io_dataIn_18_payload[19 : 16];
  assign tensor_core_bf12_18_data_in_6 = io_dataIn_18_payload[23 : 20];
  assign tensor_core_bf12_18_data_in_7 = io_dataIn_18_payload[27 : 24];
  assign tensor_core_bf12_18_data_in_8 = io_dataIn_18_payload[31 : 28];
  assign tensor_core_bf12_18_data_in_9 = io_dataIn_18_payload[35 : 32];
  assign tensor_core_bf12_18_data_in_10 = io_dataIn_18_payload[39 : 36];
  assign tensor_core_bf12_18_data_in_11 = io_dataIn_18_payload[43 : 40];
  assign tensor_core_bf12_18_data_in_12 = io_dataIn_18_payload[47 : 44];
  assign tensor_core_bf12_18_data_in_13 = io_dataIn_18_payload[51 : 48];
  assign tensor_core_bf12_18_data_in_14 = io_dataIn_18_payload[55 : 52];
  assign tensor_core_bf12_18_data_in_15 = io_dataIn_18_payload[59 : 56];
  assign tensor_core_bf12_18_data_in_16 = io_dataIn_18_payload[63 : 60];
  assign tensor_core_bf12_18_data_in_17 = io_dataIn_18_payload[67 : 64];
  assign tensor_core_bf12_18_data_in_18 = io_dataIn_18_payload[71 : 68];
  assign tensor_core_bf12_18_data_in_19 = io_dataIn_18_payload[75 : 72];
  assign tensor_core_bf12_18_data_in_20 = io_dataIn_18_payload[79 : 76];
  assign tensor_core_bf12_18_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_18_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_19_data_in_1 = io_dataIn_19_payload[3 : 0];
  assign tensor_core_bf12_19_data_in_2 = io_dataIn_19_payload[7 : 4];
  assign tensor_core_bf12_19_data_in_3 = io_dataIn_19_payload[11 : 8];
  assign tensor_core_bf12_19_data_in_4 = io_dataIn_19_payload[15 : 12];
  assign tensor_core_bf12_19_data_in_5 = io_dataIn_19_payload[19 : 16];
  assign tensor_core_bf12_19_data_in_6 = io_dataIn_19_payload[23 : 20];
  assign tensor_core_bf12_19_data_in_7 = io_dataIn_19_payload[27 : 24];
  assign tensor_core_bf12_19_data_in_8 = io_dataIn_19_payload[31 : 28];
  assign tensor_core_bf12_19_data_in_9 = io_dataIn_19_payload[35 : 32];
  assign tensor_core_bf12_19_data_in_10 = io_dataIn_19_payload[39 : 36];
  assign tensor_core_bf12_19_data_in_11 = io_dataIn_19_payload[43 : 40];
  assign tensor_core_bf12_19_data_in_12 = io_dataIn_19_payload[47 : 44];
  assign tensor_core_bf12_19_data_in_13 = io_dataIn_19_payload[51 : 48];
  assign tensor_core_bf12_19_data_in_14 = io_dataIn_19_payload[55 : 52];
  assign tensor_core_bf12_19_data_in_15 = io_dataIn_19_payload[59 : 56];
  assign tensor_core_bf12_19_data_in_16 = io_dataIn_19_payload[63 : 60];
  assign tensor_core_bf12_19_data_in_17 = io_dataIn_19_payload[67 : 64];
  assign tensor_core_bf12_19_data_in_18 = io_dataIn_19_payload[71 : 68];
  assign tensor_core_bf12_19_data_in_19 = io_dataIn_19_payload[75 : 72];
  assign tensor_core_bf12_19_data_in_20 = io_dataIn_19_payload[79 : 76];
  assign tensor_core_bf12_19_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_19_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_20_data_in_1 = io_dataIn_20_payload[3 : 0];
  assign tensor_core_bf12_20_data_in_2 = io_dataIn_20_payload[7 : 4];
  assign tensor_core_bf12_20_data_in_3 = io_dataIn_20_payload[11 : 8];
  assign tensor_core_bf12_20_data_in_4 = io_dataIn_20_payload[15 : 12];
  assign tensor_core_bf12_20_data_in_5 = io_dataIn_20_payload[19 : 16];
  assign tensor_core_bf12_20_data_in_6 = io_dataIn_20_payload[23 : 20];
  assign tensor_core_bf12_20_data_in_7 = io_dataIn_20_payload[27 : 24];
  assign tensor_core_bf12_20_data_in_8 = io_dataIn_20_payload[31 : 28];
  assign tensor_core_bf12_20_data_in_9 = io_dataIn_20_payload[35 : 32];
  assign tensor_core_bf12_20_data_in_10 = io_dataIn_20_payload[39 : 36];
  assign tensor_core_bf12_20_data_in_11 = io_dataIn_20_payload[43 : 40];
  assign tensor_core_bf12_20_data_in_12 = io_dataIn_20_payload[47 : 44];
  assign tensor_core_bf12_20_data_in_13 = io_dataIn_20_payload[51 : 48];
  assign tensor_core_bf12_20_data_in_14 = io_dataIn_20_payload[55 : 52];
  assign tensor_core_bf12_20_data_in_15 = io_dataIn_20_payload[59 : 56];
  assign tensor_core_bf12_20_data_in_16 = io_dataIn_20_payload[63 : 60];
  assign tensor_core_bf12_20_data_in_17 = io_dataIn_20_payload[67 : 64];
  assign tensor_core_bf12_20_data_in_18 = io_dataIn_20_payload[71 : 68];
  assign tensor_core_bf12_20_data_in_19 = io_dataIn_20_payload[75 : 72];
  assign tensor_core_bf12_20_data_in_20 = io_dataIn_20_payload[79 : 76];
  assign tensor_core_bf12_20_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_20_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_21_data_in_1 = io_dataIn_21_payload[3 : 0];
  assign tensor_core_bf12_21_data_in_2 = io_dataIn_21_payload[7 : 4];
  assign tensor_core_bf12_21_data_in_3 = io_dataIn_21_payload[11 : 8];
  assign tensor_core_bf12_21_data_in_4 = io_dataIn_21_payload[15 : 12];
  assign tensor_core_bf12_21_data_in_5 = io_dataIn_21_payload[19 : 16];
  assign tensor_core_bf12_21_data_in_6 = io_dataIn_21_payload[23 : 20];
  assign tensor_core_bf12_21_data_in_7 = io_dataIn_21_payload[27 : 24];
  assign tensor_core_bf12_21_data_in_8 = io_dataIn_21_payload[31 : 28];
  assign tensor_core_bf12_21_data_in_9 = io_dataIn_21_payload[35 : 32];
  assign tensor_core_bf12_21_data_in_10 = io_dataIn_21_payload[39 : 36];
  assign tensor_core_bf12_21_data_in_11 = io_dataIn_21_payload[43 : 40];
  assign tensor_core_bf12_21_data_in_12 = io_dataIn_21_payload[47 : 44];
  assign tensor_core_bf12_21_data_in_13 = io_dataIn_21_payload[51 : 48];
  assign tensor_core_bf12_21_data_in_14 = io_dataIn_21_payload[55 : 52];
  assign tensor_core_bf12_21_data_in_15 = io_dataIn_21_payload[59 : 56];
  assign tensor_core_bf12_21_data_in_16 = io_dataIn_21_payload[63 : 60];
  assign tensor_core_bf12_21_data_in_17 = io_dataIn_21_payload[67 : 64];
  assign tensor_core_bf12_21_data_in_18 = io_dataIn_21_payload[71 : 68];
  assign tensor_core_bf12_21_data_in_19 = io_dataIn_21_payload[75 : 72];
  assign tensor_core_bf12_21_data_in_20 = io_dataIn_21_payload[79 : 76];
  assign tensor_core_bf12_21_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_21_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_22_data_in_1 = io_dataIn_22_payload[3 : 0];
  assign tensor_core_bf12_22_data_in_2 = io_dataIn_22_payload[7 : 4];
  assign tensor_core_bf12_22_data_in_3 = io_dataIn_22_payload[11 : 8];
  assign tensor_core_bf12_22_data_in_4 = io_dataIn_22_payload[15 : 12];
  assign tensor_core_bf12_22_data_in_5 = io_dataIn_22_payload[19 : 16];
  assign tensor_core_bf12_22_data_in_6 = io_dataIn_22_payload[23 : 20];
  assign tensor_core_bf12_22_data_in_7 = io_dataIn_22_payload[27 : 24];
  assign tensor_core_bf12_22_data_in_8 = io_dataIn_22_payload[31 : 28];
  assign tensor_core_bf12_22_data_in_9 = io_dataIn_22_payload[35 : 32];
  assign tensor_core_bf12_22_data_in_10 = io_dataIn_22_payload[39 : 36];
  assign tensor_core_bf12_22_data_in_11 = io_dataIn_22_payload[43 : 40];
  assign tensor_core_bf12_22_data_in_12 = io_dataIn_22_payload[47 : 44];
  assign tensor_core_bf12_22_data_in_13 = io_dataIn_22_payload[51 : 48];
  assign tensor_core_bf12_22_data_in_14 = io_dataIn_22_payload[55 : 52];
  assign tensor_core_bf12_22_data_in_15 = io_dataIn_22_payload[59 : 56];
  assign tensor_core_bf12_22_data_in_16 = io_dataIn_22_payload[63 : 60];
  assign tensor_core_bf12_22_data_in_17 = io_dataIn_22_payload[67 : 64];
  assign tensor_core_bf12_22_data_in_18 = io_dataIn_22_payload[71 : 68];
  assign tensor_core_bf12_22_data_in_19 = io_dataIn_22_payload[75 : 72];
  assign tensor_core_bf12_22_data_in_20 = io_dataIn_22_payload[79 : 76];
  assign tensor_core_bf12_22_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_22_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_23_data_in_1 = io_dataIn_23_payload[3 : 0];
  assign tensor_core_bf12_23_data_in_2 = io_dataIn_23_payload[7 : 4];
  assign tensor_core_bf12_23_data_in_3 = io_dataIn_23_payload[11 : 8];
  assign tensor_core_bf12_23_data_in_4 = io_dataIn_23_payload[15 : 12];
  assign tensor_core_bf12_23_data_in_5 = io_dataIn_23_payload[19 : 16];
  assign tensor_core_bf12_23_data_in_6 = io_dataIn_23_payload[23 : 20];
  assign tensor_core_bf12_23_data_in_7 = io_dataIn_23_payload[27 : 24];
  assign tensor_core_bf12_23_data_in_8 = io_dataIn_23_payload[31 : 28];
  assign tensor_core_bf12_23_data_in_9 = io_dataIn_23_payload[35 : 32];
  assign tensor_core_bf12_23_data_in_10 = io_dataIn_23_payload[39 : 36];
  assign tensor_core_bf12_23_data_in_11 = io_dataIn_23_payload[43 : 40];
  assign tensor_core_bf12_23_data_in_12 = io_dataIn_23_payload[47 : 44];
  assign tensor_core_bf12_23_data_in_13 = io_dataIn_23_payload[51 : 48];
  assign tensor_core_bf12_23_data_in_14 = io_dataIn_23_payload[55 : 52];
  assign tensor_core_bf12_23_data_in_15 = io_dataIn_23_payload[59 : 56];
  assign tensor_core_bf12_23_data_in_16 = io_dataIn_23_payload[63 : 60];
  assign tensor_core_bf12_23_data_in_17 = io_dataIn_23_payload[67 : 64];
  assign tensor_core_bf12_23_data_in_18 = io_dataIn_23_payload[71 : 68];
  assign tensor_core_bf12_23_data_in_19 = io_dataIn_23_payload[75 : 72];
  assign tensor_core_bf12_23_data_in_20 = io_dataIn_23_payload[79 : 76];
  assign tensor_core_bf12_23_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_23_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_24_data_in_1 = io_dataIn_24_payload[3 : 0];
  assign tensor_core_bf12_24_data_in_2 = io_dataIn_24_payload[7 : 4];
  assign tensor_core_bf12_24_data_in_3 = io_dataIn_24_payload[11 : 8];
  assign tensor_core_bf12_24_data_in_4 = io_dataIn_24_payload[15 : 12];
  assign tensor_core_bf12_24_data_in_5 = io_dataIn_24_payload[19 : 16];
  assign tensor_core_bf12_24_data_in_6 = io_dataIn_24_payload[23 : 20];
  assign tensor_core_bf12_24_data_in_7 = io_dataIn_24_payload[27 : 24];
  assign tensor_core_bf12_24_data_in_8 = io_dataIn_24_payload[31 : 28];
  assign tensor_core_bf12_24_data_in_9 = io_dataIn_24_payload[35 : 32];
  assign tensor_core_bf12_24_data_in_10 = io_dataIn_24_payload[39 : 36];
  assign tensor_core_bf12_24_data_in_11 = io_dataIn_24_payload[43 : 40];
  assign tensor_core_bf12_24_data_in_12 = io_dataIn_24_payload[47 : 44];
  assign tensor_core_bf12_24_data_in_13 = io_dataIn_24_payload[51 : 48];
  assign tensor_core_bf12_24_data_in_14 = io_dataIn_24_payload[55 : 52];
  assign tensor_core_bf12_24_data_in_15 = io_dataIn_24_payload[59 : 56];
  assign tensor_core_bf12_24_data_in_16 = io_dataIn_24_payload[63 : 60];
  assign tensor_core_bf12_24_data_in_17 = io_dataIn_24_payload[67 : 64];
  assign tensor_core_bf12_24_data_in_18 = io_dataIn_24_payload[71 : 68];
  assign tensor_core_bf12_24_data_in_19 = io_dataIn_24_payload[75 : 72];
  assign tensor_core_bf12_24_data_in_20 = io_dataIn_24_payload[79 : 76];
  assign tensor_core_bf12_24_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_24_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_25_data_in_1 = io_dataIn_25_payload[3 : 0];
  assign tensor_core_bf12_25_data_in_2 = io_dataIn_25_payload[7 : 4];
  assign tensor_core_bf12_25_data_in_3 = io_dataIn_25_payload[11 : 8];
  assign tensor_core_bf12_25_data_in_4 = io_dataIn_25_payload[15 : 12];
  assign tensor_core_bf12_25_data_in_5 = io_dataIn_25_payload[19 : 16];
  assign tensor_core_bf12_25_data_in_6 = io_dataIn_25_payload[23 : 20];
  assign tensor_core_bf12_25_data_in_7 = io_dataIn_25_payload[27 : 24];
  assign tensor_core_bf12_25_data_in_8 = io_dataIn_25_payload[31 : 28];
  assign tensor_core_bf12_25_data_in_9 = io_dataIn_25_payload[35 : 32];
  assign tensor_core_bf12_25_data_in_10 = io_dataIn_25_payload[39 : 36];
  assign tensor_core_bf12_25_data_in_11 = io_dataIn_25_payload[43 : 40];
  assign tensor_core_bf12_25_data_in_12 = io_dataIn_25_payload[47 : 44];
  assign tensor_core_bf12_25_data_in_13 = io_dataIn_25_payload[51 : 48];
  assign tensor_core_bf12_25_data_in_14 = io_dataIn_25_payload[55 : 52];
  assign tensor_core_bf12_25_data_in_15 = io_dataIn_25_payload[59 : 56];
  assign tensor_core_bf12_25_data_in_16 = io_dataIn_25_payload[63 : 60];
  assign tensor_core_bf12_25_data_in_17 = io_dataIn_25_payload[67 : 64];
  assign tensor_core_bf12_25_data_in_18 = io_dataIn_25_payload[71 : 68];
  assign tensor_core_bf12_25_data_in_19 = io_dataIn_25_payload[75 : 72];
  assign tensor_core_bf12_25_data_in_20 = io_dataIn_25_payload[79 : 76];
  assign tensor_core_bf12_25_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_25_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_26_data_in_1 = io_dataIn_26_payload[3 : 0];
  assign tensor_core_bf12_26_data_in_2 = io_dataIn_26_payload[7 : 4];
  assign tensor_core_bf12_26_data_in_3 = io_dataIn_26_payload[11 : 8];
  assign tensor_core_bf12_26_data_in_4 = io_dataIn_26_payload[15 : 12];
  assign tensor_core_bf12_26_data_in_5 = io_dataIn_26_payload[19 : 16];
  assign tensor_core_bf12_26_data_in_6 = io_dataIn_26_payload[23 : 20];
  assign tensor_core_bf12_26_data_in_7 = io_dataIn_26_payload[27 : 24];
  assign tensor_core_bf12_26_data_in_8 = io_dataIn_26_payload[31 : 28];
  assign tensor_core_bf12_26_data_in_9 = io_dataIn_26_payload[35 : 32];
  assign tensor_core_bf12_26_data_in_10 = io_dataIn_26_payload[39 : 36];
  assign tensor_core_bf12_26_data_in_11 = io_dataIn_26_payload[43 : 40];
  assign tensor_core_bf12_26_data_in_12 = io_dataIn_26_payload[47 : 44];
  assign tensor_core_bf12_26_data_in_13 = io_dataIn_26_payload[51 : 48];
  assign tensor_core_bf12_26_data_in_14 = io_dataIn_26_payload[55 : 52];
  assign tensor_core_bf12_26_data_in_15 = io_dataIn_26_payload[59 : 56];
  assign tensor_core_bf12_26_data_in_16 = io_dataIn_26_payload[63 : 60];
  assign tensor_core_bf12_26_data_in_17 = io_dataIn_26_payload[67 : 64];
  assign tensor_core_bf12_26_data_in_18 = io_dataIn_26_payload[71 : 68];
  assign tensor_core_bf12_26_data_in_19 = io_dataIn_26_payload[75 : 72];
  assign tensor_core_bf12_26_data_in_20 = io_dataIn_26_payload[79 : 76];
  assign tensor_core_bf12_26_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_26_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_27_data_in_1 = io_dataIn_27_payload[3 : 0];
  assign tensor_core_bf12_27_data_in_2 = io_dataIn_27_payload[7 : 4];
  assign tensor_core_bf12_27_data_in_3 = io_dataIn_27_payload[11 : 8];
  assign tensor_core_bf12_27_data_in_4 = io_dataIn_27_payload[15 : 12];
  assign tensor_core_bf12_27_data_in_5 = io_dataIn_27_payload[19 : 16];
  assign tensor_core_bf12_27_data_in_6 = io_dataIn_27_payload[23 : 20];
  assign tensor_core_bf12_27_data_in_7 = io_dataIn_27_payload[27 : 24];
  assign tensor_core_bf12_27_data_in_8 = io_dataIn_27_payload[31 : 28];
  assign tensor_core_bf12_27_data_in_9 = io_dataIn_27_payload[35 : 32];
  assign tensor_core_bf12_27_data_in_10 = io_dataIn_27_payload[39 : 36];
  assign tensor_core_bf12_27_data_in_11 = io_dataIn_27_payload[43 : 40];
  assign tensor_core_bf12_27_data_in_12 = io_dataIn_27_payload[47 : 44];
  assign tensor_core_bf12_27_data_in_13 = io_dataIn_27_payload[51 : 48];
  assign tensor_core_bf12_27_data_in_14 = io_dataIn_27_payload[55 : 52];
  assign tensor_core_bf12_27_data_in_15 = io_dataIn_27_payload[59 : 56];
  assign tensor_core_bf12_27_data_in_16 = io_dataIn_27_payload[63 : 60];
  assign tensor_core_bf12_27_data_in_17 = io_dataIn_27_payload[67 : 64];
  assign tensor_core_bf12_27_data_in_18 = io_dataIn_27_payload[71 : 68];
  assign tensor_core_bf12_27_data_in_19 = io_dataIn_27_payload[75 : 72];
  assign tensor_core_bf12_27_data_in_20 = io_dataIn_27_payload[79 : 76];
  assign tensor_core_bf12_27_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_27_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_28_data_in_1 = io_dataIn_28_payload[3 : 0];
  assign tensor_core_bf12_28_data_in_2 = io_dataIn_28_payload[7 : 4];
  assign tensor_core_bf12_28_data_in_3 = io_dataIn_28_payload[11 : 8];
  assign tensor_core_bf12_28_data_in_4 = io_dataIn_28_payload[15 : 12];
  assign tensor_core_bf12_28_data_in_5 = io_dataIn_28_payload[19 : 16];
  assign tensor_core_bf12_28_data_in_6 = io_dataIn_28_payload[23 : 20];
  assign tensor_core_bf12_28_data_in_7 = io_dataIn_28_payload[27 : 24];
  assign tensor_core_bf12_28_data_in_8 = io_dataIn_28_payload[31 : 28];
  assign tensor_core_bf12_28_data_in_9 = io_dataIn_28_payload[35 : 32];
  assign tensor_core_bf12_28_data_in_10 = io_dataIn_28_payload[39 : 36];
  assign tensor_core_bf12_28_data_in_11 = io_dataIn_28_payload[43 : 40];
  assign tensor_core_bf12_28_data_in_12 = io_dataIn_28_payload[47 : 44];
  assign tensor_core_bf12_28_data_in_13 = io_dataIn_28_payload[51 : 48];
  assign tensor_core_bf12_28_data_in_14 = io_dataIn_28_payload[55 : 52];
  assign tensor_core_bf12_28_data_in_15 = io_dataIn_28_payload[59 : 56];
  assign tensor_core_bf12_28_data_in_16 = io_dataIn_28_payload[63 : 60];
  assign tensor_core_bf12_28_data_in_17 = io_dataIn_28_payload[67 : 64];
  assign tensor_core_bf12_28_data_in_18 = io_dataIn_28_payload[71 : 68];
  assign tensor_core_bf12_28_data_in_19 = io_dataIn_28_payload[75 : 72];
  assign tensor_core_bf12_28_data_in_20 = io_dataIn_28_payload[79 : 76];
  assign tensor_core_bf12_28_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_28_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_29_data_in_1 = io_dataIn_29_payload[3 : 0];
  assign tensor_core_bf12_29_data_in_2 = io_dataIn_29_payload[7 : 4];
  assign tensor_core_bf12_29_data_in_3 = io_dataIn_29_payload[11 : 8];
  assign tensor_core_bf12_29_data_in_4 = io_dataIn_29_payload[15 : 12];
  assign tensor_core_bf12_29_data_in_5 = io_dataIn_29_payload[19 : 16];
  assign tensor_core_bf12_29_data_in_6 = io_dataIn_29_payload[23 : 20];
  assign tensor_core_bf12_29_data_in_7 = io_dataIn_29_payload[27 : 24];
  assign tensor_core_bf12_29_data_in_8 = io_dataIn_29_payload[31 : 28];
  assign tensor_core_bf12_29_data_in_9 = io_dataIn_29_payload[35 : 32];
  assign tensor_core_bf12_29_data_in_10 = io_dataIn_29_payload[39 : 36];
  assign tensor_core_bf12_29_data_in_11 = io_dataIn_29_payload[43 : 40];
  assign tensor_core_bf12_29_data_in_12 = io_dataIn_29_payload[47 : 44];
  assign tensor_core_bf12_29_data_in_13 = io_dataIn_29_payload[51 : 48];
  assign tensor_core_bf12_29_data_in_14 = io_dataIn_29_payload[55 : 52];
  assign tensor_core_bf12_29_data_in_15 = io_dataIn_29_payload[59 : 56];
  assign tensor_core_bf12_29_data_in_16 = io_dataIn_29_payload[63 : 60];
  assign tensor_core_bf12_29_data_in_17 = io_dataIn_29_payload[67 : 64];
  assign tensor_core_bf12_29_data_in_18 = io_dataIn_29_payload[71 : 68];
  assign tensor_core_bf12_29_data_in_19 = io_dataIn_29_payload[75 : 72];
  assign tensor_core_bf12_29_data_in_20 = io_dataIn_29_payload[79 : 76];
  assign tensor_core_bf12_29_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_29_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_30_data_in_1 = io_dataIn_30_payload[3 : 0];
  assign tensor_core_bf12_30_data_in_2 = io_dataIn_30_payload[7 : 4];
  assign tensor_core_bf12_30_data_in_3 = io_dataIn_30_payload[11 : 8];
  assign tensor_core_bf12_30_data_in_4 = io_dataIn_30_payload[15 : 12];
  assign tensor_core_bf12_30_data_in_5 = io_dataIn_30_payload[19 : 16];
  assign tensor_core_bf12_30_data_in_6 = io_dataIn_30_payload[23 : 20];
  assign tensor_core_bf12_30_data_in_7 = io_dataIn_30_payload[27 : 24];
  assign tensor_core_bf12_30_data_in_8 = io_dataIn_30_payload[31 : 28];
  assign tensor_core_bf12_30_data_in_9 = io_dataIn_30_payload[35 : 32];
  assign tensor_core_bf12_30_data_in_10 = io_dataIn_30_payload[39 : 36];
  assign tensor_core_bf12_30_data_in_11 = io_dataIn_30_payload[43 : 40];
  assign tensor_core_bf12_30_data_in_12 = io_dataIn_30_payload[47 : 44];
  assign tensor_core_bf12_30_data_in_13 = io_dataIn_30_payload[51 : 48];
  assign tensor_core_bf12_30_data_in_14 = io_dataIn_30_payload[55 : 52];
  assign tensor_core_bf12_30_data_in_15 = io_dataIn_30_payload[59 : 56];
  assign tensor_core_bf12_30_data_in_16 = io_dataIn_30_payload[63 : 60];
  assign tensor_core_bf12_30_data_in_17 = io_dataIn_30_payload[67 : 64];
  assign tensor_core_bf12_30_data_in_18 = io_dataIn_30_payload[71 : 68];
  assign tensor_core_bf12_30_data_in_19 = io_dataIn_30_payload[75 : 72];
  assign tensor_core_bf12_30_data_in_20 = io_dataIn_30_payload[79 : 76];
  assign tensor_core_bf12_30_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_30_load_bb_two = loadBufCtrl[1];
  assign tensor_core_bf12_31_data_in_1 = io_dataIn_31_payload[3 : 0];
  assign tensor_core_bf12_31_data_in_2 = io_dataIn_31_payload[7 : 4];
  assign tensor_core_bf12_31_data_in_3 = io_dataIn_31_payload[11 : 8];
  assign tensor_core_bf12_31_data_in_4 = io_dataIn_31_payload[15 : 12];
  assign tensor_core_bf12_31_data_in_5 = io_dataIn_31_payload[19 : 16];
  assign tensor_core_bf12_31_data_in_6 = io_dataIn_31_payload[23 : 20];
  assign tensor_core_bf12_31_data_in_7 = io_dataIn_31_payload[27 : 24];
  assign tensor_core_bf12_31_data_in_8 = io_dataIn_31_payload[31 : 28];
  assign tensor_core_bf12_31_data_in_9 = io_dataIn_31_payload[35 : 32];
  assign tensor_core_bf12_31_data_in_10 = io_dataIn_31_payload[39 : 36];
  assign tensor_core_bf12_31_data_in_11 = io_dataIn_31_payload[43 : 40];
  assign tensor_core_bf12_31_data_in_12 = io_dataIn_31_payload[47 : 44];
  assign tensor_core_bf12_31_data_in_13 = io_dataIn_31_payload[51 : 48];
  assign tensor_core_bf12_31_data_in_14 = io_dataIn_31_payload[55 : 52];
  assign tensor_core_bf12_31_data_in_15 = io_dataIn_31_payload[59 : 56];
  assign tensor_core_bf12_31_data_in_16 = io_dataIn_31_payload[63 : 60];
  assign tensor_core_bf12_31_data_in_17 = io_dataIn_31_payload[67 : 64];
  assign tensor_core_bf12_31_data_in_18 = io_dataIn_31_payload[71 : 68];
  assign tensor_core_bf12_31_data_in_19 = io_dataIn_31_payload[75 : 72];
  assign tensor_core_bf12_31_data_in_20 = io_dataIn_31_payload[79 : 76];
  assign tensor_core_bf12_31_load_bb_one = loadBufCtrl[0];
  assign tensor_core_bf12_31_load_bb_two = loadBufCtrl[1];
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
      resValidCounter_valueNext = 16'h0;
    end else begin
      resValidCounter_valueNext = (resValidCounter_value + _zz_resValidCounter_valueNext);
    end
    if(resValidCounter_willClear) begin
      resValidCounter_valueNext = 16'h0;
    end
  end

  assign resValidCounter_overflowVal = (io_matAColSubGrpLen - 16'h0001);
  always @(*) begin
    if(resValidCounter_willOverflowIfInc) begin
      io_res_valid = AccuDelayInst_io_pop_valid;
    end else begin
      io_res_valid = 1'b0;
    end
  end

  always @(*) begin
    if(resValidCounter_willOverflowIfInc) begin
      AccuDelayInst_io_pop_ready = io_res_ready;
    end else begin
      AccuDelayInst_io_pop_ready = oBufferLoadValid_delay_89;
    end
  end

  always @(*) begin
    if(resValidCounter_willOverflowIfInc) begin
      io_res_payload_0 = AccuDelayInst_io_pop_payload_0;
    end else begin
      io_res_payload_0 = 24'h0;
    end
  end

  always @(*) begin
    if(resValidCounter_willOverflowIfInc) begin
      io_res_payload_1 = AccuDelayInst_io_pop_payload_1;
    end else begin
      io_res_payload_1 = 24'h0;
    end
  end

  always @(*) begin
    if(resValidCounter_willOverflowIfInc) begin
      io_res_payload_2 = AccuDelayInst_io_pop_payload_2;
    end else begin
      io_res_payload_2 = 24'h0;
    end
  end

  always @(posedge clk) begin
    if(!clrn) begin
      io_loadValid_delay_1 <= 1'b0;
      io_loadValid_delay_2 <= 1'b0;
      loadValidD3t <= 1'b0;
      io_loadValid_delay_1_1 <= 1'b0;
      loadValidD2t <= 1'b0;
      loadCounter_value <= 7'h0;
      loadSelCounter_value <= 7'h0;
      loadBufCtrlReg <= 2'b01;
      inputCounter_value <= 16'h0;
      loadBufSel <= 1'b0;
      io_dataValid_delay_1 <= 1'b0;
      io_dataValid_delay_2 <= 1'b0;
      io_dataValid_delay_3 <= 1'b0;
      io_dataValid_delay_4 <= 1'b0;
      io_dataValid_delay_5 <= 1'b0;
      io_dataValid_delay_6 <= 1'b0;
      io_dataValid_delay_7 <= 1'b0;
      io_dataValid_delay_8 <= 1'b0;
      io_dataValid_delay_9 <= 1'b0;
      io_dataValid_delay_10 <= 1'b0;
      io_dataValid_delay_11 <= 1'b0;
      io_dataValid_delay_12 <= 1'b0;
      io_dataValid_delay_13 <= 1'b0;
      io_dataValid_delay_14 <= 1'b0;
      io_dataValid_delay_15 <= 1'b0;
      io_dataValid_delay_16 <= 1'b0;
      io_dataValid_delay_17 <= 1'b0;
      io_dataValid_delay_18 <= 1'b0;
      io_dataValid_delay_19 <= 1'b0;
      io_dataValid_delay_20 <= 1'b0;
      io_dataValid_delay_21 <= 1'b0;
      io_dataValid_delay_22 <= 1'b0;
      io_dataValid_delay_23 <= 1'b0;
      io_dataValid_delay_24 <= 1'b0;
      io_dataValid_delay_25 <= 1'b0;
      io_dataValid_delay_26 <= 1'b0;
      io_dataValid_delay_27 <= 1'b0;
      io_dataValid_delay_28 <= 1'b0;
      io_dataValid_delay_29 <= 1'b0;
      io_dataValid_delay_30 <= 1'b0;
      io_dataValid_delay_31 <= 1'b0;
      io_dataValid_delay_32 <= 1'b0;
      io_dataValid_delay_33 <= 1'b0;
      io_dataValid_delay_34 <= 1'b0;
      io_dataValid_delay_35 <= 1'b0;
      io_dataValid_delay_36 <= 1'b0;
      io_dataValid_delay_37 <= 1'b0;
      io_dataValid_delay_38 <= 1'b0;
      io_dataValid_delay_39 <= 1'b0;
      io_dataValid_delay_40 <= 1'b0;
      io_dataValid_delay_41 <= 1'b0;
      io_dataValid_delay_42 <= 1'b0;
      io_dataValid_delay_43 <= 1'b0;
      io_dataValid_delay_44 <= 1'b0;
      io_dataValid_delay_45 <= 1'b0;
      io_dataValid_delay_46 <= 1'b0;
      io_dataValid_delay_47 <= 1'b0;
      io_dataValid_delay_48 <= 1'b0;
      io_dataValid_delay_49 <= 1'b0;
      io_dataValid_delay_50 <= 1'b0;
      io_dataValid_delay_51 <= 1'b0;
      io_dataValid_delay_52 <= 1'b0;
      io_dataValid_delay_53 <= 1'b0;
      io_dataValid_delay_54 <= 1'b0;
      io_dataValid_delay_55 <= 1'b0;
      io_dataValid_delay_56 <= 1'b0;
      io_dataValid_delay_57 <= 1'b0;
      io_dataValid_delay_58 <= 1'b0;
      io_dataValid_delay_59 <= 1'b0;
      io_dataValid_delay_60 <= 1'b0;
      io_dataValid_delay_61 <= 1'b0;
      io_dataValid_delay_62 <= 1'b0;
      io_dataValid_delay_63 <= 1'b0;
      io_dataValid_delay_64 <= 1'b0;
      io_dataValid_delay_65 <= 1'b0;
      io_dataValid_delay_66 <= 1'b0;
      io_dataValid_delay_67 <= 1'b0;
      oBufferLoadValid <= 1'b0;
      outValidCounter_value <= 16'h0;
      resValidCounter_value <= 16'h0;
      AccuDelayInst_io_pop_payload_0_delay_1 <= 24'h0;
      AccuDelayInst_io_pop_payload_0_delay_2 <= 24'h0;
      AccuDelayInst_io_pop_payload_1_delay_1 <= 24'h0;
      AccuDelayInst_io_pop_payload_1_delay_2 <= 24'h0;
      AccuDelayInst_io_pop_payload_2_delay_1 <= 24'h0;
      AccuDelayInst_io_pop_payload_2_delay_2 <= 24'h0;
    end else begin
      io_loadValid_delay_1 <= io_loadValid;
      io_loadValid_delay_2 <= io_loadValid_delay_1;
      loadValidD3t <= io_loadValid_delay_2;
      io_loadValid_delay_1_1 <= io_loadValid;
      loadValidD2t <= io_loadValid_delay_1_1;
      loadCounter_value <= loadCounter_valueNext;
      loadSelCounter_value <= loadSelCounter_valueNext;
      if(loadSelCounter_willOverflow) begin
        loadBufCtrlReg <= {loadBufCtrlReg[0 : 0],loadBufCtrlReg[1 : 1]};
      end
      inputCounter_value <= inputCounter_valueNext;
      if(inputCounter_willOverflow) begin
        loadBufSel <= (! loadBufSel);
      end
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
      io_dataValid_delay_28 <= io_dataValid_delay_27;
      io_dataValid_delay_29 <= io_dataValid_delay_28;
      io_dataValid_delay_30 <= io_dataValid_delay_29;
      io_dataValid_delay_31 <= io_dataValid_delay_30;
      io_dataValid_delay_32 <= io_dataValid_delay_31;
      io_dataValid_delay_33 <= io_dataValid_delay_32;
      io_dataValid_delay_34 <= io_dataValid_delay_33;
      io_dataValid_delay_35 <= io_dataValid_delay_34;
      io_dataValid_delay_36 <= io_dataValid_delay_35;
      io_dataValid_delay_37 <= io_dataValid_delay_36;
      io_dataValid_delay_38 <= io_dataValid_delay_37;
      io_dataValid_delay_39 <= io_dataValid_delay_38;
      io_dataValid_delay_40 <= io_dataValid_delay_39;
      io_dataValid_delay_41 <= io_dataValid_delay_40;
      io_dataValid_delay_42 <= io_dataValid_delay_41;
      io_dataValid_delay_43 <= io_dataValid_delay_42;
      io_dataValid_delay_44 <= io_dataValid_delay_43;
      io_dataValid_delay_45 <= io_dataValid_delay_44;
      io_dataValid_delay_46 <= io_dataValid_delay_45;
      io_dataValid_delay_47 <= io_dataValid_delay_46;
      io_dataValid_delay_48 <= io_dataValid_delay_47;
      io_dataValid_delay_49 <= io_dataValid_delay_48;
      io_dataValid_delay_50 <= io_dataValid_delay_49;
      io_dataValid_delay_51 <= io_dataValid_delay_50;
      io_dataValid_delay_52 <= io_dataValid_delay_51;
      io_dataValid_delay_53 <= io_dataValid_delay_52;
      io_dataValid_delay_54 <= io_dataValid_delay_53;
      io_dataValid_delay_55 <= io_dataValid_delay_54;
      io_dataValid_delay_56 <= io_dataValid_delay_55;
      io_dataValid_delay_57 <= io_dataValid_delay_56;
      io_dataValid_delay_58 <= io_dataValid_delay_57;
      io_dataValid_delay_59 <= io_dataValid_delay_58;
      io_dataValid_delay_60 <= io_dataValid_delay_59;
      io_dataValid_delay_61 <= io_dataValid_delay_60;
      io_dataValid_delay_62 <= io_dataValid_delay_61;
      io_dataValid_delay_63 <= io_dataValid_delay_62;
      io_dataValid_delay_64 <= io_dataValid_delay_63;
      io_dataValid_delay_65 <= io_dataValid_delay_64;
      io_dataValid_delay_66 <= io_dataValid_delay_65;
      io_dataValid_delay_67 <= io_dataValid_delay_66;
      oBufferLoadValid <= io_dataValid_delay_67;
      outValidCounter_value <= outValidCounter_valueNext;
      resValidCounter_value <= resValidCounter_valueNext;
      AccuDelayInst_io_pop_payload_0_delay_1 <= AccuDelayInst_io_pop_payload_0;
      AccuDelayInst_io_pop_payload_0_delay_2 <= AccuDelayInst_io_pop_payload_0_delay_1;
      AccuDelayInst_io_pop_payload_1_delay_1 <= AccuDelayInst_io_pop_payload_1;
      AccuDelayInst_io_pop_payload_1_delay_2 <= AccuDelayInst_io_pop_payload_1_delay_1;
      AccuDelayInst_io_pop_payload_2_delay_1 <= AccuDelayInst_io_pop_payload_2;
      AccuDelayInst_io_pop_payload_2_delay_2 <= AccuDelayInst_io_pop_payload_2_delay_1;
    end
  end

  always @(posedge clk) begin
    if(!clrn) begin
      oBufferLoadValid_delay_1 <= 1'b0;
      oBufferLoadValid_delay_2 <= 1'b0;
      oBufferLoadValid_delay_3 <= 1'b0;
      oBufferLoadValid_delay_4 <= 1'b0;
      oBufferLoadValid_delay_5 <= 1'b0;
      oBufferLoadValid_delay_6 <= 1'b0;
      oBufferLoadValid_delay_7 <= 1'b0;
      oBufferLoadValid_delay_8 <= 1'b0;
      oBufferLoadValid_delay_9 <= 1'b0;
      oBufferLoadValid_delay_10 <= 1'b0;
      oBufferLoadValid_delay_11 <= 1'b0;
      oBufferLoadValid_delay_12 <= 1'b0;
      oBufferLoadValid_delay_13 <= 1'b0;
      oBufferLoadValid_delay_14 <= 1'b0;
      oBufferLoadValid_delay_15 <= 1'b0;
      oBufferLoadValid_delay_16 <= 1'b0;
      oBufferLoadValid_delay_17 <= 1'b0;
      oBufferLoadValid_delay_18 <= 1'b0;
      oBufferLoadValid_delay_19 <= 1'b0;
      oBufferLoadValid_delay_20 <= 1'b0;
      oBufferLoadValid_delay_21 <= 1'b0;
      oBufferLoadValid_delay_22 <= 1'b0;
      oBufferLoadValid_delay_23 <= 1'b0;
      oBufferLoadValid_delay_24 <= 1'b0;
      oBufferLoadValid_delay_25 <= 1'b0;
      oBufferLoadValid_delay_26 <= 1'b0;
      oBufferLoadValid_delay_27 <= 1'b0;
      oBufferLoadValid_delay_28 <= 1'b0;
      oBufferLoadValid_delay_29 <= 1'b0;
      oBufferLoadValid_delay_30 <= 1'b0;
      oBufferLoadValid_delay_31 <= 1'b0;
      oBufferLoadValid_delay_32 <= 1'b0;
      oBufferLoadValid_delay_33 <= 1'b0;
      oBufferLoadValid_delay_34 <= 1'b0;
      oBufferLoadValid_delay_35 <= 1'b0;
      oBufferLoadValid_delay_36 <= 1'b0;
      oBufferLoadValid_delay_37 <= 1'b0;
      oBufferLoadValid_delay_38 <= 1'b0;
      oBufferLoadValid_delay_39 <= 1'b0;
      oBufferLoadValid_delay_40 <= 1'b0;
      oBufferLoadValid_delay_41 <= 1'b0;
      oBufferLoadValid_delay_42 <= 1'b0;
      oBufferLoadValid_delay_43 <= 1'b0;
      oBufferLoadValid_delay_44 <= 1'b0;
      oBufferLoadValid_delay_45 <= 1'b0;
      oBufferLoadValid_delay_46 <= 1'b0;
      oBufferLoadValid_delay_47 <= 1'b0;
      oBufferLoadValid_delay_48 <= 1'b0;
      oBufferLoadValid_delay_49 <= 1'b0;
      oBufferLoadValid_delay_50 <= 1'b0;
      oBufferLoadValid_delay_51 <= 1'b0;
      oBufferLoadValid_delay_52 <= 1'b0;
      oBufferLoadValid_delay_53 <= 1'b0;
      oBufferLoadValid_delay_54 <= 1'b0;
      oBufferLoadValid_delay_55 <= 1'b0;
      oBufferLoadValid_delay_56 <= 1'b0;
      oBufferLoadValid_delay_57 <= 1'b0;
      oBufferLoadValid_delay_58 <= 1'b0;
      oBufferLoadValid_delay_59 <= 1'b0;
      oBufferLoadValid_delay_60 <= 1'b0;
      oBufferLoadValid_delay_61 <= 1'b0;
      oBufferLoadValid_delay_62 <= 1'b0;
      oBufferLoadValid_delay_63 <= 1'b0;
      oBufferLoadValid_delay_64 <= 1'b0;
      oBufferLoadValid_delay_65 <= 1'b0;
      oBufferLoadValid_delay_66 <= 1'b0;
      oBufferLoadValid_delay_67 <= 1'b0;
      oBufferLoadValid_delay_68 <= 1'b0;
      oBufferLoadValid_delay_69 <= 1'b0;
      oBufferLoadValid_delay_70 <= 1'b0;
      oBufferLoadValid_delay_71 <= 1'b0;
      oBufferLoadValid_delay_72 <= 1'b0;
      oBufferLoadValid_delay_73 <= 1'b0;
      oBufferLoadValid_delay_74 <= 1'b0;
      oBufferLoadValid_delay_75 <= 1'b0;
      oBufferLoadValid_delay_76 <= 1'b0;
      oBufferLoadValid_delay_77 <= 1'b0;
      oBufferLoadValid_delay_78 <= 1'b0;
      oBufferLoadValid_delay_79 <= 1'b0;
      oBufferLoadValid_delay_80 <= 1'b0;
      oBufferLoadValid_delay_81 <= 1'b0;
      oBufferLoadValid_delay_82 <= 1'b0;
      oBufferLoadValid_delay_83 <= 1'b0;
      oBufferLoadValid_delay_84 <= 1'b0;
      oBufferLoadValid_delay_85 <= 1'b0;
      oBufferLoadValid_delay_86 <= 1'b0;
      oBufferLoadValid_delay_87 <= 1'b0;
      oBufferLoadValid_delay_88 <= 1'b0;
      oBufferLoadValid_delay_89 <= 1'b0;
    end else begin
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
      oBufferLoadValid_delay_30 <= oBufferLoadValid_delay_29;
      oBufferLoadValid_delay_31 <= oBufferLoadValid_delay_30;
      oBufferLoadValid_delay_32 <= oBufferLoadValid_delay_31;
      oBufferLoadValid_delay_33 <= oBufferLoadValid_delay_32;
      oBufferLoadValid_delay_34 <= oBufferLoadValid_delay_33;
      oBufferLoadValid_delay_35 <= oBufferLoadValid_delay_34;
      oBufferLoadValid_delay_36 <= oBufferLoadValid_delay_35;
      oBufferLoadValid_delay_37 <= oBufferLoadValid_delay_36;
      oBufferLoadValid_delay_38 <= oBufferLoadValid_delay_37;
      oBufferLoadValid_delay_39 <= oBufferLoadValid_delay_38;
      oBufferLoadValid_delay_40 <= oBufferLoadValid_delay_39;
      oBufferLoadValid_delay_41 <= oBufferLoadValid_delay_40;
      oBufferLoadValid_delay_42 <= oBufferLoadValid_delay_41;
      oBufferLoadValid_delay_43 <= oBufferLoadValid_delay_42;
      oBufferLoadValid_delay_44 <= oBufferLoadValid_delay_43;
      oBufferLoadValid_delay_45 <= oBufferLoadValid_delay_44;
      oBufferLoadValid_delay_46 <= oBufferLoadValid_delay_45;
      oBufferLoadValid_delay_47 <= oBufferLoadValid_delay_46;
      oBufferLoadValid_delay_48 <= oBufferLoadValid_delay_47;
      oBufferLoadValid_delay_49 <= oBufferLoadValid_delay_48;
      oBufferLoadValid_delay_50 <= oBufferLoadValid_delay_49;
      oBufferLoadValid_delay_51 <= oBufferLoadValid_delay_50;
      oBufferLoadValid_delay_52 <= oBufferLoadValid_delay_51;
      oBufferLoadValid_delay_53 <= oBufferLoadValid_delay_52;
      oBufferLoadValid_delay_54 <= oBufferLoadValid_delay_53;
      oBufferLoadValid_delay_55 <= oBufferLoadValid_delay_54;
      oBufferLoadValid_delay_56 <= oBufferLoadValid_delay_55;
      oBufferLoadValid_delay_57 <= oBufferLoadValid_delay_56;
      oBufferLoadValid_delay_58 <= oBufferLoadValid_delay_57;
      oBufferLoadValid_delay_59 <= oBufferLoadValid_delay_58;
      oBufferLoadValid_delay_60 <= oBufferLoadValid_delay_59;
      oBufferLoadValid_delay_61 <= oBufferLoadValid_delay_60;
      oBufferLoadValid_delay_62 <= oBufferLoadValid_delay_61;
      oBufferLoadValid_delay_63 <= oBufferLoadValid_delay_62;
      oBufferLoadValid_delay_64 <= oBufferLoadValid_delay_63;
      oBufferLoadValid_delay_65 <= oBufferLoadValid_delay_64;
      oBufferLoadValid_delay_66 <= oBufferLoadValid_delay_65;
      oBufferLoadValid_delay_67 <= oBufferLoadValid_delay_66;
      oBufferLoadValid_delay_68 <= oBufferLoadValid_delay_67;
      oBufferLoadValid_delay_69 <= oBufferLoadValid_delay_68;
      oBufferLoadValid_delay_70 <= oBufferLoadValid_delay_69;
      oBufferLoadValid_delay_71 <= oBufferLoadValid_delay_70;
      oBufferLoadValid_delay_72 <= oBufferLoadValid_delay_71;
      oBufferLoadValid_delay_73 <= oBufferLoadValid_delay_72;
      oBufferLoadValid_delay_74 <= oBufferLoadValid_delay_73;
      oBufferLoadValid_delay_75 <= oBufferLoadValid_delay_74;
      oBufferLoadValid_delay_76 <= oBufferLoadValid_delay_75;
      oBufferLoadValid_delay_77 <= oBufferLoadValid_delay_76;
      oBufferLoadValid_delay_78 <= oBufferLoadValid_delay_77;
      oBufferLoadValid_delay_79 <= oBufferLoadValid_delay_78;
      oBufferLoadValid_delay_80 <= oBufferLoadValid_delay_79;
      oBufferLoadValid_delay_81 <= oBufferLoadValid_delay_80;
      oBufferLoadValid_delay_82 <= oBufferLoadValid_delay_81;
      oBufferLoadValid_delay_83 <= oBufferLoadValid_delay_82;
      oBufferLoadValid_delay_84 <= oBufferLoadValid_delay_83;
      oBufferLoadValid_delay_85 <= oBufferLoadValid_delay_84;
      oBufferLoadValid_delay_86 <= oBufferLoadValid_delay_85;
      oBufferLoadValid_delay_87 <= oBufferLoadValid_delay_86;
      oBufferLoadValid_delay_88 <= oBufferLoadValid_delay_87;
      oBufferLoadValid_delay_89 <= oBufferLoadValid_delay_88;
    end
  end


endmodule
