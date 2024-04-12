// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemoverFrontend_2
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemoverFrontend_2 (
  input  wire [10:0]   io_upperIns_0,
  input  wire [10:0]   io_upperIns_1,
  input  wire [10:0]   io_upperIns_2,
  input  wire [10:0]   io_upperIns_3,
  input  wire [10:0]   io_lowerIns_0,
  input  wire [10:0]   io_lowerIns_1,
  input  wire [10:0]   io_lowerIns_2,
  input  wire [10:0]   io_lowerIns_3,
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
  input  wire          io_fifoPopSig_0,
  input  wire          io_fifoPopSig_1,
  input  wire          io_fifoPopSig_2,
  input  wire          io_fifoPopSig_3,
  input  wire          io_fifoPopSig_4,
  input  wire          io_fifoPopSig_5,
  input  wire          io_fifoPopSig_6,
  input  wire          io_fifoPopSig_7,
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
  wire       [2:0]    _zz_topRemoverFrontend_rotateInOffset_6;
  wire       [3:0]    _zz_topRemoverFrontend_rotateOutOffset_9;
  wire       [3:0]    _zz_topRemoverFrontend_rotateOutOffset_10;
  wire       [3:0]    _zz_topRemoverFrontend_rotateOutOffset_11;
  wire       [2:0]    _zz_botRemoverFrontend_rotateInOffset_6;
  wire       [3:0]    _zz_botRemoverFrontend_rotateOutOffset_9;
  wire       [3:0]    _zz_botRemoverFrontend_rotateOutOffset_10;
  wire       [3:0]    _zz_botRemoverFrontend_rotateOutOffset_11;
  reg        [2:0]    topRemoverFrontend_rotateInOffset;
  reg        [3:0]    topRemoverFrontend_rateIn;
  reg                 _zz_topRemoverFrontend_rateIn;
  reg                 _zz_topRemoverFrontend_rateIn_1;
  reg                 _zz_topRemoverFrontend_rateIn_2;
  reg                 _zz_topRemoverFrontend_rateIn_3;
  wire       [3:0]    _zz_topRemoverFrontend_rotateInOffset;
  reg        [4:0]    _zz_topRemoverFrontend_rotateInOffset_1;
  wire                _zz_topRemoverFrontend_rotateInOffset_2;
  wire                _zz_topRemoverFrontend_rotateInOffset_3;
  wire                _zz_topRemoverFrontend_rotateInOffset_4;
  wire                _zz_topRemoverFrontend_rotateInOffset_5;
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
  reg        [2:0]    topRemoverFrontend_rotateOutOffset;
  wire       [7:0]    topRemoverFrontend_rateOut;
  wire       [10:0]   topRemoverFrontend_fifoOuts_0;
  wire       [10:0]   topRemoverFrontend_fifoOuts_1;
  wire       [10:0]   topRemoverFrontend_fifoOuts_2;
  wire       [10:0]   topRemoverFrontend_fifoOuts_3;
  wire       [10:0]   topRemoverFrontend_fifoOuts_4;
  wire       [10:0]   topRemoverFrontend_fifoOuts_5;
  wire       [10:0]   topRemoverFrontend_fifoOuts_6;
  wire       [10:0]   topRemoverFrontend_fifoOuts_7;
  reg        [8:0]    _zz_topRemoverFrontend_rotateOutOffset;
  wire                _zz_topRemoverFrontend_rotateOutOffset_1;
  wire                _zz_topRemoverFrontend_rotateOutOffset_2;
  wire                _zz_topRemoverFrontend_rotateOutOffset_3;
  wire                _zz_topRemoverFrontend_rotateOutOffset_4;
  wire                _zz_topRemoverFrontend_rotateOutOffset_5;
  wire                _zz_topRemoverFrontend_rotateOutOffset_6;
  wire                _zz_topRemoverFrontend_rotateOutOffset_7;
  wire                _zz_topRemoverFrontend_rotateOutOffset_8;
  wire       [10:0]   _zz_io_outs_8;
  wire       [10:0]   _zz_io_outs_8_1;
  wire       [10:0]   _zz_io_outs_8_2;
  wire       [10:0]   _zz_io_outs_8_3;
  wire       [10:0]   _zz_io_outs_8_4;
  wire       [10:0]   _zz_io_outs_8_5;
  wire       [10:0]   _zz_io_outs_8_6;
  wire       [10:0]   _zz_io_outs_8_7;
  wire       [10:0]   _zz_io_outs_8_8;
  wire       [10:0]   _zz_io_outs_9;
  wire       [10:0]   _zz_io_outs_8_9;
  wire       [10:0]   _zz_io_outs_9_1;
  wire       [10:0]   _zz_io_outs_8_10;
  wire       [10:0]   _zz_io_outs_9_2;
  wire       [10:0]   _zz_io_outs_8_11;
  wire       [10:0]   _zz_io_outs_9_3;
  wire       [10:0]   _zz_io_outs_8_12;
  wire       [10:0]   _zz_io_outs_9_4;
  wire       [10:0]   _zz_io_outs_10;
  wire       [10:0]   _zz_io_outs_11;
  wire       [10:0]   _zz_io_outs_8_13;
  wire       [10:0]   _zz_io_outs_9_5;
  wire       [10:0]   _zz_io_outs_10_1;
  wire       [10:0]   _zz_io_outs_11_1;
  reg                 _zz_io_pop_ready;
  reg                 _zz_io_pop_ready_1;
  reg                 _zz_io_pop_ready_2;
  reg                 _zz_io_pop_ready_3;
  reg                 _zz_io_pop_ready_4;
  reg                 _zz_io_pop_ready_5;
  reg                 _zz_io_pop_ready_6;
  reg                 _zz_io_pop_ready_7;
  reg        [2:0]    botRemoverFrontend_rotateInOffset;
  reg        [3:0]    botRemoverFrontend_rateIn;
  reg                 _zz_botRemoverFrontend_rateIn;
  reg                 _zz_botRemoverFrontend_rateIn_1;
  reg                 _zz_botRemoverFrontend_rateIn_2;
  reg                 _zz_botRemoverFrontend_rateIn_3;
  wire       [3:0]    _zz_botRemoverFrontend_rotateInOffset;
  reg        [4:0]    _zz_botRemoverFrontend_rotateInOffset_1;
  wire                _zz_botRemoverFrontend_rotateInOffset_2;
  wire                _zz_botRemoverFrontend_rotateInOffset_3;
  wire                _zz_botRemoverFrontend_rotateInOffset_4;
  wire                _zz_botRemoverFrontend_rotateInOffset_5;
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
  reg        [2:0]    botRemoverFrontend_rotateOutOffset;
  wire       [7:0]    botRemoverFrontend_rateOut;
  wire       [10:0]   botRemoverFrontend_fifoOuts_0;
  wire       [10:0]   botRemoverFrontend_fifoOuts_1;
  wire       [10:0]   botRemoverFrontend_fifoOuts_2;
  wire       [10:0]   botRemoverFrontend_fifoOuts_3;
  wire       [10:0]   botRemoverFrontend_fifoOuts_4;
  wire       [10:0]   botRemoverFrontend_fifoOuts_5;
  wire       [10:0]   botRemoverFrontend_fifoOuts_6;
  wire       [10:0]   botRemoverFrontend_fifoOuts_7;
  reg        [8:0]    _zz_botRemoverFrontend_rotateOutOffset;
  wire                _zz_botRemoverFrontend_rotateOutOffset_1;
  wire                _zz_botRemoverFrontend_rotateOutOffset_2;
  wire                _zz_botRemoverFrontend_rotateOutOffset_3;
  wire                _zz_botRemoverFrontend_rotateOutOffset_4;
  wire                _zz_botRemoverFrontend_rotateOutOffset_5;
  wire                _zz_botRemoverFrontend_rotateOutOffset_6;
  wire                _zz_botRemoverFrontend_rotateOutOffset_7;
  wire                _zz_botRemoverFrontend_rotateOutOffset_8;
  wire       [10:0]   _zz_io_outs_0;
  wire       [10:0]   _zz_io_outs_0_1;
  wire       [10:0]   _zz_io_outs_0_2;
  wire       [10:0]   _zz_io_outs_0_3;
  wire       [10:0]   _zz_io_outs_0_4;
  wire       [10:0]   _zz_io_outs_0_5;
  wire       [10:0]   _zz_io_outs_0_6;
  wire       [10:0]   _zz_io_outs_0_7;
  wire       [10:0]   _zz_io_outs_0_8;
  wire       [10:0]   _zz_io_outs_1;
  wire       [10:0]   _zz_io_outs_0_9;
  wire       [10:0]   _zz_io_outs_1_1;
  wire       [10:0]   _zz_io_outs_0_10;
  wire       [10:0]   _zz_io_outs_1_2;
  wire       [10:0]   _zz_io_outs_0_11;
  wire       [10:0]   _zz_io_outs_1_3;
  wire       [10:0]   _zz_io_outs_0_12;
  wire       [10:0]   _zz_io_outs_1_4;
  wire       [10:0]   _zz_io_outs_2;
  wire       [10:0]   _zz_io_outs_3;
  wire       [10:0]   _zz_io_outs_0_13;
  wire       [10:0]   _zz_io_outs_1_5;
  wire       [10:0]   _zz_io_outs_2_1;
  wire       [10:0]   _zz_io_outs_3_1;
  reg                 _zz_io_pop_ready_8;
  reg                 _zz_io_pop_ready_9;
  reg                 _zz_io_pop_ready_10;
  reg                 _zz_io_pop_ready_11;
  reg                 _zz_io_pop_ready_12;
  reg                 _zz_io_pop_ready_13;
  reg                 _zz_io_pop_ready_14;
  reg                 _zz_io_pop_ready_15;

  assign _zz_topRemoverFrontend_rotateInOffset_6 = ({_zz_topRemoverFrontend_rotateInOffset_3,{_zz_topRemoverFrontend_rotateInOffset_5,_zz_topRemoverFrontend_rotateInOffset_4}} + topRemoverFrontend_rotateInOffset);
  assign _zz_topRemoverFrontend_rotateOutOffset_9 = (_zz_topRemoverFrontend_rotateOutOffset_10 % 4'b1000);
  assign _zz_topRemoverFrontend_rotateOutOffset_10 = ({_zz_topRemoverFrontend_rotateOutOffset_5,{_zz_topRemoverFrontend_rotateOutOffset_8,{_zz_topRemoverFrontend_rotateOutOffset_7,_zz_topRemoverFrontend_rotateOutOffset_6}}} + _zz_topRemoverFrontend_rotateOutOffset_11);
  assign _zz_topRemoverFrontend_rotateOutOffset_11 = {1'd0, topRemoverFrontend_rotateOutOffset};
  assign _zz_botRemoverFrontend_rotateInOffset_6 = ({_zz_botRemoverFrontend_rotateInOffset_3,{_zz_botRemoverFrontend_rotateInOffset_5,_zz_botRemoverFrontend_rotateInOffset_4}} + botRemoverFrontend_rotateInOffset);
  assign _zz_botRemoverFrontend_rotateOutOffset_9 = (_zz_botRemoverFrontend_rotateOutOffset_10 % 4'b1000);
  assign _zz_botRemoverFrontend_rotateOutOffset_10 = ({_zz_botRemoverFrontend_rotateOutOffset_5,{_zz_botRemoverFrontend_rotateOutOffset_8,{_zz_botRemoverFrontend_rotateOutOffset_7,_zz_botRemoverFrontend_rotateOutOffset_6}}} + _zz_botRemoverFrontend_rotateOutOffset_11);
  assign _zz_botRemoverFrontend_rotateOutOffset_11 = {1'd0, botRemoverFrontend_rotateOutOffset};
  StreamFifo_48 topRemoverFrontend_fifos_0 (
    .io_push_valid   (topRemoverFrontend_fifos_0_io_push_valid       ), //i
    .io_push_ready   (topRemoverFrontend_fifos_0_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_24[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_25[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_26[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_27[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_28[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_29[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_30[10:0]                     ), //i
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
    .io_push_payload (_zz_io_push_valid_31[10:0]                     ), //i
    .io_pop_valid    (topRemoverFrontend_fifos_7_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_7                             ), //i
    .io_pop_payload  (topRemoverFrontend_fifos_7_io_pop_payload[10:0]), //o
    .io_flush        (topRemoverFrontend_fifos_7_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_0 (
    .io_push_valid   (botRemoverFrontend_fifos_0_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_0_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_56[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_0_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_8                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_0_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_0_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_1 (
    .io_push_valid   (botRemoverFrontend_fifos_1_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_1_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_57[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_1_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_9                             ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_1_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_1_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_2 (
    .io_push_valid   (botRemoverFrontend_fifos_2_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_2_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_58[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_2_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_10                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_2_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_2_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_3 (
    .io_push_valid   (botRemoverFrontend_fifos_3_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_3_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_59[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_3_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_11                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_3_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_3_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_4 (
    .io_push_valid   (botRemoverFrontend_fifos_4_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_4_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_60[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_4_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_12                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_4_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_4_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_5 (
    .io_push_valid   (botRemoverFrontend_fifos_5_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_5_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_61[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_5_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_13                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_5_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_5_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_6 (
    .io_push_valid   (botRemoverFrontend_fifos_6_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_6_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_62[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_6_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_14                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_6_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_6_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  StreamFifo_48 botRemoverFrontend_fifos_7 (
    .io_push_valid   (botRemoverFrontend_fifos_7_io_push_valid       ), //i
    .io_push_ready   (botRemoverFrontend_fifos_7_io_push_ready       ), //o
    .io_push_payload (_zz_io_push_valid_63[10:0]                     ), //i
    .io_pop_valid    (botRemoverFrontend_fifos_7_io_pop_valid        ), //o
    .io_pop_ready    (_zz_io_pop_ready_15                            ), //i
    .io_pop_payload  (botRemoverFrontend_fifos_7_io_pop_payload[10:0]), //o
    .io_flush        (botRemoverFrontend_fifos_7_io_flush            ), //i
    .clk             (clk                                            ), //i
    .clrn            (clrn                                           )  //i
  );
  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b001 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b010 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b011 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_5_io_push_ready;
      end
      3'b100 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_4_io_push_ready;
      end
      3'b101 : begin
        _zz_topRemoverFrontend_rateIn = topRemoverFrontend_fifos_3_io_push_ready;
      end
      3'b110 : begin
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
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      3'b001 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b010 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b011 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b100 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      3'b101 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      3'b110 : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_1 = topRemoverFrontend_fifos_2_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      3'b001 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      3'b010 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b011 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b100 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b101 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      3'b110 : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_4_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_2 = topRemoverFrontend_fifos_3_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(topRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_3_io_push_ready;
      end
      3'b001 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_2_io_push_ready;
      end
      3'b010 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_1_io_push_ready;
      end
      3'b011 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b100 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b101 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b110 : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_5_io_push_ready;
      end
      default : begin
        _zz_topRemoverFrontend_rateIn_3 = topRemoverFrontend_fifos_4_io_push_ready;
      end
    endcase
  end

  assign _zz_topRemoverFrontend_rotateInOffset = (~ topRemoverFrontend_rateIn);
  always @(*) begin
    _zz_topRemoverFrontend_rotateInOffset_1[0] = (! _zz_topRemoverFrontend_rotateInOffset[0]);
    _zz_topRemoverFrontend_rotateInOffset_1[1] = (_zz_topRemoverFrontend_rotateInOffset[0] && (! _zz_topRemoverFrontend_rotateInOffset[1]));
    _zz_topRemoverFrontend_rotateInOffset_1[2] = (_zz_topRemoverFrontend_rotateInOffset[1] && (! _zz_topRemoverFrontend_rotateInOffset[2]));
    _zz_topRemoverFrontend_rotateInOffset_1[3] = (_zz_topRemoverFrontend_rotateInOffset[2] && (! _zz_topRemoverFrontend_rotateInOffset[3]));
    _zz_topRemoverFrontend_rotateInOffset_1[4] = _zz_topRemoverFrontend_rotateInOffset[3];
  end

  assign _zz_topRemoverFrontend_rotateInOffset_2 = _zz_topRemoverFrontend_rotateInOffset_1[3];
  assign _zz_topRemoverFrontend_rotateInOffset_3 = _zz_topRemoverFrontend_rotateInOffset_1[4];
  assign _zz_topRemoverFrontend_rotateInOffset_4 = (_zz_topRemoverFrontend_rotateInOffset_1[1] || _zz_topRemoverFrontend_rotateInOffset_2);
  assign _zz_topRemoverFrontend_rotateInOffset_5 = (_zz_topRemoverFrontend_rotateInOffset_1[2] || _zz_topRemoverFrontend_rotateInOffset_2);
  assign _zz_io_push_valid = io_upperIns_0;
  assign _zz_io_push_valid_1 = io_upperIns_1;
  assign _zz_io_push_valid_2 = io_upperIns_2;
  assign _zz_io_push_valid_3 = io_upperIns_3;
  assign _zz_io_push_valid_4 = 11'h400;
  assign _zz_io_push_valid_5 = 11'h400;
  assign _zz_io_push_valid_6 = 11'h400;
  assign _zz_io_push_valid_7 = 11'h400;
  assign _zz_io_push_valid_8 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_7 : _zz_io_push_valid);
  assign _zz_io_push_valid_9 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid : _zz_io_push_valid_1);
  assign _zz_io_push_valid_10 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_1 : _zz_io_push_valid_2);
  assign _zz_io_push_valid_11 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_2 : _zz_io_push_valid_3);
  assign _zz_io_push_valid_12 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_3 : _zz_io_push_valid_4);
  assign _zz_io_push_valid_13 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_4 : _zz_io_push_valid_5);
  assign _zz_io_push_valid_14 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_5 : _zz_io_push_valid_6);
  assign _zz_io_push_valid_15 = (topRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_6 : _zz_io_push_valid_7);
  assign _zz_io_push_valid_16 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_14 : _zz_io_push_valid_8);
  assign _zz_io_push_valid_17 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_15 : _zz_io_push_valid_9);
  assign _zz_io_push_valid_18 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_8 : _zz_io_push_valid_10);
  assign _zz_io_push_valid_19 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_9 : _zz_io_push_valid_11);
  assign _zz_io_push_valid_20 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_10 : _zz_io_push_valid_12);
  assign _zz_io_push_valid_21 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_11 : _zz_io_push_valid_13);
  assign _zz_io_push_valid_22 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_12 : _zz_io_push_valid_14);
  assign _zz_io_push_valid_23 = (topRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_13 : _zz_io_push_valid_15);
  assign _zz_io_push_valid_24 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_20 : _zz_io_push_valid_16);
  assign _zz_io_push_valid_25 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_21 : _zz_io_push_valid_17);
  assign _zz_io_push_valid_26 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_22 : _zz_io_push_valid_18);
  assign _zz_io_push_valid_27 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_23 : _zz_io_push_valid_19);
  assign _zz_io_push_valid_28 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_16 : _zz_io_push_valid_20);
  assign _zz_io_push_valid_29 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_17 : _zz_io_push_valid_21);
  assign _zz_io_push_valid_30 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_18 : _zz_io_push_valid_22);
  assign _zz_io_push_valid_31 = (topRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_19 : _zz_io_push_valid_23);
  assign topRemoverFrontend_fifos_0_io_push_valid = _zz_io_push_valid_24[10];
  assign topRemoverFrontend_fifos_1_io_push_valid = _zz_io_push_valid_25[10];
  assign topRemoverFrontend_fifos_2_io_push_valid = _zz_io_push_valid_26[10];
  assign topRemoverFrontend_fifos_3_io_push_valid = _zz_io_push_valid_27[10];
  assign topRemoverFrontend_fifos_4_io_push_valid = _zz_io_push_valid_28[10];
  assign topRemoverFrontend_fifos_5_io_push_valid = _zz_io_push_valid_29[10];
  assign topRemoverFrontend_fifos_6_io_push_valid = _zz_io_push_valid_30[10];
  assign topRemoverFrontend_fifos_7_io_push_valid = _zz_io_push_valid_31[10];
  assign topRemoverFrontend_rateOut = {io_fifoPopSig_7,{io_fifoPopSig_6,{io_fifoPopSig_5,{io_fifoPopSig_4,{io_fifoPopSig_3,{io_fifoPopSig_2,{io_fifoPopSig_1,io_fifoPopSig_0}}}}}}};
  assign topRemoverFrontend_fifoOuts_0 = (topRemoverFrontend_fifos_0_io_pop_valid ? topRemoverFrontend_fifos_0_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_1 = (topRemoverFrontend_fifos_1_io_pop_valid ? topRemoverFrontend_fifos_1_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_2 = (topRemoverFrontend_fifos_2_io_pop_valid ? topRemoverFrontend_fifos_2_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_3 = (topRemoverFrontend_fifos_3_io_pop_valid ? topRemoverFrontend_fifos_3_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_4 = (topRemoverFrontend_fifos_4_io_pop_valid ? topRemoverFrontend_fifos_4_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_5 = (topRemoverFrontend_fifos_5_io_pop_valid ? topRemoverFrontend_fifos_5_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_6 = (topRemoverFrontend_fifos_6_io_pop_valid ? topRemoverFrontend_fifos_6_io_pop_payload : 11'h400);
  assign topRemoverFrontend_fifoOuts_7 = (topRemoverFrontend_fifos_7_io_pop_valid ? topRemoverFrontend_fifos_7_io_pop_payload : 11'h400);
  always @(*) begin
    _zz_topRemoverFrontend_rotateOutOffset[0] = (! topRemoverFrontend_rateOut[0]);
    _zz_topRemoverFrontend_rotateOutOffset[1] = (topRemoverFrontend_rateOut[0] && (! topRemoverFrontend_rateOut[1]));
    _zz_topRemoverFrontend_rotateOutOffset[2] = (topRemoverFrontend_rateOut[1] && (! topRemoverFrontend_rateOut[2]));
    _zz_topRemoverFrontend_rotateOutOffset[3] = (topRemoverFrontend_rateOut[2] && (! topRemoverFrontend_rateOut[3]));
    _zz_topRemoverFrontend_rotateOutOffset[4] = (topRemoverFrontend_rateOut[3] && (! topRemoverFrontend_rateOut[4]));
    _zz_topRemoverFrontend_rotateOutOffset[5] = (topRemoverFrontend_rateOut[4] && (! topRemoverFrontend_rateOut[5]));
    _zz_topRemoverFrontend_rotateOutOffset[6] = (topRemoverFrontend_rateOut[5] && (! topRemoverFrontend_rateOut[6]));
    _zz_topRemoverFrontend_rotateOutOffset[7] = (topRemoverFrontend_rateOut[6] && (! topRemoverFrontend_rateOut[7]));
    _zz_topRemoverFrontend_rotateOutOffset[8] = topRemoverFrontend_rateOut[7];
  end

  assign _zz_topRemoverFrontend_rotateOutOffset_1 = _zz_topRemoverFrontend_rotateOutOffset[3];
  assign _zz_topRemoverFrontend_rotateOutOffset_2 = _zz_topRemoverFrontend_rotateOutOffset[5];
  assign _zz_topRemoverFrontend_rotateOutOffset_3 = _zz_topRemoverFrontend_rotateOutOffset[6];
  assign _zz_topRemoverFrontend_rotateOutOffset_4 = _zz_topRemoverFrontend_rotateOutOffset[7];
  assign _zz_topRemoverFrontend_rotateOutOffset_5 = _zz_topRemoverFrontend_rotateOutOffset[8];
  assign _zz_topRemoverFrontend_rotateOutOffset_6 = (((_zz_topRemoverFrontend_rotateOutOffset[1] || _zz_topRemoverFrontend_rotateOutOffset_1) || _zz_topRemoverFrontend_rotateOutOffset_2) || _zz_topRemoverFrontend_rotateOutOffset_4);
  assign _zz_topRemoverFrontend_rotateOutOffset_7 = (((_zz_topRemoverFrontend_rotateOutOffset[2] || _zz_topRemoverFrontend_rotateOutOffset_1) || _zz_topRemoverFrontend_rotateOutOffset_3) || _zz_topRemoverFrontend_rotateOutOffset_4);
  assign _zz_topRemoverFrontend_rotateOutOffset_8 = (((_zz_topRemoverFrontend_rotateOutOffset[4] || _zz_topRemoverFrontend_rotateOutOffset_2) || _zz_topRemoverFrontend_rotateOutOffset_3) || _zz_topRemoverFrontend_rotateOutOffset_4);
  assign _zz_io_outs_8 = topRemoverFrontend_fifoOuts_0;
  assign _zz_io_outs_8_1 = topRemoverFrontend_fifoOuts_1;
  assign _zz_io_outs_8_2 = topRemoverFrontend_fifoOuts_2;
  assign _zz_io_outs_8_3 = topRemoverFrontend_fifoOuts_3;
  assign _zz_io_outs_8_4 = topRemoverFrontend_fifoOuts_4;
  assign _zz_io_outs_8_5 = topRemoverFrontend_fifoOuts_5;
  assign _zz_io_outs_8_6 = topRemoverFrontend_fifoOuts_6;
  assign _zz_io_outs_8_7 = topRemoverFrontend_fifoOuts_7;
  assign _zz_io_outs_8_8 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_7 : _zz_io_outs_8);
  assign _zz_io_outs_9 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8 : _zz_io_outs_8_1);
  assign _zz_io_outs_8_9 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_1 : _zz_io_outs_8_2);
  assign _zz_io_outs_9_1 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_2 : _zz_io_outs_8_3);
  assign _zz_io_outs_8_10 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_3 : _zz_io_outs_8_4);
  assign _zz_io_outs_9_2 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_4 : _zz_io_outs_8_5);
  assign _zz_io_outs_8_11 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_5 : _zz_io_outs_8_6);
  assign _zz_io_outs_9_3 = (topRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_8_6 : _zz_io_outs_8_7);
  assign _zz_io_outs_8_12 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_8_11 : _zz_io_outs_8_8);
  assign _zz_io_outs_9_4 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_9_3 : _zz_io_outs_9);
  assign _zz_io_outs_10 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_8_8 : _zz_io_outs_8_9);
  assign _zz_io_outs_11 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_9 : _zz_io_outs_9_1);
  assign _zz_io_outs_8_13 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_8_9 : _zz_io_outs_8_10);
  assign _zz_io_outs_9_5 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_9_1 : _zz_io_outs_9_2);
  assign _zz_io_outs_10_1 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_8_10 : _zz_io_outs_8_11);
  assign _zz_io_outs_11_1 = (topRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_9_2 : _zz_io_outs_9_3);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_8 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_8_13 : _zz_io_outs_8_12);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_1 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_9 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_9_5 : _zz_io_outs_9_4);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_2 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_10 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_10_1 : _zz_io_outs_10);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_3 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_11 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_11_1 : _zz_io_outs_11);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_4 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_12 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_8_12 : _zz_io_outs_8_13);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_5 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_13 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_9_4 : _zz_io_outs_9_5);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_6 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_14 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_10 : _zz_io_outs_10_1);
  always @(*) begin
    case(topRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_7;
      end
      3'b001 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_0;
      end
      3'b010 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_1;
      end
      3'b011 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_2;
      end
      3'b100 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_3;
      end
      3'b101 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_4;
      end
      3'b110 : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_5;
      end
      default : begin
        _zz_io_pop_ready_7 = io_fifoPopSig_6;
      end
    endcase
  end

  assign io_outs_15 = (topRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_11 : _zz_io_outs_11_1);
  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b001 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b010 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b011 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_5_io_push_ready;
      end
      3'b100 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_4_io_push_ready;
      end
      3'b101 : begin
        _zz_botRemoverFrontend_rateIn = botRemoverFrontend_fifos_3_io_push_ready;
      end
      3'b110 : begin
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
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      3'b001 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b010 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b011 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b100 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      3'b101 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      3'b110 : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_1 = botRemoverFrontend_fifos_2_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      3'b001 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      3'b010 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b011 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b100 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b101 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      3'b110 : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_4_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_2 = botRemoverFrontend_fifos_3_io_push_ready;
      end
    endcase
  end

  always @(*) begin
    case(botRemoverFrontend_rotateInOffset)
      3'b000 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_3_io_push_ready;
      end
      3'b001 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_2_io_push_ready;
      end
      3'b010 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_1_io_push_ready;
      end
      3'b011 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_0_io_push_ready;
      end
      3'b100 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_7_io_push_ready;
      end
      3'b101 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_6_io_push_ready;
      end
      3'b110 : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_5_io_push_ready;
      end
      default : begin
        _zz_botRemoverFrontend_rateIn_3 = botRemoverFrontend_fifos_4_io_push_ready;
      end
    endcase
  end

  assign _zz_botRemoverFrontend_rotateInOffset = (~ botRemoverFrontend_rateIn);
  always @(*) begin
    _zz_botRemoverFrontend_rotateInOffset_1[0] = (! _zz_botRemoverFrontend_rotateInOffset[0]);
    _zz_botRemoverFrontend_rotateInOffset_1[1] = (_zz_botRemoverFrontend_rotateInOffset[0] && (! _zz_botRemoverFrontend_rotateInOffset[1]));
    _zz_botRemoverFrontend_rotateInOffset_1[2] = (_zz_botRemoverFrontend_rotateInOffset[1] && (! _zz_botRemoverFrontend_rotateInOffset[2]));
    _zz_botRemoverFrontend_rotateInOffset_1[3] = (_zz_botRemoverFrontend_rotateInOffset[2] && (! _zz_botRemoverFrontend_rotateInOffset[3]));
    _zz_botRemoverFrontend_rotateInOffset_1[4] = _zz_botRemoverFrontend_rotateInOffset[3];
  end

  assign _zz_botRemoverFrontend_rotateInOffset_2 = _zz_botRemoverFrontend_rotateInOffset_1[3];
  assign _zz_botRemoverFrontend_rotateInOffset_3 = _zz_botRemoverFrontend_rotateInOffset_1[4];
  assign _zz_botRemoverFrontend_rotateInOffset_4 = (_zz_botRemoverFrontend_rotateInOffset_1[1] || _zz_botRemoverFrontend_rotateInOffset_2);
  assign _zz_botRemoverFrontend_rotateInOffset_5 = (_zz_botRemoverFrontend_rotateInOffset_1[2] || _zz_botRemoverFrontend_rotateInOffset_2);
  assign _zz_io_push_valid_32 = io_lowerIns_0;
  assign _zz_io_push_valid_33 = io_lowerIns_1;
  assign _zz_io_push_valid_34 = io_lowerIns_2;
  assign _zz_io_push_valid_35 = io_lowerIns_3;
  assign _zz_io_push_valid_36 = 11'h400;
  assign _zz_io_push_valid_37 = 11'h400;
  assign _zz_io_push_valid_38 = 11'h400;
  assign _zz_io_push_valid_39 = 11'h400;
  assign _zz_io_push_valid_40 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_39 : _zz_io_push_valid_32);
  assign _zz_io_push_valid_41 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_32 : _zz_io_push_valid_33);
  assign _zz_io_push_valid_42 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_33 : _zz_io_push_valid_34);
  assign _zz_io_push_valid_43 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_34 : _zz_io_push_valid_35);
  assign _zz_io_push_valid_44 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_35 : _zz_io_push_valid_36);
  assign _zz_io_push_valid_45 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_36 : _zz_io_push_valid_37);
  assign _zz_io_push_valid_46 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_37 : _zz_io_push_valid_38);
  assign _zz_io_push_valid_47 = (botRemoverFrontend_rotateInOffset[0] ? _zz_io_push_valid_38 : _zz_io_push_valid_39);
  assign _zz_io_push_valid_48 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_46 : _zz_io_push_valid_40);
  assign _zz_io_push_valid_49 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_47 : _zz_io_push_valid_41);
  assign _zz_io_push_valid_50 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_40 : _zz_io_push_valid_42);
  assign _zz_io_push_valid_51 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_41 : _zz_io_push_valid_43);
  assign _zz_io_push_valid_52 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_42 : _zz_io_push_valid_44);
  assign _zz_io_push_valid_53 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_43 : _zz_io_push_valid_45);
  assign _zz_io_push_valid_54 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_44 : _zz_io_push_valid_46);
  assign _zz_io_push_valid_55 = (botRemoverFrontend_rotateInOffset[1] ? _zz_io_push_valid_45 : _zz_io_push_valid_47);
  assign _zz_io_push_valid_56 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_52 : _zz_io_push_valid_48);
  assign _zz_io_push_valid_57 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_53 : _zz_io_push_valid_49);
  assign _zz_io_push_valid_58 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_54 : _zz_io_push_valid_50);
  assign _zz_io_push_valid_59 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_55 : _zz_io_push_valid_51);
  assign _zz_io_push_valid_60 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_48 : _zz_io_push_valid_52);
  assign _zz_io_push_valid_61 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_49 : _zz_io_push_valid_53);
  assign _zz_io_push_valid_62 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_50 : _zz_io_push_valid_54);
  assign _zz_io_push_valid_63 = (botRemoverFrontend_rotateInOffset[2] ? _zz_io_push_valid_51 : _zz_io_push_valid_55);
  assign botRemoverFrontend_fifos_0_io_push_valid = _zz_io_push_valid_56[10];
  assign botRemoverFrontend_fifos_1_io_push_valid = _zz_io_push_valid_57[10];
  assign botRemoverFrontend_fifos_2_io_push_valid = _zz_io_push_valid_58[10];
  assign botRemoverFrontend_fifos_3_io_push_valid = _zz_io_push_valid_59[10];
  assign botRemoverFrontend_fifos_4_io_push_valid = _zz_io_push_valid_60[10];
  assign botRemoverFrontend_fifos_5_io_push_valid = _zz_io_push_valid_61[10];
  assign botRemoverFrontend_fifos_6_io_push_valid = _zz_io_push_valid_62[10];
  assign botRemoverFrontend_fifos_7_io_push_valid = _zz_io_push_valid_63[10];
  assign botRemoverFrontend_rateOut = (~ {io_fifoPopSig_7,{io_fifoPopSig_6,{io_fifoPopSig_5,{io_fifoPopSig_4,{io_fifoPopSig_3,{io_fifoPopSig_2,{io_fifoPopSig_1,io_fifoPopSig_0}}}}}}});
  assign botRemoverFrontend_fifoOuts_0 = (botRemoverFrontend_fifos_0_io_pop_valid ? botRemoverFrontend_fifos_0_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_1 = (botRemoverFrontend_fifos_1_io_pop_valid ? botRemoverFrontend_fifos_1_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_2 = (botRemoverFrontend_fifos_2_io_pop_valid ? botRemoverFrontend_fifos_2_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_3 = (botRemoverFrontend_fifos_3_io_pop_valid ? botRemoverFrontend_fifos_3_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_4 = (botRemoverFrontend_fifos_4_io_pop_valid ? botRemoverFrontend_fifos_4_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_5 = (botRemoverFrontend_fifos_5_io_pop_valid ? botRemoverFrontend_fifos_5_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_6 = (botRemoverFrontend_fifos_6_io_pop_valid ? botRemoverFrontend_fifos_6_io_pop_payload : 11'h400);
  assign botRemoverFrontend_fifoOuts_7 = (botRemoverFrontend_fifos_7_io_pop_valid ? botRemoverFrontend_fifos_7_io_pop_payload : 11'h400);
  always @(*) begin
    _zz_botRemoverFrontend_rotateOutOffset[0] = (! botRemoverFrontend_rateOut[0]);
    _zz_botRemoverFrontend_rotateOutOffset[1] = (botRemoverFrontend_rateOut[0] && (! botRemoverFrontend_rateOut[1]));
    _zz_botRemoverFrontend_rotateOutOffset[2] = (botRemoverFrontend_rateOut[1] && (! botRemoverFrontend_rateOut[2]));
    _zz_botRemoverFrontend_rotateOutOffset[3] = (botRemoverFrontend_rateOut[2] && (! botRemoverFrontend_rateOut[3]));
    _zz_botRemoverFrontend_rotateOutOffset[4] = (botRemoverFrontend_rateOut[3] && (! botRemoverFrontend_rateOut[4]));
    _zz_botRemoverFrontend_rotateOutOffset[5] = (botRemoverFrontend_rateOut[4] && (! botRemoverFrontend_rateOut[5]));
    _zz_botRemoverFrontend_rotateOutOffset[6] = (botRemoverFrontend_rateOut[5] && (! botRemoverFrontend_rateOut[6]));
    _zz_botRemoverFrontend_rotateOutOffset[7] = (botRemoverFrontend_rateOut[6] && (! botRemoverFrontend_rateOut[7]));
    _zz_botRemoverFrontend_rotateOutOffset[8] = botRemoverFrontend_rateOut[7];
  end

  assign _zz_botRemoverFrontend_rotateOutOffset_1 = _zz_botRemoverFrontend_rotateOutOffset[3];
  assign _zz_botRemoverFrontend_rotateOutOffset_2 = _zz_botRemoverFrontend_rotateOutOffset[5];
  assign _zz_botRemoverFrontend_rotateOutOffset_3 = _zz_botRemoverFrontend_rotateOutOffset[6];
  assign _zz_botRemoverFrontend_rotateOutOffset_4 = _zz_botRemoverFrontend_rotateOutOffset[7];
  assign _zz_botRemoverFrontend_rotateOutOffset_5 = _zz_botRemoverFrontend_rotateOutOffset[8];
  assign _zz_botRemoverFrontend_rotateOutOffset_6 = (((_zz_botRemoverFrontend_rotateOutOffset[1] || _zz_botRemoverFrontend_rotateOutOffset_1) || _zz_botRemoverFrontend_rotateOutOffset_2) || _zz_botRemoverFrontend_rotateOutOffset_4);
  assign _zz_botRemoverFrontend_rotateOutOffset_7 = (((_zz_botRemoverFrontend_rotateOutOffset[2] || _zz_botRemoverFrontend_rotateOutOffset_1) || _zz_botRemoverFrontend_rotateOutOffset_3) || _zz_botRemoverFrontend_rotateOutOffset_4);
  assign _zz_botRemoverFrontend_rotateOutOffset_8 = (((_zz_botRemoverFrontend_rotateOutOffset[4] || _zz_botRemoverFrontend_rotateOutOffset_2) || _zz_botRemoverFrontend_rotateOutOffset_3) || _zz_botRemoverFrontend_rotateOutOffset_4);
  assign _zz_io_outs_0 = botRemoverFrontend_fifoOuts_0;
  assign _zz_io_outs_0_1 = botRemoverFrontend_fifoOuts_1;
  assign _zz_io_outs_0_2 = botRemoverFrontend_fifoOuts_2;
  assign _zz_io_outs_0_3 = botRemoverFrontend_fifoOuts_3;
  assign _zz_io_outs_0_4 = botRemoverFrontend_fifoOuts_4;
  assign _zz_io_outs_0_5 = botRemoverFrontend_fifoOuts_5;
  assign _zz_io_outs_0_6 = botRemoverFrontend_fifoOuts_6;
  assign _zz_io_outs_0_7 = botRemoverFrontend_fifoOuts_7;
  assign _zz_io_outs_0_8 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_7 : _zz_io_outs_0);
  assign _zz_io_outs_1 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0 : _zz_io_outs_0_1);
  assign _zz_io_outs_0_9 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_1 : _zz_io_outs_0_2);
  assign _zz_io_outs_1_1 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_2 : _zz_io_outs_0_3);
  assign _zz_io_outs_0_10 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_3 : _zz_io_outs_0_4);
  assign _zz_io_outs_1_2 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_4 : _zz_io_outs_0_5);
  assign _zz_io_outs_0_11 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_5 : _zz_io_outs_0_6);
  assign _zz_io_outs_1_3 = (botRemoverFrontend_rotateOutOffset[0] ? _zz_io_outs_0_6 : _zz_io_outs_0_7);
  assign _zz_io_outs_0_12 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_11 : _zz_io_outs_0_8);
  assign _zz_io_outs_1_4 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_3 : _zz_io_outs_1);
  assign _zz_io_outs_2 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_8 : _zz_io_outs_0_9);
  assign _zz_io_outs_3 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1 : _zz_io_outs_1_1);
  assign _zz_io_outs_0_13 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_9 : _zz_io_outs_0_10);
  assign _zz_io_outs_1_5 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_1 : _zz_io_outs_1_2);
  assign _zz_io_outs_2_1 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_0_10 : _zz_io_outs_0_11);
  assign _zz_io_outs_3_1 = (botRemoverFrontend_rotateOutOffset[1] ? _zz_io_outs_1_2 : _zz_io_outs_1_3);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_8 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_0 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_0_13 : _zz_io_outs_0_12);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_9 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_1 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_1_5 : _zz_io_outs_1_4);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_10 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_2 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_2_1 : _zz_io_outs_2);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_11 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_3 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_3_1 : _zz_io_outs_3);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_12 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_4 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_0_12 : _zz_io_outs_0_13);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_13 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_5 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_1_4 : _zz_io_outs_1_5);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_14 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_6 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_2 : _zz_io_outs_2_1);
  always @(*) begin
    case(botRemoverFrontend_rotateOutOffset)
      3'b000 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_0);
      end
      3'b001 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_1);
      end
      3'b010 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_2);
      end
      3'b011 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_3);
      end
      3'b100 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_4);
      end
      3'b101 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_5);
      end
      3'b110 : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_6);
      end
      default : begin
        _zz_io_pop_ready_15 = (! io_fifoPopSig_7);
      end
    endcase
  end

  assign io_outs_7 = (botRemoverFrontend_rotateOutOffset[2] ? _zz_io_outs_3 : _zz_io_outs_3_1);
  assign topRemoverFrontend_fifos_0_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_1_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_2_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_3_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_4_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_5_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_6_io_flush = 1'b0;
  assign topRemoverFrontend_fifos_7_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_0_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_1_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_2_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_3_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_4_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_5_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_6_io_flush = 1'b0;
  assign botRemoverFrontend_fifos_7_io_flush = 1'b0;
  always @(posedge clk) begin
    if(!clrn) begin
      topRemoverFrontend_rotateInOffset <= 3'b000;
      topRemoverFrontend_rotateOutOffset <= 3'b000;
      botRemoverFrontend_rotateInOffset <= 3'b000;
      botRemoverFrontend_rotateOutOffset <= 3'b000;
    end else begin
      topRemoverFrontend_rotateInOffset <= (_zz_topRemoverFrontend_rotateInOffset_6 % 4'b1000);
      topRemoverFrontend_rotateOutOffset <= _zz_topRemoverFrontend_rotateOutOffset_9[2 : 0];
      botRemoverFrontend_rotateInOffset <= (_zz_botRemoverFrontend_rotateInOffset_6 % 4'b1000);
      botRemoverFrontend_rotateOutOffset <= _zz_botRemoverFrontend_rotateOutOffset_9[2 : 0];
    end
  end


endmodule
