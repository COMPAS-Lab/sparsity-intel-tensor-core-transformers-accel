// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : TensorCoreChainBf12
// Git hash  : 0bb1bc1ae0d66d050090da7c42b30392afe42cab

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
  input      [79:0]   io_loadCascadeIn,
  input      [7:0]    io_expIn_0,
  input      [7:0]    io_expIn_1,
  input      [7:0]    io_expIn_2,
  input      [7:0]    io_expIn_3,
  input      [7:0]    io_expIn_4,
  input      [7:0]    io_expIn_5,
  input      [7:0]    io_expCascadeIn,
  input               io_dataValid,
  output              io_dataIterReady,
  input               io_loadValid,
  output              io_loadReady,
  output reg          io_res_valid,
  input               io_res_ready,
  output     [23:0]   io_res_payload_0,
  output     [23:0]   io_res_payload_1,
  output     [23:0]   io_res_payload_2,
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
  wire       [71:0]   AccuDelayInst_io_push_payload;
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
  wire                AccuDelayInst_io_push_ready;
  wire                AccuDelayInst_io_pop_valid;
  wire       [71:0]   AccuDelayInst_io_pop_payload;
  wire       [4:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [4:0]    _zz_loadSelCounter_valueNext;
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
  reg        [4:0]    loadCounter_valueNext;
  reg        [4:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willOverflow;
  reg                 loadSelCounter_willIncrement;
  wire                loadSelCounter_willClear;
  reg        [4:0]    loadSelCounter_valueNext;
  reg        [4:0]    loadSelCounter_value;
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
  reg                 inputCounter_willOverflow_delay_1;
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
  reg        [23:0]   fbDelayFifoPayload_0_delay_1;
  reg        [23:0]   fbDelayFifoPayload_0_delay_2;
  reg        [23:0]   fbDelayFifoPayload_1_delay_1;
  reg        [23:0]   fbDelayFifoPayload_1_delay_2;
  reg        [23:0]   fbDelayFifoPayload_2_delay_1;
  reg        [23:0]   fbDelayFifoPayload_2_delay_2;

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {4'd0, _zz_loadCounter_valueNext_1};
  assign _zz_loadSelCounter_valueNext_1 = loadSelCounter_willIncrement;
  assign _zz_loadSelCounter_valueNext = {4'd0, _zz_loadSelCounter_valueNext_1};
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
    .clk                    (clk                                            ), //i
    .acc_en                 (1'b0                                           ), //i
    .zero_en                (1'b0                                           ), //i
    .clr0                   (resValid                                       ), //i
    .bf24_a1                (fbDelayFifoPayload_0_delay_2[23:0]             ), //i
    .bf24_a2                (fbDelayFifoPayload_1_delay_2[23:0]             ), //i
    .bf24_a3                (fbDelayFifoPayload_2_delay_2[23:0]             ), //i
    .cascade_data_in_col_1  (tensor_core_bf12_5_cascade_data_out_col_1[31:0]), //i
    .cascade_data_in_col_2  (tensor_core_bf12_5_cascade_data_out_col_2[31:0]), //i
    .cascade_data_in_col_3  (tensor_core_bf12_5_cascade_data_out_col_3[31:0]), //i
    .bf24_col_1             (tcAccu_bf24_col_1[23:0]                        ), //o
    .bf24_col_2             (tcAccu_bf24_col_2[23:0]                        ), //o
    .bf24_col_3             (tcAccu_bf24_col_3[23:0]                        ), //o
    .cascade_data_out_col_1 (tcAccu_cascade_data_out_col_1[31:0]            ), //o
    .cascade_data_out_col_2 (tcAccu_cascade_data_out_col_2[31:0]            ), //o
    .cascade_data_out_col_3 (tcAccu_cascade_data_out_col_3[31:0]            )  //o
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
  StreamOutFifo AccuDelayInst (
    .io_push_valid   (oBufferLoadValid                   ), //i
    .io_push_ready   (AccuDelayInst_io_push_ready        ), //o
    .io_push_payload (AccuDelayInst_io_push_payload[71:0]), //i
    .io_pop_valid    (AccuDelayInst_io_pop_valid         ), //o
    .io_pop_ready    (AccuDelayInst_io_pop_ready         ), //i
    .io_pop_payload  (AccuDelayInst_io_pop_payload[71:0] ), //o
    .clk             (clk                                )  //i
  );
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(loadValidD3t) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willClear = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 5'h11);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 5'h0;
    end else begin
      loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 5'h0;
    end
  end

  always @(*) begin
    loadSelCounter_willIncrement = 1'b0;
    if(loadValidD2t) begin
      loadSelCounter_willIncrement = 1'b1;
    end
  end

  assign loadSelCounter_willClear = 1'b0;
  assign loadSelCounter_willOverflowIfInc = (loadSelCounter_value == 5'h11);
  assign loadSelCounter_willOverflow = (loadSelCounter_willOverflowIfInc && loadSelCounter_willIncrement);
  always @(*) begin
    if(loadSelCounter_willOverflow) begin
      loadSelCounter_valueNext = 5'h0;
    end else begin
      loadSelCounter_valueNext = (loadSelCounter_value + _zz_loadSelCounter_valueNext);
    end
    if(loadSelCounter_willClear) begin
      loadSelCounter_valueNext = 5'h0;
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
  assign io_dataIterReady = inputCounter_willOverflow_delay_1;
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
      resValidCounter_valueNext = 16'h0;
    end else begin
      resValidCounter_valueNext = (resValidCounter_value + _zz_resValidCounter_valueNext);
    end
    if(resValidCounter_willClear) begin
      resValidCounter_valueNext = 16'h0;
    end
  end

  assign resValidCounter_overflowVal = (io_matAColSubGrpLen - 16'h0001);
  assign fbDelayFifoPayload_0 = AccuDelayInst_io_pop_payload[23 : 0];
  assign fbDelayFifoPayload_1 = AccuDelayInst_io_pop_payload[47 : 24];
  assign fbDelayFifoPayload_2 = AccuDelayInst_io_pop_payload[71 : 48];
  assign io_res_payload_0 = fbDelayFifoPayload_0;
  assign io_res_payload_1 = fbDelayFifoPayload_1;
  assign io_res_payload_2 = fbDelayFifoPayload_2;
  always @(*) begin
    if(resValid) begin
      io_res_valid = AccuDelayInst_io_pop_valid;
    end else begin
      io_res_valid = 1'b0;
    end
  end

  always @(*) begin
    if(resValid) begin
      AccuDelayInst_io_pop_ready = io_res_ready;
    end else begin
      AccuDelayInst_io_pop_ready = oBufferLoadValid_delay_11;
    end
  end

  always @(posedge clk) begin
    if(!clrn) begin
      io_loadValid_delay_1 <= 1'b0;
      io_loadValid_delay_2 <= 1'b0;
      loadValidD3t <= 1'b0;
      io_loadValid_delay_1_1 <= 1'b0;
      loadValidD2t <= 1'b0;
      loadCounter_value <= 5'h0;
      loadSelCounter_value <= 5'h0;
      loadBufCtrlReg <= 2'b01;
      inputCounter_value <= 16'h0;
      loadBufSel <= 1'b0;
      inputCounter_willOverflow_delay_1 <= 1'b0;
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
      oBufferLoadValid <= 1'b0;
      outValidCounter_value <= 16'h0;
      outValidCounter_willOverflow_delay_1 <= 1'b0;
      resValidCounter_value <= 16'h0;
      resValid <= 1'b0;
      fbDelayFifoPayload_0_delay_1 <= 24'h0;
      fbDelayFifoPayload_0_delay_2 <= 24'h0;
      fbDelayFifoPayload_1_delay_1 <= 24'h0;
      fbDelayFifoPayload_1_delay_2 <= 24'h0;
      fbDelayFifoPayload_2_delay_1 <= 24'h0;
      fbDelayFifoPayload_2_delay_2 <= 24'h0;
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
      inputCounter_willOverflow_delay_1 <= inputCounter_willOverflow;
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
      oBufferLoadValid <= io_dataValid_delay_15;
      outValidCounter_value <= outValidCounter_valueNext;
      outValidCounter_willOverflow_delay_1 <= outValidCounter_willOverflow;
      resValidCounter_value <= resValidCounter_valueNext;
      resValid <= resValidCounter_willOverflowIfInc;
      fbDelayFifoPayload_0_delay_1 <= fbDelayFifoPayload_0;
      fbDelayFifoPayload_0_delay_2 <= fbDelayFifoPayload_0_delay_1;
      fbDelayFifoPayload_1_delay_1 <= fbDelayFifoPayload_1;
      fbDelayFifoPayload_1_delay_2 <= fbDelayFifoPayload_1_delay_1;
      fbDelayFifoPayload_2_delay_1 <= fbDelayFifoPayload_2;
      fbDelayFifoPayload_2_delay_2 <= fbDelayFifoPayload_2_delay_1;
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
    end
  end


endmodule
