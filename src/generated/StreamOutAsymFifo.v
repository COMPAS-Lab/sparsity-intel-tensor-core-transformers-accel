// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : StreamOutAsymFifo
// Git hash  : 257eb1a112838047dc69fc54ad4c70da7b455b11

`timescale 1ns/1ps 
module StreamOutAsymFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [1151:0] io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [71:0]   io_pop_payload,
  input               clrn,
  input               clk
);

  wire                AsymFifoCore_rst;
  wire       [71:0]   AsymFifoCore_rd_data;
  wire                AsymFifoCore_wr_ok;
  wire                AsymFifoCore_rd_ok;
  wire       [5:0]    AsymFifoCore_usedw;

  out_asym_fifo #(
    .IDW(1152),
    .ODW(72),
    .DEPTH(64),
    .ID(0)
  ) AsymFifoCore (
    .wr_data (io_push_payload[1151:0]   ), //i
    .wr_en   (io_push_valid             ), //i
    .rd_en   (io_pop_ready              ), //i
    .clk     (clk                       ), //i
    .rst     (AsymFifoCore_rst          ), //i
    .rd_data (AsymFifoCore_rd_data[71:0]), //o
    .wr_ok   (AsymFifoCore_wr_ok        ), //o
    .rd_ok   (AsymFifoCore_rd_ok        ), //o
    .usedw   (AsymFifoCore_usedw[5:0]   )  //o
  );
  assign AsymFifoCore_rst = (! clrn);
  assign io_push_ready = AsymFifoCore_wr_ok;
  assign io_pop_payload = AsymFifoCore_rd_data;
  assign io_pop_valid = AsymFifoCore_rd_ok;

endmodule
