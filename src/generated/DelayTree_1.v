// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : DelayTree_1
// Git hash  : 257eb1a112838047dc69fc54ad4c70da7b455b11

`timescale 1ns/1ps 
module DelayTree_1 (
  input      [7:0]    io_dataIn,
  output     [7:0]    io_dataOut_0,
  output     [7:0]    io_dataOut_1,
  output     [7:0]    io_dataOut_2,
  output     [7:0]    io_dataOut_3,
  output     [7:0]    io_dataOut_4,
  output     [7:0]    io_dataOut_5,
  output     [7:0]    io_dataOut_6,
  output     [7:0]    io_dataOut_7,
  output     [7:0]    io_dataOut_8,
  output     [7:0]    io_dataOut_9,
  output     [7:0]    io_dataOut_10,
  output     [7:0]    io_dataOut_11,
  output     [7:0]    io_dataOut_12,
  output     [7:0]    io_dataOut_13,
  output     [7:0]    io_dataOut_14,
  output     [7:0]    io_dataOut_15,
  input               clk,
  input               clrn
);

  reg        [7:0]    _zz_io_dataOut_0;
  reg        [7:0]    _zz_io_dataOut_8;
  reg        [7:0]    _zz_io_dataOut_0_1;
  reg        [7:0]    _zz_io_dataOut_4;
  reg        [7:0]    _zz_io_dataOut_0_2;
  reg        [7:0]    _zz_io_dataOut_2;
  reg        [7:0]    _zz_io_dataOut_4_1;
  reg        [7:0]    _zz_io_dataOut_6;
  reg        [7:0]    _zz_io_dataOut_8_1;
  reg        [7:0]    _zz_io_dataOut_12;
  reg        [7:0]    _zz_io_dataOut_8_2;
  reg        [7:0]    _zz_io_dataOut_10;
  reg        [7:0]    _zz_io_dataOut_12_1;
  reg        [7:0]    _zz_io_dataOut_14;

  assign io_dataOut_0 = _zz_io_dataOut_0_2;
  assign io_dataOut_1 = _zz_io_dataOut_0_2;
  assign io_dataOut_2 = _zz_io_dataOut_2;
  assign io_dataOut_3 = _zz_io_dataOut_2;
  assign io_dataOut_4 = _zz_io_dataOut_4_1;
  assign io_dataOut_5 = _zz_io_dataOut_4_1;
  assign io_dataOut_6 = _zz_io_dataOut_6;
  assign io_dataOut_7 = _zz_io_dataOut_6;
  assign io_dataOut_8 = _zz_io_dataOut_8_2;
  assign io_dataOut_9 = _zz_io_dataOut_8_2;
  assign io_dataOut_10 = _zz_io_dataOut_10;
  assign io_dataOut_11 = _zz_io_dataOut_10;
  assign io_dataOut_12 = _zz_io_dataOut_12_1;
  assign io_dataOut_13 = _zz_io_dataOut_12_1;
  assign io_dataOut_14 = _zz_io_dataOut_14;
  assign io_dataOut_15 = _zz_io_dataOut_14;
  always @(posedge clk) begin
    _zz_io_dataOut_0_2 <= _zz_io_dataOut_0_1;
    _zz_io_dataOut_2 <= _zz_io_dataOut_0_1;
    _zz_io_dataOut_4_1 <= _zz_io_dataOut_4;
    _zz_io_dataOut_6 <= _zz_io_dataOut_4;
    _zz_io_dataOut_0_1 <= _zz_io_dataOut_0;
    _zz_io_dataOut_4 <= _zz_io_dataOut_0;
    _zz_io_dataOut_8_2 <= _zz_io_dataOut_8_1;
    _zz_io_dataOut_10 <= _zz_io_dataOut_8_1;
    _zz_io_dataOut_12_1 <= _zz_io_dataOut_12;
    _zz_io_dataOut_14 <= _zz_io_dataOut_12;
    _zz_io_dataOut_8_1 <= _zz_io_dataOut_8;
    _zz_io_dataOut_12 <= _zz_io_dataOut_8;
    _zz_io_dataOut_0 <= io_dataIn;
    _zz_io_dataOut_8 <= io_dataIn;
  end


endmodule
