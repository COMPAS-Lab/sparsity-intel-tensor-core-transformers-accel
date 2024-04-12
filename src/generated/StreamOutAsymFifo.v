// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : StreamOutAsymFifo
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module StreamOutAsymFifo (
  input  wire          io_push_valid,
  input  wire [863:0]  io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [71:0]   io_pop_payload,
  input  wire          clrn,
  input  wire          clk
);

  wire                AsymFifoCore_rst;
  wire       [71:0]   AsymFifoCore_rd_data;
  wire                AsymFifoCore_rd_ok;

  out_asym_fifo #(
    .IDW(864),
    .ODW(72),
    .DEPTH(64),
    .ID(0)
  ) AsymFifoCore (
    .wr_data (io_push_payload[863:0]    ), //i
    .wr_en   (io_push_valid             ), //i
    .rd_en   (io_pop_ready              ), //i
    .clk     (clk                       ), //i
    .rst     (AsymFifoCore_rst          ), //i
    .rd_data (AsymFifoCore_rd_data[71:0]), //o
    .rd_ok   (AsymFifoCore_rd_ok        )  //o
  );
  assign AsymFifoCore_rst = (! clrn);
  assign io_pop_payload = AsymFifoCore_rd_data;
  assign io_pop_valid = AsymFifoCore_rd_ok;

endmodule
