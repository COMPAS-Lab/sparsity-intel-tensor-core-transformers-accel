// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : DelayTree
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module DelayTree (
  input  wire [79:0]   io_dataIn,
  output wire [79:0]   io_dataOut_0,
  output wire [79:0]   io_dataOut_1,
  output wire [79:0]   io_dataOut_2,
  output wire [79:0]   io_dataOut_3,
  input  wire          clk,
  input  wire          clrn
);

  reg        [79:0]   _zz_io_dataOut_0;
  reg        [79:0]   _zz_io_dataOut_2;

  assign io_dataOut_0 = _zz_io_dataOut_0;
  assign io_dataOut_1 = _zz_io_dataOut_0;
  assign io_dataOut_2 = _zz_io_dataOut_2;
  assign io_dataOut_3 = _zz_io_dataOut_2;
  always @(posedge clk) begin
    _zz_io_dataOut_0 <= io_dataIn;
    _zz_io_dataOut_2 <= io_dataIn;
  end


endmodule
