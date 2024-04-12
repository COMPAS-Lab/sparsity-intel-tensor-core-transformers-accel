// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemoverBackend_2
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemoverBackend_2 (
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
  output wire [10:0]   io_outs_0,
  output wire [10:0]   io_outs_1,
  output wire [10:0]   io_outs_2,
  output wire [10:0]   io_outs_3,
  output wire [10:0]   io_outs_4,
  output wire [10:0]   io_outs_5,
  output wire [10:0]   io_outs_6,
  output wire [10:0]   io_outs_7,
  output wire          io_stg1CompRes_0,
  output wire          io_stg1CompRes_1,
  output wire          io_stg1CompRes_2,
  output wire          io_stg1CompRes_3,
  output wire          io_stg1CompRes_4,
  output wire          io_stg1CompRes_5,
  output wire          io_stg1CompRes_6,
  output wire          io_stg1CompRes_7,
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
  wire       [10:0]   compRes_1_0;
  wire       [10:0]   compRes_1_1;
  wire       [10:0]   compRes_1_2;
  wire       [10:0]   compRes_1_3;
  wire       [10:0]   compRes_1_4;
  wire       [10:0]   compRes_1_5;
  wire       [10:0]   compRes_1_6;
  wire       [10:0]   compRes_1_7;
  wire       [10:0]   compRes_2_0;
  wire       [10:0]   compRes_2_1;
  wire       [10:0]   compRes_2_2;
  wire       [10:0]   compRes_2_3;
  wire       [10:0]   compRes_2_4;
  wire       [10:0]   compRes_2_5;
  wire       [10:0]   compRes_2_6;
  wire       [10:0]   compRes_2_7;
  wire       [10:0]   compRes_3_0;
  wire       [10:0]   compRes_3_1;
  wire       [10:0]   compRes_3_2;
  wire       [10:0]   compRes_3_3;
  wire       [10:0]   compRes_3_4;
  wire       [10:0]   compRes_3_5;
  wire       [10:0]   compRes_3_6;
  wire       [10:0]   compRes_3_7;
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
  reg        [10:0]   _zz_stg1Outs_0_dat;
  reg        [10:0]   _zz_stg1Outs_1_dat;
  reg        [10:0]   _zz_stg1Outs_2_dat;
  reg        [10:0]   _zz_stg1Outs_3_dat;
  reg        [10:0]   _zz_stg1Outs_4_dat;
  reg        [10:0]   _zz_stg1Outs_5_dat;
  reg        [10:0]   _zz_stg1Outs_6_dat;
  reg        [10:0]   _zz_stg1Outs_7_dat;
  reg        [10:0]   _zz_compRes_1_0;
  reg        [10:0]   _zz_compRes_1_4;
  wire                when_RedundancyRemover_l155;
  wire                when_RedundancyRemover_l158;
  wire                when_RedundancyRemover_l161;
  reg        [10:0]   _zz_compRes_1_1;
  reg        [10:0]   _zz_compRes_1_5;
  wire                when_RedundancyRemover_l155_1;
  wire                when_RedundancyRemover_l158_1;
  wire                when_RedundancyRemover_l161_1;
  reg        [10:0]   _zz_compRes_1_2;
  reg        [10:0]   _zz_compRes_1_6;
  wire                when_RedundancyRemover_l155_2;
  wire                when_RedundancyRemover_l158_2;
  wire                when_RedundancyRemover_l161_2;
  reg        [10:0]   _zz_compRes_1_3;
  reg        [10:0]   _zz_compRes_1_7;
  wire                when_RedundancyRemover_l155_3;
  wire                when_RedundancyRemover_l158_3;
  wire                when_RedundancyRemover_l161_3;
  reg        [10:0]   _zz_compRes_2_0;
  reg        [10:0]   _zz_compRes_2_2;
  wire                when_RedundancyRemover_l155_4;
  wire                when_RedundancyRemover_l158_4;
  wire                when_RedundancyRemover_l161_4;
  reg        [10:0]   _zz_compRes_2_1;
  reg        [10:0]   _zz_compRes_2_3;
  wire                when_RedundancyRemover_l155_5;
  wire                when_RedundancyRemover_l158_5;
  wire                when_RedundancyRemover_l161_5;
  reg        [10:0]   _zz_compRes_2_4;
  reg        [10:0]   _zz_compRes_2_6;
  wire                when_RedundancyRemover_l155_6;
  wire                when_RedundancyRemover_l158_6;
  wire                when_RedundancyRemover_l161_6;
  reg        [10:0]   _zz_compRes_2_5;
  reg        [10:0]   _zz_compRes_2_7;
  wire                when_RedundancyRemover_l155_7;
  wire                when_RedundancyRemover_l158_7;
  wire                when_RedundancyRemover_l161_7;
  reg        [10:0]   _zz_compRes_3_0;
  reg        [10:0]   _zz_compRes_3_1;
  wire                when_RedundancyRemover_l155_8;
  wire                when_RedundancyRemover_l158_8;
  wire                when_RedundancyRemover_l161_8;
  reg        [10:0]   _zz_compRes_3_2;
  reg        [10:0]   _zz_compRes_3_3;
  wire                when_RedundancyRemover_l155_9;
  wire                when_RedundancyRemover_l158_9;
  wire                when_RedundancyRemover_l161_9;
  reg        [10:0]   _zz_compRes_3_4;
  reg        [10:0]   _zz_compRes_3_5;
  wire                when_RedundancyRemover_l155_10;
  wire                when_RedundancyRemover_l158_10;
  wire                when_RedundancyRemover_l161_10;
  reg        [10:0]   _zz_compRes_3_6;
  reg        [10:0]   _zz_compRes_3_7;
  wire                when_RedundancyRemover_l155_11;
  wire                when_RedundancyRemover_l158_11;
  wire                when_RedundancyRemover_l161_11;

  assign stg1Outs_0_dat = _zz_stg1Outs_0_dat;
  assign stg1Outs_0_compFlag = ((io_ins_15 < io_ins_0) || (io_ins_0 == io_ins_15));
  assign stg1Outs_1_dat = _zz_stg1Outs_1_dat;
  assign stg1Outs_1_compFlag = ((io_ins_14 < io_ins_1) || (io_ins_1 == io_ins_14));
  assign stg1Outs_2_dat = _zz_stg1Outs_2_dat;
  assign stg1Outs_2_compFlag = ((io_ins_13 < io_ins_2) || (io_ins_2 == io_ins_13));
  assign stg1Outs_3_dat = _zz_stg1Outs_3_dat;
  assign stg1Outs_3_compFlag = ((io_ins_12 < io_ins_3) || (io_ins_3 == io_ins_12));
  assign stg1Outs_4_dat = _zz_stg1Outs_4_dat;
  assign stg1Outs_4_compFlag = ((io_ins_11 < io_ins_4) || (io_ins_4 == io_ins_11));
  assign stg1Outs_5_dat = _zz_stg1Outs_5_dat;
  assign stg1Outs_5_compFlag = ((io_ins_10 < io_ins_5) || (io_ins_5 == io_ins_10));
  assign stg1Outs_6_dat = _zz_stg1Outs_6_dat;
  assign stg1Outs_6_compFlag = ((io_ins_9 < io_ins_6) || (io_ins_6 == io_ins_9));
  assign stg1Outs_7_dat = _zz_stg1Outs_7_dat;
  assign stg1Outs_7_compFlag = ((io_ins_8 < io_ins_7) || (io_ins_7 == io_ins_8));
  assign compRes_0_0 = stg1Outs_0_dat;
  assign compRes_0_1 = stg1Outs_1_dat;
  assign compRes_0_2 = stg1Outs_2_dat;
  assign compRes_0_3 = stg1Outs_3_dat;
  assign compRes_0_4 = stg1Outs_4_dat;
  assign compRes_0_5 = stg1Outs_5_dat;
  assign compRes_0_6 = stg1Outs_6_dat;
  assign compRes_0_7 = stg1Outs_7_dat;
  assign when_RedundancyRemover_l155 = ((compRes_0_0[10] == 1'b1) || (compRes_0_4[10] == 1'b1));
  assign when_RedundancyRemover_l158 = (compRes_0_0 == compRes_0_4);
  assign when_RedundancyRemover_l161 = (compRes_0_4 < compRes_0_0);
  assign when_RedundancyRemover_l155_1 = ((compRes_0_1[10] == 1'b1) || (compRes_0_5[10] == 1'b1));
  assign when_RedundancyRemover_l158_1 = (compRes_0_1 == compRes_0_5);
  assign when_RedundancyRemover_l161_1 = (compRes_0_5 < compRes_0_1);
  assign when_RedundancyRemover_l155_2 = ((compRes_0_2[10] == 1'b1) || (compRes_0_6[10] == 1'b1));
  assign when_RedundancyRemover_l158_2 = (compRes_0_2 == compRes_0_6);
  assign when_RedundancyRemover_l161_2 = (compRes_0_6 < compRes_0_2);
  assign when_RedundancyRemover_l155_3 = ((compRes_0_3[10] == 1'b1) || (compRes_0_7[10] == 1'b1));
  assign when_RedundancyRemover_l158_3 = (compRes_0_3 == compRes_0_7);
  assign when_RedundancyRemover_l161_3 = (compRes_0_7 < compRes_0_3);
  assign compRes_1_0 = _zz_compRes_1_0;
  assign compRes_1_1 = _zz_compRes_1_1;
  assign compRes_1_2 = _zz_compRes_1_2;
  assign compRes_1_3 = _zz_compRes_1_3;
  assign compRes_1_4 = _zz_compRes_1_4;
  assign compRes_1_5 = _zz_compRes_1_5;
  assign compRes_1_6 = _zz_compRes_1_6;
  assign compRes_1_7 = _zz_compRes_1_7;
  assign when_RedundancyRemover_l155_4 = ((compRes_1_0[10] == 1'b1) || (compRes_1_2[10] == 1'b1));
  assign when_RedundancyRemover_l158_4 = (compRes_1_0 == compRes_1_2);
  assign when_RedundancyRemover_l161_4 = (compRes_1_2 < compRes_1_0);
  assign when_RedundancyRemover_l155_5 = ((compRes_1_1[10] == 1'b1) || (compRes_1_3[10] == 1'b1));
  assign when_RedundancyRemover_l158_5 = (compRes_1_1 == compRes_1_3);
  assign when_RedundancyRemover_l161_5 = (compRes_1_3 < compRes_1_1);
  assign when_RedundancyRemover_l155_6 = ((compRes_1_4[10] == 1'b1) || (compRes_1_6[10] == 1'b1));
  assign when_RedundancyRemover_l158_6 = (compRes_1_4 == compRes_1_6);
  assign when_RedundancyRemover_l161_6 = (compRes_1_6 < compRes_1_4);
  assign when_RedundancyRemover_l155_7 = ((compRes_1_5[10] == 1'b1) || (compRes_1_7[10] == 1'b1));
  assign when_RedundancyRemover_l158_7 = (compRes_1_5 == compRes_1_7);
  assign when_RedundancyRemover_l161_7 = (compRes_1_7 < compRes_1_5);
  assign compRes_2_0 = _zz_compRes_2_0;
  assign compRes_2_1 = _zz_compRes_2_1;
  assign compRes_2_2 = _zz_compRes_2_2;
  assign compRes_2_3 = _zz_compRes_2_3;
  assign compRes_2_4 = _zz_compRes_2_4;
  assign compRes_2_5 = _zz_compRes_2_5;
  assign compRes_2_6 = _zz_compRes_2_6;
  assign compRes_2_7 = _zz_compRes_2_7;
  assign when_RedundancyRemover_l155_8 = ((compRes_2_0[10] == 1'b1) || (compRes_2_1[10] == 1'b1));
  assign when_RedundancyRemover_l158_8 = (compRes_2_0 == compRes_2_1);
  assign when_RedundancyRemover_l161_8 = (compRes_2_1 < compRes_2_0);
  assign when_RedundancyRemover_l155_9 = ((compRes_2_2[10] == 1'b1) || (compRes_2_3[10] == 1'b1));
  assign when_RedundancyRemover_l158_9 = (compRes_2_2 == compRes_2_3);
  assign when_RedundancyRemover_l161_9 = (compRes_2_3 < compRes_2_2);
  assign when_RedundancyRemover_l155_10 = ((compRes_2_4[10] == 1'b1) || (compRes_2_5[10] == 1'b1));
  assign when_RedundancyRemover_l158_10 = (compRes_2_4 == compRes_2_5);
  assign when_RedundancyRemover_l161_10 = (compRes_2_5 < compRes_2_4);
  assign when_RedundancyRemover_l155_11 = ((compRes_2_6[10] == 1'b1) || (compRes_2_7[10] == 1'b1));
  assign when_RedundancyRemover_l158_11 = (compRes_2_6 == compRes_2_7);
  assign when_RedundancyRemover_l161_11 = (compRes_2_7 < compRes_2_6);
  assign compRes_3_0 = _zz_compRes_3_0;
  assign compRes_3_1 = _zz_compRes_3_1;
  assign compRes_3_2 = _zz_compRes_3_2;
  assign compRes_3_3 = _zz_compRes_3_3;
  assign compRes_3_4 = _zz_compRes_3_4;
  assign compRes_3_5 = _zz_compRes_3_5;
  assign compRes_3_6 = _zz_compRes_3_6;
  assign compRes_3_7 = _zz_compRes_3_7;
  assign io_outs_0 = compRes_3_0;
  assign io_outs_1 = compRes_3_1;
  assign io_outs_2 = compRes_3_2;
  assign io_outs_3 = compRes_3_3;
  assign io_outs_4 = compRes_3_4;
  assign io_outs_5 = compRes_3_5;
  assign io_outs_6 = compRes_3_6;
  assign io_outs_7 = compRes_3_7;
  assign io_stg1CompRes_0 = stg1Outs_0_compFlag;
  assign io_stg1CompRes_1 = stg1Outs_1_compFlag;
  assign io_stg1CompRes_2 = stg1Outs_2_compFlag;
  assign io_stg1CompRes_3 = stg1Outs_3_compFlag;
  assign io_stg1CompRes_4 = stg1Outs_4_compFlag;
  assign io_stg1CompRes_5 = stg1Outs_5_compFlag;
  assign io_stg1CompRes_6 = stg1Outs_6_compFlag;
  assign io_stg1CompRes_7 = stg1Outs_7_compFlag;
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
      _zz_compRes_1_0 <= 11'h000;
      _zz_compRes_1_4 <= 11'h000;
      _zz_compRes_1_1 <= 11'h000;
      _zz_compRes_1_5 <= 11'h000;
      _zz_compRes_1_2 <= 11'h000;
      _zz_compRes_1_6 <= 11'h000;
      _zz_compRes_1_3 <= 11'h000;
      _zz_compRes_1_7 <= 11'h000;
      _zz_compRes_2_0 <= 11'h000;
      _zz_compRes_2_2 <= 11'h000;
      _zz_compRes_2_1 <= 11'h000;
      _zz_compRes_2_3 <= 11'h000;
      _zz_compRes_2_4 <= 11'h000;
      _zz_compRes_2_6 <= 11'h000;
      _zz_compRes_2_5 <= 11'h000;
      _zz_compRes_2_7 <= 11'h000;
      _zz_compRes_3_0 <= 11'h000;
      _zz_compRes_3_1 <= 11'h000;
      _zz_compRes_3_2 <= 11'h000;
      _zz_compRes_3_3 <= 11'h000;
      _zz_compRes_3_4 <= 11'h000;
      _zz_compRes_3_5 <= 11'h000;
      _zz_compRes_3_6 <= 11'h000;
      _zz_compRes_3_7 <= 11'h000;
    end else begin
      _zz_stg1Outs_0_dat <= ((io_ins_15 < io_ins_0) ? io_ins_0 : io_ins_15);
      _zz_stg1Outs_1_dat <= ((io_ins_14 < io_ins_1) ? io_ins_1 : io_ins_14);
      _zz_stg1Outs_2_dat <= ((io_ins_13 < io_ins_2) ? io_ins_2 : io_ins_13);
      _zz_stg1Outs_3_dat <= ((io_ins_12 < io_ins_3) ? io_ins_3 : io_ins_12);
      _zz_stg1Outs_4_dat <= ((io_ins_11 < io_ins_4) ? io_ins_4 : io_ins_11);
      _zz_stg1Outs_5_dat <= ((io_ins_10 < io_ins_5) ? io_ins_5 : io_ins_10);
      _zz_stg1Outs_6_dat <= ((io_ins_9 < io_ins_6) ? io_ins_6 : io_ins_9);
      _zz_stg1Outs_7_dat <= ((io_ins_8 < io_ins_7) ? io_ins_7 : io_ins_8);
      if(when_RedundancyRemover_l155) begin
        _zz_compRes_1_0 <= compRes_0_0;
        _zz_compRes_1_4 <= compRes_0_4;
      end else begin
        if(when_RedundancyRemover_l158) begin
          _zz_compRes_1_0 <= 11'h400;
          _zz_compRes_1_4 <= compRes_0_0;
        end else begin
          if(when_RedundancyRemover_l161) begin
            _zz_compRes_1_0 <= compRes_0_4;
            _zz_compRes_1_4 <= compRes_0_0;
          end else begin
            _zz_compRes_1_0 <= compRes_0_0;
            _zz_compRes_1_4 <= compRes_0_4;
          end
        end
      end
      if(when_RedundancyRemover_l155_1) begin
        _zz_compRes_1_1 <= compRes_0_1;
        _zz_compRes_1_5 <= compRes_0_5;
      end else begin
        if(when_RedundancyRemover_l158_1) begin
          _zz_compRes_1_1 <= 11'h400;
          _zz_compRes_1_5 <= compRes_0_1;
        end else begin
          if(when_RedundancyRemover_l161_1) begin
            _zz_compRes_1_1 <= compRes_0_5;
            _zz_compRes_1_5 <= compRes_0_1;
          end else begin
            _zz_compRes_1_1 <= compRes_0_1;
            _zz_compRes_1_5 <= compRes_0_5;
          end
        end
      end
      if(when_RedundancyRemover_l155_2) begin
        _zz_compRes_1_2 <= compRes_0_2;
        _zz_compRes_1_6 <= compRes_0_6;
      end else begin
        if(when_RedundancyRemover_l158_2) begin
          _zz_compRes_1_2 <= 11'h400;
          _zz_compRes_1_6 <= compRes_0_2;
        end else begin
          if(when_RedundancyRemover_l161_2) begin
            _zz_compRes_1_2 <= compRes_0_6;
            _zz_compRes_1_6 <= compRes_0_2;
          end else begin
            _zz_compRes_1_2 <= compRes_0_2;
            _zz_compRes_1_6 <= compRes_0_6;
          end
        end
      end
      if(when_RedundancyRemover_l155_3) begin
        _zz_compRes_1_3 <= compRes_0_3;
        _zz_compRes_1_7 <= compRes_0_7;
      end else begin
        if(when_RedundancyRemover_l158_3) begin
          _zz_compRes_1_3 <= 11'h400;
          _zz_compRes_1_7 <= compRes_0_3;
        end else begin
          if(when_RedundancyRemover_l161_3) begin
            _zz_compRes_1_3 <= compRes_0_7;
            _zz_compRes_1_7 <= compRes_0_3;
          end else begin
            _zz_compRes_1_3 <= compRes_0_3;
            _zz_compRes_1_7 <= compRes_0_7;
          end
        end
      end
      if(when_RedundancyRemover_l155_4) begin
        _zz_compRes_2_0 <= compRes_1_0;
        _zz_compRes_2_2 <= compRes_1_2;
      end else begin
        if(when_RedundancyRemover_l158_4) begin
          _zz_compRes_2_0 <= 11'h400;
          _zz_compRes_2_2 <= compRes_1_0;
        end else begin
          if(when_RedundancyRemover_l161_4) begin
            _zz_compRes_2_0 <= compRes_1_2;
            _zz_compRes_2_2 <= compRes_1_0;
          end else begin
            _zz_compRes_2_0 <= compRes_1_0;
            _zz_compRes_2_2 <= compRes_1_2;
          end
        end
      end
      if(when_RedundancyRemover_l155_5) begin
        _zz_compRes_2_1 <= compRes_1_1;
        _zz_compRes_2_3 <= compRes_1_3;
      end else begin
        if(when_RedundancyRemover_l158_5) begin
          _zz_compRes_2_1 <= 11'h400;
          _zz_compRes_2_3 <= compRes_1_1;
        end else begin
          if(when_RedundancyRemover_l161_5) begin
            _zz_compRes_2_1 <= compRes_1_3;
            _zz_compRes_2_3 <= compRes_1_1;
          end else begin
            _zz_compRes_2_1 <= compRes_1_1;
            _zz_compRes_2_3 <= compRes_1_3;
          end
        end
      end
      if(when_RedundancyRemover_l155_6) begin
        _zz_compRes_2_4 <= compRes_1_4;
        _zz_compRes_2_6 <= compRes_1_6;
      end else begin
        if(when_RedundancyRemover_l158_6) begin
          _zz_compRes_2_4 <= 11'h400;
          _zz_compRes_2_6 <= compRes_1_4;
        end else begin
          if(when_RedundancyRemover_l161_6) begin
            _zz_compRes_2_4 <= compRes_1_6;
            _zz_compRes_2_6 <= compRes_1_4;
          end else begin
            _zz_compRes_2_4 <= compRes_1_4;
            _zz_compRes_2_6 <= compRes_1_6;
          end
        end
      end
      if(when_RedundancyRemover_l155_7) begin
        _zz_compRes_2_5 <= compRes_1_5;
        _zz_compRes_2_7 <= compRes_1_7;
      end else begin
        if(when_RedundancyRemover_l158_7) begin
          _zz_compRes_2_5 <= 11'h400;
          _zz_compRes_2_7 <= compRes_1_5;
        end else begin
          if(when_RedundancyRemover_l161_7) begin
            _zz_compRes_2_5 <= compRes_1_7;
            _zz_compRes_2_7 <= compRes_1_5;
          end else begin
            _zz_compRes_2_5 <= compRes_1_5;
            _zz_compRes_2_7 <= compRes_1_7;
          end
        end
      end
      if(when_RedundancyRemover_l155_8) begin
        _zz_compRes_3_0 <= compRes_2_0;
        _zz_compRes_3_1 <= compRes_2_1;
      end else begin
        if(when_RedundancyRemover_l158_8) begin
          _zz_compRes_3_0 <= 11'h400;
          _zz_compRes_3_1 <= compRes_2_0;
        end else begin
          if(when_RedundancyRemover_l161_8) begin
            _zz_compRes_3_0 <= compRes_2_1;
            _zz_compRes_3_1 <= compRes_2_0;
          end else begin
            _zz_compRes_3_0 <= compRes_2_0;
            _zz_compRes_3_1 <= compRes_2_1;
          end
        end
      end
      if(when_RedundancyRemover_l155_9) begin
        _zz_compRes_3_2 <= compRes_2_2;
        _zz_compRes_3_3 <= compRes_2_3;
      end else begin
        if(when_RedundancyRemover_l158_9) begin
          _zz_compRes_3_2 <= 11'h400;
          _zz_compRes_3_3 <= compRes_2_2;
        end else begin
          if(when_RedundancyRemover_l161_9) begin
            _zz_compRes_3_2 <= compRes_2_3;
            _zz_compRes_3_3 <= compRes_2_2;
          end else begin
            _zz_compRes_3_2 <= compRes_2_2;
            _zz_compRes_3_3 <= compRes_2_3;
          end
        end
      end
      if(when_RedundancyRemover_l155_10) begin
        _zz_compRes_3_4 <= compRes_2_4;
        _zz_compRes_3_5 <= compRes_2_5;
      end else begin
        if(when_RedundancyRemover_l158_10) begin
          _zz_compRes_3_4 <= 11'h400;
          _zz_compRes_3_5 <= compRes_2_4;
        end else begin
          if(when_RedundancyRemover_l161_10) begin
            _zz_compRes_3_4 <= compRes_2_5;
            _zz_compRes_3_5 <= compRes_2_4;
          end else begin
            _zz_compRes_3_4 <= compRes_2_4;
            _zz_compRes_3_5 <= compRes_2_5;
          end
        end
      end
      if(when_RedundancyRemover_l155_11) begin
        _zz_compRes_3_6 <= compRes_2_6;
        _zz_compRes_3_7 <= compRes_2_7;
      end else begin
        if(when_RedundancyRemover_l158_11) begin
          _zz_compRes_3_6 <= 11'h400;
          _zz_compRes_3_7 <= compRes_2_6;
        end else begin
          if(when_RedundancyRemover_l161_11) begin
            _zz_compRes_3_6 <= compRes_2_7;
            _zz_compRes_3_7 <= compRes_2_6;
          end else begin
            _zz_compRes_3_6 <= compRes_2_6;
            _zz_compRes_3_7 <= compRes_2_7;
          end
        end
      end
    end
  end


endmodule
