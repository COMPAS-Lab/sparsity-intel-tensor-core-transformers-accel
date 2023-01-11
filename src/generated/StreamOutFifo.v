// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : StreamOutFifo
// Git hash  : cb207be92a3693b2f4fe24f4792cfe4129d4d797

`timescale 1ns/1ps 
module StreamOutFifo (
  input               io_push_valid,
  output              io_push_ready,
  input      [71:0]   io_push_payload,
  output              io_pop_valid,
  input               io_pop_ready,
  output     [71:0]   io_pop_payload,
  input               clk
);

  wire                FifoCore_full;
  wire                FifoCore_empty;
  wire       [71:0]   FifoCore_q;

  out_fifo FifoCore (
    .clock (clk                  ), //i
    .wrreq (io_push_valid        ), //i
    .rdreq (io_pop_ready         ), //i
    .full  (FifoCore_full        ), //o
    .empty (FifoCore_empty       ), //o
    .data  (io_push_payload[71:0]), //i
    .q     (FifoCore_q[71:0]     )  //o
  );
  assign io_push_ready = (! FifoCore_full);
  assign io_pop_payload = FifoCore_q;
  assign io_pop_valid = (! FifoCore_empty);

endmodule
