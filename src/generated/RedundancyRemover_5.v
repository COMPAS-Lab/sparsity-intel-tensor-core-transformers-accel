// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemover_5
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemover_5 (
  input  wire [10:0]   io_upperIns_0,
  input  wire [10:0]   io_upperIns_1,
  input  wire [10:0]   io_upperIns_2,
  input  wire [10:0]   io_upperIns_3,
  input  wire [10:0]   io_lowerIns_0,
  input  wire [10:0]   io_lowerIns_1,
  input  wire [10:0]   io_lowerIns_2,
  input  wire [10:0]   io_lowerIns_3,
  output wire [10:0]   io_outs_0,
  output wire [10:0]   io_outs_1,
  output wire [10:0]   io_outs_2,
  output wire [10:0]   io_outs_3,
  output wire [10:0]   io_outs_4,
  output wire [10:0]   io_outs_5,
  output wire [10:0]   io_outs_6,
  output wire [10:0]   io_outs_7,
  input  wire          clk,
  input  wire          clrn
);

  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_0;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_1;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_2;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_3;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_4;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_5;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_6;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_7;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_8;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_9;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_10;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_11;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_12;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_13;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_14;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_15;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_0;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_1;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_2;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_3;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_4;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_5;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_6;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_7;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_0;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_1;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_2;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_3;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_4;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_5;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_6;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_7;
  wire       [10:0]   redundancyMover_7_io_outputSeq_0;
  wire       [10:0]   redundancyMover_7_io_outputSeq_1;
  wire       [10:0]   redundancyMover_7_io_outputSeq_2;
  wire       [10:0]   redundancyMover_7_io_outputSeq_3;
  wire       [10:0]   redundancyMover_7_io_outputSeq_4;
  wire       [10:0]   redundancyMover_7_io_outputSeq_5;
  wire       [10:0]   redundancyMover_7_io_outputSeq_6;
  wire       [10:0]   redundancyMover_7_io_outputSeq_7;
  reg        [10:0]   sortedOuts_0;
  reg        [10:0]   sortedOuts_1;
  reg        [10:0]   sortedOuts_2;
  reg        [10:0]   sortedOuts_3;
  reg        [10:0]   sortedOuts_4;
  reg        [10:0]   sortedOuts_5;
  reg        [10:0]   sortedOuts_6;
  reg        [10:0]   sortedOuts_7;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_0;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_1;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_2;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_3;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_4;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_5;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_6;
  reg        [10:0]   redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_7;

  RedundancyRemoverFrontend_2 redundancyRemoverFrontend_3 (
    .io_upperIns_0   (io_upperIns_0[10:0]                         ), //i
    .io_upperIns_1   (io_upperIns_1[10:0]                         ), //i
    .io_upperIns_2   (io_upperIns_2[10:0]                         ), //i
    .io_upperIns_3   (io_upperIns_3[10:0]                         ), //i
    .io_lowerIns_0   (io_lowerIns_0[10:0]                         ), //i
    .io_lowerIns_1   (io_lowerIns_1[10:0]                         ), //i
    .io_lowerIns_2   (io_lowerIns_2[10:0]                         ), //i
    .io_lowerIns_3   (io_lowerIns_3[10:0]                         ), //i
    .io_outs_0       (redundancyRemoverFrontend_3_io_outs_0[10:0] ), //o
    .io_outs_1       (redundancyRemoverFrontend_3_io_outs_1[10:0] ), //o
    .io_outs_2       (redundancyRemoverFrontend_3_io_outs_2[10:0] ), //o
    .io_outs_3       (redundancyRemoverFrontend_3_io_outs_3[10:0] ), //o
    .io_outs_4       (redundancyRemoverFrontend_3_io_outs_4[10:0] ), //o
    .io_outs_5       (redundancyRemoverFrontend_3_io_outs_5[10:0] ), //o
    .io_outs_6       (redundancyRemoverFrontend_3_io_outs_6[10:0] ), //o
    .io_outs_7       (redundancyRemoverFrontend_3_io_outs_7[10:0] ), //o
    .io_outs_8       (redundancyRemoverFrontend_3_io_outs_8[10:0] ), //o
    .io_outs_9       (redundancyRemoverFrontend_3_io_outs_9[10:0] ), //o
    .io_outs_10      (redundancyRemoverFrontend_3_io_outs_10[10:0]), //o
    .io_outs_11      (redundancyRemoverFrontend_3_io_outs_11[10:0]), //o
    .io_outs_12      (redundancyRemoverFrontend_3_io_outs_12[10:0]), //o
    .io_outs_13      (redundancyRemoverFrontend_3_io_outs_13[10:0]), //o
    .io_outs_14      (redundancyRemoverFrontend_3_io_outs_14[10:0]), //o
    .io_outs_15      (redundancyRemoverFrontend_3_io_outs_15[10:0]), //o
    .io_fifoPopSig_0 (redundancyRemoverBackend_3_io_stg1CompRes_0 ), //i
    .io_fifoPopSig_1 (redundancyRemoverBackend_3_io_stg1CompRes_1 ), //i
    .io_fifoPopSig_2 (redundancyRemoverBackend_3_io_stg1CompRes_2 ), //i
    .io_fifoPopSig_3 (redundancyRemoverBackend_3_io_stg1CompRes_3 ), //i
    .io_fifoPopSig_4 (redundancyRemoverBackend_3_io_stg1CompRes_4 ), //i
    .io_fifoPopSig_5 (redundancyRemoverBackend_3_io_stg1CompRes_5 ), //i
    .io_fifoPopSig_6 (redundancyRemoverBackend_3_io_stg1CompRes_6 ), //i
    .io_fifoPopSig_7 (redundancyRemoverBackend_3_io_stg1CompRes_7 ), //i
    .clk             (clk                                         ), //i
    .clrn            (clrn                                        )  //i
  );
  RedundancyRemoverBackend_2 redundancyRemoverBackend_3 (
    .io_ins_0         (redundancyRemoverFrontend_3_io_outs_0[10:0] ), //i
    .io_ins_1         (redundancyRemoverFrontend_3_io_outs_1[10:0] ), //i
    .io_ins_2         (redundancyRemoverFrontend_3_io_outs_2[10:0] ), //i
    .io_ins_3         (redundancyRemoverFrontend_3_io_outs_3[10:0] ), //i
    .io_ins_4         (redundancyRemoverFrontend_3_io_outs_4[10:0] ), //i
    .io_ins_5         (redundancyRemoverFrontend_3_io_outs_5[10:0] ), //i
    .io_ins_6         (redundancyRemoverFrontend_3_io_outs_6[10:0] ), //i
    .io_ins_7         (redundancyRemoverFrontend_3_io_outs_7[10:0] ), //i
    .io_ins_8         (redundancyRemoverFrontend_3_io_outs_8[10:0] ), //i
    .io_ins_9         (redundancyRemoverFrontend_3_io_outs_9[10:0] ), //i
    .io_ins_10        (redundancyRemoverFrontend_3_io_outs_10[10:0]), //i
    .io_ins_11        (redundancyRemoverFrontend_3_io_outs_11[10:0]), //i
    .io_ins_12        (redundancyRemoverFrontend_3_io_outs_12[10:0]), //i
    .io_ins_13        (redundancyRemoverFrontend_3_io_outs_13[10:0]), //i
    .io_ins_14        (redundancyRemoverFrontend_3_io_outs_14[10:0]), //i
    .io_ins_15        (redundancyRemoverFrontend_3_io_outs_15[10:0]), //i
    .io_outs_0        (redundancyRemoverBackend_3_io_outs_0[10:0]  ), //o
    .io_outs_1        (redundancyRemoverBackend_3_io_outs_1[10:0]  ), //o
    .io_outs_2        (redundancyRemoverBackend_3_io_outs_2[10:0]  ), //o
    .io_outs_3        (redundancyRemoverBackend_3_io_outs_3[10:0]  ), //o
    .io_outs_4        (redundancyRemoverBackend_3_io_outs_4[10:0]  ), //o
    .io_outs_5        (redundancyRemoverBackend_3_io_outs_5[10:0]  ), //o
    .io_outs_6        (redundancyRemoverBackend_3_io_outs_6[10:0]  ), //o
    .io_outs_7        (redundancyRemoverBackend_3_io_outs_7[10:0]  ), //o
    .io_stg1CompRes_0 (redundancyRemoverBackend_3_io_stg1CompRes_0 ), //o
    .io_stg1CompRes_1 (redundancyRemoverBackend_3_io_stg1CompRes_1 ), //o
    .io_stg1CompRes_2 (redundancyRemoverBackend_3_io_stg1CompRes_2 ), //o
    .io_stg1CompRes_3 (redundancyRemoverBackend_3_io_stg1CompRes_3 ), //o
    .io_stg1CompRes_4 (redundancyRemoverBackend_3_io_stg1CompRes_4 ), //o
    .io_stg1CompRes_5 (redundancyRemoverBackend_3_io_stg1CompRes_5 ), //o
    .io_stg1CompRes_6 (redundancyRemoverBackend_3_io_stg1CompRes_6 ), //o
    .io_stg1CompRes_7 (redundancyRemoverBackend_3_io_stg1CompRes_7 ), //o
    .clk              (clk                                         ), //i
    .clrn             (clrn                                        )  //i
  );
  RedundancyMover_2 redundancyMover_7 (
    .io_inputSeq_0  (sortedOuts_0[10:0]                    ), //i
    .io_inputSeq_1  (sortedOuts_1[10:0]                    ), //i
    .io_inputSeq_2  (sortedOuts_2[10:0]                    ), //i
    .io_inputSeq_3  (sortedOuts_3[10:0]                    ), //i
    .io_inputSeq_4  (sortedOuts_4[10:0]                    ), //i
    .io_inputSeq_5  (sortedOuts_5[10:0]                    ), //i
    .io_inputSeq_6  (sortedOuts_6[10:0]                    ), //i
    .io_inputSeq_7  (sortedOuts_7[10:0]                    ), //i
    .io_outputSeq_0 (redundancyMover_7_io_outputSeq_0[10:0]), //o
    .io_outputSeq_1 (redundancyMover_7_io_outputSeq_1[10:0]), //o
    .io_outputSeq_2 (redundancyMover_7_io_outputSeq_2[10:0]), //o
    .io_outputSeq_3 (redundancyMover_7_io_outputSeq_3[10:0]), //o
    .io_outputSeq_4 (redundancyMover_7_io_outputSeq_4[10:0]), //o
    .io_outputSeq_5 (redundancyMover_7_io_outputSeq_5[10:0]), //o
    .io_outputSeq_6 (redundancyMover_7_io_outputSeq_6[10:0]), //o
    .io_outputSeq_7 (redundancyMover_7_io_outputSeq_7[10:0])  //o
  );
  assign io_outs_0 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_0;
  assign io_outs_1 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_1;
  assign io_outs_2 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_2;
  assign io_outs_3 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_3;
  assign io_outs_4 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_4;
  assign io_outs_5 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_5;
  assign io_outs_6 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_6;
  assign io_outs_7 = redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_7;
  always @(posedge clk) begin
    if(!clrn) begin
      sortedOuts_0 <= 11'h000;
      sortedOuts_1 <= 11'h000;
      sortedOuts_2 <= 11'h000;
      sortedOuts_3 <= 11'h000;
      sortedOuts_4 <= 11'h000;
      sortedOuts_5 <= 11'h000;
      sortedOuts_6 <= 11'h000;
      sortedOuts_7 <= 11'h000;
    end else begin
      sortedOuts_0 <= redundancyRemoverBackend_3_io_outs_0;
      sortedOuts_1 <= redundancyRemoverBackend_3_io_outs_1;
      sortedOuts_2 <= redundancyRemoverBackend_3_io_outs_2;
      sortedOuts_3 <= redundancyRemoverBackend_3_io_outs_3;
      sortedOuts_4 <= redundancyRemoverBackend_3_io_outs_4;
      sortedOuts_5 <= redundancyRemoverBackend_3_io_outs_5;
      sortedOuts_6 <= redundancyRemoverBackend_3_io_outs_6;
      sortedOuts_7 <= redundancyRemoverBackend_3_io_outs_7;
    end
  end

  always @(posedge clk) begin
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_0 <= redundancyMover_7_io_outputSeq_0;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_1 <= redundancyMover_7_io_outputSeq_1;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_2 <= redundancyMover_7_io_outputSeq_2;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_3 <= redundancyMover_7_io_outputSeq_3;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_4 <= redundancyMover_7_io_outputSeq_4;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_5 <= redundancyMover_7_io_outputSeq_5;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_6 <= redundancyMover_7_io_outputSeq_6;
    redundancyRemover_12_redundancyMover_7_io_outputSeq_delay_1_7 <= redundancyMover_7_io_outputSeq_7;
  end


endmodule
