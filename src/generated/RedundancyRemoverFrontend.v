// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemoverFrontend
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemoverFrontend (
  input  wire [10:0]   io_upperIns_0,
  input  wire [10:0]   io_upperIns_1,
  input  wire [10:0]   io_upperIns_2,
  input  wire [10:0]   io_upperIns_3,
  input  wire [10:0]   io_upperIns_4,
  input  wire [10:0]   io_upperIns_5,
  input  wire [10:0]   io_upperIns_6,
  input  wire [10:0]   io_upperIns_7,
  input  wire [10:0]   io_lowerIns_0,
  input  wire [10:0]   io_lowerIns_1,
  input  wire [10:0]   io_lowerIns_2,
  input  wire [10:0]   io_lowerIns_3,
  input  wire [10:0]   io_lowerIns_4,
  input  wire [10:0]   io_lowerIns_5,
  input  wire [10:0]   io_lowerIns_6,
  input  wire [10:0]   io_lowerIns_7,
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
  output wire [10:0]   io_outs_16,
  output wire [10:0]   io_outs_17,
  output wire [10:0]   io_outs_18,
  output wire [10:0]   io_outs_19,
  output wire [10:0]   io_outs_20,
  output wire [10:0]   io_outs_21,
  output wire [10:0]   io_outs_22,
  output wire [10:0]   io_outs_23,
  output wire [10:0]   io_outs_24,
  output wire [10:0]   io_outs_25,
  output wire [10:0]   io_outs_26,
  output wire [10:0]   io_outs_27,
  output wire [10:0]   io_outs_28,
  output wire [10:0]   io_outs_29,
  output wire [10:0]   io_outs_30,
  output wire [10:0]   io_outs_31,
  input  wire          io_fifoPopSig_0,
  input  wire          io_fifoPopSig_1,
  input  wire          io_fifoPopSig_2,
  input  wire          io_fifoPopSig_3,
  input  wire          io_fifoPopSig_4,
  input  wire          io_fifoPopSig_5,
  input  wire          io_fifoPopSig_6,
  input  wire          io_fifoPopSig_7,
  input  wire          io_fifoPopSig_8,
  input  wire          io_fifoPopSig_9,
  input  wire          io_fifoPopSig_10,
  input  wire          io_fifoPopSig_11,
  input  wire          io_fifoPopSig_12,
  input  wire          io_fifoPopSig_13,
  input  wire          io_fifoPopSig_14,
  input  wire          io_fifoPopSig_15,
  input  wire          clk,
  input  wire          clrn
);

  wire                topRemoverFrontend_fifos_0_io_push_valid;
  wire                topRemoverFrontend_fifos_0_io_flush;
  wire                topRemoverFrontend_fifos_1_io_push_valid;
  wire                topRemoverFrontend_fifos_1_io_flush;
  wire                topRemoverFrontend_fifos_2_io_push_valid;
  wire                topRemoverFrontend_fifos_2_io_flush;
  wire                topRemoverFrontend_fifos_3_io_push_valid;
  wire                topRemoverFrontend_fifos_3_io_flush;
  wire                topRemoverFrontend_fifos_4_io_push_valid;
  wire                topRemoverFrontend_fifos_4_io_flush;
  wire                topRemoverFrontend_fifos_5_io_push_valid;
  wire                topRemoverFrontend_fifos_5_io_flush;
  wire                topRemoverFrontend_fifos_6_io_push_valid;
  wire                topRemoverFrontend_fifos_6_io_flush;
  wire                topRemoverFrontend_fifos_7_io_push_valid;
  wire                topRemoverFrontend_fifos_7_io_flush;
  wire                topRemoverFrontend_fifos_8_io_push_valid;
  wire                topRemoverFrontend_fifos_8_io_flush;
  wire                topRemoverFrontend_fifos_9_io_push_valid;
  wire                topRemoverFrontend_fifos_9_io_flush;
  wire                topRemoverFrontend_fifos_10_io_push_valid;
  wire                topRemoverFrontend_fifos_10_io_flush;
  wire                topRemoverFrontend_fifos_11_io_push_valid;
  wire                topRemoverFrontend_fifos_11_io_flush;
  wire                topRemoverFrontend_fifos_12_io_push_valid;
  wire                topRemoverFrontend_fifos_12_io_flush;
  wire                topRemoverFrontend_fifos_13_io_push_valid;
  wire                topRemoverFrontend_fifos_13_io_flush;
  wire                topRemoverFrontend_fifos_14_io_push_valid;
  wire                topRemoverFrontend_fifos_14_io_flush;
  wire                topRemoverFrontend_fifos_15_io_push_valid;
  wire                topRemoverFrontend_fifos_15_io_flush;
  wire                botRemoverFrontend_fifos_0_io_push_valid;
  wire                botRemoverFrontend_fifos_0_io_flush;
  wire                botRemoverFrontend_fifos_1_io_push_valid;
  wire                botRemoverFrontend_fifos_1_io_flush;
  wire                botRemoverFrontend_fifos_2_io_push_valid;
  wire                botRemoverFrontend_fifos_2_io_flush;
  wire                botRemoverFrontend_fifos_3_io_push_valid;
  wire                botRemoverFrontend_fifos_3_io_flush;
  wire                botRemoverFrontend_fifos_4_io_push_valid;
  wire                botRemoverFrontend_fifos_4_io_flush;
  wire                botRemoverFrontend_fifos_5_io_push_valid;
  wire                botRemoverFrontend_fifos_5_io_flush;
  wire                botRemoverFrontend_fifos_6_io_push_valid;
  wire                botRemoverFrontend_fifos_6_io_flush;
  wire                botRemoverFrontend_fifos_7_io_push_valid;
  wire                botRemoverFrontend_fifos_7_io_flush;
  wire                botRemoverFrontend_fifos_8_io_push_valid;
  wire                botRemoverFrontend_fifos_8_io_flush;
  wire                botRemoverFrontend_fifos_9_io_push_valid;
  wire                botRemoverFrontend_fifos_9_io_flush;
  wire                botRemoverFrontend_fifos_10_io_push_valid;
  wire                botRemoverFrontend_fifos_10_io_flush;
  wire                botRemoverFrontend_fifos_11_io_push_valid;
  wire                botRemoverFrontend_fifos_11_io_flush;
  wire                botRemoverFrontend_fifos_12_io_push_valid;
  wire                botRemoverFrontend_fifos_12_io_flush;
  wire                botRemoverFrontend_fifos_13_io_push_valid;
  wire                botRemoverFrontend_fifos_13_io_flush;
  wire                botRemoverFrontend_fifos_14_io_push_valid;
  wire                botRemoverFrontend_fifos_14_io_flush;
  wire                botRemoverFrontend_fifos_15_io_push_valid;
  wire                botRemoverFrontend_fifos_15_io_flush;
  wire                topRemoverFrontend_fifos_0_io_push_ready;
  wire                topRemoverFrontend_fifos_0_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_0_io_pop_payload;
  wire                topRemoverFrontend_fifos_1_io_push_ready;
  wire                topRemoverFrontend_fifos_1_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_1_io_pop_payload;
  wire                topRemoverFrontend_fifos_2_io_push_ready;
  wire                topRemoverFrontend_fifos_2_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_2_io_pop_payload;
  wire                topRemoverFrontend_fifos_3_io_push_ready;
  wire                topRemoverFrontend_fifos_3_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_3_io_pop_payload;
  wire                topRemoverFrontend_fifos_4_io_push_ready;
  wire                topRemoverFrontend_fifos_4_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_4_io_pop_payload;
  wire                topRemoverFrontend_fifos_5_io_push_ready;
  wire                topRemoverFrontend_fifos_5_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_5_io_pop_payload;
  wire                topRemoverFrontend_fifos_6_io_push_ready;
  wire                topRemoverFrontend_fifos_6_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_6_io_pop_payload;
  wire                topRemoverFrontend_fifos_7_io_push_ready;
  wire                topRemoverFrontend_fifos_7_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_7_io_pop_payload;
  wire                topRemoverFrontend_fifos_8_io_push_ready;
  wire                topRemoverFrontend_fifos_8_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_8_io_pop_payload;
  wire                topRemoverFrontend_fifos_9_io_push_ready;
  wire                topRemoverFrontend_fifos_9_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_9_io_pop_payload;
  wire                topRemoverFrontend_fifos_10_io_push_ready;
  wire                topRemoverFrontend_fifos_10_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_10_io_pop_payload;
  wire                topRemoverFrontend_fifos_11_io_push_ready;
  wire                topRemoverFrontend_fifos_11_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_11_io_pop_payload;
  wire                topRemoverFrontend_fifos_12_io_push_ready;
  wire                topRemoverFrontend_fifos_12_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_12_io_pop_payload;
  wire                topRemoverFrontend_fifos_13_io_push_ready;
  wire                topRemoverFrontend_fifos_13_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_13_io_pop_payload;
  wire                topRemoverFrontend_fifos_14_io_push_ready;
  wire                topRemoverFrontend_fifos_14_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_14_io_pop_payload;
  wire                topRemoverFrontend_fifos_15_io_push_ready;
  wire                topRemoverFrontend_fifos_15_io_pop_valid;
  wire       [10:0]   topRemoverFrontend_fifos_15_io_pop_payload;
  wire                botRemoverFrontend_fifos_0_io_push_ready;
  wire                botRemoverFrontend_fifos_0_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_0_io_pop_payload;
  wire                botRemoverFrontend_fifos_1_io_push_ready;
  wire                botRemoverFrontend_fifos_1_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_1_io_pop_payload;
  wire                botRemoverFrontend_fifos_2_io_push_ready;
  wire                botRemoverFrontend_fifos_2_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_2_io_pop_payload;
  wire                botRemoverFrontend_fifos_3_io_push_ready;
  wire                botRemoverFrontend_fifos_3_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_3_io_pop_payload;
  wire                botRemoverFrontend_fifos_4_io_push_ready;
  wire                botRemoverFrontend_fifos_4_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_4_io_pop_payload;
  wire                botRemoverFrontend_fifos_5_io_push_ready;
  wire                botRemoverFrontend_fifos_5_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_5_io_pop_payload;
  wire                botRemoverFrontend_fifos_6_io_push_ready;
  wire                botRemoverFrontend_fifos_6_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_6_io_pop_payload;
  wire                botRemoverFrontend_fifos_7_io_push_ready;
  wire                botRemoverFrontend_fifos_7_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_7_io_pop_payload;
  wire                botRemoverFrontend_fifos_8_io_push_ready;
  wire                botRemoverFrontend_fifos_8_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_8_io_pop_payload;
  wire                botRemoverFrontend_fifos_9_io_push_ready;
  wire                botRemoverFrontend_fifos_9_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_9_io_pop_payload;
  wire                botRemoverFrontend_fifos_10_io_push_ready;
  wire                botRemoverFrontend_fifos_10_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_10_io_pop_payload;
  wire                botRemoverFrontend_fifos_11_io_push_ready;
  wire                botRemoverFrontend_fifos_11_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_11_io_pop_payload;
  wire                botRemoverFrontend_fifos_12_io_push_ready;
  wire                botRemoverFrontend_fifos_12_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_12_io_pop_payload;
  wire                botRemoverFrontend_fifos_13_io_push_ready;
  wire                botRemoverFrontend_fifos_13_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_13_io_pop_payload;
  wire                botRemoverFrontend_fifos_14_io_push_ready;
  wire                botRemoverFrontend_fifos_14_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_14_io_pop_payload;
  wire                botRemoverFrontend_fifos_15_io_push_ready;
  wire                botRemoverFrontend_fifos_15_io_pop_valid;
  wire       [10:0]   botRemoverFrontend_fifos_15_io_pop_payload;
  wire       [3:0]    _zz_topRemoverFrontend_rotateInOffset_10;
  wire       [0:0]    _zz_topRemoverFrontend_rateOut;
  wire       [4:0]    _zz_topRemoverFrontend_rateOut_1;
  wire       [4:0]    _zz_topRemoverFrontend_rotateOutOffset_17;
  wire       [4:0]    _zz_topRemoverFrontend_rotateOutOffset_18;
  wire       [4:0]    _zz_topRemoverFrontend_rotateOutOffset_19;
  wire       [3:0]    _zz_botRemoverFrontend_rotateInOffset_10;
  wire       [0:0]    _zz_botRemoverFrontend_rateOut;
  wire       [4:0]    _zz_botRemoverFrontend_rateOut_1;
  wire       [4:0]    _zz_botRemoverFrontend_rotateOutOffset_17;
  wire       [4:0]    _zz_botRemoverFrontend_rotateOutOffset_18;
  wire       [4:0]    _zz_botRemoverFrontend_rotateOutOffset_19;
  reg        [3:0]    topRemoverFrontend_rotateInOffset;
  reg        [7:0]    topRemoverFrontend_rateIn;
  reg                 _zz_topRemoverFrontend_rateIn;
  reg                 _zz_topRemoverFrontend_rateIn_1;
  reg                 _zz_topRemoverFrontend_rateIn_2;
  reg                 _zz_topRemoverFrontend_rateIn_3;
  reg                 _zz_topRemoverFrontend_rateIn_4;
  reg                 _zz_topRemoverFrontend_rateIn_5;
  reg                 _zz_topRemoverFrontend_rateIn_6;
  reg                 _zz_topRemoverFrontend_rateIn_7;
  wire       [7:0]    _zz_topRemoverFrontend_rotateInOffset;
  reg        [8:0]    _zz_topRemoverFrontend_rotateInOffset_1;
  wire                _zz_topRemoverFrontend_rotateInOffset_2;
  wire                _zz_topRemoverFrontend_rotateInOffset_3;
  wire                _zz_topRemoverFrontend_rotateInOffset_4;
  wire                _zz_topRemoverFrontend_rotateInOffset_5;
  wire                _zz_topRemoverFrontend_rotateInOffset_6;
  wire                _zz_topRemoverFrontend_rotateInOffset_7;
  wire                _zz_topRemoverFrontend_rotateInOffset_8;
  wire                _zz_topRemoverFrontend_rotateInOffset_9;
  wire       [10:0]   _zz_io_push_valid;
  wire       [10:0]   _zz_io_push_valid_1;
  wire       [10:0]   _zz_io_push_valid_2;
  wire       [10:0]   _zz_io_push_valid_3;
  wire       [10:0]   _zz_io_push_valid_4;
  wire       [10:0]   _zz_io_push_valid_5;
  wire       [10:0]   _zz_io_push_valid_6;
  wire       [10:0]   _zz_io_push_valid_7;
  wire       [10:0]   _zz_io_push_valid_8;
  wire       [10:0]   _zz_io_push_valid_9;
  wire       [10:0]   _zz_io_push_valid_10;
  wire       [10:0]   _zz_io_push_valid_11;
  wire       [10:0]   _zz_io_push_valid_12;
  wire       [10:0]   _zz_io_push_valid_13;
  wire       [10:0]   _zz_io_push_valid_14;
  wire       [10:0]   _zz_io_push_valid_15;
  wire       [10:0]   _zz_io_push_valid_16;
  wire       [10:0]   _zz_io_push_valid_17;
  wire       [10:0]   _zz_io_push_valid_18;
  wire       [10:0]   _zz_io_push_valid_19;
  wire       [10:0]   _zz_io_push_valid_20;
  wire       [10:0]   _zz_io_push_valid_21;
  wire       [10:0]   _zz_io_push_valid_22;
  wire       [10:0]   _zz_io_push_valid_23;
  wire       [10:0]   _zz_io_push_valid_24;
  wire       [10:0]   _zz_io_push_valid_25;
  wire       [10:0]   _zz_io_push_valid_26;
  wire       [10:0]   _zz_io_push_valid_27;
  wire       [10:0]   _zz_io_push_valid_28;
  wire       [10:0]   _zz_io_push_valid_29;
  wire       [10:0]   _zz_io_push_valid_30;
  wire       [10:0]   _zz_io_push_valid_31;
  wire       [10:0]   _zz_io_push_valid_32;
  wire       [10:0]   _zz_io_push_valid_33;
  wire       [10:0]   _zz_io_push_valid_34;
  wire       [10:0]   _zz_io_push_valid_35;
  wire       [10:0]   _zz_io_push_valid_36;
  wire       [10:0]   _zz_io_push_valid_37;
  wire       [10:0]   _zz_io_push_valid_38;
  wire       [10:0]   _zz_io_push_valid_39;
  wire       [10:0]   _zz_io_push_valid_40;
  wire       [10:0]   _zz_io_push_valid_41;
  wire       [10:0]   _zz_io_push_valid_42;
  wire       [10:0]   _zz_io_push_valid_43;
  wire       [10:0]   _zz_io_push_valid_44;
  wire       [10:0]   _zz_io_push_valid_45;
  wire       [10:0]   _zz_io_push_valid_46;
  wire       [10:0]   _zz_io_push_valid_47;
  wire       [10:0]   _zz_io_push_valid_48;
  wire       [10:0]   _zz_io_push_valid_49;
  wire       [10:0]   _zz_io_push_valid_50;
  wire       [10:0]   _zz_io_push_valid_51;
  wire       [10:0]   _zz_io_push_valid_52;
  wire       [10:0]   _zz_io_push_valid_53;
  wire       [10:0]   _zz_io_push_valid_54;
  wire       [10:0]   _zz_io_push_valid_55;
  wire       [10:0]   _zz_io_push_valid_56;
  wire       [10:0]   _zz_io_push_valid_57;
  wire       [10:0]   _zz_io_push_valid_58;
  wire       [10:0]   _zz_io_push_valid_59;
  wire       [10:0]   _zz_io_push_valid_60;
  wire       [10:0]   _zz_io_push_valid_61;
  wire       [10:0]   _zz_io_push_valid_62;
  wire       [10:0]   _zz_io_push_valid_63;
  wire       [10:0]   _zz_io_push_valid_64;
  wire       [10:0]   _zz_io_push_valid_65;
  wire       [10:0]   _zz_io_push_valid_66;
  wire       [10:0]   _zz_io_push_valid_67;
  wire       [10:0]   _zz_io_push_valid_68;
  wire       [10:0]   _zz_io_push_valid_69;
  wire       [10:0]   _zz_io_push_valid_70;
  wire       [10:0]   _zz_io_push_valid_71;
  wire       [10:0]   _zz_io_push_valid_72;
  wire       [10:0]   _zz_io_push_valid_73;
  wire       [10:0]   _zz_io_push_valid_74;
  wire       [10:0]   _zz_io_push_valid_75;
  wire       [10:0]   _zz_io_push_valid_76;
  wire       [10:0]   _zz_io_push_valid_77;
  wire       [10:0]   _zz_io_push_valid_78;
  wire       [10:0]   _zz_io_push_valid_79;
  reg        [3:0]    topRemoverFrontend_rotateOutOffset;
  wire       [15:0]   topRemoverFrontend_rateOut;
  wire       [10:0]   topRemoverFrontend_fifoOuts_0;
  wire       [10:0]   topRemoverFrontend_fifoOuts_1;
  wire       [10:0]   topRemoverFrontend_fifoOuts_2;
  wire       [10:0]   topRemoverFrontend_fifoOuts_3;
  wire       [10:0]   topRemoverFrontend_fifoOuts_4;
  wire       [10:0]   topRemoverFrontend_fifoOuts_5;
  wire       [10:0]   topRemoverFrontend_fifoOuts_6;
  wire       [10:0]   topRemoverFrontend_fifoOuts_7;
  wire       [10:0]   topRemoverFrontend_fifoOuts_8;
  wire       [10:0]   topRemoverFrontend_fifoOuts_9;
  wire       [10:0]   topRemoverFrontend_fifoOuts_10;
  wire       [10:0]   topRemoverFrontend_fifoOuts_11;
  wire       [10:0]   topRemoverFrontend_fifoOuts_12;
  wire       [10:0]   topRemoverFrontend_fifoOuts_13;
  wire       [10:0]   topRemoverFrontend_fifoOuts_14;
  wire       [10:0]   topRemoverFrontend_fifoOuts_15;
  reg        [16:0]   _zz_topRemoverFrontend_rotateOutOffset;
  wire                _zz_topRemoverFrontend_rotateOutOffset_1;
  wire                _zz_topRemoverFrontend_rotateOutOffset_2;
  wire                _zz_topRemoverFrontend_rotateOutOffset_3;
  wire                _zz_topRemoverFrontend_rotateOutOffset_4;
  wire                _zz_topRemoverFrontend_rotateOutOffset_5;
  wire                _zz_topRemoverFrontend_rotateOutOffset_6;
  wire                _zz_topRemoverFrontend_rotateOutOffset_7;
  wire                _zz_topRemoverFrontend_rotateOutOffset_8;
  wire                _zz_topRemoverFrontend_rotateOutOffset_9;
  wire                _zz_topRemoverFrontend_rotateOutOffset_10;
  wire                _zz_topRemoverFrontend_rotateOutOffset_11;
  wire                _zz_topRemoverFrontend_rotateOutOffset_12;
  wire                _zz_topRemoverFrontend_rotateOutOffset_13;
  wire                _zz_topRemoverFrontend_rotateOutOffset_14;
  wire                _zz_topRemoverFrontend_rotateOutOffset_15;
  wire                _zz_topRemoverFrontend_rotateOutOffset_16;
  wire       [10:0]   _zz_io_outs_16;
  wire       [10:0]   _zz_io_outs_16_1;
  wire       [10:0]   _zz_io_outs_16_2;
  wire       [10:0]   _zz_io_outs_16_3;
  wire       [10:0]   _zz_io_outs_16_4;
  wire       [10:0]   _zz_io_outs_16_5;
  wire       [10:0]   _zz_io_outs_16_6;
  wire       [10:0]   _zz_io_outs_16_7;
  wire       [10:0]   _zz_io_outs_16_8;
  wire       [10:0]   _zz_io_outs_16_9;
  wire       [10:0]   _zz_io_outs_16_10;
  wire       [10:0]   _zz_io_outs_16_11;
  wire       [10:0]   _zz_io_outs_16_12;
  wire       [10:0]   _zz_io_outs_16_13;
  wire       [10:0]   _zz_io_outs_16_14;
  wire       [10:0]   _zz_io_outs_16_15;
  wire       [10:0]   _zz_io_outs_16_16;
  wire       [10:0]   _zz_io_outs_17;
  wire       [10:0]   _zz_io_outs_16_17;
  wire       [10:0]   _zz_io_outs_17_1;
  wire       [10:0]   _zz_io_outs_16_18;
  wire       [10:0]   _zz_io_outs_17_2;
  wire       [10:0]   _zz_io_outs_16_19;
  wire       [10:0]   _zz_io_outs_17_3;
  wire       [10:0]   _zz_io_outs_16_20;
  wire       [10:0]   _zz_io_outs_17_4;
  wire       [10:0]   _zz_io_outs_16_21;
  wire       [10:0]   _zz_io_outs_17_5;
  wire       [10:0]   _zz_io_outs_16_22;
  wire       [10:0]   _zz_io_outs_17_6;
  wire       [10:0]   _zz_io_outs_16_23;
  wire       [10:0]   _zz_io_outs_17_7;
  wire       [10:0]   _zz_io_outs_16_24;
  wire       [10:0]   _zz_io_outs_17_8;
  wire       [10:0]   _zz_io_outs_18;
  wire       [10:0]   _zz_io_outs_19;
  wire       [10:0]   _zz_io_outs_16_25;
  wire       [10:0]   _zz_io_outs_17_9;
  wire       [10:0]   _zz_io_outs_18_1;
  wire       [10:0]   _zz_io_outs_19_1;
  wire       [10:0]   _zz_io_outs_16_26;
  wire       [10:0]   _zz_io_outs_17_10;
  wire       [10:0]   _zz_io_outs_18_2;
  wire       [10:0]   _zz_io_outs_19_2;
  wire       [10:0]   _zz_io_outs_16_27;
  wire       [10:0]   _zz_io_outs_17_11;
  wire       [10:0]   _zz_io_outs_18_3;
  wire       [10:0]   _zz_io_outs_19_3;
  wire       [10:0]   _zz_io_outs_16_28;
  wire       [10:0]   _zz_io_outs_17_12;
  wire       [10:0]   _zz_io_outs_18_4;
  wire       [10:0]   _zz_io_outs_19_4;
  wire       [10:0]   _zz_io_outs_20;
  wire       [10:0]   _zz_io_outs_21;
  wire       [10:0]   _zz_io_outs_22;
  wire       [10:0]   _zz_io_outs_23;
  wire       [10:0]   _zz_io_outs_16_29;
  wire       [10:0]   _zz_io_outs_17_13;
  wire       [10:0]   _zz_io_outs_18_5;
  wire       [10:0]   _zz_io_outs_19_5;
  wire       [10:0]   _zz_io_outs_20_1;
  wire       [10:0]   _zz_io_outs_21_1;
  wire       [10:0]   _zz_io_outs_22_1;
  wire       [10:0]   _zz_io_outs_23_1;
  reg                 _zz_io_pop_ready;
  reg                 _zz_io_pop_ready_1;
  reg                 _zz_io_pop_ready_2;
  reg                 _zz_io_pop_ready_3;
  reg                 _zz_io_pop_ready_4;
  reg                 _zz_io_pop_ready_5;
  reg                 _zz_io_pop_ready_6;
  reg                 _zz_io_pop_ready_7;
  reg                 _zz_io_pop_ready_8;
  reg                 _zz_io_pop_ready_9;
  reg                 _zz_io_pop_ready_10;
  reg                 _zz_io_pop_ready_11;
  reg                 _zz_io_pop_ready_12;
  reg                 _zz_io_pop_ready_13;
  reg                 _zz_io_pop_ready_14;
  reg                 _zz_io_pop_ready_15;
  reg        [3:0]    botRemoverFrontend_rotateInOffset;
  reg        [7:0]    botRemoverFrontend_rateIn;
  reg                 _zz_botRemoverFrontend_rateIn;
  reg                 _zz_botRemoverFrontend_rateIn_1;
  reg                 _zz_botRemoverFrontend_rateIn_2;
  reg                 _zz_botRemoverFrontend_rateIn_3;
  reg                 _zz_botRemoverFrontend_rateIn_4;
  reg                 _zz_botRemoverFrontend_rateIn_5;
  reg                 _zz_botRemoverFrontend_rateIn_6;
  reg                 _zz_botRemoverFrontend_rateIn_7;
  wire       [7:0]    _zz_botRemoverFrontend_rotateInOffset;
  reg        [8:0]    _zz_botRemoverFrontend_rotateInOffset_1;
  wire                _zz_botRemoverFrontend_rotateInOffset_2;
  wire                _zz_botRemoverFrontend_rotateInOffset_3;
  wire                _zz_botRemoverFrontend_rotateInOffset_4;
  wire                _zz_botRemoverFrontend_rotateInOffset_5;
  wire                _zz_botRemoverFrontend_rotateInOffset_6;
  wire                _zz_botRemoverFrontend_rotateInOffset_7;
  wire                _zz_botRemoverFrontend_rotateInOffset_8;
  wire                _zz_botRemoverFrontend_rotateInOffset_9;
  wire       [10:0]   _zz_io_push_valid_80;
  wire       [10:0]   _zz_io_push_valid_81;
  wire       [10:0]   _zz_io_push_valid_82;
  wire       [10:0]   _zz_io_push_valid_83;
  wire       [10:0]   _zz_io_push_valid_84;
  wire       [10:0]   _zz_io_push_valid_85;
  wire       [10:0]   _zz_io_push_valid_86;
  wire       [10:0]   _zz_io_push_valid_87;
  wire       [10:0]   _zz_io_push_valid_88;
  wire       [10:0]   _zz_io_push_valid_89;
  wire       [10:0]   _zz_io_push_valid_90;
  wire       [10:0]   _zz_io_push_valid_91;
  wire       [10:0]   _zz_io_push_valid_92;
  wire       [10:0]   _zz_io_push_valid_93;
  wire       [10:0]   _zz_io_push_valid_94;
  wire       [10:0]   _zz_io_push_valid_95;
  wire       [10:0]   _zz_io_push_valid_96;
  wire       [10:0]   _zz_io_push_valid_97;
  wire       [10:0]   _zz_io_push_valid_98;
  wire       [10:0]   _zz_io_push_valid_99;
  wire       [10:0]   _zz_io_push_valid_100;
  wire       [10:0]   _zz_io_push_valid_101;
  wire       [10:0]   _zz_io_push_valid_102;
  wire       [10:0]   _zz_io_push_valid_103;
  wire       [10:0]   _zz_io_push_valid_104;
  wire       [10:0]   _zz_io_push_valid_105;
  wire       [10:0]   _zz_io_push_valid_106;
  wire       [10:0]   _zz_io_push_valid_107;
  wire       [10:0]   _zz_io_push_valid_108;
  wire       [10:0]   _zz_io_push_valid_109;
  wire       [10:0]   _zz_io_push_valid_110;
  wire       [10:0]   _zz_io_push_valid_111;
  wire       [10:0]   _zz_io_push_valid_112;
  wire       [10:0]   _zz_io_push_valid_113;
  wire       [10:0]   _zz_io_push_valid_114;
  wire       [10:0]   _zz_io_push_valid_115;
  wire       [10:0]   _zz_io_push_valid_116;
  wire       [10:0]   _zz_io_push_valid_117;
  wire       [10:0]   _zz_io_push_valid_118;
  wire       [10:0]   _zz_io_push_valid_119;
  wire       [10:0]   _zz_io_push_valid_120;
  wire       [10:0]   _zz_io_push_valid_121;
  wire       [10:0]   _zz_io_push_valid_122;
  wire       [10:0]   _zz_io_push_valid_123;
  wire       [10:0]   _zz_io_push_valid_124;
  wire       [10:0]   _zz_io_push_valid_125;
  wire       [10:0]   _zz_io_push_valid_126;
  wire       [10:0]   _zz_io_push_valid_127;
  wire       [10:0]   _zz_io_push_valid_128;
  wire       [10:0]   _zz_io_push_valid_129;
  wire       [10:0]   _zz_io_push_valid_130;
  wire       [10:0]   _zz_io_push_valid_131;
  wire       [10:0]   _zz_io_push_valid_132;
  wire       [10:0]   _zz_io_push_valid_133;
  wire       [10:0]   _zz_io_push_valid_134;
  wire       [10:0]   _zz_io_push_valid_135;
  wire       [10:0]   _zz_io_push_valid_136;
  wire       [10:0]   _zz_io_push_valid_137;
  wire       [10:0]   _zz_io_push_valid_138;
  wire       [10:0]   _zz_io_push_valid_139;
  wire       [10:0]   _zz_io_push_valid_140;
  wire       [10:0]   _zz_io_push_valid_141;
  wire       [10:0]   _zz_io_push_valid_142;
  wire       [10:0]   _zz_io_push_valid_143;
  wire       [10:0]   _zz_io_push_valid_144;
  wire       [10:0]   _zz_io_push_valid_145;
  wire       [10:0]   _zz_io_push_valid_146;
  wire       [10:0]   _zz_io_push_valid_147;
  wire       [10:0]   _zz_io_push_valid_148;
  wire       [10:0]   _zz_io_push_valid_149;
  wire       [10:0]   _zz_io_push_valid_150;
  wire       [10:0]   _zz_io_push_valid_151;
  wire       [10:0]   _zz_io_push_valid_152;
  wire       [10:0]   _zz_io_push_valid_153;
  wire       [10:0]   _zz_io_push_valid_154;
  wire       [10:0]   _zz_io_push_valid_155;
  wire       [10:0]   _zz_io_push_valid_156;
  wire       [10:0]   _zz_io_push_valid_157;
  wire       [10:0]   _zz_io_push_valid_158;
  wire       [10:0]   _zz_io_push_valid_159;
  reg        [3:0]    botRemoverFrontend_rotateOutOffset;
  wire       [15:0]   botRemoverFrontend_rateOut;
  wire       [10:0]   botRemoverFrontend_fifoOuts_0;
  wire       [10:0]   botRemoverFrontend_fifoOuts_1;
  wire       [10:0]   botRemoverFrontend_fifoOuts_2;
  wire       [10:0]   botRemoverFrontend_fifoOuts_3;
  wire       [10:0]   botRemoverFrontend_fifoOuts_4;
  wire       [10:0]   botRemoverFrontend_fifoOuts_5;
  wire       [10:0]   botRemoverFrontend_fifoOuts_6;
  wire       [10:0]   botRemoverFrontend_fifoOuts_7;
  wire       [10:0]   botRemoverFrontend_fifoOuts_8;
  wire       [10:0]   botRemoverFrontend_fifoOuts_9;
  wire       [10:0]   botRemoverFrontend_fifoOuts_10;
  wire       [10:0]   botRemoverFrontend_fifoOuts_11;
  wire       [10:0]   botRemoverFrontend_fifoOuts_12;
  wire       [10:0]   botRemoverFrontend_fifoOuts_13;
  wire       [10:0]   botRemoverFrontend_fifoOuts_14;
  wire       [10:0]   botRemoverFrontend_fifoOuts_15;
  reg        [16:0]   _zz_botRemoverFrontend_rotateOutOffset;
  wire                _zz_botRemoverFrontend_rotateOutOffset_1;
  wire                _zz_botRemoverFrontend_rotateOutOffset_2;
  wire                _zz_botRemoverFrontend_rotateOutOffset_3;
  wire                _zz_botRemoverFrontend_rotateOutOffset_4;
  wire                _zz_botRemoverFrontend_rotateOutOffset_5;
  wire                _zz_botRemoverFrontend_rotateOutOffset_6;
  wire                _zz_botRemoverFrontend_rotateOutOffset_7;
  wire                _zz_botRemoverFrontend_rotateOutOffset_8;
  wire                _zz_botRemoverFrontend_rotateOutOffset_9;
  wire                _zz_botRemoverFrontend_rotateOutOffset_10;
  wire                _zz_botRemoverFrontend_rotateOutOffset_11;
  wire                _zz_botRemoverFrontend_rotateOutOffset_12;
  wire                _zz_botRemoverFrontend_rotateOutOffset_13;
  wire                _zz_botRemoverFrontend_rotateOutOffset_14;
  wire                _zz_botRemoverFrontend_rotateOutOffset_15;
  wire                _zz_botRemoverFrontend_rotateOutOffset_16;
  wire       [10:0]   _zz_io_outs_0;
  wire       [10:0]   _zz_io_outs_0_1;
  wire       [10:0]   _zz_io_outs_0_2;
  wire       [10:0]   _zz_io_outs_0_3;
  wire       [10:0]   _zz_io_outs_0_4;
  wire       [10:0]   _zz_io_outs_0_5;
  wire       [10:0]   _zz_io_outs_0_6;
  wire       [10:0]   _zz_io_outs_0_7;
  wire       [10:0]   _zz_io_outs_0_8;
  wire       [10:0]   _zz_io_outs_0_9;
  wire       [10:0]   _zz_io_outs_0_10;
  wire       [10:0]   _zz_io_outs_0_11;
  wire       [10:0]   _zz_io_outs_0_12;
  wire       [10:0]   _zz_io_outs_0_13;
  wire       [10:0]   _zz_io_outs_0_14;
  wire       [10:0]   _zz_io_outs_0_15;
  wire       [10:0]   _zz_io_outs_0_16;
  wire       [10:0]   _zz_io_outs_1;
  wire       [10:0]   _zz_io_outs_0_17;
  wire       [10:0]   _zz_io_outs_1_1;
  wire       [10:0]   _zz_io_outs_0_18;
  wire       [10:0]   _zz_io_outs_1_2;
  wire       [10:0]   _zz_io_outs_0_19;
  wire       [10:0]   _zz_io_outs_1_3;
  wire       [10:0]   _zz_io_outs_0_20;
  wire       [10:0]   _zz_io_outs_1_4;
  wire       [10:0]   _zz_io_outs_0_21;
  wire       [10:0]   _zz_io_outs_1_5;
  wire       [10:0]   _zz_io_outs_0_22;
  wire       [10:0]   _zz_io_outs_1_6;
  wire       [10:0]   _zz_io_outs_0_23;
  wire       [10:0]   _zz_io_outs_1_7;
  wire       [10:0]   _zz_io_outs_0_24;
  wire       [10:0]   _zz_io_outs_1_8;
  wire       [10:0]   _zz_io_outs_2;
  wire       [10:0]   _zz_io_outs_3;
  wire       [10:0]   _zz_io_outs_0_25;
  wire       [10:0]   _zz_io_outs_1_9;
  wire       [10:0]   _zz_io_outs_2_1;
  wire       [10:0]   _zz_io_outs_3_1;
  wire       [10:0]   _zz_io_outs_0_26;
  wire       [10:0]   _zz_io_outs_1_10;
  wire       [10:0]   _zz_io_outs_2_2;
  wire       [10:0]   _zz_io_outs_3_2;
  wire       [10:0]   _zz_io_outs_0_27;
  wire       [10:0]   _zz_io_outs_1_11;
  wire       [10:0]   _zz_io_outs_2_3;
  wire       [10:0]   _zz_io_outs_3_3;
  wire       [10:0]   _zz_io_outs_0_28;
  wire       [10:0]   _zz_io_outs_1_12;
  wire       [10:0]   _zz_io_outs_2_4;
  wire       [10:0]   _zz_io_outs_3_4;
  wire       [10:0]   _zz_io_outs_4;
  wire       [10:0]   _zz_io_outs_5;
  wire       [10:0]   _zz_io_outs_6;
  wire       [10:0]   _zz_io_outs_7;
  wire       [10:0]   _zz_io_outs_0_29;
  wire       [10:0]   _zz_io_outs_1_13;
  wire       [10:0]   _zz_io_outs_2_5;
  wire       [10:0]   _zz_io_outs_3_5;
  wire       [10:0]   _zz_io_outs_4_1;
  wire       [10:0]   _zz_io_outs_5_1;
  wire       [10:0]   _zz_io_outs_6_1;
  wire       [10:0]   _zz_io_outs_7_1;
  reg                 _zz_io_pop_ready_16;
  reg                 _zz_io_pop_ready_17;
  reg                 _zz_io_pop_ready_18;
  reg                 _zz_io_pop_ready_19;
  reg                 _zz_io_pop_ready_20;
  reg                 _zz_io_pop_ready_21;
  reg                 _zz_io_pop_ready_22;
  reg                 _zz_io_pop_ready_23;
  reg                 _zz_io_pop_ready_24;
  reg                 _zz_io_pop_ready_25;
  reg                 _zz_io_pop_ready_26;
  reg                 _zz_io_pop_ready_27;
  reg                 _zz_io_pop_ready_28;
  reg                 _zz_io_pop_ready_29;
  reg                 _zz_io_pop_ready_30;
  reg                 _zz_io_pop_ready_31;

  assign _zz_topRemoverFrontend_rotateInOffset_10 = ({_zz_topRemoverFrontend_rotateInOffset_6,{_zz_topRemoverFrontend_rotateInOffset_9,{_zz_topRemoverFrontend_rotateInOffset_8,_zz_topRemoverFrontend_rotateInOffset_7}}} + topRemoverFrontend_rotateInOffset);
  assign _zz_topRemoverFrontend_rotateOutOffset_17 = (_zz_topRemoverFrontend_rotateOutOffset_18 % 5'h10);
  assign _zz_topRemoverFrontend_rotateOutOffset_18 = ({_zz_topRemoverFrontend_rotateOutOffset_12,{_zz_topRemoverFrontend_rotateOutOffset_16,{_zz_topRemoverFrontend_rotateOutOffset_15,{_zz_topRemoverFrontend_rotateOutOffset_14,_zz_topRemoverFrontend_rotateOutOffset_13}}}} + _zz_topRemoverFrontend_rotateOutOffset_19);
  assign _zz_topRemoverFrontend_rotateOutOffset_19 = {1'd0, topRemoverFrontend_rotateOutOffset};
  assign _zz_botRemoverFrontend_rotateInOffset_10 = ({_zz_botRemoverFrontend_rotateInOffset_6,{_zz_botRemoverFrontend_rotateInOffset_9,{_zz_botRemoverFrontend_rotateInOffset_8,_zz_botRemoverFrontend_rotateInOffset_7}}} + botRemoverFrontend_rotateInOffset);
  assign _zz_botRemoverFrontend_rotateOutOffset_17 = (_zz_botRemoverFrontend_rotateOutOffset_18 % 5'h10);
  assign _zz_botRemoverFrontend_rotateOutOffset_18 = ({_zz_botRemoverFrontend_rotateOutOffset_12,{_zz_botRemoverFrontend_rotateOutOffset_16,{_zz_botRemoverFrontend_rotateOutOffset_15,{_zz_botRemoverFrontend_rotateOutOffset_14,_zz_botRemoverFrontend_rotateOutOffset_13}}}} + _zz_botRemoverFrontend_rotateOutOffset_19);
  assign _zz_botRemoverFrontend_rotateOutOffset_19 = {1'd0, botRemoverFrontend_rotateOutOffset};
  assign _zz_topRemoverFrontend_rateOut = io_fifoPopSig_5;
  assign _zz_topRemoverFrontend_rateOut_1 = {io_fifoPopSig_4,{io_fifoPopSig_3,{io_fifoPopSig_2,{io_fifoPopSig_1,io_fifoPopSig_0}}}};
  assign _zz_botRemoverFrontend_rateOut = io_fifoPopSig_5;
  assign _zz_botRemoverFrontend_rateOut_1 = {io_fifoPopSig_4,{io_fifoPopSig_3,{io_fifoPopSig_2,{io_fifoPopSig_1,io_fifoPopSig_0}}}};
  StreamFifo_48 topRemoverFrontend_fifos_0 (
    .io_push_valid   (topRemoverFrontend_fifos_0_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_0_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_64[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_0_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready                               ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_0_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_0_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_1 (
    .io_push_valid   (topRemoverFrontend_fifos_1_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_1_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_65[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_1_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_1                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_1_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_1_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_2 (
    .io_push_valid   (topRemoverFrontend_fifos_2_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_2_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_66[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_2_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_2                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_2_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_2_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_3 (
    .io_push_valid   (topRemoverFrontend_fifos_3_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_3_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_67[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_3_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_3                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_3_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_3_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_4 (
    .io_push_valid   (topRemoverFrontend_fifos_4_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_4_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_68[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_4_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_4                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_4_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_4_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_5 (
    .io_push_valid   (topRemoverFrontend_fifos_5_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_5_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_69[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_5_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_5                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_5_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_5_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_6 (
    .io_push_valid   (topRemoverFrontend_fifos_6_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_6_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_70[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_6_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_6                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_6_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_6_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_7 (
    .io_push_valid   (topRemoverFrontend_fifos_7_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_7_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_71[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_7_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_7                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_7_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_7_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_8 (
    .io_push_valid   (topRemoverFrontend_fifos_8_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_8_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_72[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_8_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_8                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_8_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_8_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_9 (
    .io_push_valid   (topRemoverFrontend_fifos_9_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_9_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_73[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_9_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_9                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_9_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_9_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_10 (
    .io_push_valid   (topRemoverFrontend_fifos_10_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_10_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_74[10:0]                      ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_10_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_10                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_10_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_10_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_11 (
    .io_push_valid   (topRemoverFrontend_fifos_11_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_11_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_75[10:0]                      ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_11_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_11                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_11_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_11_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_12 (
    .io_push_valid   (topRemoverFrontend_fifos_12_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_12_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_76[10:0]                      ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_12_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_12                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_12_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_12_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_13 (
    .io_push_valid   (topRemoverFrontend_fifos_13_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_13_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_77[10:0]                      ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_13_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_13                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_13_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_13_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_14 (
    .io_push_valid   (topRemoverFrontend_fifos_14_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_14_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_78[10:0]                      ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_14_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_14                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_14_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_14_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 topRemoverFrontend_fifos_15 (
    .io_push_valid   (topRemoverFrontend_fifos_15_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_15_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_79[10:0]                      ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_15_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_15                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_15_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_15_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_0 (
    .io_push_valid   (botRemoverFrontend_fifos_0_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_0_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_144[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_0_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_16                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_0_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_0_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_1 (
    .io_push_valid   (botRemoverFrontend_fifos_1_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_1_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_145[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_1_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_17                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_1_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_1_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_2 (
    .io_push_valid   (botRemoverFrontend_fifos_2_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_2_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_146[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_2_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_18                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_2_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_2_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_3 (
    .io_push_valid   (botRemoverFrontend_fifos_3_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_3_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_147[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_3_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_19                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_3_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_3_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_4 (
    .io_push_valid   (botRemoverFrontend_fifos_4_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_4_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_148[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_4_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_20                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_4_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_4_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_5 (
    .io_push_valid   (botRemoverFrontend_fifos_5_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_5_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_149[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_5_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_21                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_5_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_5_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_6 (
    .io_push_valid   (botRemoverFrontend_fifos_6_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_6_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_150[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_6_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_22                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_6_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_6_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_7 (
    .io_push_valid   (botRemoverFrontend_fifos_7_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_7_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_151[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_7_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_23                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_7_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_7_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_8 (
    .io_push_valid   (botRemoverFrontend_fifos_8_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_8_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_152[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_8_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_24                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_8_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_8_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_9 (
    .io_push_valid   (botRemoverFrontend_fifos_9_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_9_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_153[10:0]                    ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_9_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_25                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_9_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_9_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_10 (
    .io_push_valid   (botRemoverFrontend_fifos_10_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_10_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_154[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_10_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_26                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_10_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_10_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_11 (
    .io_push_valid   (botRemoverFrontend_fifos_11_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_11_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_155[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_11_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_27                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_11_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_11_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_12 (
    .io_push_valid   (botRemoverFrontend_fifos_12_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_12_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_156[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_12_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_28                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_12_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_12_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_13 (
    .io_push_valid   (botRemoverFrontend_fifos_13_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_13_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_157[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_13_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_29                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_13_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_13_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_14 (
    .io_push_valid   (botRemoverFrontend_fifos_14_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_14_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_158[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_14_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_30                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_14_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_14_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_15 (
    .io_push_valid   (botRemoverFrontend_fifos_15_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_15_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_159[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_15_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_31                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_15_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_15_io_flush            ), //i
    .clk             (clk                                             ), //i
    .clrn            (clrn                                            )  //i
  );
  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_2_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_1_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    topRemoverFrontend_rateIn[0] = _zz_topRemoverFrontend_rateIn;
    topRemoverFrontend_rateIn[1] = _zz_topRemoverFrontend_rateIn_1;
    topRemoverFrontend_rateIn[2] = _zz_topRemoverFrontend_rateIn_2;
    topRemoverFrontend_rateIn[3] = _zz_topRemoverFrontend_rateIn_3;
    topRemoverFrontend_rateIn[4] = _zz_topRemoverFrontend_rateIn_4;
    topRemoverFrontend_rateIn[5] = _zz_topRemoverFrontend_rateIn_5;
    topRemoverFrontend_rateIn[6] = _zz_topRemoverFrontend_rateIn_6;
    topRemoverFrontend_rateIn[7] = _zz_topRemoverFrontend_rateIn_7;
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_2_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_3_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_4_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_4 = topRemoverFrontend_fifos_5_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_5 = topRemoverFrontend_fifos_6_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_8_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_6 = topRemoverFrontend_fifos_7_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b0001 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b0010 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b0011 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0100 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0101 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0110 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0111 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b1000 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b1001 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b1010 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1011 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1100 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1101 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1110 : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_9_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_7 = topRemoverFrontend_fifos_8_io_push_ready;
      end
    endcase
  end

  assign _zz_topRemoverFrontend_rotateInOffset = (~ topRemoverFrontend_rateIn);
  always @(*) begin
    _zz_topRemoverFrontend_rotateInOffset_1[0] = (! _zz_topRemoverFrontend_rotateInOffset[0]);
    _zz_topRemoverFrontend_rotateInOffset_1[1] = (_zz_topRemoverFrontend_rotateInOffset[0] && (! _zz_topRemoverFrontend_rotateInOffset[1]));
    _zz_topRemoverFrontend_rotateInOffset_1[2] = (_zz_topRemoverFrontend_rotateInOffset[1] && (! _zz_topRemoverFrontend_rotateInOffset[2]));
    _zz_topRemoverFrontend_rotateInOffset_1[3] = (_zz_topRemoverFrontend_rotateInOffset[2] && (! _zz_topRemoverFrontend_rotateInOffset[3]));
    _zz_topRemoverFrontend_rotateInOffset_1[4] = (_zz_topRemoverFrontend_rotateInOffset[3] && (! _zz_topRemoverFrontend_rotateInOffset[4]));
    _zz_topRemoverFrontend_rotateInOffset_1[5] = (_zz_topRemoverFrontend_rotateInOffset[4] && (! _zz_topRemoverFrontend_rotateInOffset[5]));
    _zz_topRemoverFrontend_rotateInOffset_1[6] = (_zz_topRemoverFrontend_rotateInOffset[5] && (! _zz_topRemoverFrontend_rotateInOffset[6]));
    _zz_topRemoverFrontend_rotateInOffset_1[7] = (_zz_topRemoverFrontend_rotateInOffset[6] && (! _zz_topRemoverFrontend_rotateInOffset[7]));
    _zz_topRemoverFrontend_rotateInOffset_1[8] = _zz_topRemoverFrontend_rotateInOffset[7];
  end

  assign _zz_topRemoverFrontend_rotateInOffset_2 = _zz_topRemoverFrontend_rotateInOffset_1[3];
  assign _zz_topRemoverFrontend_rotateInOffset_3 = _zz_topRemoverFrontend_rotateInOffset_1[5];
  assign _zz_topRemoverFrontend_rotateInOffset_4 = _zz_topRemoverFrontend_rotateInOffset_1[6];
  assign _zz_topRemoverFrontend_rotateInOffset_5 = _zz_topRemoverFrontend_rotateInOffset_1[7];
  assign _zz_topRemoverFrontend_rotateInOffset_6 = _zz_topRemoverFrontend_rotateInOffset_1[8];
  assign _zz_topRemoverFrontend_rotateInOffset_7 = (((_zz_topRemoverFrontend_rotateInOffset_1[1] || _zz_topRemoverFrontend_rotateInOffset_2) || _zz_topRemoverFrontend_rotateInOffset_3) || _zz_topRemoverFrontend_rotateInOffset_5);
  assign _zz_topRemoverFrontend_rotateInOffset_8 = (((_zz_topRemoverFrontend_rotateInOffset_1[2] || _zz_topRemoverFrontend_rotateInOffset_2) || _zz_topRemoverFrontend_rotateInOffset_4) || _zz_topRemoverFrontend_rotateInOffset_5);
  assign _zz_topRemoverFrontend_rotateInOffset_9 = (((_zz_topRemoverFrontend_rotateInOffset_1[4] || _zz_topRemoverFrontend_rotateInOffset_3) || _zz_topRemoverFrontend_rotateInOffset_4) || _zz_topRemoverFrontend_rotateInOffset_5);
  assign _zz_io_push_valid = io_upperIns_0;
  assign _zz_io_push_valid_1 = io_upperIns_1;
  assign _zz_io_push_valid_2 = io_upperIns_2;
  assign _zz_io_push_valid_3 = io_upperIns_3;
  assign _zz_io_push_valid_4 = io_upperIns_4;
  assign _zz_io_push_valid_5 = io_upperIns_5;
  assign _zz_io_push_valid_6 = io_upperIns_6;
  assign _zz_io_push_valid_7 = io_upperIns_7;
  assign _zz_io_push_valid_8 = 11'h400;
  assign _zz_io_push_valid_9 = 11'h400;
  assign _zz_io_push_valid_10 = 11'h400;
  assign _zz_io_push_valid_11 = 11'h400;
  assign _zz_io_push_valid_12 = 11'h400;
  assign _zz_io_push_valid_13 = 11'h400;
  assign _zz_io_push_valid_14 = 11'h400;
  assign _zz_io_push_valid_15 = 11'h400;
  assign _zz_io_push_valid_16 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_15 : _zz_io_push_valid);
  assign _zz_io_push_valid_17 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid : _zz_io_push_valid_1);
  assign _zz_io_push_valid_18 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_1 : _zz_io_push_valid_2);
  assign _zz_io_push_valid_19 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_2 : _zz_io_push_valid_3);
  assign _zz_io_push_valid_20 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_3 : _zz_io_push_valid_4);
  assign _zz_io_push_valid_21 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_4 : _zz_io_push_valid_5);
  assign _zz_io_push_valid_22 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_5 : _zz_io_push_valid_6);
  assign _zz_io_push_valid_23 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_6 : _zz_io_push_valid_7);
  assign _zz_io_push_valid_24 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_7 : _zz_io_push_valid_8);
  assign _zz_io_push_valid_25 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_8 : _zz_io_push_valid_9);
  assign _zz_io_push_valid_26 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_9 : _zz_io_push_valid_10);
  assign _zz_io_push_valid_27 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_10 : _zz_io_push_valid_11);
  assign _zz_io_push_valid_28 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_11 : _zz_io_push_valid_12);
  assign _zz_io_push_valid_29 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_12 : _zz_io_push_valid_13);
  assign _zz_io_push_valid_30 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_13 : _zz_io_push_valid_14);
  assign _zz_io_push_valid_31 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_14 : _zz_io_push_valid_15);
  assign _zz_io_push_valid_32 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_30 : _zz_io_push_valid_16);
  assign _zz_io_push_valid_33 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_31 : _zz_io_push_valid_17);
  assign _zz_io_push_valid_34 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_16 : _zz_io_push_valid_18);
  assign _zz_io_push_valid_35 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_17 : _zz_io_push_valid_19);
  assign _zz_io_push_valid_36 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_18 : _zz_io_push_valid_20);
  assign _zz_io_push_valid_37 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_19 : _zz_io_push_valid_21);
  assign _zz_io_push_valid_38 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_20 : _zz_io_push_valid_22);
  assign _zz_io_push_valid_39 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_21 : _zz_io_push_valid_23);
  assign _zz_io_push_valid_40 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_22 : _zz_io_push_valid_24);
  assign _zz_io_push_valid_41 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_23 : _zz_io_push_valid_25);
  assign _zz_io_push_valid_42 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_24 : _zz_io_push_valid_26);
  assign _zz_io_push_valid_43 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_25 : _zz_io_push_valid_27);
  assign _zz_io_push_valid_44 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_26 : _zz_io_push_valid_28);
  assign _zz_io_push_valid_45 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_27 : _zz_io_push_valid_29);
  assign _zz_io_push_valid_46 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_28 : _zz_io_push_valid_30);
  assign _zz_io_push_valid_47 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_29 : _zz_io_push_valid_31);
  assign _zz_io_push_valid_48 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_44 : _zz_io_push_valid_32);
  assign _zz_io_push_valid_49 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_45 : _zz_io_push_valid_33);
  assign _zz_io_push_valid_50 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_46 : _zz_io_push_valid_34);
  assign _zz_io_push_valid_51 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_47 : _zz_io_push_valid_35);
  assign _zz_io_push_valid_52 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_32 : _zz_io_push_valid_36);
  assign _zz_io_push_valid_53 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_33 : _zz_io_push_valid_37);
  assign _zz_io_push_valid_54 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_34 : _zz_io_push_valid_38);
  assign _zz_io_push_valid_55 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_35 : _zz_io_push_valid_39);
  assign _zz_io_push_valid_56 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_36 : _zz_io_push_valid_40);
  assign _zz_io_push_valid_57 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_37 : _zz_io_push_valid_41);
  assign _zz_io_push_valid_58 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_38 : _zz_io_push_valid_42);
  assign _zz_io_push_valid_59 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_39 : _zz_io_push_valid_43);
  assign _zz_io_push_valid_60 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_40 : _zz_io_push_valid_44);
  assign _zz_io_push_valid_61 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_41 : _zz_io_push_valid_45);
  assign _zz_io_push_valid_62 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_42 : _zz_io_push_valid_46);
  assign _zz_io_push_valid_63 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_43 : _zz_io_push_valid_47);
  assign _zz_io_push_valid_64 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_56 : _zz_io_push_valid_48);
  assign _zz_io_push_valid_65 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_57 : _zz_io_push_valid_49);
  assign _zz_io_push_valid_66 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_58 : _zz_io_push_valid_50);
  assign _zz_io_push_valid_67 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_59 : _zz_io_push_valid_51);
  assign _zz_io_push_valid_68 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_60 : _zz_io_push_valid_52);
  assign _zz_io_push_valid_69 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_61 : _zz_io_push_valid_53);
  assign _zz_io_push_valid_70 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_62 : _zz_io_push_valid_54);
  assign _zz_io_push_valid_71 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_63 : _zz_io_push_valid_55);
  assign _zz_io_push_valid_72 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_48 : _zz_io_push_valid_56);
  assign _zz_io_push_valid_73 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_49 : _zz_io_push_valid_57);
  assign _zz_io_push_valid_74 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_50 : _zz_io_push_valid_58);
  assign _zz_io_push_valid_75 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_51 : _zz_io_push_valid_59);
  assign _zz_io_push_valid_76 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_52 : _zz_io_push_valid_60);
  assign _zz_io_push_valid_77 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_53 : _zz_io_push_valid_61);
  assign _zz_io_push_valid_78 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_54 : _zz_io_push_valid_62);
  assign _zz_io_push_valid_79 = (topRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_55 : _zz_io_push_valid_63);
  assign topRemoverFrontend_fifos_0_io_push_valid = _zz_io_push_valid_64[10];
  assign topRemoverFrontend_fifos_1_io_push_valid = _zz_io_push_valid_65[10];
  assign topRemoverFrontend_fifos_2_io_push_valid = _zz_io_push_valid_66[10];
  assign topRemoverFrontend_fifos_3_io_push_valid = _zz_io_push_valid_67[10];
  assign topRemoverFrontend_fifos_4_io_push_valid = _zz_io_push_valid_68[10];
  assign topRemoverFrontend_fifos_5_io_push_valid = _zz_io_push_valid_69[10];
  assign topRemoverFrontend_fifos_6_io_push_valid = _zz_io_push_valid_70[10];
  assign topRemoverFrontend_fifos_7_io_push_valid = _zz_io_push_valid_71[10];
  assign topRemoverFrontend_fifos_8_io_push_valid = _zz_io_push_valid_72[10];
  assign topRemoverFrontend_fifos_9_io_push_valid = _zz_io_push_valid_73[10];
  assign topRemoverFrontend_fifos_10_io_push_valid = _zz_io_push_valid_74[10];
  assign topRemoverFrontend_fifos_11_io_push_valid = _zz_io_push_valid_75[10];
  assign topRemoverFrontend_fifos_12_io_push_valid = _zz_io_push_valid_76[10];
  assign topRemoverFrontend_fifos_13_io_push_valid = _zz_io_push_valid_77[10];
  assign topRemoverFrontend_fifos_14_io_push_valid = _zz_io_push_valid_78[10];
  assign topRemoverFrontend_fifos_15_io_push_valid = _zz_io_push_valid_79[10];
  assign topRemoverFrontend_rateOut = {io_fifoPopSig_15,{io_fifoPopSig_14,{io_fifoPopSig_13,{io_fifoPopSig_12,{io_fifoPopSig_11,{io_fifoPopSig_10,{io_fifoPopSig_9,{io_fifoPopSig_8,{io_fifoPopSig_7,{io_fifoPopSig_6,{_zz_topRemoverFrontend_rateOut,_zz_topRemoverFrontend_rateOut_1}}}}}}}}}}};
  assign topRemoverFrontend_fifoOuts_0 = (topRemoverFrontend_fifos_0_io_pop_valid ? topRemoverFrontend_fifos_0_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_1 = (topRemoverFrontend_fifos_1_io_pop_valid ? topRemoverFrontend_fifos_1_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_2 = (topRemoverFrontend_fifos_2_io_pop_valid ? topRemoverFrontend_fifos_2_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_3 = (topRemoverFrontend_fifos_3_io_pop_valid ? topRemoverFrontend_fifos_3_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_4 = (topRemoverFrontend_fifos_4_io_pop_valid ? topRemoverFrontend_fifos_4_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_5 = (topRemoverFrontend_fifos_5_io_pop_valid ? topRemoverFrontend_fifos_5_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_6 = (topRemoverFrontend_fifos_6_io_pop_valid ? topRemoverFrontend_fifos_6_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_7 = (topRemoverFrontend_fifos_7_io_pop_valid ? topRemoverFrontend_fifos_7_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_8 = (topRemoverFrontend_fifos_8_io_pop_valid ? topRemoverFrontend_fifos_8_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_9 = (topRemoverFrontend_fifos_9_io_pop_valid ? topRemoverFrontend_fifos_9_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_10 = (topRemoverFrontend_fifos_10_io_pop_valid ? topRemoverFrontend_fifos_10_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_11 = (topRemoverFrontend_fifos_11_io_pop_valid ? topRemoverFrontend_fifos_11_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_12 = (topRemoverFrontend_fifos_12_io_pop_valid ? topRemoverFrontend_fifos_12_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_13 = (topRemoverFrontend_fifos_13_io_pop_valid ? topRemoverFrontend_fifos_13_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_14 = (topRemoverFrontend_fifos_14_io_pop_valid ? topRemoverFrontend_fifos_14_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_15 = (topRemoverFrontend_fifos_15_io_pop_valid ? topRemoverFrontend_fifos_15_io_pop_payload : 11'h400);
  always @(*) begin
    _zz_topRemoverFrontend_rotateOutOffset[0] = (! topRemoverFrontend_rateOut[0]);
    _zz_topRemoverFrontend_rotateOutOffset[1] = (topRemoverFrontend_rateOut[0] && (! topRemoverFrontend_rateOut[1]));
    _zz_topRemoverFrontend_rotateOutOffset[2] = (topRemoverFrontend_rateOut[1] && (! topRemoverFrontend_rateOut[2]));
    _zz_topRemoverFrontend_rotateOutOffset[3] = (topRemoverFrontend_rateOut[2] && (! topRemoverFrontend_rateOut[3]));
    _zz_topRemoverFrontend_rotateOutOffset[4] = (topRemoverFrontend_rateOut[3] && (! topRemoverFrontend_rateOut[4]));
    _zz_topRemoverFrontend_rotateOutOffset[5] = (topRemoverFrontend_rateOut[4] && (! topRemoverFrontend_rateOut[5]));
    _zz_topRemoverFrontend_rotateOutOffset[6] = (topRemoverFrontend_rateOut[5] && (! topRemoverFrontend_rateOut[6]));
    _zz_topRemoverFrontend_rotateOutOffset[7] = (topRemoverFrontend_rateOut[6] && (! topRemoverFrontend_rateOut[7]));
    _zz_topRemoverFrontend_rotateOutOffset[8] = (topRemoverFrontend_rateOut[7] && (! topRemoverFrontend_rateOut[8]));
    _zz_topRemoverFrontend_rotateOutOffset[9] = (topRemoverFrontend_rateOut[8] && (! topRemoverFrontend_rateOut[9]));
    _zz_topRemoverFrontend_rotateOutOffset[10] = (topRemoverFrontend_rateOut[9] && (! topRemoverFrontend_rateOut[10]));
    _zz_topRemoverFrontend_rotateOutOffset[11] = (topRemoverFrontend_rateOut[10] && (! topRemoverFrontend_rateOut[11]));
    _zz_topRemoverFrontend_rotateOutOffset[12] = (topRemoverFrontend_rateOut[11] && (! topRemoverFrontend_rateOut[12]));
    _zz_topRemoverFrontend_rotateOutOffset[13] = (topRemoverFrontend_rateOut[12] && (! topRemoverFrontend_rateOut[13]));
    _zz_topRemoverFrontend_rotateOutOffset[14] = (topRemoverFrontend_rateOut[13] && (! topRemoverFrontend_rateOut[14]));
    _zz_topRemoverFrontend_rotateOutOffset[15] = (topRemoverFrontend_rateOut[14] && (! topRemoverFrontend_rateOut[15]));
    _zz_topRemoverFrontend_rotateOutOffset[16] = topRemoverFrontend_rateOut[15];
  end

  assign _zz_topRemoverFrontend_rotateOutOffset_1 = _zz_topRemoverFrontend_rotateOutOffset[3];
  assign _zz_topRemoverFrontend_rotateOutOffset_2 = _zz_topRemoverFrontend_rotateOutOffset[5];
  assign _zz_topRemoverFrontend_rotateOutOffset_3 = _zz_topRemoverFrontend_rotateOutOffset[6];
  assign _zz_topRemoverFrontend_rotateOutOffset_4 = _zz_topRemoverFrontend_rotateOutOffset[7];
  assign _zz_topRemoverFrontend_rotateOutOffset_5 = _zz_topRemoverFrontend_rotateOutOffset[9];
  assign _zz_topRemoverFrontend_rotateOutOffset_6 = _zz_topRemoverFrontend_rotateOutOffset[10];
  assign _zz_topRemoverFrontend_rotateOutOffset_7 = _zz_topRemoverFrontend_rotateOutOffset[11];
  assign _zz_topRemoverFrontend_rotateOutOffset_8 = _zz_topRemoverFrontend_rotateOutOffset[12];
  assign _zz_topRemoverFrontend_rotateOutOffset_9 = _zz_topRemoverFrontend_rotateOutOffset[13];
  assign _zz_topRemoverFrontend_rotateOutOffset_10 = _zz_topRemoverFrontend_rotateOutOffset[14];
  assign _zz_topRemoverFrontend_rotateOutOffset_11 = _zz_topRemoverFrontend_rotateOutOffset[15];
  assign _zz_topRemoverFrontend_rotateOutOffset_12 = _zz_topRemoverFrontend_rotateOutOffset[16];
  assign _zz_topRemoverFrontend_rotateOutOffset_13 = (((((((_zz_topRemoverFrontend_rotateOutOffset[1] || _zz_topRemoverFrontend_rotateOutOffset_1) || _zz_topRemoverFrontend_rotateOutOffset_2) || _zz_topRemoverFrontend_rotateOutOffset_4) || _zz_topRemoverFrontend_rotateOutOffset_5) || _zz_topRemoverFrontend_rotateOutOffset_7) || _zz_topRemoverFrontend_rotateOutOffset_9) || _zz_topRemoverFrontend_rotateOutOffset_11);
  assign _zz_topRemoverFrontend_rotateOutOffset_14 = (((((((_zz_topRemoverFrontend_rotateOutOffset[2] || _zz_topRemoverFrontend_rotateOutOffset_1) || _zz_topRemoverFrontend_rotateOutOffset_3) || _zz_topRemoverFrontend_rotateOutOffset_4) || _zz_topRemoverFrontend_rotateOutOffset_6) || _zz_topRemoverFrontend_rotateOutOffset_7) || _zz_topRemoverFrontend_rotateOutOffset_10) || _zz_topRemoverFrontend_rotateOutOffset_11);
  assign _zz_topRemoverFrontend_rotateOutOffset_15 = (((((((_zz_topRemoverFrontend_rotateOutOffset[4] || _zz_topRemoverFrontend_rotateOutOffset_2) || _zz_topRemoverFrontend_rotateOutOffset_3) || _zz_topRemoverFrontend_rotateOutOffset_4) || _zz_topRemoverFrontend_rotateOutOffset_8) || _zz_topRemoverFrontend_rotateOutOffset_9) || _zz_topRemoverFrontend_rotateOutOffset_10) || _zz_topRemoverFrontend_rotateOutOffset_11);
  assign _zz_topRemoverFrontend_rotateOutOffset_16 = (((((((_zz_topRemoverFrontend_rotateOutOffset[8] || _zz_topRemoverFrontend_rotateOutOffset_5) || _zz_topRemoverFrontend_rotateOutOffset_6) || _zz_topRemoverFrontend_rotateOutOffset_7) || _zz_topRemoverFrontend_rotateOutOffset_8) || _zz_topRemoverFrontend_rotateOutOffset_9) || _zz_topRemoverFrontend_rotateOutOffset_10) || _zz_topRemoverFrontend_rotateOutOffset_11);
  assign _zz_io_outs_16 = topRemoverFrontend_fifoOuts_0;
  assign _zz_io_outs_16_1 = topRemoverFrontend_fifoOuts_1;
  assign _zz_io_outs_16_2 = topRemoverFrontend_fifoOuts_2;
  assign _zz_io_outs_16_3 = topRemoverFrontend_fifoOuts_3;
  assign _zz_io_outs_16_4 = topRemoverFrontend_fifoOuts_4;
  assign _zz_io_outs_16_5 = topRemoverFrontend_fifoOuts_5;
  assign _zz_io_outs_16_6 = topRemoverFrontend_fifoOuts_6;
  assign _zz_io_outs_16_7 = topRemoverFrontend_fifoOuts_7;
  assign _zz_io_outs_16_8 = topRemoverFrontend_fifoOuts_8;
  assign _zz_io_outs_16_9 = topRemoverFrontend_fifoOuts_9;
  assign _zz_io_outs_16_10 = topRemoverFrontend_fifoOuts_10;
  assign _zz_io_outs_16_11 = topRemoverFrontend_fifoOuts_11;
  assign _zz_io_outs_16_12 = topRemoverFrontend_fifoOuts_12;
  assign _zz_io_outs_16_13 = topRemoverFrontend_fifoOuts_13;
  assign _zz_io_outs_16_14 = topRemoverFrontend_fifoOuts_14;
  assign _zz_io_outs_16_15 = topRemoverFrontend_fifoOuts_15;
  assign _zz_io_outs_16_16 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_15 : _zz_io_outs_16);
  assign _zz_io_outs_17 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16 : _zz_io_outs_16_1);
  assign _zz_io_outs_16_17 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_1 : _zz_io_outs_16_2);
  assign _zz_io_outs_17_1 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_2 : _zz_io_outs_16_3);
  assign _zz_io_outs_16_18 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_3 : _zz_io_outs_16_4);
  assign _zz_io_outs_17_2 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_4 : _zz_io_outs_16_5);
  assign _zz_io_outs_16_19 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_5 : _zz_io_outs_16_6);
  assign _zz_io_outs_17_3 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_6 : _zz_io_outs_16_7);
  assign _zz_io_outs_16_20 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_7 : _zz_io_outs_16_8);
  assign _zz_io_outs_17_4 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_8 : _zz_io_outs_16_9);
  assign _zz_io_outs_16_21 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_9 : _zz_io_outs_16_10);
  assign _zz_io_outs_17_5 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_10 : _zz_io_outs_16_11);
  assign _zz_io_outs_16_22 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_11 : _zz_io_outs_16_12);
  assign _zz_io_outs_17_6 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_12 : _zz_io_outs_16_13);
  assign _zz_io_outs_16_23 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_13 : _zz_io_outs_16_14);
  assign _zz_io_outs_17_7 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_16_14 : _zz_io_outs_16_15);
  assign _zz_io_outs_16_24 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_23 : _zz_io_outs_16_16);
  assign _zz_io_outs_17_8 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_7 : _zz_io_outs_17);
  assign _zz_io_outs_18 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_16 : _zz_io_outs_16_17);
  assign _zz_io_outs_19 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17 : _zz_io_outs_17_1);
  assign _zz_io_outs_16_25 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_17 : _zz_io_outs_16_18);
  assign _zz_io_outs_17_9 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_1 : _zz_io_outs_17_2);
  assign _zz_io_outs_18_1 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_18 : _zz_io_outs_16_19);
  assign _zz_io_outs_19_1 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_2 : _zz_io_outs_17_3);
  assign _zz_io_outs_16_26 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_19 : _zz_io_outs_16_20);
  assign _zz_io_outs_17_10 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_3 : _zz_io_outs_17_4);
  assign _zz_io_outs_18_2 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_20 : _zz_io_outs_16_21);
  assign _zz_io_outs_19_2 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_4 : _zz_io_outs_17_5);
  assign _zz_io_outs_16_27 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_21 : _zz_io_outs_16_22);
  assign _zz_io_outs_17_11 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_5 : _zz_io_outs_17_6);
  assign _zz_io_outs_18_3 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_16_22 : _zz_io_outs_16_23);
  assign _zz_io_outs_19_3 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_17_6 : _zz_io_outs_17_7);
  assign _zz_io_outs_16_28 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_16_27 : _zz_io_outs_16_24);
  assign _zz_io_outs_17_12 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_17_11 : _zz_io_outs_17_8);
  assign _zz_io_outs_18_4 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_18_3 : _zz_io_outs_18);
  assign _zz_io_outs_19_4 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_19_3 : _zz_io_outs_19);
  assign _zz_io_outs_20 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_16_24 : _zz_io_outs_16_25);
  assign _zz_io_outs_21 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_17_8 : _zz_io_outs_17_9);
  assign _zz_io_outs_22 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_18 : _zz_io_outs_18_1);
  assign _zz_io_outs_23 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_19 : _zz_io_outs_19_1);
  assign _zz_io_outs_16_29 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_16_25 : _zz_io_outs_16_26);
  assign _zz_io_outs_17_13 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_17_9 : _zz_io_outs_17_10);
  assign _zz_io_outs_18_5 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_18_1 : _zz_io_outs_18_2);
  assign _zz_io_outs_19_5 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_19_1 : _zz_io_outs_19_2);
  assign _zz_io_outs_20_1 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_16_26 : _zz_io_outs_16_27);
  assign _zz_io_outs_21_1 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_17_10 : _zz_io_outs_17_11);
  assign _zz_io_outs_22_1 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_18_2 : _zz_io_outs_18_3);
  assign _zz_io_outs_23_1 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_19_2 : _zz_io_outs_19_3);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_16 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_16_29 : _zz_io_outs_16_28);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_17 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_17_13 : _zz_io_outs_17_12);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_18 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_18_5 : _zz_io_outs_18_4);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_19 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_19_5 : _zz_io_outs_19_4);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_20 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_20_1 : _zz_io_outs_20);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_21 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_21_1 : _zz_io_outs_21);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_22 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_22_1 : _zz_io_outs_22);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_23 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_23_1 : _zz_io_outs_23);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_8 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_24 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_16_28 : _zz_io_outs_16_29);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_9 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_25 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_17_12 : _zz_io_outs_17_13);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_10 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_26 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_18_4 : _zz_io_outs_18_5);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_11 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_27 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_19_4 : _zz_io_outs_19_5);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_12 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_28 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_20 : _zz_io_outs_20_1);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_13 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_29 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_21 : _zz_io_outs_21_1);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_14 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_30 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_22 : _zz_io_outs_22_1);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_15;
      end
      4'b0001 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_0;
      end
      4'b0010 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_1;
      end
      4'b0011 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_2;
      end
      4'b0100 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_3;
      end
      4'b0101 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_4;
      end
      4'b0110 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_5;
      end
      4'b0111 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_6;
      end
      4'b1000 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_7;
      end
      4'b1001 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_8;
      end
      4'b1010 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_9;
      end
      4'b1011 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_10;
      end
      4'b1100 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_11;
      end
      4'b1101 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_12;
      end
      4'b1110 : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_13;
      end
      default : begin
        _zz_io_pop_ready_15 = io_fifoPopSig_14;
      end
    endcase
  end

  assign io_outs_31 = (topRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_23 : _zz_io_outs_23_1);
  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_2_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_1_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    botRemoverFrontend_rateIn[0] = _zz_botRemoverFrontend_rateIn;
    botRemoverFrontend_rateIn[1] = _zz_botRemoverFrontend_rateIn_1;
    botRemoverFrontend_rateIn[2] = _zz_botRemoverFrontend_rateIn_2;
    botRemoverFrontend_rateIn[3] = _zz_botRemoverFrontend_rateIn_3;
    botRemoverFrontend_rateIn[4] = _zz_botRemoverFrontend_rateIn_4;
    botRemoverFrontend_rateIn[5] = _zz_botRemoverFrontend_rateIn_5;
    botRemoverFrontend_rateIn[6] = _zz_botRemoverFrontend_rateIn_6;
    botRemoverFrontend_rateIn[7] = _zz_botRemoverFrontend_rateIn_7;
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_2_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_3_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_4_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_4 = botRemoverFrontend_fifos_5_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_8_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_5 = botRemoverFrontend_fifos_6_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_8_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_6 = botRemoverFrontend_fifos_7_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      4'b0000 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      4'b0001 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      4'b0010 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      4'b0011 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      4'b0100 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      4'b0101 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      4'b0110 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      4'b0111 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      4'b1000 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_15_io_push_ready;
      end
      4'b1001 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_14_io_push_ready;
      end
      4'b1010 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_13_io_push_ready;
      end
      4'b1011 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_12_io_push_ready;
      end
      4'b1100 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_11_io_push_ready;
      end
      4'b1101 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_10_io_push_ready;
      end
      4'b1110 : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_9_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_7 = botRemoverFrontend_fifos_8_io_push_ready;
      end
    endcase
  end

  assign _zz_botRemoverFrontend_rotateInOffset = (~ botRemoverFrontend_rateIn);
  always @(*) begin
    _zz_botRemoverFrontend_rotateInOffset_1[0] = (! _zz_botRemoverFrontend_rotateInOffset[0]);
    _zz_botRemoverFrontend_rotateInOffset_1[1] = (_zz_botRemoverFrontend_rotateInOffset[0] && (! _zz_botRemoverFrontend_rotateInOffset[1]));
    _zz_botRemoverFrontend_rotateInOffset_1[2] = (_zz_botRemoverFrontend_rotateInOffset[1] && (! _zz_botRemoverFrontend_rotateInOffset[2]));
    _zz_botRemoverFrontend_rotateInOffset_1[3] = (_zz_botRemoverFrontend_rotateInOffset[2] && (! _zz_botRemoverFrontend_rotateInOffset[3]));
    _zz_botRemoverFrontend_rotateInOffset_1[4] = (_zz_botRemoverFrontend_rotateInOffset[3] && (! _zz_botRemoverFrontend_rotateInOffset[4]));
    _zz_botRemoverFrontend_rotateInOffset_1[5] = (_zz_botRemoverFrontend_rotateInOffset[4] && (! _zz_botRemoverFrontend_rotateInOffset[5]));
    _zz_botRemoverFrontend_rotateInOffset_1[6] = (_zz_botRemoverFrontend_rotateInOffset[5] && (! _zz_botRemoverFrontend_rotateInOffset[6]));
    _zz_botRemoverFrontend_rotateInOffset_1[7] = (_zz_botRemoverFrontend_rotateInOffset[6] && (! _zz_botRemoverFrontend_rotateInOffset[7]));
    _zz_botRemoverFrontend_rotateInOffset_1[8] = _zz_botRemoverFrontend_rotateInOffset[7];
  end

  assign _zz_botRemoverFrontend_rotateInOffset_2 = _zz_botRemoverFrontend_rotateInOffset_1[3];
  assign _zz_botRemoverFrontend_rotateInOffset_3 = _zz_botRemoverFrontend_rotateInOffset_1[5];
  assign _zz_botRemoverFrontend_rotateInOffset_4 = _zz_botRemoverFrontend_rotateInOffset_1[6];
  assign _zz_botRemoverFrontend_rotateInOffset_5 = _zz_botRemoverFrontend_rotateInOffset_1[7];
  assign _zz_botRemoverFrontend_rotateInOffset_6 = _zz_botRemoverFrontend_rotateInOffset_1[8];
  assign _zz_botRemoverFrontend_rotateInOffset_7 = (((_zz_botRemoverFrontend_rotateInOffset_1[1] || _zz_botRemoverFrontend_rotateInOffset_2) || _zz_botRemoverFrontend_rotateInOffset_3) || _zz_botRemoverFrontend_rotateInOffset_5);
  assign _zz_botRemoverFrontend_rotateInOffset_8 = (((_zz_botRemoverFrontend_rotateInOffset_1[2] || _zz_botRemoverFrontend_rotateInOffset_2) || _zz_botRemoverFrontend_rotateInOffset_4) || _zz_botRemoverFrontend_rotateInOffset_5);
  assign _zz_botRemoverFrontend_rotateInOffset_9 = (((_zz_botRemoverFrontend_rotateInOffset_1[4] || _zz_botRemoverFrontend_rotateInOffset_3) || _zz_botRemoverFrontend_rotateInOffset_4) || _zz_botRemoverFrontend_rotateInOffset_5);
  assign _zz_io_push_valid_80 = io_lowerIns_0;
  assign _zz_io_push_valid_81 = io_lowerIns_1;
  assign _zz_io_push_valid_82 = io_lowerIns_2;
  assign _zz_io_push_valid_83 = io_lowerIns_3;
  assign _zz_io_push_valid_84 = io_lowerIns_4;
  assign _zz_io_push_valid_85 = io_lowerIns_5;
  assign _zz_io_push_valid_86 = io_lowerIns_6;
  assign _zz_io_push_valid_87 = io_lowerIns_7;
  assign _zz_io_push_valid_88 = 11'h400;
  assign _zz_io_push_valid_89 = 11'h400;
  assign _zz_io_push_valid_90 = 11'h400;
  assign _zz_io_push_valid_91 = 11'h400;
  assign _zz_io_push_valid_92 = 11'h400;
  assign _zz_io_push_valid_93 = 11'h400;
  assign _zz_io_push_valid_94 = 11'h400;
  assign _zz_io_push_valid_95 = 11'h400;
  assign _zz_io_push_valid_96 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_95 : _zz_io_push_valid_80);
  assign _zz_io_push_valid_97 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_80 : _zz_io_push_valid_81);
  assign _zz_io_push_valid_98 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_81 : _zz_io_push_valid_82);
  assign _zz_io_push_valid_99 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_82 : _zz_io_push_valid_83);
  assign _zz_io_push_valid_100 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_83 : _zz_io_push_valid_84);
  assign _zz_io_push_valid_101 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_84 : _zz_io_push_valid_85);
  assign _zz_io_push_valid_102 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_85 : _zz_io_push_valid_86);
  assign _zz_io_push_valid_103 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_86 : _zz_io_push_valid_87);
  assign _zz_io_push_valid_104 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_87 : _zz_io_push_valid_88);
  assign _zz_io_push_valid_105 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_88 : _zz_io_push_valid_89);
  assign _zz_io_push_valid_106 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_89 : _zz_io_push_valid_90);
  assign _zz_io_push_valid_107 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_90 : _zz_io_push_valid_91);
  assign _zz_io_push_valid_108 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_91 : _zz_io_push_valid_92);
  assign _zz_io_push_valid_109 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_92 : _zz_io_push_valid_93);
  assign _zz_io_push_valid_110 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_93 : _zz_io_push_valid_94);
  assign _zz_io_push_valid_111 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_94 : _zz_io_push_valid_95);
  assign _zz_io_push_valid_112 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_110 : _zz_io_push_valid_96);
  assign _zz_io_push_valid_113 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_111 : _zz_io_push_valid_97);
  assign _zz_io_push_valid_114 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_96 : _zz_io_push_valid_98);
  assign _zz_io_push_valid_115 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_97 : _zz_io_push_valid_99);
  assign _zz_io_push_valid_116 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_98 : _zz_io_push_valid_100);
  assign _zz_io_push_valid_117 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_99 : _zz_io_push_valid_101);
  assign _zz_io_push_valid_118 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_100 : _zz_io_push_valid_102);
  assign _zz_io_push_valid_119 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_101 : _zz_io_push_valid_103);
  assign _zz_io_push_valid_120 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_102 : _zz_io_push_valid_104);
  assign _zz_io_push_valid_121 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_103 : _zz_io_push_valid_105);
  assign _zz_io_push_valid_122 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_104 : _zz_io_push_valid_106);
  assign _zz_io_push_valid_123 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_105 : _zz_io_push_valid_107);
  assign _zz_io_push_valid_124 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_106 : _zz_io_push_valid_108);
  assign _zz_io_push_valid_125 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_107 : _zz_io_push_valid_109);
  assign _zz_io_push_valid_126 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_108 : _zz_io_push_valid_110);
  assign _zz_io_push_valid_127 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_109 : _zz_io_push_valid_111);
  assign _zz_io_push_valid_128 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_124 : _zz_io_push_valid_112);
  assign _zz_io_push_valid_129 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_125 : _zz_io_push_valid_113);
  assign _zz_io_push_valid_130 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_126 : _zz_io_push_valid_114);
  assign _zz_io_push_valid_131 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_127 : _zz_io_push_valid_115);
  assign _zz_io_push_valid_132 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_112 : _zz_io_push_valid_116);
  assign _zz_io_push_valid_133 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_113 : _zz_io_push_valid_117);
  assign _zz_io_push_valid_134 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_114 : _zz_io_push_valid_118);
  assign _zz_io_push_valid_135 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_115 : _zz_io_push_valid_119);
  assign _zz_io_push_valid_136 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_116 : _zz_io_push_valid_120);
  assign _zz_io_push_valid_137 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_117 : _zz_io_push_valid_121);
  assign _zz_io_push_valid_138 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_118 : _zz_io_push_valid_122);
  assign _zz_io_push_valid_139 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_119 : _zz_io_push_valid_123);
  assign _zz_io_push_valid_140 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_120 : _zz_io_push_valid_124);
  assign _zz_io_push_valid_141 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_121 : _zz_io_push_valid_125);
  assign _zz_io_push_valid_142 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_122 : _zz_io_push_valid_126);
  assign _zz_io_push_valid_143 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_123 : _zz_io_push_valid_127);
  assign _zz_io_push_valid_144 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_136 : _zz_io_push_valid_128);
  assign _zz_io_push_valid_145 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_137 : _zz_io_push_valid_129);
  assign _zz_io_push_valid_146 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_138 : _zz_io_push_valid_130);
  assign _zz_io_push_valid_147 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_139 : _zz_io_push_valid_131);
  assign _zz_io_push_valid_148 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_140 : _zz_io_push_valid_132);
  assign _zz_io_push_valid_149 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_141 : _zz_io_push_valid_133);
  assign _zz_io_push_valid_150 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_142 : _zz_io_push_valid_134);
  assign _zz_io_push_valid_151 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_143 : _zz_io_push_valid_135);
  assign _zz_io_push_valid_152 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_128 : _zz_io_push_valid_136);
  assign _zz_io_push_valid_153 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_129 : _zz_io_push_valid_137);
  assign _zz_io_push_valid_154 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_130 : _zz_io_push_valid_138);
  assign _zz_io_push_valid_155 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_131 : _zz_io_push_valid_139);
  assign _zz_io_push_valid_156 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_132 : _zz_io_push_valid_140);
  assign _zz_io_push_valid_157 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_133 : _zz_io_push_valid_141);
  assign _zz_io_push_valid_158 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_134 : _zz_io_push_valid_142);
  assign _zz_io_push_valid_159 = (botRemoverFrontend_rotateInOffset[3] ? _zz_io_push_valid_135 : _zz_io_push_valid_143);
  assign botRemoverFrontend_fifos_0_io_push_valid = _zz_io_push_valid_144[10];
  assign botRemoverFrontend_fifos_1_io_push_valid = _zz_io_push_valid_145[10];
  assign botRemoverFrontend_fifos_2_io_push_valid = _zz_io_push_valid_146[10];
  assign botRemoverFrontend_fifos_3_io_push_valid = _zz_io_push_valid_147[10];
  assign botRemoverFrontend_fifos_4_io_push_valid = _zz_io_push_valid_148[10];
  assign botRemoverFrontend_fifos_5_io_push_valid = _zz_io_push_valid_149[10];
  assign botRemoverFrontend_fifos_6_io_push_valid = _zz_io_push_valid_150[10];
  assign botRemoverFrontend_fifos_7_io_push_valid = _zz_io_push_valid_151[10];
  assign botRemoverFrontend_fifos_8_io_push_valid = _zz_io_push_valid_152[10];
  assign botRemoverFrontend_fifos_9_io_push_valid = _zz_io_push_valid_153[10];
  assign botRemoverFrontend_fifos_10_io_push_valid = _zz_io_push_valid_154[10];
  assign botRemoverFrontend_fifos_11_io_push_valid = _zz_io_push_valid_155[10];
  assign botRemoverFrontend_fifos_12_io_push_valid = _zz_io_push_valid_156[10];
  assign botRemoverFrontend_fifos_13_io_push_valid = _zz_io_push_valid_157[10];
  assign botRemoverFrontend_fifos_14_io_push_valid = _zz_io_push_valid_158[10];
  assign botRemoverFrontend_fifos_15_io_push_valid = _zz_io_push_valid_159[10];
  assign botRemoverFrontend_rateOut = (~ {io_fifoPopSig_15,{io_fifoPopSig_14,{io_fifoPopSig_13,{io_fifoPopSig_12,{io_fifoPopSig_11,{io_fifoPopSig_10,{io_fifoPopSig_9,{io_fifoPopSig_8,{io_fifoPopSig_7,{io_fifoPopSig_6,{_zz_botRemoverFrontend_rateOut,_zz_botRemoverFrontend_rateOut_1}}}}}}}}}}});
  assign botRemoverFrontend_fifoOuts_0 = (botRemoverFrontend_fifos_0_io_pop_valid ? botRemoverFrontend_fifos_0_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_1 = (botRemoverFrontend_fifos_1_io_pop_valid ? botRemoverFrontend_fifos_1_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_2 = (botRemoverFrontend_fifos_2_io_pop_valid ? botRemoverFrontend_fifos_2_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_3 = (botRemoverFrontend_fifos_3_io_pop_valid ? botRemoverFrontend_fifos_3_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_4 = (botRemoverFrontend_fifos_4_io_pop_valid ? botRemoverFrontend_fifos_4_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_5 = (botRemoverFrontend_fifos_5_io_pop_valid ? botRemoverFrontend_fifos_5_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_6 = (botRemoverFrontend_fifos_6_io_pop_valid ? botRemoverFrontend_fifos_6_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_7 = (botRemoverFrontend_fifos_7_io_pop_valid ? botRemoverFrontend_fifos_7_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_8 = (botRemoverFrontend_fifos_8_io_pop_valid ? botRemoverFrontend_fifos_8_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_9 = (botRemoverFrontend_fifos_9_io_pop_valid ? botRemoverFrontend_fifos_9_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_10 = (botRemoverFrontend_fifos_10_io_pop_valid ? botRemoverFrontend_fifos_10_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_11 = (botRemoverFrontend_fifos_11_io_pop_valid ? botRemoverFrontend_fifos_11_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_12 = (botRemoverFrontend_fifos_12_io_pop_valid ? botRemoverFrontend_fifos_12_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_13 = (botRemoverFrontend_fifos_13_io_pop_valid ? botRemoverFrontend_fifos_13_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_14 = (botRemoverFrontend_fifos_14_io_pop_valid ? botRemoverFrontend_fifos_14_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_15 = (botRemoverFrontend_fifos_15_io_pop_valid ? botRemoverFrontend_fifos_15_io_pop_payload : 11'h400);
  always @(*) begin
    _zz_botRemoverFrontend_rotateOutOffset[0] = (! botRemoverFrontend_rateOut[0]);
    _zz_botRemoverFrontend_rotateOutOffset[1] = (botRemoverFrontend_rateOut[0] && (! botRemoverFrontend_rateOut[1]));
    _zz_botRemoverFrontend_rotateOutOffset[2] = (botRemoverFrontend_rateOut[1] && (! botRemoverFrontend_rateOut[2]));
    _zz_botRemoverFrontend_rotateOutOffset[3] = (botRemoverFrontend_rateOut[2] && (! botRemoverFrontend_rateOut[3]));
    _zz_botRemoverFrontend_rotateOutOffset[4] = (botRemoverFrontend_rateOut[3] && (! botRemoverFrontend_rateOut[4]));
    _zz_botRemoverFrontend_rotateOutOffset[5] = (botRemoverFrontend_rateOut[4] && (! botRemoverFrontend_rateOut[5]));
    _zz_botRemoverFrontend_rotateOutOffset[6] = (botRemoverFrontend_rateOut[5] && (! botRemoverFrontend_rateOut[6]));
    _zz_botRemoverFrontend_rotateOutOffset[7] = (botRemoverFrontend_rateOut[6] && (! botRemoverFrontend_rateOut[7]));
    _zz_botRemoverFrontend_rotateOutOffset[8] = (botRemoverFrontend_rateOut[7] && (! botRemoverFrontend_rateOut[8]));
    _zz_botRemoverFrontend_rotateOutOffset[9] = (botRemoverFrontend_rateOut[8] && (! botRemoverFrontend_rateOut[9]));
    _zz_botRemoverFrontend_rotateOutOffset[10] = (botRemoverFrontend_rateOut[9] && (! botRemoverFrontend_rateOut[10]));
    _zz_botRemoverFrontend_rotateOutOffset[11] = (botRemoverFrontend_rateOut[10] && (! botRemoverFrontend_rateOut[11]));
    _zz_botRemoverFrontend_rotateOutOffset[12] = (botRemoverFrontend_rateOut[11] && (! botRemoverFrontend_rateOut[12]));
    _zz_botRemoverFrontend_rotateOutOffset[13] = (botRemoverFrontend_rateOut[12] && (! botRemoverFrontend_rateOut[13]));
    _zz_botRemoverFrontend_rotateOutOffset[14] = (botRemoverFrontend_rateOut[13] && (! botRemoverFrontend_rateOut[14]));
    _zz_botRemoverFrontend_rotateOutOffset[15] = (botRemoverFrontend_rateOut[14] && (! botRemoverFrontend_rateOut[15]));
    _zz_botRemoverFrontend_rotateOutOffset[16] = botRemoverFrontend_rateOut[15];
  end

  assign _zz_botRemoverFrontend_rotateOutOffset_1 = _zz_botRemoverFrontend_rotateOutOffset[3];
  assign _zz_botRemoverFrontend_rotateOutOffset_2 = _zz_botRemoverFrontend_rotateOutOffset[5];
  assign _zz_botRemoverFrontend_rotateOutOffset_3 = _zz_botRemoverFrontend_rotateOutOffset[6];
  assign _zz_botRemoverFrontend_rotateOutOffset_4 = _zz_botRemoverFrontend_rotateOutOffset[7];
  assign _zz_botRemoverFrontend_rotateOutOffset_5 = _zz_botRemoverFrontend_rotateOutOffset[9];
  assign _zz_botRemoverFrontend_rotateOutOffset_6 = _zz_botRemoverFrontend_rotateOutOffset[10];
  assign _zz_botRemoverFrontend_rotateOutOffset_7 = _zz_botRemoverFrontend_rotateOutOffset[11];
  assign _zz_botRemoverFrontend_rotateOutOffset_8 = _zz_botRemoverFrontend_rotateOutOffset[12];
  assign _zz_botRemoverFrontend_rotateOutOffset_9 = _zz_botRemoverFrontend_rotateOutOffset[13];
  assign _zz_botRemoverFrontend_rotateOutOffset_10 = _zz_botRemoverFrontend_rotateOutOffset[14];
  assign _zz_botRemoverFrontend_rotateOutOffset_11 = _zz_botRemoverFrontend_rotateOutOffset[15];
  assign _zz_botRemoverFrontend_rotateOutOffset_12 = _zz_botRemoverFrontend_rotateOutOffset[16];
  assign _zz_botRemoverFrontend_rotateOutOffset_13 = (((((((_zz_botRemoverFrontend_rotateOutOffset[1] || _zz_botRemoverFrontend_rotateOutOffset_1) || _zz_botRemoverFrontend_rotateOutOffset_2) || _zz_botRemoverFrontend_rotateOutOffset_4) || _zz_botRemoverFrontend_rotateOutOffset_5) || _zz_botRemoverFrontend_rotateOutOffset_7) || _zz_botRemoverFrontend_rotateOutOffset_9) || _zz_botRemoverFrontend_rotateOutOffset_11);
  assign _zz_botRemoverFrontend_rotateOutOffset_14 = (((((((_zz_botRemoverFrontend_rotateOutOffset[2] || _zz_botRemoverFrontend_rotateOutOffset_1) || _zz_botRemoverFrontend_rotateOutOffset_3) || _zz_botRemoverFrontend_rotateOutOffset_4) || _zz_botRemoverFrontend_rotateOutOffset_6) || _zz_botRemoverFrontend_rotateOutOffset_7) || _zz_botRemoverFrontend_rotateOutOffset_10) || _zz_botRemoverFrontend_rotateOutOffset_11);
  assign _zz_botRemoverFrontend_rotateOutOffset_15 = (((((((_zz_botRemoverFrontend_rotateOutOffset[4] || _zz_botRemoverFrontend_rotateOutOffset_2) || _zz_botRemoverFrontend_rotateOutOffset_3) || _zz_botRemoverFrontend_rotateOutOffset_4) || _zz_botRemoverFrontend_rotateOutOffset_8) || _zz_botRemoverFrontend_rotateOutOffset_9) || _zz_botRemoverFrontend_rotateOutOffset_10) || _zz_botRemoverFrontend_rotateOutOffset_11);
  assign _zz_botRemoverFrontend_rotateOutOffset_16 = (((((((_zz_botRemoverFrontend_rotateOutOffset[8] || _zz_botRemoverFrontend_rotateOutOffset_5) || _zz_botRemoverFrontend_rotateOutOffset_6) || _zz_botRemoverFrontend_rotateOutOffset_7) || _zz_botRemoverFrontend_rotateOutOffset_8) || _zz_botRemoverFrontend_rotateOutOffset_9) || _zz_botRemoverFrontend_rotateOutOffset_10) || _zz_botRemoverFrontend_rotateOutOffset_11);
  assign _zz_io_outs_0 = botRemoverFrontend_fifoOuts_0;
  assign _zz_io_outs_0_1 = botRemoverFrontend_fifoOuts_1;
  assign _zz_io_outs_0_2 = botRemoverFrontend_fifoOuts_2;
  assign _zz_io_outs_0_3 = botRemoverFrontend_fifoOuts_3;
  assign _zz_io_outs_0_4 = botRemoverFrontend_fifoOuts_4;
  assign _zz_io_outs_0_5 = botRemoverFrontend_fifoOuts_5;
  assign _zz_io_outs_0_6 = botRemoverFrontend_fifoOuts_6;
  assign _zz_io_outs_0_7 = botRemoverFrontend_fifoOuts_7;
  assign _zz_io_outs_0_8 = botRemoverFrontend_fifoOuts_8;
  assign _zz_io_outs_0_9 = botRemoverFrontend_fifoOuts_9;
  assign _zz_io_outs_0_10 = botRemoverFrontend_fifoOuts_10;
  assign _zz_io_outs_0_11 = botRemoverFrontend_fifoOuts_11;
  assign _zz_io_outs_0_12 = botRemoverFrontend_fifoOuts_12;
  assign _zz_io_outs_0_13 = botRemoverFrontend_fifoOuts_13;
  assign _zz_io_outs_0_14 = botRemoverFrontend_fifoOuts_14;
  assign _zz_io_outs_0_15 = botRemoverFrontend_fifoOuts_15;
  assign _zz_io_outs_0_16 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_15 : _zz_io_outs_0);
  assign _zz_io_outs_1 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0 : _zz_io_outs_0_1);
  assign _zz_io_outs_0_17 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_1 : _zz_io_outs_0_2);
  assign _zz_io_outs_1_1 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_2 : _zz_io_outs_0_3);
  assign _zz_io_outs_0_18 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_3 : _zz_io_outs_0_4);
  assign _zz_io_outs_1_2 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_4 : _zz_io_outs_0_5);
  assign _zz_io_outs_0_19 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_5 : _zz_io_outs_0_6);
  assign _zz_io_outs_1_3 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_6 : _zz_io_outs_0_7);
  assign _zz_io_outs_0_20 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_7 : _zz_io_outs_0_8);
  assign _zz_io_outs_1_4 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_8 : _zz_io_outs_0_9);
  assign _zz_io_outs_0_21 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_9 : _zz_io_outs_0_10);
  assign _zz_io_outs_1_5 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_10 : _zz_io_outs_0_11);
  assign _zz_io_outs_0_22 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_11 : _zz_io_outs_0_12);
  assign _zz_io_outs_1_6 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_12 : _zz_io_outs_0_13);
  assign _zz_io_outs_0_23 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_13 : _zz_io_outs_0_14);
  assign _zz_io_outs_1_7 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_14 : _zz_io_outs_0_15);
  assign _zz_io_outs_0_24 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_23 : _zz_io_outs_0_16);
  assign _zz_io_outs_1_8 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_7 : _zz_io_outs_1);
  assign _zz_io_outs_2 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_16 : _zz_io_outs_0_17);
  assign _zz_io_outs_3 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1 : _zz_io_outs_1_1);
  assign _zz_io_outs_0_25 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_17 : _zz_io_outs_0_18);
  assign _zz_io_outs_1_9 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_1 : _zz_io_outs_1_2);
  assign _zz_io_outs_2_1 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_18 : _zz_io_outs_0_19);
  assign _zz_io_outs_3_1 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_2 : _zz_io_outs_1_3);
  assign _zz_io_outs_0_26 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_19 : _zz_io_outs_0_20);
  assign _zz_io_outs_1_10 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_3 : _zz_io_outs_1_4);
  assign _zz_io_outs_2_2 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_20 : _zz_io_outs_0_21);
  assign _zz_io_outs_3_2 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_4 : _zz_io_outs_1_5);
  assign _zz_io_outs_0_27 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_21 : _zz_io_outs_0_22);
  assign _zz_io_outs_1_11 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_5 : _zz_io_outs_1_6);
  assign _zz_io_outs_2_3 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_22 : _zz_io_outs_0_23);
  assign _zz_io_outs_3_3 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_6 : _zz_io_outs_1_7);
  assign _zz_io_outs_0_28 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_0_27 : _zz_io_outs_0_24);
  assign _zz_io_outs_1_12 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_1_11 : _zz_io_outs_1_8);
  assign _zz_io_outs_2_4 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_2_3 : _zz_io_outs_2);
  assign _zz_io_outs_3_4 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_3_3 : _zz_io_outs_3);
  assign _zz_io_outs_4 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_0_24 : _zz_io_outs_0_25);
  assign _zz_io_outs_5 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_1_8 : _zz_io_outs_1_9);
  assign _zz_io_outs_6 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_2 : _zz_io_outs_2_1);
  assign _zz_io_outs_7 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_3 : _zz_io_outs_3_1);
  assign _zz_io_outs_0_29 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_0_25 : _zz_io_outs_0_26);
  assign _zz_io_outs_1_13 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_1_9 : _zz_io_outs_1_10);
  assign _zz_io_outs_2_5 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_2_1 : _zz_io_outs_2_2);
  assign _zz_io_outs_3_5 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_3_1 : _zz_io_outs_3_2);
  assign _zz_io_outs_4_1 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_0_26 : _zz_io_outs_0_27);
  assign _zz_io_outs_5_1 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_1_10 : _zz_io_outs_1_11);
  assign _zz_io_outs_6_1 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_2_2 : _zz_io_outs_2_3);
  assign _zz_io_outs_7_1 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_3_2 : _zz_io_outs_3_3);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_16 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_0 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_0_29 : _zz_io_outs_0_28);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_17 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_1 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_1_13 : _zz_io_outs_1_12);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_18 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_2 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_2_5 : _zz_io_outs_2_4);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_19 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_3 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_3_5 : _zz_io_outs_3_4);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_20 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_4 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_4_1 : _zz_io_outs_4);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_21 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_5 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_5_1 : _zz_io_outs_5);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_22 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_6 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_6_1 : _zz_io_outs_6);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_23 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_7 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_7_1 : _zz_io_outs_7);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_24 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_8 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_0_28 : _zz_io_outs_0_29);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_25 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_9 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_1_12 : _zz_io_outs_1_13);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_26 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_10 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_2_4 : _zz_io_outs_2_5);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_27 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_11 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_3_4 : _zz_io_outs_3_5);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_28 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_12 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_4 : _zz_io_outs_4_1);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_29 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_13 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_5 : _zz_io_outs_5_1);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_30 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_14 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_6 : _zz_io_outs_6_1);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      4'b0000 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_0);
      end
      4'b0001 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_1);
      end
      4'b0010 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_2);
      end
      4'b0011 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_3);
      end
      4'b0100 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_4);
      end
      4'b0101 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_5);
      end
      4'b0110 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_6);
      end
      4'b0111 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_7);
      end
      4'b1000 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_8);
      end
      4'b1001 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_9);
      end
      4'b1010 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_10);
      end
      4'b1011 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_11);
      end
      4'b1100 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_12);
      end
      4'b1101 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_13);
      end
      4'b1110 : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_14);
      end
      default : begin
        _zz_io_pop_ready_31 = (! io_fifoPopSig_15);
      end
    endcase
  end

  assign io_outs_15 = (botRemoverFrontend_rotateOutOffset[3] ? _zz_io_outs_7 : _zz_io_outs_7_1);
  assign topRemoverFrontend_fifos_0_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_1_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_2_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_3_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_4_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_5_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_6_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_7_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_8_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_9_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_10_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_11_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_12_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_13_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_14_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_15_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_0_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_1_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_2_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_3_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_4_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_5_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_6_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_7_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_8_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_9_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_10_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_11_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_12_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_13_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_14_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_15_io_flush = 1'b0;
  always @(posedge clk) begin
    if(!clrn) begin
      topRemoverFrontend_rotateInOffset <= 4'b0000;
      topRemoverFrontend_rotateOutOffset <= 4'b0000;
      botRemoverFrontend_rotateInOffset <= 4'b0000;
      botRemoverFrontend_rotateOutOffset <= 4'b0000;
    end else begin
      topRemoverFrontend_rotateInOffset <= (_zz_topRemoverFrontend_rotateInOffset_10 % 5'h10);
      topRemoverFrontend_rotateOutOffset <= _zz_topRemoverFrontend_rotateOutOffset_17[3 : 0];
      botRemoverFrontend_rotateInOffset <= (_zz_botRemoverFrontend_rotateInOffset_10 % 5'h10);
      botRemoverFrontend_rotateOutOffset <= _zz_botRemoverFrontend_rotateOutOffset_17[3 : 0];
    end
  end


endmodule
