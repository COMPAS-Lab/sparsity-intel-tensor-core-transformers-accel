// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyMover
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyMover (
  input  wire [10:0]   io_inputSeq_0,
  input  wire [10:0]   io_inputSeq_1,
  input  wire [10:0]   io_inputSeq_2,
  input  wire [10:0]   io_inputSeq_3,
  input  wire [10:0]   io_inputSeq_4,
  input  wire [10:0]   io_inputSeq_5,
  input  wire [10:0]   io_inputSeq_6,
  input  wire [10:0]   io_inputSeq_7,
  input  wire [10:0]   io_inputSeq_8,
  input  wire [10:0]   io_inputSeq_9,
  input  wire [10:0]   io_inputSeq_10,
  input  wire [10:0]   io_inputSeq_11,
  input  wire [10:0]   io_inputSeq_12,
  input  wire [10:0]   io_inputSeq_13,
  input  wire [10:0]   io_inputSeq_14,
  input  wire [10:0]   io_inputSeq_15,
  output wire [10:0]   io_outputSeq_0,
  output wire [10:0]   io_outputSeq_1,
  output wire [10:0]   io_outputSeq_2,
  output wire [10:0]   io_outputSeq_3,
  output wire [10:0]   io_outputSeq_4,
  output wire [10:0]   io_outputSeq_5,
  output wire [10:0]   io_outputSeq_6,
  output wire [10:0]   io_outputSeq_7,
  output wire [10:0]   io_outputSeq_8,
  output wire [10:0]   io_outputSeq_9,
  output wire [10:0]   io_outputSeq_10,
  output wire [10:0]   io_outputSeq_11,
  output wire [10:0]   io_outputSeq_12,
  output wire [10:0]   io_outputSeq_13,
  output wire [10:0]   io_outputSeq_14,
  output wire [10:0]   io_outputSeq_15
);

  reg        [10:0]   _zz_lower_half_1_1;
  wire       [0:0]    _zz_lower_half_1_1_1;
  reg        [10:0]   _zz_lower_half_2_1;
  wire       [0:0]    _zz_lower_half_2_1_1;
  reg        [10:0]   _zz_upper_half_1_1;
  wire       [0:0]    _zz_upper_half_1_1_1;
  reg        [10:0]   _zz_upper_half_2;
  wire       [0:0]    _zz_upper_half_2_1;
  reg        [10:0]   _zz_lower_half_2;
  wire       [0:0]    _zz_lower_half_2_2;
  reg        [10:0]   _zz_lower_half_3_1;
  wire       [1:0]    _zz_lower_half_3_2;
  wire       [1:0]    _zz_lower_half_3_3;
  wire       [0:0]    _zz_lower_half_3_4;
  reg        [10:0]   _zz_lower_half_4_1;
  wire       [1:0]    _zz_lower_half_4_2;
  wire       [1:0]    _zz_lower_half_4_3;
  wire       [0:0]    _zz_lower_half_4_4;
  reg        [10:0]   _zz_lower_half_5_1;
  wire       [1:0]    _zz_lower_half_5_2;
  wire       [1:0]    _zz_lower_half_5_3;
  wire       [0:0]    _zz_lower_half_5_4;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_2_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_2_2;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_3_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_3_2;
  reg        [10:0]   _zz_lower_half_1_4;
  wire       [0:0]    _zz_lower_half_1_4_1;
  reg        [10:0]   _zz_lower_half_2_2_1;
  wire       [0:0]    _zz_lower_half_2_2_2;
  reg        [10:0]   _zz_upper_half_1_5;
  wire       [0:0]    _zz_upper_half_1_5_1;
  reg        [10:0]   _zz_upper_half_2_2;
  wire       [0:0]    _zz_upper_half_2_2_1;
  reg        [10:0]   _zz_upper_half_2_1_1;
  wire       [0:0]    _zz_upper_half_2_1_2;
  reg        [10:0]   _zz_upper_half_3_1;
  wire       [1:0]    _zz_upper_half_3_1_1;
  wire       [1:0]    _zz_upper_half_3_1_2;
  wire       [0:0]    _zz_upper_half_3_1_3;
  reg        [10:0]   _zz_upper_half_4_1;
  wire       [1:0]    _zz_upper_half_4_2;
  wire       [1:0]    _zz_upper_half_4_3;
  wire       [0:0]    _zz_upper_half_4_4;
  reg        [10:0]   _zz_upper_half_5_1;
  wire       [1:0]    _zz_upper_half_5_2;
  wire       [1:0]    _zz_upper_half_5_3;
  wire       [0:0]    _zz_upper_half_5_4;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_6_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_6_2;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_7_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_7_2;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_8;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_8_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_8_2;
  wire       [2:0]    _zz_switch_RedundancyMover_l68_8_3;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_8_4;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_8_5;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_8_6;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_9;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_9_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_9_2;
  wire       [2:0]    _zz_switch_RedundancyMover_l68_9_3;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_9_4;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_9_5;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_9_6;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_10;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_10_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_10_2;
  wire       [2:0]    _zz_switch_RedundancyMover_l68_10_3;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_10_4;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_10_5;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_10_6;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_11;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_11_1;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_11_2;
  wire       [2:0]    _zz_switch_RedundancyMover_l68_11_3;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_11_4;
  wire       [1:0]    _zz_switch_RedundancyMover_l68_11_5;
  wire       [0:0]    _zz_switch_RedundancyMover_l68_11_6;
  reg        [10:0]   _zz_io_outputSeq_4;
  wire       [0:0]    _zz_io_outputSeq_4_1;
  reg        [10:0]   _zz_io_outputSeq_5_1;
  wire       [1:0]    _zz_io_outputSeq_5_2;
  wire       [1:0]    _zz_io_outputSeq_5_3;
  wire       [0:0]    _zz_io_outputSeq_5_4;
  reg        [10:0]   _zz_io_outputSeq_6_1;
  wire       [1:0]    _zz_io_outputSeq_6_2;
  wire       [1:0]    _zz_io_outputSeq_6_3;
  wire       [1:0]    _zz_io_outputSeq_6_4;
  wire       [0:0]    _zz_io_outputSeq_6_5;
  reg        [10:0]   _zz_io_outputSeq_7_1;
  wire       [2:0]    _zz_io_outputSeq_7_2;
  wire       [1:0]    _zz_io_outputSeq_7_3;
  wire       [1:0]    _zz_io_outputSeq_7_4;
  wire       [0:0]    _zz_io_outputSeq_7_5;
  wire       [2:0]    _zz_io_outputSeq_7_6;
  wire       [1:0]    _zz_io_outputSeq_7_7;
  wire       [1:0]    _zz_io_outputSeq_7_8;
  wire       [0:0]    _zz_io_outputSeq_7_9;
  reg        [10:0]   _zz_io_outputSeq_8_1;
  wire       [2:0]    _zz_io_outputSeq_8_2;
  wire       [1:0]    _zz_io_outputSeq_8_3;
  wire       [1:0]    _zz_io_outputSeq_8_4;
  wire       [0:0]    _zz_io_outputSeq_8_5;
  wire       [2:0]    _zz_io_outputSeq_8_6;
  wire       [1:0]    _zz_io_outputSeq_8_7;
  wire       [1:0]    _zz_io_outputSeq_8_8;
  wire       [0:0]    _zz_io_outputSeq_8_9;
  reg        [10:0]   _zz_io_outputSeq_9_1;
  wire       [2:0]    _zz_io_outputSeq_9_2;
  wire       [1:0]    _zz_io_outputSeq_9_3;
  wire       [1:0]    _zz_io_outputSeq_9_4;
  wire       [0:0]    _zz_io_outputSeq_9_5;
  wire       [2:0]    _zz_io_outputSeq_9_6;
  wire       [1:0]    _zz_io_outputSeq_9_7;
  wire       [1:0]    _zz_io_outputSeq_9_8;
  wire       [0:0]    _zz_io_outputSeq_9_9;
  reg        [10:0]   _zz_io_outputSeq_10_1;
  wire       [2:0]    _zz_io_outputSeq_10_2;
  wire       [1:0]    _zz_io_outputSeq_10_3;
  wire       [1:0]    _zz_io_outputSeq_10_4;
  wire       [0:0]    _zz_io_outputSeq_10_5;
  wire       [2:0]    _zz_io_outputSeq_10_6;
  wire       [1:0]    _zz_io_outputSeq_10_7;
  wire       [1:0]    _zz_io_outputSeq_10_8;
  wire       [0:0]    _zz_io_outputSeq_10_9;
  reg        [10:0]   _zz_io_outputSeq_11_1;
  wire       [2:0]    _zz_io_outputSeq_11_2;
  wire       [1:0]    _zz_io_outputSeq_11_3;
  wire       [1:0]    _zz_io_outputSeq_11_4;
  wire       [0:0]    _zz_io_outputSeq_11_5;
  wire       [2:0]    _zz_io_outputSeq_11_6;
  wire       [1:0]    _zz_io_outputSeq_11_7;
  wire       [1:0]    _zz_io_outputSeq_11_8;
  wire       [0:0]    _zz_io_outputSeq_11_9;
  reg        [10:0]   _zz_io_outputSeq_12;
  reg        [10:0]   _zz_io_outputSeq_13;
  reg        [10:0]   _zz_io_outputSeq_14;
  reg        [10:0]   _zz_io_outputSeq_15;
  wire       [10:0]   _zz_io_outputSeq_12_1;
  wire       [10:0]   lower_half_0;
  wire       [10:0]   lower_half_1;
  wire       [10:0]   lower_half_2;
  wire       [10:0]   lower_half_3;
  wire       [10:0]   lower_half_4;
  wire       [10:0]   lower_half_5;
  reg        [10:0]   lower_half_6;
  reg        [10:0]   lower_half_7;
  wire       [10:0]   _zz_lower_half_6;
  wire       [10:0]   lower_half_0_1;
  wire       [10:0]   lower_half_1_1;
  wire       [10:0]   lower_half_2_1;
  reg        [10:0]   lower_half_3_1;
  reg        [10:0]   lower_half_0_2;
  reg        [10:0]   lower_half_1_2;
  wire       [1:0]    switch_RedundancyMover_l17;
  reg        [10:0]   upper_half_0;
  reg        [10:0]   upper_half_1;
  wire       [1:0]    switch_RedundancyMover_l17_1;
  wire       [10:0]   upper_candidates_0;
  wire       [10:0]   upper_candidates_1;
  wire       [0:0]    switch_RedundancyMover_l68;
  wire       [10:0]   upper_half_0_1;
  wire       [10:0]   upper_half_1_1;
  wire       [10:0]   upper_half_2;
  reg        [10:0]   upper_half_3;
  reg        [10:0]   lower_half_0_3;
  reg        [10:0]   lower_half_1_3;
  wire       [1:0]    switch_RedundancyMover_l17_2;
  reg        [10:0]   upper_half_0_2;
  reg        [10:0]   upper_half_1_2;
  wire       [1:0]    switch_RedundancyMover_l17_3;
  wire       [10:0]   upper_candidates_0_1;
  wire       [10:0]   upper_candidates_1_1;
  wire       [0:0]    switch_RedundancyMover_l68_1;
  wire       [10:0]   upper_candidates_0_2;
  wire       [10:0]   upper_candidates_1_2;
  wire       [10:0]   upper_candidates_0_3;
  wire       [10:0]   upper_candidates_1_3;
  wire       [10:0]   upper_candidates_2;
  wire                _zz_lower_half_3;
  wire                _zz_lower_half_4;
  wire                _zz_lower_half_5;
  wire                _zz_switch_RedundancyMover_l68;
  wire       [1:0]    switch_RedundancyMover_l68_2;
  wire                _zz_switch_RedundancyMover_l68_1;
  wire       [1:0]    switch_RedundancyMover_l68_3;
  wire       [10:0]   upper_half_0_3;
  wire       [10:0]   upper_half_1_3;
  wire       [10:0]   upper_half_2_1;
  wire       [10:0]   upper_half_3_1;
  wire       [10:0]   upper_half_4;
  wire       [10:0]   upper_half_5;
  reg        [10:0]   upper_half_6;
  reg        [10:0]   upper_half_7;
  wire       [10:0]   _zz_upper_half_6;
  wire       [10:0]   lower_half_0_4;
  wire       [10:0]   lower_half_1_4;
  wire       [10:0]   lower_half_2_2;
  reg        [10:0]   lower_half_3_2;
  reg        [10:0]   lower_half_0_5;
  reg        [10:0]   lower_half_1_5;
  wire       [1:0]    switch_RedundancyMover_l17_4;
  reg        [10:0]   upper_half_0_4;
  reg        [10:0]   upper_half_1_4;
  wire       [1:0]    switch_RedundancyMover_l17_5;
  wire       [10:0]   upper_candidates_0_4;
  wire       [10:0]   upper_candidates_1_4;
  wire       [0:0]    switch_RedundancyMover_l68_4;
  wire       [10:0]   upper_half_0_5;
  wire       [10:0]   upper_half_1_5;
  wire       [10:0]   upper_half_2_2;
  reg        [10:0]   upper_half_3_2;
  reg        [10:0]   lower_half_0_6;
  reg        [10:0]   lower_half_1_6;
  wire       [1:0]    switch_RedundancyMover_l17_6;
  reg        [10:0]   upper_half_0_6;
  reg        [10:0]   upper_half_1_6;
  wire       [1:0]    switch_RedundancyMover_l17_7;
  wire       [10:0]   upper_candidates_0_5;
  wire       [10:0]   upper_candidates_1_5;
  wire       [0:0]    switch_RedundancyMover_l68_5;
  wire       [10:0]   upper_candidates_0_6;
  wire       [10:0]   upper_candidates_1_6;
  wire       [10:0]   upper_candidates_0_7;
  wire       [10:0]   upper_candidates_1_7;
  wire       [10:0]   upper_candidates_2_1;
  wire                _zz_upper_half_3;
  wire                _zz_upper_half_4;
  wire                _zz_upper_half_5;
  wire                _zz_switch_RedundancyMover_l68_2;
  wire       [1:0]    switch_RedundancyMover_l68_6;
  wire                _zz_switch_RedundancyMover_l68_3;
  wire       [1:0]    switch_RedundancyMover_l68_7;
  wire       [10:0]   upper_candidates_0_8;
  wire       [10:0]   upper_candidates_1_8;
  wire       [10:0]   upper_candidates_0_9;
  wire       [10:0]   upper_candidates_1_9;
  wire       [10:0]   upper_candidates_2_2;
  wire                _zz_io_outputSeq_5;
  wire       [10:0]   upper_candidates_0_10;
  wire       [10:0]   upper_candidates_1_10;
  wire       [10:0]   upper_candidates_2_3;
  wire       [10:0]   upper_candidates_3;
  wire                _zz_io_outputSeq_6;
  wire       [10:0]   upper_candidates_0_11;
  wire       [10:0]   upper_candidates_1_11;
  wire       [10:0]   upper_candidates_2_4;
  wire       [10:0]   upper_candidates_3_1;
  wire       [10:0]   upper_candidates_4;
  wire                _zz_io_outputSeq_7;
  wire                _zz_io_outputSeq_8;
  wire                _zz_io_outputSeq_9;
  wire                _zz_io_outputSeq_10;
  wire                _zz_io_outputSeq_11;
  wire                _zz_switch_RedundancyMover_l68_4;
  wire       [2:0]    switch_RedundancyMover_l68_8;
  wire                _zz_switch_RedundancyMover_l68_5;
  wire       [2:0]    switch_RedundancyMover_l68_9;
  wire                _zz_switch_RedundancyMover_l68_6;
  wire       [2:0]    switch_RedundancyMover_l68_10;
  wire                _zz_switch_RedundancyMover_l68_7;
  wire       [2:0]    switch_RedundancyMover_l68_11;

  assign _zz_lower_half_3_2 = ({1'b0,(lower_half_2_1[10] == _zz_lower_half_3)} + _zz_lower_half_3_3);
  assign _zz_lower_half_3_4 = (lower_half_3_1[10] == _zz_lower_half_3);
  assign _zz_lower_half_3_3 = {1'd0, _zz_lower_half_3_4};
  assign _zz_lower_half_4_2 = ({1'b0,(lower_half_2_1[10] == _zz_lower_half_4)} + _zz_lower_half_4_3);
  assign _zz_lower_half_4_4 = (lower_half_3_1[10] == _zz_lower_half_4);
  assign _zz_lower_half_4_3 = {1'd0, _zz_lower_half_4_4};
  assign _zz_lower_half_5_2 = ({1'b0,(lower_half_2_1[10] == _zz_lower_half_5)} + _zz_lower_half_5_3);
  assign _zz_lower_half_5_4 = (lower_half_3_1[10] == _zz_lower_half_5);
  assign _zz_lower_half_5_3 = {1'd0, _zz_lower_half_5_4};
  assign _zz_switch_RedundancyMover_l68_2_2 = (lower_half_3_1[10] == _zz_switch_RedundancyMover_l68);
  assign _zz_switch_RedundancyMover_l68_2_1 = {1'd0, _zz_switch_RedundancyMover_l68_2_2};
  assign _zz_switch_RedundancyMover_l68_3_2 = (lower_half_3_1[10] == _zz_switch_RedundancyMover_l68_1);
  assign _zz_switch_RedundancyMover_l68_3_1 = {1'd0, _zz_switch_RedundancyMover_l68_3_2};
  assign _zz_upper_half_3_1_1 = ({1'b0,(lower_half_2_2[10] == _zz_upper_half_3)} + _zz_upper_half_3_1_2);
  assign _zz_upper_half_3_1_3 = (lower_half_3_2[10] == _zz_upper_half_3);
  assign _zz_upper_half_3_1_2 = {1'd0, _zz_upper_half_3_1_3};
  assign _zz_upper_half_4_2 = ({1'b0,(lower_half_2_2[10] == _zz_upper_half_4)} + _zz_upper_half_4_3);
  assign _zz_upper_half_4_4 = (lower_half_3_2[10] == _zz_upper_half_4);
  assign _zz_upper_half_4_3 = {1'd0, _zz_upper_half_4_4};
  assign _zz_upper_half_5_2 = ({1'b0,(lower_half_2_2[10] == _zz_upper_half_5)} + _zz_upper_half_5_3);
  assign _zz_upper_half_5_4 = (lower_half_3_2[10] == _zz_upper_half_5);
  assign _zz_upper_half_5_3 = {1'd0, _zz_upper_half_5_4};
  assign _zz_switch_RedundancyMover_l68_6_2 = (lower_half_3_2[10] == _zz_switch_RedundancyMover_l68_2);
  assign _zz_switch_RedundancyMover_l68_6_1 = {1'd0, _zz_switch_RedundancyMover_l68_6_2};
  assign _zz_switch_RedundancyMover_l68_7_2 = (lower_half_3_2[10] == _zz_switch_RedundancyMover_l68_3);
  assign _zz_switch_RedundancyMover_l68_7_1 = {1'd0, _zz_switch_RedundancyMover_l68_7_2};
  assign _zz_switch_RedundancyMover_l68_8 = ({1'b0,(lower_half_4[10] == _zz_switch_RedundancyMover_l68_4)} + _zz_switch_RedundancyMover_l68_8_1);
  assign _zz_switch_RedundancyMover_l68_8_2 = (lower_half_5[10] == _zz_switch_RedundancyMover_l68_4);
  assign _zz_switch_RedundancyMover_l68_8_1 = {1'd0, _zz_switch_RedundancyMover_l68_8_2};
  assign _zz_switch_RedundancyMover_l68_8_4 = ({1'b0,(lower_half_6[10] == _zz_switch_RedundancyMover_l68_4)} + _zz_switch_RedundancyMover_l68_8_5);
  assign _zz_switch_RedundancyMover_l68_8_3 = {1'd0, _zz_switch_RedundancyMover_l68_8_4};
  assign _zz_switch_RedundancyMover_l68_8_6 = (lower_half_7[10] == _zz_switch_RedundancyMover_l68_4);
  assign _zz_switch_RedundancyMover_l68_8_5 = {1'd0, _zz_switch_RedundancyMover_l68_8_6};
  assign _zz_switch_RedundancyMover_l68_9 = ({1'b0,(lower_half_4[10] == _zz_switch_RedundancyMover_l68_5)} + _zz_switch_RedundancyMover_l68_9_1);
  assign _zz_switch_RedundancyMover_l68_9_2 = (lower_half_5[10] == _zz_switch_RedundancyMover_l68_5);
  assign _zz_switch_RedundancyMover_l68_9_1 = {1'd0, _zz_switch_RedundancyMover_l68_9_2};
  assign _zz_switch_RedundancyMover_l68_9_4 = ({1'b0,(lower_half_6[10] == _zz_switch_RedundancyMover_l68_5)} + _zz_switch_RedundancyMover_l68_9_5);
  assign _zz_switch_RedundancyMover_l68_9_3 = {1'd0, _zz_switch_RedundancyMover_l68_9_4};
  assign _zz_switch_RedundancyMover_l68_9_6 = (lower_half_7[10] == _zz_switch_RedundancyMover_l68_5);
  assign _zz_switch_RedundancyMover_l68_9_5 = {1'd0, _zz_switch_RedundancyMover_l68_9_6};
  assign _zz_switch_RedundancyMover_l68_10 = ({1'b0,(lower_half_4[10] == _zz_switch_RedundancyMover_l68_6)} + _zz_switch_RedundancyMover_l68_10_1);
  assign _zz_switch_RedundancyMover_l68_10_2 = (lower_half_5[10] == _zz_switch_RedundancyMover_l68_6);
  assign _zz_switch_RedundancyMover_l68_10_1 = {1'd0, _zz_switch_RedundancyMover_l68_10_2};
  assign _zz_switch_RedundancyMover_l68_10_4 = ({1'b0,(lower_half_6[10] == _zz_switch_RedundancyMover_l68_6)} + _zz_switch_RedundancyMover_l68_10_5);
  assign _zz_switch_RedundancyMover_l68_10_3 = {1'd0, _zz_switch_RedundancyMover_l68_10_4};
  assign _zz_switch_RedundancyMover_l68_10_6 = (lower_half_7[10] == _zz_switch_RedundancyMover_l68_6);
  assign _zz_switch_RedundancyMover_l68_10_5 = {1'd0, _zz_switch_RedundancyMover_l68_10_6};
  assign _zz_switch_RedundancyMover_l68_11 = ({1'b0,(lower_half_4[10] == _zz_switch_RedundancyMover_l68_7)} + _zz_switch_RedundancyMover_l68_11_1);
  assign _zz_switch_RedundancyMover_l68_11_2 = (lower_half_5[10] == _zz_switch_RedundancyMover_l68_7);
  assign _zz_switch_RedundancyMover_l68_11_1 = {1'd0, _zz_switch_RedundancyMover_l68_11_2};
  assign _zz_switch_RedundancyMover_l68_11_4 = ({1'b0,(lower_half_6[10] == _zz_switch_RedundancyMover_l68_7)} + _zz_switch_RedundancyMover_l68_11_5);
  assign _zz_switch_RedundancyMover_l68_11_3 = {1'd0, _zz_switch_RedundancyMover_l68_11_4};
  assign _zz_switch_RedundancyMover_l68_11_6 = (lower_half_7[10] == _zz_switch_RedundancyMover_l68_7);
  assign _zz_switch_RedundancyMover_l68_11_5 = {1'd0, _zz_switch_RedundancyMover_l68_11_6};
  assign _zz_io_outputSeq_5_2 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_5)} + _zz_io_outputSeq_5_3);
  assign _zz_io_outputSeq_5_4 = (lower_half_5[10] == _zz_io_outputSeq_5);
  assign _zz_io_outputSeq_5_3 = {1'd0, _zz_io_outputSeq_5_4};
  assign _zz_io_outputSeq_6_2 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_6)} + _zz_io_outputSeq_6_3);
  assign _zz_io_outputSeq_6_3 = ({1'b0,(lower_half_5[10] == _zz_io_outputSeq_6)} + _zz_io_outputSeq_6_4);
  assign _zz_io_outputSeq_6_5 = (lower_half_6[10] == _zz_io_outputSeq_6);
  assign _zz_io_outputSeq_6_4 = {1'd0, _zz_io_outputSeq_6_5};
  assign _zz_io_outputSeq_7_2 = ({1'b0,_zz_io_outputSeq_7_3} + _zz_io_outputSeq_7_6);
  assign _zz_io_outputSeq_7_3 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_7)} + _zz_io_outputSeq_7_4);
  assign _zz_io_outputSeq_7_5 = (lower_half_5[10] == _zz_io_outputSeq_7);
  assign _zz_io_outputSeq_7_4 = {1'd0, _zz_io_outputSeq_7_5};
  assign _zz_io_outputSeq_7_7 = ({1'b0,(lower_half_6[10] == _zz_io_outputSeq_7)} + _zz_io_outputSeq_7_8);
  assign _zz_io_outputSeq_7_6 = {1'd0, _zz_io_outputSeq_7_7};
  assign _zz_io_outputSeq_7_9 = (lower_half_7[10] == _zz_io_outputSeq_7);
  assign _zz_io_outputSeq_7_8 = {1'd0, _zz_io_outputSeq_7_9};
  assign _zz_io_outputSeq_8_2 = ({1'b0,_zz_io_outputSeq_8_3} + _zz_io_outputSeq_8_6);
  assign _zz_io_outputSeq_8_3 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_8)} + _zz_io_outputSeq_8_4);
  assign _zz_io_outputSeq_8_5 = (lower_half_5[10] == _zz_io_outputSeq_8);
  assign _zz_io_outputSeq_8_4 = {1'd0, _zz_io_outputSeq_8_5};
  assign _zz_io_outputSeq_8_7 = ({1'b0,(lower_half_6[10] == _zz_io_outputSeq_8)} + _zz_io_outputSeq_8_8);
  assign _zz_io_outputSeq_8_6 = {1'd0, _zz_io_outputSeq_8_7};
  assign _zz_io_outputSeq_8_9 = (lower_half_7[10] == _zz_io_outputSeq_8);
  assign _zz_io_outputSeq_8_8 = {1'd0, _zz_io_outputSeq_8_9};
  assign _zz_io_outputSeq_9_2 = ({1'b0,_zz_io_outputSeq_9_3} + _zz_io_outputSeq_9_6);
  assign _zz_io_outputSeq_9_3 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_9)} + _zz_io_outputSeq_9_4);
  assign _zz_io_outputSeq_9_5 = (lower_half_5[10] == _zz_io_outputSeq_9);
  assign _zz_io_outputSeq_9_4 = {1'd0, _zz_io_outputSeq_9_5};
  assign _zz_io_outputSeq_9_7 = ({1'b0,(lower_half_6[10] == _zz_io_outputSeq_9)} + _zz_io_outputSeq_9_8);
  assign _zz_io_outputSeq_9_6 = {1'd0, _zz_io_outputSeq_9_7};
  assign _zz_io_outputSeq_9_9 = (lower_half_7[10] == _zz_io_outputSeq_9);
  assign _zz_io_outputSeq_9_8 = {1'd0, _zz_io_outputSeq_9_9};
  assign _zz_io_outputSeq_10_2 = ({1'b0,_zz_io_outputSeq_10_3} + _zz_io_outputSeq_10_6);
  assign _zz_io_outputSeq_10_3 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_10)} + _zz_io_outputSeq_10_4);
  assign _zz_io_outputSeq_10_5 = (lower_half_5[10] == _zz_io_outputSeq_10);
  assign _zz_io_outputSeq_10_4 = {1'd0, _zz_io_outputSeq_10_5};
  assign _zz_io_outputSeq_10_7 = ({1'b0,(lower_half_6[10] == _zz_io_outputSeq_10)} + _zz_io_outputSeq_10_8);
  assign _zz_io_outputSeq_10_6 = {1'd0, _zz_io_outputSeq_10_7};
  assign _zz_io_outputSeq_10_9 = (lower_half_7[10] == _zz_io_outputSeq_10);
  assign _zz_io_outputSeq_10_8 = {1'd0, _zz_io_outputSeq_10_9};
  assign _zz_io_outputSeq_11_2 = ({1'b0,_zz_io_outputSeq_11_3} + _zz_io_outputSeq_11_6);
  assign _zz_io_outputSeq_11_3 = ({1'b0,(lower_half_4[10] == _zz_io_outputSeq_11)} + _zz_io_outputSeq_11_4);
  assign _zz_io_outputSeq_11_5 = (lower_half_5[10] == _zz_io_outputSeq_11);
  assign _zz_io_outputSeq_11_4 = {1'd0, _zz_io_outputSeq_11_5};
  assign _zz_io_outputSeq_11_7 = ({1'b0,(lower_half_6[10] == _zz_io_outputSeq_11)} + _zz_io_outputSeq_11_8);
  assign _zz_io_outputSeq_11_6 = {1'd0, _zz_io_outputSeq_11_7};
  assign _zz_io_outputSeq_11_9 = (lower_half_7[10] == _zz_io_outputSeq_11);
  assign _zz_io_outputSeq_11_8 = {1'd0, _zz_io_outputSeq_11_9};
  assign _zz_lower_half_1_1_1 = lower_half_1_2[10];
  assign _zz_lower_half_2_1_1 = (lower_half_1_2[10] == 1'b1);
  assign _zz_upper_half_1_1_1 = lower_half_1_3[10];
  assign _zz_upper_half_2_1 = (lower_half_1_3[10] == 1'b1);
  assign _zz_lower_half_2_2 = lower_half_2_1[10];
  assign _zz_lower_half_1_4_1 = lower_half_1_5[10];
  assign _zz_lower_half_2_2_2 = (lower_half_1_5[10] == 1'b1);
  assign _zz_upper_half_1_5_1 = lower_half_1_6[10];
  assign _zz_upper_half_2_2_1 = (lower_half_1_6[10] == 1'b1);
  assign _zz_upper_half_2_1_2 = lower_half_2_2[10];
  assign _zz_io_outputSeq_4_1 = lower_half_4[10];
  always @(*) begin
    case(_zz_lower_half_1_1_1)
      1'b0 : _zz_lower_half_1_1 = upper_candidates_0;
      default : _zz_lower_half_1_1 = upper_candidates_1;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_2_1_1)
      1'b0 : _zz_lower_half_2_1 = upper_half_0;
      default : _zz_lower_half_2_1 = upper_half_1;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_1_1_1)
      1'b0 : _zz_upper_half_1_1 = upper_candidates_0_1;
      default : _zz_upper_half_1_1 = upper_candidates_1_1;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_2_1)
      1'b0 : _zz_upper_half_2 = upper_half_0_2;
      default : _zz_upper_half_2 = upper_half_1_2;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_2_2)
      1'b0 : _zz_lower_half_2 = upper_candidates_0_2;
      default : _zz_lower_half_2 = upper_candidates_1_2;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_3_2)
      2'b00 : _zz_lower_half_3_1 = upper_candidates_0_3;
      2'b01 : _zz_lower_half_3_1 = upper_candidates_1_3;
      default : _zz_lower_half_3_1 = upper_candidates_2;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_4_2)
      2'b00 : _zz_lower_half_4_1 = upper_half_0_1;
      2'b01 : _zz_lower_half_4_1 = upper_half_1_1;
      default : _zz_lower_half_4_1 = upper_half_2;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_5_2)
      2'b00 : _zz_lower_half_5_1 = upper_half_1_1;
      2'b01 : _zz_lower_half_5_1 = upper_half_2;
      default : _zz_lower_half_5_1 = upper_half_3;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_1_4_1)
      1'b0 : _zz_lower_half_1_4 = upper_candidates_0_4;
      default : _zz_lower_half_1_4 = upper_candidates_1_4;
    endcase
  end

  always @(*) begin
    case(_zz_lower_half_2_2_2)
      1'b0 : _zz_lower_half_2_2_1 = upper_half_0_4;
      default : _zz_lower_half_2_2_1 = upper_half_1_4;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_1_5_1)
      1'b0 : _zz_upper_half_1_5 = upper_candidates_0_5;
      default : _zz_upper_half_1_5 = upper_candidates_1_5;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_2_2_1)
      1'b0 : _zz_upper_half_2_2 = upper_half_0_6;
      default : _zz_upper_half_2_2 = upper_half_1_6;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_2_1_2)
      1'b0 : _zz_upper_half_2_1_1 = upper_candidates_0_6;
      default : _zz_upper_half_2_1_1 = upper_candidates_1_6;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_3_1_1)
      2'b00 : _zz_upper_half_3_1 = upper_candidates_0_7;
      2'b01 : _zz_upper_half_3_1 = upper_candidates_1_7;
      default : _zz_upper_half_3_1 = upper_candidates_2_1;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_4_2)
      2'b00 : _zz_upper_half_4_1 = upper_half_0_5;
      2'b01 : _zz_upper_half_4_1 = upper_half_1_5;
      default : _zz_upper_half_4_1 = upper_half_2_2;
    endcase
  end

  always @(*) begin
    case(_zz_upper_half_5_2)
      2'b00 : _zz_upper_half_5_1 = upper_half_1_5;
      2'b01 : _zz_upper_half_5_1 = upper_half_2_2;
      default : _zz_upper_half_5_1 = upper_half_3_2;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_4_1)
      1'b0 : _zz_io_outputSeq_4 = upper_candidates_0_8;
      default : _zz_io_outputSeq_4 = upper_candidates_1_8;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_5_2)
      2'b00 : _zz_io_outputSeq_5_1 = upper_candidates_0_9;
      2'b01 : _zz_io_outputSeq_5_1 = upper_candidates_1_9;
      default : _zz_io_outputSeq_5_1 = upper_candidates_2_2;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_6_2)
      2'b00 : _zz_io_outputSeq_6_1 = upper_candidates_0_10;
      2'b01 : _zz_io_outputSeq_6_1 = upper_candidates_1_10;
      2'b10 : _zz_io_outputSeq_6_1 = upper_candidates_2_3;
      default : _zz_io_outputSeq_6_1 = upper_candidates_3;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_7_2)
      3'b000 : _zz_io_outputSeq_7_1 = upper_candidates_0_11;
      3'b001 : _zz_io_outputSeq_7_1 = upper_candidates_1_11;
      3'b010 : _zz_io_outputSeq_7_1 = upper_candidates_2_4;
      3'b011 : _zz_io_outputSeq_7_1 = upper_candidates_3_1;
      default : _zz_io_outputSeq_7_1 = upper_candidates_4;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_8_2)
      3'b000 : _zz_io_outputSeq_8_1 = upper_half_0_3;
      3'b001 : _zz_io_outputSeq_8_1 = upper_half_1_3;
      3'b010 : _zz_io_outputSeq_8_1 = upper_half_2_1;
      3'b011 : _zz_io_outputSeq_8_1 = upper_half_3_1;
      default : _zz_io_outputSeq_8_1 = upper_half_4;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_9_2)
      3'b000 : _zz_io_outputSeq_9_1 = upper_half_1_3;
      3'b001 : _zz_io_outputSeq_9_1 = upper_half_2_1;
      3'b010 : _zz_io_outputSeq_9_1 = upper_half_3_1;
      3'b011 : _zz_io_outputSeq_9_1 = upper_half_4;
      default : _zz_io_outputSeq_9_1 = upper_half_5;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_10_2)
      3'b000 : _zz_io_outputSeq_10_1 = upper_half_2_1;
      3'b001 : _zz_io_outputSeq_10_1 = upper_half_3_1;
      3'b010 : _zz_io_outputSeq_10_1 = upper_half_4;
      3'b011 : _zz_io_outputSeq_10_1 = upper_half_5;
      default : _zz_io_outputSeq_10_1 = upper_half_6;
    endcase
  end

  always @(*) begin
    case(_zz_io_outputSeq_11_2)
      3'b000 : _zz_io_outputSeq_11_1 = upper_half_3_1;
      3'b001 : _zz_io_outputSeq_11_1 = upper_half_4;
      3'b010 : _zz_io_outputSeq_11_1 = upper_half_5;
      3'b011 : _zz_io_outputSeq_11_1 = upper_half_6;
      default : _zz_io_outputSeq_11_1 = upper_half_7;
    endcase
  end

  assign _zz_io_outputSeq_12_1 = {1'b1,10'h000};
  assign _zz_lower_half_6 = {1'b1,10'h000};
  assign switch_RedundancyMover_l17 = {io_inputSeq_0[10],io_inputSeq_1[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0_2 = io_inputSeq_0;
      end
      default : begin
        lower_half_0_2 = io_inputSeq_1;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1_2 = io_inputSeq_1;
      end
      default : begin
        lower_half_1_2 = io_inputSeq_0;
      end
    endcase
  end

  assign switch_RedundancyMover_l17_1 = {io_inputSeq_2[10],io_inputSeq_3[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_1)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_0 = io_inputSeq_2;
      end
      default : begin
        upper_half_0 = io_inputSeq_3;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_1)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_1 = io_inputSeq_3;
      end
      default : begin
        upper_half_1 = io_inputSeq_2;
      end
    endcase
  end

  assign lower_half_0_1 = lower_half_0_2;
  assign upper_candidates_0 = lower_half_1_2;
  assign upper_candidates_1 = upper_half_0;
  assign lower_half_1_1 = _zz_lower_half_1_1;
  assign lower_half_2_1 = _zz_lower_half_2_1;
  assign switch_RedundancyMover_l68 = (lower_half_1_2[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68)
      1'b0 : begin
        lower_half_3_1 = upper_half_1;
      end
      default : begin
        lower_half_3_1 = {1'b1,10'h000};
      end
    endcase
  end

  assign switch_RedundancyMover_l17_2 = {io_inputSeq_4[10],io_inputSeq_5[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_2)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0_3 = io_inputSeq_4;
      end
      default : begin
        lower_half_0_3 = io_inputSeq_5;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_2)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1_3 = io_inputSeq_5;
      end
      default : begin
        lower_half_1_3 = io_inputSeq_4;
      end
    endcase
  end

  assign switch_RedundancyMover_l17_3 = {io_inputSeq_6[10],io_inputSeq_7[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_3)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_0_2 = io_inputSeq_6;
      end
      default : begin
        upper_half_0_2 = io_inputSeq_7;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_3)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_1_2 = io_inputSeq_7;
      end
      default : begin
        upper_half_1_2 = io_inputSeq_6;
      end
    endcase
  end

  assign upper_half_0_1 = lower_half_0_3;
  assign upper_candidates_0_1 = lower_half_1_3;
  assign upper_candidates_1_1 = upper_half_0_2;
  assign upper_half_1_1 = _zz_upper_half_1_1;
  assign upper_half_2 = _zz_upper_half_2;
  assign switch_RedundancyMover_l68_1 = (lower_half_1_3[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68_1)
      1'b0 : begin
        upper_half_3 = upper_half_1_2;
      end
      default : begin
        upper_half_3 = {1'b1,10'h000};
      end
    endcase
  end

  assign lower_half_0 = lower_half_0_1;
  assign lower_half_1 = lower_half_1_1;
  assign upper_candidates_0_2 = lower_half_2_1;
  assign upper_candidates_1_2 = upper_half_0_1;
  assign lower_half_2 = _zz_lower_half_2;
  assign upper_candidates_0_3 = lower_half_3_1;
  assign upper_candidates_1_3 = upper_half_0_1;
  assign upper_candidates_2 = upper_half_1_1;
  assign _zz_lower_half_3 = 1'b1;
  assign lower_half_3 = _zz_lower_half_3_1;
  assign _zz_lower_half_4 = 1'b1;
  assign lower_half_4 = _zz_lower_half_4_1;
  assign _zz_lower_half_5 = 1'b1;
  assign lower_half_5 = _zz_lower_half_5_1;
  assign _zz_switch_RedundancyMover_l68 = 1'b1;
  assign switch_RedundancyMover_l68_2 = ({1'b0,(lower_half_2_1[10] == _zz_switch_RedundancyMover_l68)} + _zz_switch_RedundancyMover_l68_2_1);
  always @(*) begin
    case(switch_RedundancyMover_l68_2)
      2'b00 : begin
        lower_half_6 = upper_half_2;
      end
      2'b01 : begin
        lower_half_6 = upper_half_3;
      end
      default : begin
        lower_half_6 = _zz_lower_half_6;
      end
    endcase
  end

  assign _zz_switch_RedundancyMover_l68_1 = 1'b1;
  assign switch_RedundancyMover_l68_3 = ({1'b0,(lower_half_2_1[10] == _zz_switch_RedundancyMover_l68_1)} + _zz_switch_RedundancyMover_l68_3_1);
  always @(*) begin
    case(switch_RedundancyMover_l68_3)
      2'b00 : begin
        lower_half_7 = upper_half_3;
      end
      default : begin
        lower_half_7 = _zz_lower_half_6;
      end
    endcase
  end

  assign _zz_upper_half_6 = {1'b1,10'h000};
  assign switch_RedundancyMover_l17_4 = {io_inputSeq_8[10],io_inputSeq_9[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_4)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0_5 = io_inputSeq_8;
      end
      default : begin
        lower_half_0_5 = io_inputSeq_9;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_4)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1_5 = io_inputSeq_9;
      end
      default : begin
        lower_half_1_5 = io_inputSeq_8;
      end
    endcase
  end

  assign switch_RedundancyMover_l17_5 = {io_inputSeq_10[10],io_inputSeq_11[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_5)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_0_4 = io_inputSeq_10;
      end
      default : begin
        upper_half_0_4 = io_inputSeq_11;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_5)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_1_4 = io_inputSeq_11;
      end
      default : begin
        upper_half_1_4 = io_inputSeq_10;
      end
    endcase
  end

  assign lower_half_0_4 = lower_half_0_5;
  assign upper_candidates_0_4 = lower_half_1_5;
  assign upper_candidates_1_4 = upper_half_0_4;
  assign lower_half_1_4 = _zz_lower_half_1_4;
  assign lower_half_2_2 = _zz_lower_half_2_2_1;
  assign switch_RedundancyMover_l68_4 = (lower_half_1_5[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68_4)
      1'b0 : begin
        lower_half_3_2 = upper_half_1_4;
      end
      default : begin
        lower_half_3_2 = {1'b1,10'h000};
      end
    endcase
  end

  assign switch_RedundancyMover_l17_6 = {io_inputSeq_12[10],io_inputSeq_13[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_6)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_0_6 = io_inputSeq_12;
      end
      default : begin
        lower_half_0_6 = io_inputSeq_13;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_6)
      2'b00, 2'b11, 2'b01 : begin
        lower_half_1_6 = io_inputSeq_13;
      end
      default : begin
        lower_half_1_6 = io_inputSeq_12;
      end
    endcase
  end

  assign switch_RedundancyMover_l17_7 = {io_inputSeq_14[10],io_inputSeq_15[10]};
  always @(*) begin
    case(switch_RedundancyMover_l17_7)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_0_6 = io_inputSeq_14;
      end
      default : begin
        upper_half_0_6 = io_inputSeq_15;
      end
    endcase
  end

  always @(*) begin
    case(switch_RedundancyMover_l17_7)
      2'b00, 2'b11, 2'b01 : begin
        upper_half_1_6 = io_inputSeq_15;
      end
      default : begin
        upper_half_1_6 = io_inputSeq_14;
      end
    endcase
  end

  assign upper_half_0_5 = lower_half_0_6;
  assign upper_candidates_0_5 = lower_half_1_6;
  assign upper_candidates_1_5 = upper_half_0_6;
  assign upper_half_1_5 = _zz_upper_half_1_5;
  assign upper_half_2_2 = _zz_upper_half_2_2;
  assign switch_RedundancyMover_l68_5 = (lower_half_1_6[10] == 1'b1);
  always @(*) begin
    case(switch_RedundancyMover_l68_5)
      1'b0 : begin
        upper_half_3_2 = upper_half_1_6;
      end
      default : begin
        upper_half_3_2 = {1'b1,10'h000};
      end
    endcase
  end

  assign upper_half_0_3 = lower_half_0_4;
  assign upper_half_1_3 = lower_half_1_4;
  assign upper_candidates_0_6 = lower_half_2_2;
  assign upper_candidates_1_6 = upper_half_0_5;
  assign upper_half_2_1 = _zz_upper_half_2_1_1;
  assign upper_candidates_0_7 = lower_half_3_2;
  assign upper_candidates_1_7 = upper_half_0_5;
  assign upper_candidates_2_1 = upper_half_1_5;
  assign _zz_upper_half_3 = 1'b1;
  assign upper_half_3_1 = _zz_upper_half_3_1;
  assign _zz_upper_half_4 = 1'b1;
  assign upper_half_4 = _zz_upper_half_4_1;
  assign _zz_upper_half_5 = 1'b1;
  assign upper_half_5 = _zz_upper_half_5_1;
  assign _zz_switch_RedundancyMover_l68_2 = 1'b1;
  assign switch_RedundancyMover_l68_6 = ({1'b0,(lower_half_2_2[10] == _zz_switch_RedundancyMover_l68_2)} + _zz_switch_RedundancyMover_l68_6_1);
  always @(*) begin
    case(switch_RedundancyMover_l68_6)
      2'b00 : begin
        upper_half_6 = upper_half_2_2;
      end
      2'b01 : begin
        upper_half_6 = upper_half_3_2;
      end
      default : begin
        upper_half_6 = _zz_upper_half_6;
      end
    endcase
  end

  assign _zz_switch_RedundancyMover_l68_3 = 1'b1;
  assign switch_RedundancyMover_l68_7 = ({1'b0,(lower_half_2_2[10] == _zz_switch_RedundancyMover_l68_3)} + _zz_switch_RedundancyMover_l68_7_1);
  always @(*) begin
    case(switch_RedundancyMover_l68_7)
      2'b00 : begin
        upper_half_7 = upper_half_3_2;
      end
      default : begin
        upper_half_7 = _zz_upper_half_6;
      end
    endcase
  end

  assign upper_candidates_0_8 = lower_half_4;
  assign upper_candidates_1_8 = upper_half_0_3;
  assign upper_candidates_0_9 = lower_half_5;
  assign upper_candidates_1_9 = upper_half_0_3;
  assign upper_candidates_2_2 = upper_half_1_3;
  assign _zz_io_outputSeq_5 = 1'b1;
  assign upper_candidates_0_10 = lower_half_6;
  assign upper_candidates_1_10 = upper_half_0_3;
  assign upper_candidates_2_3 = upper_half_1_3;
  assign upper_candidates_3 = upper_half_2_1;
  assign _zz_io_outputSeq_6 = 1'b1;
  assign upper_candidates_0_11 = lower_half_7;
  assign upper_candidates_1_11 = upper_half_0_3;
  assign upper_candidates_2_4 = upper_half_1_3;
  assign upper_candidates_3_1 = upper_half_2_1;
  assign upper_candidates_4 = upper_half_3_1;
  assign _zz_io_outputSeq_7 = 1'b1;
  assign _zz_io_outputSeq_8 = 1'b1;
  assign _zz_io_outputSeq_9 = 1'b1;
  assign _zz_io_outputSeq_10 = 1'b1;
  assign _zz_io_outputSeq_11 = 1'b1;
  assign _zz_switch_RedundancyMover_l68_4 = 1'b1;
  assign switch_RedundancyMover_l68_8 = ({1'b0,_zz_switch_RedundancyMover_l68_8} + _zz_switch_RedundancyMover_l68_8_3);
  always @(*) begin
    case(switch_RedundancyMover_l68_8)
      3'b000 : begin
        _zz_io_outputSeq_12 = upper_half_4;
      end
      3'b001 : begin
        _zz_io_outputSeq_12 = upper_half_5;
      end
      3'b010 : begin
        _zz_io_outputSeq_12 = upper_half_6;
      end
      3'b011 : begin
        _zz_io_outputSeq_12 = upper_half_7;
      end
      default : begin
        _zz_io_outputSeq_12 = _zz_io_outputSeq_12_1;
      end
    endcase
  end

  assign _zz_switch_RedundancyMover_l68_5 = 1'b1;
  assign switch_RedundancyMover_l68_9 = ({1'b0,_zz_switch_RedundancyMover_l68_9} + _zz_switch_RedundancyMover_l68_9_3);
  always @(*) begin
    case(switch_RedundancyMover_l68_9)
      3'b000 : begin
        _zz_io_outputSeq_13 = upper_half_5;
      end
      3'b001 : begin
        _zz_io_outputSeq_13 = upper_half_6;
      end
      3'b010 : begin
        _zz_io_outputSeq_13 = upper_half_7;
      end
      default : begin
        _zz_io_outputSeq_13 = _zz_io_outputSeq_12_1;
      end
    endcase
  end

  assign _zz_switch_RedundancyMover_l68_6 = 1'b1;
  assign switch_RedundancyMover_l68_10 = ({1'b0,_zz_switch_RedundancyMover_l68_10} + _zz_switch_RedundancyMover_l68_10_3);
  always @(*) begin
    case(switch_RedundancyMover_l68_10)
      3'b000 : begin
        _zz_io_outputSeq_14 = upper_half_6;
      end
      3'b001 : begin
        _zz_io_outputSeq_14 = upper_half_7;
      end
      default : begin
        _zz_io_outputSeq_14 = _zz_io_outputSeq_12_1;
      end
    endcase
  end

  assign _zz_switch_RedundancyMover_l68_7 = 1'b1;
  assign switch_RedundancyMover_l68_11 = ({1'b0,_zz_switch_RedundancyMover_l68_11} + _zz_switch_RedundancyMover_l68_11_3);
  always @(*) begin
    case(switch_RedundancyMover_l68_11)
      3'b000 : begin
        _zz_io_outputSeq_15 = upper_half_7;
      end
      default : begin
        _zz_io_outputSeq_15 = _zz_io_outputSeq_12_1;
      end
    endcase
  end

  assign io_outputSeq_0 = lower_half_0;
  assign io_outputSeq_1 = lower_half_1;
  assign io_outputSeq_2 = lower_half_2;
  assign io_outputSeq_3 = lower_half_3;
  assign io_outputSeq_4 = _zz_io_outputSeq_4;
  assign io_outputSeq_5 = _zz_io_outputSeq_5_1;
  assign io_outputSeq_6 = _zz_io_outputSeq_6_1;
  assign io_outputSeq_7 = _zz_io_outputSeq_7_1;
  assign io_outputSeq_8 = _zz_io_outputSeq_8_1;
  assign io_outputSeq_9 = _zz_io_outputSeq_9_1;
  assign io_outputSeq_10 = _zz_io_outputSeq_10_1;
  assign io_outputSeq_11 = _zz_io_outputSeq_11_1;
  assign io_outputSeq_12 = _zz_io_outputSeq_12;
  assign io_outputSeq_13 = _zz_io_outputSeq_13;
  assign io_outputSeq_14 = _zz_io_outputSeq_14;
  assign io_outputSeq_15 = _zz_io_outputSeq_15;

endmodule
