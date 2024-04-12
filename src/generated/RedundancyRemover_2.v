// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemover_2
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemover_2 (
  input  wire [10:0]   io_upperIns_0,
  input  wire [10:0]   io_upperIns_1,
  input  wire [10:0]   io_lowerIns_0,
  input  wire [10:0]   io_lowerIns_1,
  output wire [10:0]   io_outs_0,
  output wire [10:0]   io_outs_1,
  output wire [10:0]   io_outs_2,
  output wire [10:0]   io_outs_3,
  input  wire          clk,
  input  wire          clrn
);

  wire       [10:0]   redundancyMover_7_io_outputSeq_0;
  wire       [10:0]   redundancyMover_7_io_outputSeq_1;
  wire       [10:0]   redundancyMover_7_io_outputSeq_2;
  wire       [10:0]   redundancyMover_7_io_outputSeq_3;
  reg        [10:0]   sortedOuts_0;
  reg        [10:0]   sortedOuts_1;
  reg        [10:0]   sortedOuts_2;
  reg        [10:0]   sortedOuts_3;
  wire       [10:0]   _zz_when_RedundancyRemover_l221;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_1;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_2;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_3;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_4;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_5;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_6;
  wire       [10:0]   _zz_when_RedundancyRemover_l221_7;
  reg        [10:0]   _zz_when_RedundancyRemover_l221_8;
  reg        [10:0]   _zz_when_RedundancyRemover_l221_9;
  wire                when_RedundancyRemover_l221;
  wire                when_RedundancyRemover_l224;
  wire                when_RedundancyRemover_l227;
  reg        [10:0]   _zz_when_RedundancyRemover_l221_10;
  reg        [10:0]   _zz_when_RedundancyRemover_l221_11;
  wire                when_RedundancyRemover_l221_1;
  wire                when_RedundancyRemover_l224_1;
  wire                when_RedundancyRemover_l227_1;
  reg        [10:0]   _zz_sortedOuts_0;
  reg        [10:0]   _zz_sortedOuts_1;
  wire                when_RedundancyRemover_l221_2;
  wire                when_RedundancyRemover_l224_2;
  wire                when_RedundancyRemover_l227_2;
  reg        [10:0]   _zz_sortedOuts_2;
  reg        [10:0]   _zz_sortedOuts_3;
  wire                when_RedundancyRemover_l221_3;
  wire                when_RedundancyRemover_l224_3;
  wire                when_RedundancyRemover_l227_3;
  reg        [10:0]   redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_0;
  reg        [10:0]   redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_1;
  reg        [10:0]   redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_2;
  reg        [10:0]   redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_3;

  RedundancyMover_6 redundancyMover_7 (
    .io_inputSeq_0  (sortedOuts_0[10:0]                    ), //i
    .io_inputSeq_1  (sortedOuts_1[10:0]                    ), //i
    .io_inputSeq_2  (sortedOuts_2[10:0]                    ), //i
    .io_inputSeq_3  (sortedOuts_3[10:0]                    ), //i
    .io_outputSeq_0 (redundancyMover_7_io_outputSeq_0[10:0]), //o
    .io_outputSeq_1 (redundancyMover_7_io_outputSeq_1[10:0]), //o
    .io_outputSeq_2 (redundancyMover_7_io_outputSeq_2[10:0]), //o
    .io_outputSeq_3 (redundancyMover_7_io_outputSeq_3[10:0])  //o
  );
  assign _zz_when_RedundancyRemover_l221 = io_upperIns_0;
  assign _zz_when_RedundancyRemover_l221_2 = io_lowerIns_0;
  assign _zz_when_RedundancyRemover_l221_1 = io_upperIns_1;
  assign _zz_when_RedundancyRemover_l221_3 = io_lowerIns_1;
  assign when_RedundancyRemover_l221 = ((_zz_when_RedundancyRemover_l221[10] == 1'b1) || (_zz_when_RedundancyRemover_l221_2[10] == 1'b1));
  assign when_RedundancyRemover_l224 = (_zz_when_RedundancyRemover_l221 == _zz_when_RedundancyRemover_l221_2);
  assign when_RedundancyRemover_l227 = (_zz_when_RedundancyRemover_l221_2 < _zz_when_RedundancyRemover_l221);
  assign when_RedundancyRemover_l221_1 = ((_zz_when_RedundancyRemover_l221_1[10] == 1'b1) || (_zz_when_RedundancyRemover_l221_3[10] == 1'b1));
  assign when_RedundancyRemover_l224_1 = (_zz_when_RedundancyRemover_l221_1 == _zz_when_RedundancyRemover_l221_3);
  assign when_RedundancyRemover_l227_1 = (_zz_when_RedundancyRemover_l221_3 < _zz_when_RedundancyRemover_l221_1);
  assign _zz_when_RedundancyRemover_l221_4 = _zz_when_RedundancyRemover_l221_8;
  assign _zz_when_RedundancyRemover_l221_5 = _zz_when_RedundancyRemover_l221_10;
  assign _zz_when_RedundancyRemover_l221_6 = _zz_when_RedundancyRemover_l221_9;
  assign _zz_when_RedundancyRemover_l221_7 = _zz_when_RedundancyRemover_l221_11;
  assign when_RedundancyRemover_l221_2 = ((_zz_when_RedundancyRemover_l221_4[10] == 1'b1) || (_zz_when_RedundancyRemover_l221_5[10] == 1'b1));
  assign when_RedundancyRemover_l224_2 = (_zz_when_RedundancyRemover_l221_4 == _zz_when_RedundancyRemover_l221_5);
  assign when_RedundancyRemover_l227_2 = (_zz_when_RedundancyRemover_l221_5 < _zz_when_RedundancyRemover_l221_4);
  assign when_RedundancyRemover_l221_3 = ((_zz_when_RedundancyRemover_l221_6[10] == 1'b1) || (_zz_when_RedundancyRemover_l221_7[10] == 1'b1));
  assign when_RedundancyRemover_l224_3 = (_zz_when_RedundancyRemover_l221_6 == _zz_when_RedundancyRemover_l221_7);
  assign when_RedundancyRemover_l227_3 = (_zz_when_RedundancyRemover_l221_7 < _zz_when_RedundancyRemover_l221_6);
  assign io_outs_0 = redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_0;
  assign io_outs_1 = redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_1;
  assign io_outs_2 = redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_2;
  assign io_outs_3 = redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_3;
  always @(posedge clk) begin
    if(!clrn) begin
      sortedOuts_0 <= 11'h000;
      sortedOuts_1 <= 11'h000;
      sortedOuts_2 <= 11'h000;
      sortedOuts_3 <= 11'h000;
      _zz_when_RedundancyRemover_l221_8 <= 11'h000;
      _zz_when_RedundancyRemover_l221_9 <= 11'h000;
      _zz_when_RedundancyRemover_l221_10 <= 11'h000;
      _zz_when_RedundancyRemover_l221_11 <= 11'h000;
      _zz_sortedOuts_0 <= 11'h000;
      _zz_sortedOuts_1 <= 11'h000;
      _zz_sortedOuts_2 <= 11'h000;
      _zz_sortedOuts_3 <= 11'h000;
    end else begin
      if(when_RedundancyRemover_l221) begin
        _zz_when_RedundancyRemover_l221_8 <= _zz_when_RedundancyRemover_l221;
        _zz_when_RedundancyRemover_l221_9 <= _zz_when_RedundancyRemover_l221_2;
      end else begin
        if(when_RedundancyRemover_l224) begin
          _zz_when_RedundancyRemover_l221_8 <= 11'h400;
          _zz_when_RedundancyRemover_l221_9 <= _zz_when_RedundancyRemover_l221;
        end else begin
          if(when_RedundancyRemover_l227) begin
            _zz_when_RedundancyRemover_l221_8 <= _zz_when_RedundancyRemover_l221_2;
            _zz_when_RedundancyRemover_l221_9 <= _zz_when_RedundancyRemover_l221;
          end else begin
            _zz_when_RedundancyRemover_l221_8 <= _zz_when_RedundancyRemover_l221;
            _zz_when_RedundancyRemover_l221_9 <= _zz_when_RedundancyRemover_l221_2;
          end
        end
      end
      if(when_RedundancyRemover_l221_1) begin
        _zz_when_RedundancyRemover_l221_10 <= _zz_when_RedundancyRemover_l221_1;
        _zz_when_RedundancyRemover_l221_11 <= _zz_when_RedundancyRemover_l221_3;
      end else begin
        if(when_RedundancyRemover_l224_1) begin
          _zz_when_RedundancyRemover_l221_10 <= 11'h400;
          _zz_when_RedundancyRemover_l221_11 <= _zz_when_RedundancyRemover_l221_1;
        end else begin
          if(when_RedundancyRemover_l227_1) begin
            _zz_when_RedundancyRemover_l221_10 <= _zz_when_RedundancyRemover_l221_3;
            _zz_when_RedundancyRemover_l221_11 <= _zz_when_RedundancyRemover_l221_1;
          end else begin
            _zz_when_RedundancyRemover_l221_10 <= _zz_when_RedundancyRemover_l221_1;
            _zz_when_RedundancyRemover_l221_11 <= _zz_when_RedundancyRemover_l221_3;
          end
        end
      end
      if(when_RedundancyRemover_l221_2) begin
        _zz_sortedOuts_0 <= _zz_when_RedundancyRemover_l221_4;
        _zz_sortedOuts_1 <= _zz_when_RedundancyRemover_l221_5;
      end else begin
        if(when_RedundancyRemover_l224_2) begin
          _zz_sortedOuts_0 <= 11'h400;
          _zz_sortedOuts_1 <= _zz_when_RedundancyRemover_l221_4;
        end else begin
          if(when_RedundancyRemover_l227_2) begin
            _zz_sortedOuts_0 <= _zz_when_RedundancyRemover_l221_5;
            _zz_sortedOuts_1 <= _zz_when_RedundancyRemover_l221_4;
          end else begin
            _zz_sortedOuts_0 <= _zz_when_RedundancyRemover_l221_4;
            _zz_sortedOuts_1 <= _zz_when_RedundancyRemover_l221_5;
          end
        end
      end
      if(when_RedundancyRemover_l221_3) begin
        _zz_sortedOuts_2 <= _zz_when_RedundancyRemover_l221_6;
        _zz_sortedOuts_3 <= _zz_when_RedundancyRemover_l221_7;
      end else begin
        if(when_RedundancyRemover_l224_3) begin
          _zz_sortedOuts_2 <= 11'h400;
          _zz_sortedOuts_3 <= _zz_when_RedundancyRemover_l221_6;
        end else begin
          if(when_RedundancyRemover_l227_3) begin
            _zz_sortedOuts_2 <= _zz_when_RedundancyRemover_l221_7;
            _zz_sortedOuts_3 <= _zz_when_RedundancyRemover_l221_6;
          end else begin
            _zz_sortedOuts_2 <= _zz_when_RedundancyRemover_l221_6;
            _zz_sortedOuts_3 <= _zz_when_RedundancyRemover_l221_7;
          end
        end
      end
      sortedOuts_0 <= _zz_sortedOuts_0;
      sortedOuts_1 <= _zz_sortedOuts_1;
      sortedOuts_2 <= _zz_sortedOuts_2;
      sortedOuts_3 <= _zz_sortedOuts_3;
    end
  end

  always @(posedge clk) begin
    redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_0 <= redundancyMover_7_io_outputSeq_0;
    redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_1 <= redundancyMover_7_io_outputSeq_1;
    redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_2 <= redundancyMover_7_io_outputSeq_2;
    redundancyRemover_9_redundancyMover_7_io_outputSeq_delay_1_3 <= redundancyMover_7_io_outputSeq_3;
  end


endmodule
