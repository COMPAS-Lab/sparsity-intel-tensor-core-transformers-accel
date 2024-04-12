// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : StreamOutFifo_47
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module StreamOutFifo_47 (
  input  wire          io_push_valid,
  input  wire [71:0]   io_push_payload,
  output wire          io_pop_valid,
  input  wire          io_pop_ready,
  output wire [71:0]   io_pop_payload,
  input  wire          clk
);

  wire                FifoCore_empty;
  wire       [71:0]   FifoCore_q;

  out_fifo FifoCore (
    .clock (clk                  ), //i
    .wrreq (io_push_valid        ), //i
    .rdreq (io_pop_ready         ), //i
    .empty (FifoCore_empty       ), //o
    .data  (io_push_payload[71:0]), //i
    .q     (FifoCore_q[71:0]     )  //o
  );
  assign io_pop_payload = FifoCore_q;
  assign io_pop_valid = (! FifoCore_empty);

endmodule
