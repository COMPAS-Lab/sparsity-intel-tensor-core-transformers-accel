// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemoverBackend
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemoverBackend (
  input  wire [10:0]   io_ins_0,
  input  wire [10:0]   io_ins_1,
  input  wire [10:0]   io_ins_2,
  input  wire [10:0]   io_ins_3,
  input  wire [10:0]   io_ins_4,
  input  wire [10:0]   io_ins_5,
  input  wire [10:0]   io_ins_6,
  input  wire [10:0]   io_ins_7,
  input  wire [10:0]   io_ins_8,
  input  wire [10:0]   io_ins_9,
  input  wire [10:0]   io_ins_10,
  input  wire [10:0]   io_ins_11,
  input  wire [10:0]   io_ins_12,
  input  wire [10:0]   io_ins_13,
  input  wire [10:0]   io_ins_14,
  input  wire [10:0]   io_ins_15,
  input  wire [10:0]   io_ins_16,
  input  wire [10:0]   io_ins_17,
  input  wire [10:0]   io_ins_18,
  input  wire [10:0]   io_ins_19,
  input  wire [10:0]   io_ins_20,
  input  wire [10:0]   io_ins_21,
  input  wire [10:0]   io_ins_22,
  input  wire [10:0]   io_ins_23,
  input  wire [10:0]   io_ins_24,
  input  wire [10:0]   io_ins_25,
  input  wire [10:0]   io_ins_26,
  input  wire [10:0]   io_ins_27,
  input  wire [10:0]   io_ins_28,
  input  wire [10:0]   io_ins_29,
  input  wire [10:0]   io_ins_30,
  input  wire [10:0]   io_ins_31,
  output wire [10:0]   io_outs_0,
  output wire [10:0]   io_outs_1,
  output wire [10:0]   io_outs_2,
  output wire [10:0]   io_outs_3,
  output wire [10:0]   io_outs_4,
  output wire [10:0]   io_outs_5,
  output wire [10:0]   io_outs_6,
  output wire [10:0]   io_outs_7,
  output wire [10:0]   io_outs_8,
  output wire [10:0]   io_outs_9,
  output wire [10:0]   io_outs_10,
  output wire [10:0]   io_outs_11,
  output wire [10:0]   io_outs_12,
  output wire [10:0]   io_outs_13,
  output wire [10:0]   io_outs_14,
  output wire [10:0]   io_outs_15,
  output wire          io_stg1CompRes_0,
  output wire          io_stg1CompRes_1,
  output wire          io_stg1CompRes_2,
  output wire          io_stg1CompRes_3,
  output wire          io_stg1CompRes_4,
  output wire          io_stg1CompRes_5,
  output wire          io_stg1CompRes_6,
  output wire          io_stg1CompRes_7,
  output wire          io_stg1CompRes_8,
  output wire          io_stg1CompRes_9,
  output wire          io_stg1CompRes_10,
  output wire          io_stg1CompRes_11,
  output wire          io_stg1CompRes_12,
  output wire          io_stg1CompRes_13,
  output wire          io_stg1CompRes_14,
  output wire          io_stg1CompRes_15,
  input  wire          clk,
  input  wire          clrn
);

  wire       [10:0]   compRes_0_0;
  wire       [10:0]   compRes_0_1;
  wire       [10:0]   compRes_0_2;
  wire       [10:0]   compRes_0_3;
  wire       [10:0]   compRes_0_4;
  wire       [10:0]   compRes_0_5;
  wire       [10:0]   compRes_0_6;
  wire       [10:0]   compRes_0_7;
  wire       [10:0]   compRes_0_8;
  wire       [10:0]   compRes_0_9;
  wire       [10:0]   compRes_0_10;
  wire       [10:0]   compRes_0_11;
  wire       [10:0]   compRes_0_12;
  wire       [10:0]   compRes_0_13;
  wire       [10:0]   compRes_0_14;
  wire       [10:0]   compRes_0_15;
  wire       [10:0]   compRes_1_0;
  wire       [10:0]   compRes_1_1;
  wire       [10:0]   compRes_1_2;
  wire       [10:0]   compRes_1_3;
  wire       [10:0]   compRes_1_4;
  wire       [10:0]   compRes_1_5;
  wire       [10:0]   compRes_1_6;
  wire       [10:0]   compRes_1_7;
  wire       [10:0]   compRes_1_8;
  wire       [10:0]   compRes_1_9;
  wire       [10:0]   compRes_1_10;
  wire       [10:0]   compRes_1_11;
  wire       [10:0]   compRes_1_12;
  wire       [10:0]   compRes_1_13;
  wire       [10:0]   compRes_1_14;
  wire       [10:0]   compRes_1_15;
  wire       [10:0]   compRes_2_0;
  wire       [10:0]   compRes_2_1;
  wire       [10:0]   compRes_2_2;
  wire       [10:0]   compRes_2_3;
  wire       [10:0]   compRes_2_4;
  wire       [10:0]   compRes_2_5;
  wire       [10:0]   compRes_2_6;
  wire       [10:0]   compRes_2_7;
  wire       [10:0]   compRes_2_8;
  wire       [10:0]   compRes_2_9;
  wire       [10:0]   compRes_2_10;
  wire       [10:0]   compRes_2_11;
  wire       [10:0]   compRes_2_12;
  wire       [10:0]   compRes_2_13;
  wire       [10:0]   compRes_2_14;
  wire       [10:0]   compRes_2_15;
  wire       [10:0]   compRes_3_0;
  wire       [10:0]   compRes_3_1;
  wire       [10:0]   compRes_3_2;
  wire       [10:0]   compRes_3_3;
  wire       [10:0]   compRes_3_4;
  wire       [10:0]   compRes_3_5;
  wire       [10:0]   compRes_3_6;
  wire       [10:0]   compRes_3_7;
  wire       [10:0]   compRes_3_8;
  wire       [10:0]   compRes_3_9;
  wire       [10:0]   compRes_3_10;
  wire       [10:0]   compRes_3_11;
  wire       [10:0]   compRes_3_12;
  wire       [10:0]   compRes_3_13;
  wire       [10:0]   compRes_3_14;
  wire       [10:0]   compRes_3_15;
  wire       [10:0]   compRes_4_0;
  wire       [10:0]   compRes_4_1;
  wire       [10:0]   compRes_4_2;
  wire       [10:0]   compRes_4_3;
  wire       [10:0]   compRes_4_4;
  wire       [10:0]   compRes_4_5;
  wire       [10:0]   compRes_4_6;
  wire       [10:0]   compRes_4_7;
  wire       [10:0]   compRes_4_8;
  wire       [10:0]   compRes_4_9;
  wire       [10:0]   compRes_4_10;
  wire       [10:0]   compRes_4_11;
  wire       [10:0]   compRes_4_12;
  wire       [10:0]   compRes_4_13;
  wire       [10:0]   compRes_4_14;
  wire       [10:0]   compRes_4_15;
  wire       [10:0]   stg1Outs_0_dat;
  wire                stg1Outs_0_compFlag;
  wire       [10:0]   stg1Outs_1_dat;
  wire                stg1Outs_1_compFlag;
  wire       [10:0]   stg1Outs_2_dat;
  wire                stg1Outs_2_compFlag;
  wire       [10:0]   stg1Outs_3_dat;
  wire                stg1Outs_3_compFlag;
  wire       [10:0]   stg1Outs_4_dat;
  wire                stg1Outs_4_compFlag;
  wire       [10:0]   stg1Outs_5_dat;
  wire                stg1Outs_5_compFlag;
  wire       [10:0]   stg1Outs_6_dat;
  wire                stg1Outs_6_compFlag;
  wire       [10:0]   stg1Outs_7_dat;
  wire                stg1Outs_7_compFlag;
  wire       [10:0]   stg1Outs_8_dat;
  wire                stg1Outs_8_compFlag;
  wire       [10:0]   stg1Outs_9_dat;
  wire                stg1Outs_9_compFlag;
  wire       [10:0]   stg1Outs_10_dat;
  wire                stg1Outs_10_compFlag;
  wire       [10:0]   stg1Outs_11_dat;
  wire                stg1Outs_11_compFlag;
  wire       [10:0]   stg1Outs_12_dat;
  wire                stg1Outs_12_compFlag;
  wire       [10:0]   stg1Outs_13_dat;
  wire                stg1Outs_13_compFlag;
  wire       [10:0]   stg1Outs_14_dat;
  wire                stg1Outs_14_compFlag;
  wire       [10:0]   stg1Outs_15_dat;
  wire                stg1Outs_15_compFlag;
  reg        [10:0]   _zz_stg1Outs_0_dat;
  reg        [10:0]   _zz_stg1Outs_1_dat;
  reg        [10:0]   _zz_stg1Outs_2_dat;
  reg        [10:0]   _zz_stg1Outs_3_dat;
  reg        [10:0]   _zz_stg1Outs_4_dat;
  reg        [10:0]   _zz_stg1Outs_5_dat;
  reg        [10:0]   _zz_stg1Outs_6_dat;
  reg        [10:0]   _zz_stg1Outs_7_dat;
  reg        [10:0]   _zz_stg1Outs_8_dat;
  reg        [10:0]   _zz_stg1Outs_9_dat;
  reg        [10:0]   _zz_stg1Outs_10_dat;
  reg        [10:0]   _zz_stg1Outs_11_dat;
  reg        [10:0]   _zz_stg1Outs_12_dat;
  reg        [10:0]   _zz_stg1Outs_13_dat;
  reg        [10:0]   _zz_stg1Outs_14_dat;
  reg        [10:0]   _zz_stg1Outs_15_dat;
  reg        [10:0]   _zz_compRes_1_0;
  reg        [10:0]   _zz_compRes_1_8;
  wire                when_RedundancyRemover_l155;
  wire                when_RedundancyRemover_l158;
  wire                when_RedundancyRemover_l161;
  reg        [10:0]   _zz_compRes_1_1;
  reg        [10:0]   _zz_compRes_1_9;
  wire                when_RedundancyRemover_l155_1;
  wire                when_RedundancyRemover_l158_1;
  wire                when_RedundancyRemover_l161_1;
  reg        [10:0]   _zz_compRes_1_2;
  reg        [10:0]   _zz_compRes_1_10;
  wire                when_RedundancyRemover_l155_2;
  wire                when_RedundancyRemover_l158_2;
  wire                when_RedundancyRemover_l161_2;
  reg        [10:0]   _zz_compRes_1_3;
  reg        [10:0]   _zz_compRes_1_11;
  wire                when_RedundancyRemover_l155_3;
  wire                when_RedundancyRemover_l158_3;
  wire                when_RedundancyRemover_l161_3;
  reg        [10:0]   _zz_compRes_1_4;
  reg        [10:0]   _zz_compRes_1_12;
  wire                when_RedundancyRemover_l155_4;
  wire                when_RedundancyRemover_l158_4;
  wire                when_RedundancyRemover_l161_4;
  reg        [10:0]   _zz_compRes_1_5;
  reg        [10:0]   _zz_compRes_1_13;
  wire                when_RedundancyRemover_l155_5;
  wire                when_RedundancyRemover_l158_5;
  wire                when_RedundancyRemover_l161_5;
  reg        [10:0]   _zz_compRes_1_6;
  reg        [10:0]   _zz_compRes_1_14;
  wire                when_RedundancyRemover_l155_6;
  wire                when_RedundancyRemover_l158_6;
  wire                when_RedundancyRemover_l161_6;
  reg        [10:0]   _zz_compRes_1_7;
  reg        [10:0]   _zz_compRes_1_15;
  wire                when_RedundancyRemover_l155_7;
  wire                when_RedundancyRemover_l158_7;
  wire                when_RedundancyRemover_l161_7;
  reg        [10:0]   _zz_compRes_2_0;
  reg        [10:0]   _zz_compRes_2_4;
  wire                when_RedundancyRemover_l155_8;
  wire                when_RedundancyRemover_l158_8;
  wire                when_RedundancyRemover_l161_8;
  reg        [10:0]   _zz_compRes_2_1;
  reg        [10:0]   _zz_compRes_2_5;
  wire                when_RedundancyRemover_l155_9;
  wire                when_RedundancyRemover_l158_9;
  wire                when_RedundancyRemover_l161_9;
  reg        [10:0]   _zz_compRes_2_2;
  reg        [10:0]   _zz_compRes_2_6;
  wire                when_RedundancyRemover_l155_10;
  wire                when_RedundancyRemover_l158_10;
  wire                when_RedundancyRemover_l161_10;
  reg        [10:0]   _zz_compRes_2_3;
  reg        [10:0]   _zz_compRes_2_7;
  wire                when_RedundancyRemover_l155_11;
  wire                when_RedundancyRemover_l158_11;
  wire                when_RedundancyRemover_l161_11;
  reg        [10:0]   _zz_compRes_2_8;
  reg        [10:0]   _zz_compRes_2_12;
  wire                when_RedundancyRemover_l155_12;
  wire                when_RedundancyRemover_l158_12;
  wire                when_RedundancyRemover_l161_12;
  reg        [10:0]   _zz_compRes_2_9;
  reg        [10:0]   _zz_compRes_2_13;
  wire                when_RedundancyRemover_l155_13;
  wire                when_RedundancyRemover_l158_13;
  wire                when_RedundancyRemover_l161_13;
  reg        [10:0]   _zz_compRes_2_10;
  reg        [10:0]   _zz_compRes_2_14;
  wire                when_RedundancyRemover_l155_14;
  wire                when_RedundancyRemover_l158_14;
  wire                when_RedundancyRemover_l161_14;
  reg        [10:0]   _zz_compRes_2_11;
  reg        [10:0]   _zz_compRes_2_15;
  wire                when_RedundancyRemover_l155_15;
  wire                when_RedundancyRemover_l158_15;
  wire                when_RedundancyRemover_l161_15;
  reg        [10:0]   _zz_compRes_3_0;
  reg        [10:0]   _zz_compRes_3_2;
  wire                when_RedundancyRemover_l155_16;
  wire                when_RedundancyRemover_l158_16;
  wire                when_RedundancyRemover_l161_16;
  reg        [10:0]   _zz_compRes_3_1;
  reg        [10:0]   _zz_compRes_3_3;
  wire                when_RedundancyRemover_l155_17;
  wire                when_RedundancyRemover_l158_17;
  wire                when_RedundancyRemover_l161_17;
  reg        [10:0]   _zz_compRes_3_4;
  reg        [10:0]   _zz_compRes_3_6;
  wire                when_RedundancyRemover_l155_18;
  wire                when_RedundancyRemover_l158_18;
  wire                when_RedundancyRemover_l161_18;
  reg        [10:0]   _zz_compRes_3_5;
  reg        [10:0]   _zz_compRes_3_7;
  wire                when_RedundancyRemover_l155_19;
  wire                when_RedundancyRemover_l158_19;
  wire                when_RedundancyRemover_l161_19;
  reg        [10:0]   _zz_compRes_3_8;
  reg        [10:0]   _zz_compRes_3_10;
  wire                when_RedundancyRemover_l155_20;
  wire                when_RedundancyRemover_l158_20;
  wire                when_RedundancyRemover_l161_20;
  reg        [10:0]   _zz_compRes_3_9;
  reg        [10:0]   _zz_compRes_3_11;
  wire                when_RedundancyRemover_l155_21;
  wire                when_RedundancyRemover_l158_21;
  wire                when_RedundancyRemover_l161_21;
  reg        [10:0]   _zz_compRes_3_12;
  reg        [10:0]   _zz_compRes_3_14;
  wire                when_RedundancyRemover_l155_22;
  wire                when_RedundancyRemover_l158_22;
  wire                when_RedundancyRemover_l161_22;
  reg        [10:0]   _zz_compRes_3_13;
  reg        [10:0]   _zz_compRes_3_15;
  wire                when_RedundancyRemover_l155_23;
  wire                when_RedundancyRemover_l158_23;
  wire                when_RedundancyRemover_l161_23;
  reg        [10:0]   _zz_compRes_4_0;
  reg        [10:0]   _zz_compRes_4_1;
  wire                when_RedundancyRemover_l155_24;
  wire                when_RedundancyRemover_l158_24;
  wire                when_RedundancyRemover_l161_24;
  reg        [10:0]   _zz_compRes_4_2;
  reg        [10:0]   _zz_compRes_4_3;
  wire                when_RedundancyRemover_l155_25;
  wire                when_RedundancyRemover_l158_25;
  wire                when_RedundancyRemover_l161_25;
  reg        [10:0]   _zz_compRes_4_4;
  reg        [10:0]   _zz_compRes_4_5;
  wire                when_RedundancyRemover_l155_26;
  wire                when_RedundancyRemover_l158_26;
  wire                when_RedundancyRemover_l161_26;
  reg        [10:0]   _zz_compRes_4_6;
  reg        [10:0]   _zz_compRes_4_7;
  wire                when_RedundancyRemover_l155_27;
  wire                when_RedundancyRemover_l158_27;
  wire                when_RedundancyRemover_l161_27;
  reg        [10:0]   _zz_compRes_4_8;
  reg        [10:0]   _zz_compRes_4_9;
  wire                when_RedundancyRemover_l155_28;
  wire                when_RedundancyRemover_l158_28;
  wire                when_RedundancyRemover_l161_28;
  reg        [10:0]   _zz_compRes_4_10;
  reg        [10:0]   _zz_compRes_4_11;
  wire                when_RedundancyRemover_l155_29;
  wire                when_RedundancyRemover_l158_29;
  wire                when_RedundancyRemover_l161_29;
  reg        [10:0]   _zz_compRes_4_12;
  reg        [10:0]   _zz_compRes_4_13;
  wire                when_RedundancyRemover_l155_30;
  wire                when_RedundancyRemover_l158_30;
  wire                when_RedundancyRemover_l161_30;
  reg        [10:0]   _zz_compRes_4_14;
  reg        [10:0]   _zz_compRes_4_15;
  wire                when_RedundancyRemover_l155_31;
  wire                when_RedundancyRemover_l158_31;
  wire                when_RedundancyRemover_l161_31;

  assign stg1Outs_0_dat = _zz_stg1Outs_0_dat;
  assign stg1Outs_0_compFlag = ((io_ins_31 < io_ins_0) || (io_ins_0 == io_ins_31));
  assign stg1Outs_1_dat = _zz_stg1Outs_1_dat;
  assign stg1Outs_1_compFlag = ((io_ins_30 < io_ins_1) || (io_ins_1 == io_ins_30));
  assign stg1Outs_2_dat = _zz_stg1Outs_2_dat;
  assign stg1Outs_2_compFlag = ((io_ins_29 < io_ins_2) || (io_ins_2 == io_ins_29));
  assign stg1Outs_3_dat = _zz_stg1Outs_3_dat;
  assign stg1Outs_3_compFlag = ((io_ins_28 < io_ins_3) || (io_ins_3 == io_ins_28));
  assign stg1Outs_4_dat = _zz_stg1Outs_4_dat;
  assign stg1Outs_4_compFlag = ((io_ins_27 < io_ins_4) || (io_ins_4 == io_ins_27));
  assign stg1Outs_5_dat = _zz_stg1Outs_5_dat;
  assign stg1Outs_5_compFlag = ((io_ins_26 < io_ins_5) || (io_ins_5 == io_ins_26));
  assign stg1Outs_6_dat = _zz_stg1Outs_6_dat;
  assign stg1Outs_6_compFlag = ((io_ins_25 < io_ins_6) || (io_ins_6 == io_ins_25));
  assign stg1Outs_7_dat = _zz_stg1Outs_7_dat;
  assign stg1Outs_7_compFlag = ((io_ins_24 < io_ins_7) || (io_ins_7 == io_ins_24));
  assign stg1Outs_8_dat = _zz_stg1Outs_8_dat;
  assign stg1Outs_8_compFlag = ((io_ins_23 < io_ins_8) || (io_ins_8 == io_ins_23));
  assign stg1Outs_9_dat = _zz_stg1Outs_9_dat;
  assign stg1Outs_9_compFlag = ((io_ins_22 < io_ins_9) || (io_ins_9 == io_ins_22));
  assign stg1Outs_10_dat = _zz_stg1Outs_10_dat;
  assign stg1Outs_10_compFlag = ((io_ins_21 < io_ins_10) || (io_ins_10 == io_ins_21));
  assign stg1Outs_11_dat = _zz_stg1Outs_11_dat;
  assign stg1Outs_11_compFlag = ((io_ins_20 < io_ins_11) || (io_ins_11 == io_ins_20));
  assign stg1Outs_12_dat = _zz_stg1Outs_12_dat;
  assign stg1Outs_12_compFlag = ((io_ins_19 < io_ins_12) || (io_ins_12 == io_ins_19));
  assign stg1Outs_13_dat = _zz_stg1Outs_13_dat;
  assign stg1Outs_13_compFlag = ((io_ins_18 < io_ins_13) || (io_ins_13 == io_ins_18));
  assign stg1Outs_14_dat = _zz_stg1Outs_14_dat;
  assign stg1Outs_14_compFlag = ((io_ins_17 < io_ins_14) || (io_ins_14 == io_ins_17));
  assign stg1Outs_15_dat = _zz_stg1Outs_15_dat;
  assign stg1Outs_15_compFlag = ((io_ins_16 < io_ins_15) || (io_ins_15 == io_ins_16));
  assign compRes_0_0 = stg1Outs_0_dat;
  assign compRes_0_1 = stg1Outs_1_dat;
  assign compRes_0_2 = stg1Outs_2_dat;
  assign compRes_0_3 = stg1Outs_3_dat;
  assign compRes_0_4 = stg1Outs_4_dat;
  assign compRes_0_5 = stg1Outs_5_dat;
  assign compRes_0_6 = stg1Outs_6_dat;
  assign compRes_0_7 = stg1Outs_7_dat;
  assign compRes_0_8 = stg1Outs_8_dat;
  assign compRes_0_9 = stg1Outs_9_dat;
  assign compRes_0_10 = stg1Outs_10_dat;
  assign compRes_0_11 = stg1Outs_11_dat;
  assign compRes_0_12 = stg1Outs_12_dat;
  assign compRes_0_13 = stg1Outs_13_dat;
  assign compRes_0_14 = stg1Outs_14_dat;
  assign compRes_0_15 = stg1Outs_15_dat;
  assign when_RedundancyRemover_l155 = ((compRes_0_0[10] == 1'b1) || (compRes_0_8[10] == 1'b1));
  assign when_RedundancyRemover_l158 = (compRes_0_0 == compRes_0_8);
  assign when_RedundancyRemover_l161 = (compRes_0_8 < compRes_0_0);
  assign when_RedundancyRemover_l155_1 = ((compRes_0_1[10] == 1'b1) || (compRes_0_9[10] == 1'b1));
  assign when_RedundancyRemover_l158_1 = (compRes_0_1 == compRes_0_9);
  assign when_RedundancyRemover_l161_1 = (compRes_0_9 < compRes_0_1);
  assign when_RedundancyRemover_l155_2 = ((compRes_0_2[10] == 1'b1) || (compRes_0_10[10] == 1'b1));
  assign when_RedundancyRemover_l158_2 = (compRes_0_2 == compRes_0_10);
  assign when_RedundancyRemover_l161_2 = (compRes_0_10 < compRes_0_2);
  assign when_RedundancyRemover_l155_3 = ((compRes_0_3[10] == 1'b1) || (compRes_0_11[10] == 1'b1));
  assign when_RedundancyRemover_l158_3 = (compRes_0_3 == compRes_0_11);
  assign when_RedundancyRemover_l161_3 = (compRes_0_11 < compRes_0_3);
  assign when_RedundancyRemover_l155_4 = ((compRes_0_4[10] == 1'b1) || (compRes_0_12[10] == 1'b1));
  assign when_RedundancyRemover_l158_4 = (compRes_0_4 == compRes_0_12);
  assign when_RedundancyRemover_l161_4 = (compRes_0_12 < compRes_0_4);
  assign when_RedundancyRemover_l155_5 = ((compRes_0_5[10] == 1'b1) || (compRes_0_13[10] == 1'b1));
  assign when_RedundancyRemover_l158_5 = (compRes_0_5 == compRes_0_13);
  assign when_RedundancyRemover_l161_5 = (compRes_0_13 < compRes_0_5);
  assign when_RedundancyRemover_l155_6 = ((compRes_0_6[10] == 1'b1) || (compRes_0_14[10] == 1'b1));
  assign when_RedundancyRemover_l158_6 = (compRes_0_6 == compRes_0_14);
  assign when_RedundancyRemover_l161_6 = (compRes_0_14 < compRes_0_6);
  assign when_RedundancyRemover_l155_7 = ((compRes_0_7[10] == 1'b1) || (compRes_0_15[10] == 1'b1));
  assign when_RedundancyRemover_l158_7 = (compRes_0_7 == compRes_0_15);
  assign when_RedundancyRemover_l161_7 = (compRes_0_15 < compRes_0_7);
  assign compRes_1_0 = _zz_compRes_1_0;
  assign compRes_1_1 = _zz_compRes_1_1;
  assign compRes_1_2 = _zz_compRes_1_2;
  assign compRes_1_3 = _zz_compRes_1_3;
  assign compRes_1_4 = _zz_compRes_1_4;
  assign compRes_1_5 = _zz_compRes_1_5;
  assign compRes_1_6 = _zz_compRes_1_6;
  assign compRes_1_7 = _zz_compRes_1_7;
  assign compRes_1_8 = _zz_compRes_1_8;
  assign compRes_1_9 = _zz_compRes_1_9;
  assign compRes_1_10 = _zz_compRes_1_10;
  assign compRes_1_11 = _zz_compRes_1_11;
  assign compRes_1_12 = _zz_compRes_1_12;
  assign compRes_1_13 = _zz_compRes_1_13;
  assign compRes_1_14 = _zz_compRes_1_14;
  assign compRes_1_15 = _zz_compRes_1_15;
  assign when_RedundancyRemover_l155_8 = ((compRes_1_0[10] == 1'b1) || (compRes_1_4[10] == 1'b1));
  assign when_RedundancyRemover_l158_8 = (compRes_1_0 == compRes_1_4);
  assign when_RedundancyRemover_l161_8 = (compRes_1_4 < compRes_1_0);
  assign when_RedundancyRemover_l155_9 = ((compRes_1_1[10] == 1'b1) || (compRes_1_5[10] == 1'b1));
  assign when_RedundancyRemover_l158_9 = (compRes_1_1 == compRes_1_5);
  assign when_RedundancyRemover_l161_9 = (compRes_1_5 < compRes_1_1);
  assign when_RedundancyRemover_l155_10 = ((compRes_1_2[10] == 1'b1) || (compRes_1_6[10] == 1'b1));
  assign when_RedundancyRemover_l158_10 = (compRes_1_2 == compRes_1_6);
  assign when_RedundancyRemover_l161_10 = (compRes_1_6 < compRes_1_2);
  assign when_RedundancyRemover_l155_11 = ((compRes_1_3[10] == 1'b1) || (compRes_1_7[10] == 1'b1));
  assign when_RedundancyRemover_l158_11 = (compRes_1_3 == compRes_1_7);
  assign when_RedundancyRemover_l161_11 = (compRes_1_7 < compRes_1_3);
  assign when_RedundancyRemover_l155_12 = ((compRes_1_8[10] == 1'b1) || (compRes_1_12[10] == 1'b1));
  assign when_RedundancyRemover_l158_12 = (compRes_1_8 == compRes_1_12);
  assign when_RedundancyRemover_l161_12 = (compRes_1_12 < compRes_1_8);
  assign when_RedundancyRemover_l155_13 = ((compRes_1_9[10] == 1'b1) || (compRes_1_13[10] == 1'b1));
  assign when_RedundancyRemover_l158_13 = (compRes_1_9 == compRes_1_13);
  assign when_RedundancyRemover_l161_13 = (compRes_1_13 < compRes_1_9);
  assign when_RedundancyRemover_l155_14 = ((compRes_1_10[10] == 1'b1) || (compRes_1_14[10] == 1'b1));
  assign when_RedundancyRemover_l158_14 = (compRes_1_10 == compRes_1_14);
  assign when_RedundancyRemover_l161_14 = (compRes_1_14 < compRes_1_10);
  assign when_RedundancyRemover_l155_15 = ((compRes_1_11[10] == 1'b1) || (compRes_1_15[10] == 1'b1));
  assign when_RedundancyRemover_l158_15 = (compRes_1_11 == compRes_1_15);
  assign when_RedundancyRemover_l161_15 = (compRes_1_15 < compRes_1_11);
  assign compRes_2_0 = _zz_compRes_2_0;
  assign compRes_2_1 = _zz_compRes_2_1;
  assign compRes_2_2 = _zz_compRes_2_2;
  assign compRes_2_3 = _zz_compRes_2_3;
  assign compRes_2_4 = _zz_compRes_2_4;
  assign compRes_2_5 = _zz_compRes_2_5;
  assign compRes_2_6 = _zz_compRes_2_6;
  assign compRes_2_7 = _zz_compRes_2_7;
  assign compRes_2_8 = _zz_compRes_2_8;
  assign compRes_2_9 = _zz_compRes_2_9;
  assign compRes_2_10 = _zz_compRes_2_10;
  assign compRes_2_11 = _zz_compRes_2_11;
  assign compRes_2_12 = _zz_compRes_2_12;
  assign compRes_2_13 = _zz_compRes_2_13;
  assign compRes_2_14 = _zz_compRes_2_14;
  assign compRes_2_15 = _zz_compRes_2_15;
  assign when_RedundancyRemover_l155_16 = ((compRes_2_0[10] == 1'b1) || (compRes_2_2[10] == 1'b1));
  assign when_RedundancyRemover_l158_16 = (compRes_2_0 == compRes_2_2);
  assign when_RedundancyRemover_l161_16 = (compRes_2_2 < compRes_2_0);
  assign when_RedundancyRemover_l155_17 = ((compRes_2_1[10] == 1'b1) || (compRes_2_3[10] == 1'b1));
  assign when_RedundancyRemover_l158_17 = (compRes_2_1 == compRes_2_3);
  assign when_RedundancyRemover_l161_17 = (compRes_2_3 < compRes_2_1);
  assign when_RedundancyRemover_l155_18 = ((compRes_2_4[10] == 1'b1) || (compRes_2_6[10] == 1'b1));
  assign when_RedundancyRemover_l158_18 = (compRes_2_4 == compRes_2_6);
  assign when_RedundancyRemover_l161_18 = (compRes_2_6 < compRes_2_4);
  assign when_RedundancyRemover_l155_19 = ((compRes_2_5[10] == 1'b1) || (compRes_2_7[10] == 1'b1));
  assign when_RedundancyRemover_l158_19 = (compRes_2_5 == compRes_2_7);
  assign when_RedundancyRemover_l161_19 = (compRes_2_7 < compRes_2_5);
  assign when_RedundancyRemover_l155_20 = ((compRes_2_8[10] == 1'b1) || (compRes_2_10[10] == 1'b1));
  assign when_RedundancyRemover_l158_20 = (compRes_2_8 == compRes_2_10);
  assign when_RedundancyRemover_l161_20 = (compRes_2_10 < compRes_2_8);
  assign when_RedundancyRemover_l155_21 = ((compRes_2_9[10] == 1'b1) || (compRes_2_11[10] == 1'b1));
  assign when_RedundancyRemover_l158_21 = (compRes_2_9 == compRes_2_11);
  assign when_RedundancyRemover_l161_21 = (compRes_2_11 < compRes_2_9);
  assign when_RedundancyRemover_l155_22 = ((compRes_2_12[10] == 1'b1) || (compRes_2_14[10] == 1'b1));
  assign when_RedundancyRemover_l158_22 = (compRes_2_12 == compRes_2_14);
  assign when_RedundancyRemover_l161_22 = (compRes_2_14 < compRes_2_12);
  assign when_RedundancyRemover_l155_23 = ((compRes_2_13[10] == 1'b1) || (compRes_2_15[10] == 1'b1));
  assign when_RedundancyRemover_l158_23 = (compRes_2_13 == compRes_2_15);
  assign when_RedundancyRemover_l161_23 = (compRes_2_15 < compRes_2_13);
  assign compRes_3_0 = _zz_compRes_3_0;
  assign compRes_3_1 = _zz_compRes_3_1;
  assign compRes_3_2 = _zz_compRes_3_2;
  assign compRes_3_3 = _zz_compRes_3_3;
  assign compRes_3_4 = _zz_compRes_3_4;
  assign compRes_3_5 = _zz_compRes_3_5;
  assign compRes_3_6 = _zz_compRes_3_6;
  assign compRes_3_7 = _zz_compRes_3_7;
  assign compRes_3_8 = _zz_compRes_3_8;
  assign compRes_3_9 = _zz_compRes_3_9;
  assign compRes_3_10 = _zz_compRes_3_10;
  assign compRes_3_11 = _zz_compRes_3_11;
  assign compRes_3_12 = _zz_compRes_3_12;
  assign compRes_3_13 = _zz_compRes_3_13;
  assign compRes_3_14 = _zz_compRes_3_14;
  assign compRes_3_15 = _zz_compRes_3_15;
  assign when_RedundancyRemover_l155_24 = ((compRes_3_0[10] == 1'b1) || (compRes_3_1[10] == 1'b1));
  assign when_RedundancyRemover_l158_24 = (compRes_3_0 == compRes_3_1);
  assign when_RedundancyRemover_l161_24 = (compRes_3_1 < compRes_3_0);
  assign when_RedundancyRemover_l155_25 = ((compRes_3_2[10] == 1'b1) || (compRes_3_3[10] == 1'b1));
  assign when_RedundancyRemover_l158_25 = (compRes_3_2 == compRes_3_3);
  assign when_RedundancyRemover_l161_25 = (compRes_3_3 < compRes_3_2);
  assign when_RedundancyRemover_l155_26 = ((compRes_3_4[10] == 1'b1) || (compRes_3_5[10] == 1'b1));
  assign when_RedundancyRemover_l158_26 = (compRes_3_4 == compRes_3_5);
  assign when_RedundancyRemover_l161_26 = (compRes_3_5 < compRes_3_4);
  assign when_RedundancyRemover_l155_27 = ((compRes_3_6[10] == 1'b1) || (compRes_3_7[10] == 1'b1));
  assign when_RedundancyRemover_l158_27 = (compRes_3_6 == compRes_3_7);
  assign when_RedundancyRemover_l161_27 = (compRes_3_7 < compRes_3_6);
  assign when_RedundancyRemover_l155_28 = ((compRes_3_8[10] == 1'b1) || (compRes_3_9[10] == 1'b1));
  assign when_RedundancyRemover_l158_28 = (compRes_3_8 == compRes_3_9);
  assign when_RedundancyRemover_l161_28 = (compRes_3_9 < compRes_3_8);
  assign when_RedundancyRemover_l155_29 = ((compRes_3_10[10] == 1'b1) || (compRes_3_11[10] == 1'b1));
  assign when_RedundancyRemover_l158_29 = (compRes_3_10 == compRes_3_11);
  assign when_RedundancyRemover_l161_29 = (compRes_3_11 < compRes_3_10);
  assign when_RedundancyRemover_l155_30 = ((compRes_3_12[10] == 1'b1) || (compRes_3_13[10] == 1'b1));
  assign when_RedundancyRemover_l158_30 = (compRes_3_12 == compRes_3_13);
  assign when_RedundancyRemover_l161_30 = (compRes_3_13 < compRes_3_12);
  assign when_RedundancyRemover_l155_31 = ((compRes_3_14[10] == 1'b1) || (compRes_3_15[10] == 1'b1));
  assign when_RedundancyRemover_l158_31 = (compRes_3_14 == compRes_3_15);
  assign when_RedundancyRemover_l161_31 = (compRes_3_15 < compRes_3_14);
  assign compRes_4_0 = _zz_compRes_4_0;
  assign compRes_4_1 = _zz_compRes_4_1;
  assign compRes_4_2 = _zz_compRes_4_2;
  assign compRes_4_3 = _zz_compRes_4_3;
  assign compRes_4_4 = _zz_compRes_4_4;
  assign compRes_4_5 = _zz_compRes_4_5;
  assign compRes_4_6 = _zz_compRes_4_6;
  assign compRes_4_7 = _zz_compRes_4_7;
  assign compRes_4_8 = _zz_compRes_4_8;
  assign compRes_4_9 = _zz_compRes_4_9;
  assign compRes_4_10 = _zz_compRes_4_10;
  assign compRes_4_11 = _zz_compRes_4_11;
  assign compRes_4_12 = _zz_compRes_4_12;
  assign compRes_4_13 = _zz_compRes_4_13;
  assign compRes_4_14 = _zz_compRes_4_14;
  assign compRes_4_15 = _zz_compRes_4_15;
  assign io_outs_0 = compRes_4_0;
  assign io_outs_1 = compRes_4_1;
  assign io_outs_2 = compRes_4_2;
  assign io_outs_3 = compRes_4_3;
  assign io_outs_4 = compRes_4_4;
  assign io_outs_5 = compRes_4_5;
  assign io_outs_6 = compRes_4_6;
  assign io_outs_7 = compRes_4_7;
  assign io_outs_8 = compRes_4_8;
  assign io_outs_9 = compRes_4_9;
  assign io_outs_10 = compRes_4_10;
  assign io_outs_11 = compRes_4_11;
  assign io_outs_12 = compRes_4_12;
  assign io_outs_13 = compRes_4_13;
  assign io_outs_14 = compRes_4_14;
  assign io_outs_15 = compRes_4_15;
  assign io_stg1CompRes_0 = stg1Outs_0_compFlag;
  assign io_stg1CompRes_1 = stg1Outs_1_compFlag;
  assign io_stg1CompRes_2 = stg1Outs_2_compFlag;
  assign io_stg1CompRes_3 = stg1Outs_3_compFlag;
  assign io_stg1CompRes_4 = stg1Outs_4_compFlag;
  assign io_stg1CompRes_5 = stg1Outs_5_compFlag;
  assign io_stg1CompRes_6 = stg1Outs_6_compFlag;
  assign io_stg1CompRes_7 = stg1Outs_7_compFlag;
  assign io_stg1CompRes_8 = stg1Outs_8_compFlag;
  assign io_stg1CompRes_9 = stg1Outs_9_compFlag;
  assign io_stg1CompRes_10 = stg1Outs_10_compFlag;
  assign io_stg1CompRes_11 = stg1Outs_11_compFlag;
  assign io_stg1CompRes_12 = stg1Outs_12_compFlag;
  assign io_stg1CompRes_13 = stg1Outs_13_compFlag;
  assign io_stg1CompRes_14 = stg1Outs_14_compFlag;
  assign io_stg1CompRes_15 = stg1Outs_15_compFlag;
  always @(posedge clk) begin
    if(!clrn) begin
      _zz_stg1Outs_0_dat <= 11'h000;
      _zz_stg1Outs_1_dat <= 11'h000;
      _zz_stg1Outs_2_dat <= 11'h000;
      _zz_stg1Outs_3_dat <= 11'h000;
      _zz_stg1Outs_4_dat <= 11'h000;
      _zz_stg1Outs_5_dat <= 11'h000;
      _zz_stg1Outs_6_dat <= 11'h000;
      _zz_stg1Outs_7_dat <= 11'h000;
      _zz_stg1Outs_8_dat <= 11'h000;
      _zz_stg1Outs_9_dat <= 11'h000;
      _zz_stg1Outs_10_dat <= 11'h000;
      _zz_stg1Outs_11_dat <= 11'h000;
      _zz_stg1Outs_12_dat <= 11'h000;
      _zz_stg1Outs_13_dat <= 11'h000;
      _zz_stg1Outs_14_dat <= 11'h000;
      _zz_stg1Outs_15_dat <= 11'h000;
      _zz_compRes_1_0 <= 11'h000;
      _zz_compRes_1_8 <= 11'h000;
      _zz_compRes_1_1 <= 11'h000;
      _zz_compRes_1_9 <= 11'h000;
      _zz_compRes_1_2 <= 11'h000;
      _zz_compRes_1_10 <= 11'h000;
      _zz_compRes_1_3 <= 11'h000;
      _zz_compRes_1_11 <= 11'h000;
      _zz_compRes_1_4 <= 11'h000;
      _zz_compRes_1_12 <= 11'h000;
      _zz_compRes_1_5 <= 11'h000;
      _zz_compRes_1_13 <= 11'h000;
      _zz_compRes_1_6 <= 11'h000;
      _zz_compRes_1_14 <= 11'h000;
      _zz_compRes_1_7 <= 11'h000;
      _zz_compRes_1_15 <= 11'h000;
      _zz_compRes_2_0 <= 11'h000;
      _zz_compRes_2_4 <= 11'h000;
      _zz_compRes_2_1 <= 11'h000;
      _zz_compRes_2_5 <= 11'h000;
      _zz_compRes_2_2 <= 11'h000;
      _zz_compRes_2_6 <= 11'h000;
      _zz_compRes_2_3 <= 11'h000;
      _zz_compRes_2_7 <= 11'h000;
      _zz_compRes_2_8 <= 11'h000;
      _zz_compRes_2_12 <= 11'h000;
      _zz_compRes_2_9 <= 11'h000;
      _zz_compRes_2_13 <= 11'h000;
      _zz_compRes_2_10 <= 11'h000;
      _zz_compRes_2_14 <= 11'h000;
      _zz_compRes_2_11 <= 11'h000;
      _zz_compRes_2_15 <= 11'h000;
      _zz_compRes_3_0 <= 11'h000;
      _zz_compRes_3_2 <= 11'h000;
      _zz_compRes_3_1 <= 11'h000;
      _zz_compRes_3_3 <= 11'h000;
      _zz_compRes_3_4 <= 11'h000;
      _zz_compRes_3_6 <= 11'h000;
      _zz_compRes_3_5 <= 11'h000;
      _zz_compRes_3_7 <= 11'h000;
      _zz_compRes_3_8 <= 11'h000;
      _zz_compRes_3_10 <= 11'h000;
      _zz_compRes_3_9 <= 11'h000;
      _zz_compRes_3_11 <= 11'h000;
      _zz_compRes_3_12 <= 11'h000;
      _zz_compRes_3_14 <= 11'h000;
      _zz_compRes_3_13 <= 11'h000;
      _zz_compRes_3_15 <= 11'h000;
      _zz_compRes_4_0 <= 11'h000;
      _zz_compRes_4_1 <= 11'h000;
      _zz_compRes_4_2 <= 11'h000;
      _zz_compRes_4_3 <= 11'h000;
      _zz_compRes_4_4 <= 11'h000;
      _zz_compRes_4_5 <= 11'h000;
      _zz_compRes_4_6 <= 11'h000;
      _zz_compRes_4_7 <= 11'h000;
      _zz_compRes_4_8 <= 11'h000;
      _zz_compRes_4_9 <= 11'h000;
      _zz_compRes_4_10 <= 11'h000;
      _zz_compRes_4_11 <= 11'h000;
      _zz_compRes_4_12 <= 11'h000;
      _zz_compRes_4_13 <= 11'h000;
      _zz_compRes_4_14 <= 11'h000;
      _zz_compRes_4_15 <= 11'h000;
    end else begin
      _zz_stg1Outs_0_dat <= ((io_ins_31 < io_ins_0) ? io_ins_0 : io_ins_31);
      _zz_stg1Outs_1_dat <= ((io_ins_30 < io_ins_1) ? io_ins_1 : io_ins_30);
      _zz_stg1Outs_2_dat <= ((io_ins_29 < io_ins_2) ? io_ins_2 : io_ins_29);
      _zz_stg1Outs_3_dat <= ((io_ins_28 < io_ins_3) ? io_ins_3 : io_ins_28);
      _zz_stg1Outs_4_dat <= ((io_ins_27 < io_ins_4) ? io_ins_4 : io_ins_27);
      _zz_stg1Outs_5_dat <= ((io_ins_26 < io_ins_5) ? io_ins_5 : io_ins_26);
      _zz_stg1Outs_6_dat <= ((io_ins_25 < io_ins_6) ? io_ins_6 : io_ins_25);
      _zz_stg1Outs_7_dat <= ((io_ins_24 < io_ins_7) ? io_ins_7 : io_ins_24);
      _zz_stg1Outs_8_dat <= ((io_ins_23 < io_ins_8) ? io_ins_8 : io_ins_23);
      _zz_stg1Outs_9_dat <= ((io_ins_22 < io_ins_9) ? io_ins_9 : io_ins_22);
      _zz_stg1Outs_10_dat <= ((io_ins_21 < io_ins_10) ? io_ins_10 : io_ins_21);
      _zz_stg1Outs_11_dat <= ((io_ins_20 < io_ins_11) ? io_ins_11 : io_ins_20);
      _zz_stg1Outs_12_dat <= ((io_ins_19 < io_ins_12) ? io_ins_12 : io_ins_19);
      _zz_stg1Outs_13_dat <= ((io_ins_18 < io_ins_13) ? io_ins_13 : io_ins_18);
      _zz_stg1Outs_14_dat <= ((io_ins_17 < io_ins_14) ? io_ins_14 : io_ins_17);
      _zz_stg1Outs_15_dat <= ((io_ins_16 < io_ins_15) ? io_ins_15 : io_ins_16);
      if(when_RedundancyRemover_l155) begin
        _zz_compRes_1_0 <= compRes_0_0;
        _zz_compRes_1_8 <= compRes_0_8;
      end else begin
        if(when_RedundancyRemover_l158) begin
          _zz_compRes_1_0 <= 11'h400;
          _zz_compRes_1_8 <= compRes_0_0;
        end else begin
          if(when_RedundancyRemover_l161) begin
            _zz_compRes_1_0 <= compRes_0_8;
            _zz_compRes_1_8 <= compRes_0_0;
          end else begin
            _zz_compRes_1_0 <= compRes_0_0;
            _zz_compRes_1_8 <= compRes_0_8;
          end
        end
      end
      if(when_RedundancyRemover_l155_1) begin
        _zz_compRes_1_1 <= compRes_0_1;
        _zz_compRes_1_9 <= compRes_0_9;
      end else begin
        if(when_RedundancyRemover_l158_1) begin
          _zz_compRes_1_1 <= 11'h400;
          _zz_compRes_1_9 <= compRes_0_1;
        end else begin
          if(when_RedundancyRemover_l161_1) begin
            _zz_compRes_1_1 <= compRes_0_9;
            _zz_compRes_1_9 <= compRes_0_1;
          end else begin
            _zz_compRes_1_1 <= compRes_0_1;
            _zz_compRes_1_9 <= compRes_0_9;
          end
        end
      end
      if(when_RedundancyRemover_l155_2) begin
        _zz_compRes_1_2 <= compRes_0_2;
        _zz_compRes_1_10 <= compRes_0_10;
      end else begin
        if(when_RedundancyRemover_l158_2) begin
          _zz_compRes_1_2 <= 11'h400;
          _zz_compRes_1_10 <= compRes_0_2;
        end else begin
          if(when_RedundancyRemover_l161_2) begin
            _zz_compRes_1_2 <= compRes_0_10;
            _zz_compRes_1_10 <= compRes_0_2;
          end else begin
            _zz_compRes_1_2 <= compRes_0_2;
            _zz_compRes_1_10 <= compRes_0_10;
          end
        end
      end
      if(when_RedundancyRemover_l155_3) begin
        _zz_compRes_1_3 <= compRes_0_3;
        _zz_compRes_1_11 <= compRes_0_11;
      end else begin
        if(when_RedundancyRemover_l158_3) begin
          _zz_compRes_1_3 <= 11'h400;
          _zz_compRes_1_11 <= compRes_0_3;
        end else begin
          if(when_RedundancyRemover_l161_3) begin
            _zz_compRes_1_3 <= compRes_0_11;
            _zz_compRes_1_11 <= compRes_0_3;
          end else begin
            _zz_compRes_1_3 <= compRes_0_3;
            _zz_compRes_1_11 <= compRes_0_11;
          end
        end
      end
      if(when_RedundancyRemover_l155_4) begin
        _zz_compRes_1_4 <= compRes_0_4;
        _zz_compRes_1_12 <= compRes_0_12;
      end else begin
        if(when_RedundancyRemover_l158_4) begin
          _zz_compRes_1_4 <= 11'h400;
          _zz_compRes_1_12 <= compRes_0_4;
        end else begin
          if(when_RedundancyRemover_l161_4) begin
            _zz_compRes_1_4 <= compRes_0_12;
            _zz_compRes_1_12 <= compRes_0_4;
          end else begin
            _zz_compRes_1_4 <= compRes_0_4;
            _zz_compRes_1_12 <= compRes_0_12;
          end
        end
      end
      if(when_RedundancyRemover_l155_5) begin
        _zz_compRes_1_5 <= compRes_0_5;
        _zz_compRes_1_13 <= compRes_0_13;
      end else begin
        if(when_RedundancyRemover_l158_5) begin
          _zz_compRes_1_5 <= 11'h400;
          _zz_compRes_1_13 <= compRes_0_5;
        end else begin
          if(when_RedundancyRemover_l161_5) begin
            _zz_compRes_1_5 <= compRes_0_13;
            _zz_compRes_1_13 <= compRes_0_5;
          end else begin
            _zz_compRes_1_5 <= compRes_0_5;
            _zz_compRes_1_13 <= compRes_0_13;
          end
        end
      end
      if(when_RedundancyRemover_l155_6) begin
        _zz_compRes_1_6 <= compRes_0_6;
        _zz_compRes_1_14 <= compRes_0_14;
      end else begin
        if(when_RedundancyRemover_l158_6) begin
          _zz_compRes_1_6 <= 11'h400;
          _zz_compRes_1_14 <= compRes_0_6;
        end else begin
          if(when_RedundancyRemover_l161_6) begin
            _zz_compRes_1_6 <= compRes_0_14;
            _zz_compRes_1_14 <= compRes_0_6;
          end else begin
            _zz_compRes_1_6 <= compRes_0_6;
            _zz_compRes_1_14 <= compRes_0_14;
          end
        end
      end
      if(when_RedundancyRemover_l155_7) begin
        _zz_compRes_1_7 <= compRes_0_7;
        _zz_compRes_1_15 <= compRes_0_15;
      end else begin
        if(when_RedundancyRemover_l158_7) begin
          _zz_compRes_1_7 <= 11'h400;
          _zz_compRes_1_15 <= compRes_0_7;
        end else begin
          if(when_RedundancyRemover_l161_7) begin
            _zz_compRes_1_7 <= compRes_0_15;
            _zz_compRes_1_15 <= compRes_0_7;
          end else begin
            _zz_compRes_1_7 <= compRes_0_7;
            _zz_compRes_1_15 <= compRes_0_15;
          end
        end
      end
      if(when_RedundancyRemover_l155_8) begin
        _zz_compRes_2_0 <= compRes_1_0;
        _zz_compRes_2_4 <= compRes_1_4;
      end else begin
        if(when_RedundancyRemover_l158_8) begin
          _zz_compRes_2_0 <= 11'h400;
          _zz_compRes_2_4 <= compRes_1_0;
        end else begin
          if(when_RedundancyRemover_l161_8) begin
            _zz_compRes_2_0 <= compRes_1_4;
            _zz_compRes_2_4 <= compRes_1_0;
          end else begin
            _zz_compRes_2_0 <= compRes_1_0;
            _zz_compRes_2_4 <= compRes_1_4;
          end
        end
      end
      if(when_RedundancyRemover_l155_9) begin
        _zz_compRes_2_1 <= compRes_1_1;
        _zz_compRes_2_5 <= compRes_1_5;
      end else begin
        if(when_RedundancyRemover_l158_9) begin
          _zz_compRes_2_1 <= 11'h400;
          _zz_compRes_2_5 <= compRes_1_1;
        end else begin
          if(when_RedundancyRemover_l161_9) begin
            _zz_compRes_2_1 <= compRes_1_5;
            _zz_compRes_2_5 <= compRes_1_1;
          end else begin
            _zz_compRes_2_1 <= compRes_1_1;
            _zz_compRes_2_5 <= compRes_1_5;
          end
        end
      end
      if(when_RedundancyRemover_l155_10) begin
        _zz_compRes_2_2 <= compRes_1_2;
        _zz_compRes_2_6 <= compRes_1_6;
      end else begin
        if(when_RedundancyRemover_l158_10) begin
          _zz_compRes_2_2 <= 11'h400;
          _zz_compRes_2_6 <= compRes_1_2;
        end else begin
          if(when_RedundancyRemover_l161_10) begin
            _zz_compRes_2_2 <= compRes_1_6;
            _zz_compRes_2_6 <= compRes_1_2;
          end else begin
            _zz_compRes_2_2 <= compRes_1_2;
            _zz_compRes_2_6 <= compRes_1_6;
          end
        end
      end
      if(when_RedundancyRemover_l155_11) begin
        _zz_compRes_2_3 <= compRes_1_3;
        _zz_compRes_2_7 <= compRes_1_7;
      end else begin
        if(when_RedundancyRemover_l158_11) begin
          _zz_compRes_2_3 <= 11'h400;
          _zz_compRes_2_7 <= compRes_1_3;
        end else begin
          if(when_RedundancyRemover_l161_11) begin
            _zz_compRes_2_3 <= compRes_1_7;
            _zz_compRes_2_7 <= compRes_1_3;
          end else begin
            _zz_compRes_2_3 <= compRes_1_3;
            _zz_compRes_2_7 <= compRes_1_7;
          end
        end
      end
      if(when_RedundancyRemover_l155_12) begin
        _zz_compRes_2_8 <= compRes_1_8;
        _zz_compRes_2_12 <= compRes_1_12;
      end else begin
        if(when_RedundancyRemover_l158_12) begin
          _zz_compRes_2_8 <= 11'h400;
          _zz_compRes_2_12 <= compRes_1_8;
        end else begin
          if(when_RedundancyRemover_l161_12) begin
            _zz_compRes_2_8 <= compRes_1_12;
            _zz_compRes_2_12 <= compRes_1_8;
          end else begin
            _zz_compRes_2_8 <= compRes_1_8;
            _zz_compRes_2_12 <= compRes_1_12;
          end
        end
      end
      if(when_RedundancyRemover_l155_13) begin
        _zz_compRes_2_9 <= compRes_1_9;
        _zz_compRes_2_13 <= compRes_1_13;
      end else begin
        if(when_RedundancyRemover_l158_13) begin
          _zz_compRes_2_9 <= 11'h400;
          _zz_compRes_2_13 <= compRes_1_9;
        end else begin
          if(when_RedundancyRemover_l161_13) begin
            _zz_compRes_2_9 <= compRes_1_13;
            _zz_compRes_2_13 <= compRes_1_9;
          end else begin
            _zz_compRes_2_9 <= compRes_1_9;
            _zz_compRes_2_13 <= compRes_1_13;
          end
        end
      end
      if(when_RedundancyRemover_l155_14) begin
        _zz_compRes_2_10 <= compRes_1_10;
        _zz_compRes_2_14 <= compRes_1_14;
      end else begin
        if(when_RedundancyRemover_l158_14) begin
          _zz_compRes_2_10 <= 11'h400;
          _zz_compRes_2_14 <= compRes_1_10;
        end else begin
          if(when_RedundancyRemover_l161_14) begin
            _zz_compRes_2_10 <= compRes_1_14;
            _zz_compRes_2_14 <= compRes_1_10;
          end else begin
            _zz_compRes_2_10 <= compRes_1_10;
            _zz_compRes_2_14 <= compRes_1_14;
          end
        end
      end
      if(when_RedundancyRemover_l155_15) begin
        _zz_compRes_2_11 <= compRes_1_11;
        _zz_compRes_2_15 <= compRes_1_15;
      end else begin
        if(when_RedundancyRemover_l158_15) begin
          _zz_compRes_2_11 <= 11'h400;
          _zz_compRes_2_15 <= compRes_1_11;
        end else begin
          if(when_RedundancyRemover_l161_15) begin
            _zz_compRes_2_11 <= compRes_1_15;
            _zz_compRes_2_15 <= compRes_1_11;
          end else begin
            _zz_compRes_2_11 <= compRes_1_11;
            _zz_compRes_2_15 <= compRes_1_15;
          end
        end
      end
      if(when_RedundancyRemover_l155_16) begin
        _zz_compRes_3_0 <= compRes_2_0;
        _zz_compRes_3_2 <= compRes_2_2;
      end else begin
        if(when_RedundancyRemover_l158_16) begin
          _zz_compRes_3_0 <= 11'h400;
          _zz_compRes_3_2 <= compRes_2_0;
        end else begin
          if(when_RedundancyRemover_l161_16) begin
            _zz_compRes_3_0 <= compRes_2_2;
            _zz_compRes_3_2 <= compRes_2_0;
          end else begin
            _zz_compRes_3_0 <= compRes_2_0;
            _zz_compRes_3_2 <= compRes_2_2;
          end
        end
      end
      if(when_RedundancyRemover_l155_17) begin
        _zz_compRes_3_1 <= compRes_2_1;
        _zz_compRes_3_3 <= compRes_2_3;
      end else begin
        if(when_RedundancyRemover_l158_17) begin
          _zz_compRes_3_1 <= 11'h400;
          _zz_compRes_3_3 <= compRes_2_1;
        end else begin
          if(when_RedundancyRemover_l161_17) begin
            _zz_compRes_3_1 <= compRes_2_3;
            _zz_compRes_3_3 <= compRes_2_1;
          end else begin
            _zz_compRes_3_1 <= compRes_2_1;
            _zz_compRes_3_3 <= compRes_2_3;
          end
        end
      end
      if(when_RedundancyRemover_l155_18) begin
        _zz_compRes_3_4 <= compRes_2_4;
        _zz_compRes_3_6 <= compRes_2_6;
      end else begin
        if(when_RedundancyRemover_l158_18) begin
          _zz_compRes_3_4 <= 11'h400;
          _zz_compRes_3_6 <= compRes_2_4;
        end else begin
          if(when_RedundancyRemover_l161_18) begin
            _zz_compRes_3_4 <= compRes_2_6;
            _zz_compRes_3_6 <= compRes_2_4;
          end else begin
            _zz_compRes_3_4 <= compRes_2_4;
            _zz_compRes_3_6 <= compRes_2_6;
          end
        end
      end
      if(when_RedundancyRemover_l155_19) begin
        _zz_compRes_3_5 <= compRes_2_5;
        _zz_compRes_3_7 <= compRes_2_7;
      end else begin
        if(when_RedundancyRemover_l158_19) begin
          _zz_compRes_3_5 <= 11'h400;
          _zz_compRes_3_7 <= compRes_2_5;
        end else begin
          if(when_RedundancyRemover_l161_19) begin
            _zz_compRes_3_5 <= compRes_2_7;
            _zz_compRes_3_7 <= compRes_2_5;
          end else begin
            _zz_compRes_3_5 <= compRes_2_5;
            _zz_compRes_3_7 <= compRes_2_7;
          end
        end
      end
      if(when_RedundancyRemover_l155_20) begin
        _zz_compRes_3_8 <= compRes_2_8;
        _zz_compRes_3_10 <= compRes_2_10;
      end else begin
        if(when_RedundancyRemover_l158_20) begin
          _zz_compRes_3_8 <= 11'h400;
          _zz_compRes_3_10 <= compRes_2_8;
        end else begin
          if(when_RedundancyRemover_l161_20) begin
            _zz_compRes_3_8 <= compRes_2_10;
            _zz_compRes_3_10 <= compRes_2_8;
          end else begin
            _zz_compRes_3_8 <= compRes_2_8;
            _zz_compRes_3_10 <= compRes_2_10;
          end
        end
      end
      if(when_RedundancyRemover_l155_21) begin
        _zz_compRes_3_9 <= compRes_2_9;
        _zz_compRes_3_11 <= compRes_2_11;
      end else begin
        if(when_RedundancyRemover_l158_21) begin
          _zz_compRes_3_9 <= 11'h400;
          _zz_compRes_3_11 <= compRes_2_9;
        end else begin
          if(when_RedundancyRemover_l161_21) begin
            _zz_compRes_3_9 <= compRes_2_11;
            _zz_compRes_3_11 <= compRes_2_9;
          end else begin
            _zz_compRes_3_9 <= compRes_2_9;
            _zz_compRes_3_11 <= compRes_2_11;
          end
        end
      end
      if(when_RedundancyRemover_l155_22) begin
        _zz_compRes_3_12 <= compRes_2_12;
        _zz_compRes_3_14 <= compRes_2_14;
      end else begin
        if(when_RedundancyRemover_l158_22) begin
          _zz_compRes_3_12 <= 11'h400;
          _zz_compRes_3_14 <= compRes_2_12;
        end else begin
          if(when_RedundancyRemover_l161_22) begin
            _zz_compRes_3_12 <= compRes_2_14;
            _zz_compRes_3_14 <= compRes_2_12;
          end else begin
            _zz_compRes_3_12 <= compRes_2_12;
            _zz_compRes_3_14 <= compRes_2_14;
          end
        end
      end
      if(when_RedundancyRemover_l155_23) begin
        _zz_compRes_3_13 <= compRes_2_13;
        _zz_compRes_3_15 <= compRes_2_15;
      end else begin
        if(when_RedundancyRemover_l158_23) begin
          _zz_compRes_3_13 <= 11'h400;
          _zz_compRes_3_15 <= compRes_2_13;
        end else begin
          if(when_RedundancyRemover_l161_23) begin
            _zz_compRes_3_13 <= compRes_2_15;
            _zz_compRes_3_15 <= compRes_2_13;
          end else begin
            _zz_compRes_3_13 <= compRes_2_13;
            _zz_compRes_3_15 <= compRes_2_15;
          end
        end
      end
      if(when_RedundancyRemover_l155_24) begin
        _zz_compRes_4_0 <= compRes_3_0;
        _zz_compRes_4_1 <= compRes_3_1;
      end else begin
        if(when_RedundancyRemover_l158_24) begin
          _zz_compRes_4_0 <= 11'h400;
          _zz_compRes_4_1 <= compRes_3_0;
        end else begin
          if(when_RedundancyRemover_l161_24) begin
            _zz_compRes_4_0 <= compRes_3_1;
            _zz_compRes_4_1 <= compRes_3_0;
          end else begin
            _zz_compRes_4_0 <= compRes_3_0;
            _zz_compRes_4_1 <= compRes_3_1;
          end
        end
      end
      if(when_RedundancyRemover_l155_25) begin
        _zz_compRes_4_2 <= compRes_3_2;
        _zz_compRes_4_3 <= compRes_3_3;
      end else begin
        if(when_RedundancyRemover_l158_25) begin
          _zz_compRes_4_2 <= 11'h400;
          _zz_compRes_4_3 <= compRes_3_2;
        end else begin
          if(when_RedundancyRemover_l161_25) begin
            _zz_compRes_4_2 <= compRes_3_3;
            _zz_compRes_4_3 <= compRes_3_2;
          end else begin
            _zz_compRes_4_2 <= compRes_3_2;
            _zz_compRes_4_3 <= compRes_3_3;
          end
        end
      end
      if(when_RedundancyRemover_l155_26) begin
        _zz_compRes_4_4 <= compRes_3_4;
        _zz_compRes_4_5 <= compRes_3_5;
      end else begin
        if(when_RedundancyRemover_l158_26) begin
          _zz_compRes_4_4 <= 11'h400;
          _zz_compRes_4_5 <= compRes_3_4;
        end else begin
          if(when_RedundancyRemover_l161_26) begin
            _zz_compRes_4_4 <= compRes_3_5;
            _zz_compRes_4_5 <= compRes_3_4;
          end else begin
            _zz_compRes_4_4 <= compRes_3_4;
            _zz_compRes_4_5 <= compRes_3_5;
          end
        end
      end
      if(when_RedundancyRemover_l155_27) begin
        _zz_compRes_4_6 <= compRes_3_6;
        _zz_compRes_4_7 <= compRes_3_7;
      end else begin
        if(when_RedundancyRemover_l158_27) begin
          _zz_compRes_4_6 <= 11'h400;
          _zz_compRes_4_7 <= compRes_3_6;
        end else begin
          if(when_RedundancyRemover_l161_27) begin
            _zz_compRes_4_6 <= compRes_3_7;
            _zz_compRes_4_7 <= compRes_3_6;
          end else begin
            _zz_compRes_4_6 <= compRes_3_6;
            _zz_compRes_4_7 <= compRes_3_7;
          end
        end
      end
      if(when_RedundancyRemover_l155_28) begin
        _zz_compRes_4_8 <= compRes_3_8;
        _zz_compRes_4_9 <= compRes_3_9;
      end else begin
        if(when_RedundancyRemover_l158_28) begin
          _zz_compRes_4_8 <= 11'h400;
          _zz_compRes_4_9 <= compRes_3_8;
        end else begin
          if(when_RedundancyRemover_l161_28) begin
            _zz_compRes_4_8 <= compRes_3_9;
            _zz_compRes_4_9 <= compRes_3_8;
          end else begin
            _zz_compRes_4_8 <= compRes_3_8;
            _zz_compRes_4_9 <= compRes_3_9;
          end
        end
      end
      if(when_RedundancyRemover_l155_29) begin
        _zz_compRes_4_10 <= compRes_3_10;
        _zz_compRes_4_11 <= compRes_3_11;
      end else begin
        if(when_RedundancyRemover_l158_29) begin
          _zz_compRes_4_10 <= 11'h400;
          _zz_compRes_4_11 <= compRes_3_10;
        end else begin
          if(when_RedundancyRemover_l161_29) begin
            _zz_compRes_4_10 <= compRes_3_11;
            _zz_compRes_4_11 <= compRes_3_10;
          end else begin
            _zz_compRes_4_10 <= compRes_3_10;
            _zz_compRes_4_11 <= compRes_3_11;
          end
        end
      end
      if(when_RedundancyRemover_l155_30) begin
        _zz_compRes_4_12 <= compRes_3_12;
        _zz_compRes_4_13 <= compRes_3_13;
      end else begin
        if(when_RedundancyRemover_l158_30) begin
          _zz_compRes_4_12 <= 11'h400;
          _zz_compRes_4_13 <= compRes_3_12;
        end else begin
          if(when_RedundancyRemover_l161_30) begin
            _zz_compRes_4_12 <= compRes_3_13;
            _zz_compRes_4_13 <= compRes_3_12;
          end else begin
            _zz_compRes_4_12 <= compRes_3_12;
            _zz_compRes_4_13 <= compRes_3_13;
          end
        end
      end
      if(when_RedundancyRemover_l155_31) begin
        _zz_compRes_4_14 <= compRes_3_14;
        _zz_compRes_4_15 <= compRes_3_15;
      end else begin
        if(when_RedundancyRemover_l158_31) begin
          _zz_compRes_4_14 <= 11'h400;
          _zz_compRes_4_15 <= compRes_3_14;
        end else begin
          if(when_RedundancyRemover_l161_31) begin
            _zz_compRes_4_14 <= compRes_3_15;
            _zz_compRes_4_15 <= compRes_3_14;
          end else begin
            _zz_compRes_4_14 <= compRes_3_14;
            _zz_compRes_4_15 <= compRes_3_15;
          end
        end
      end
    end
  end


endmodule
