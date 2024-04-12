// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : RedundancyRemover_6
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module RedundancyRemover_6 (
  input  wire [10:0]   io_upperIns_0,
  input  wire [10:0]   io_upperIns_1,
  input  wire [10:0]   io_upperIns_2,
  input  wire [10:0]   io_upperIns_3,
  input  wire [10:0]   io_upperIns_4,
  input  wire [10:0]   io_upperIns_5,
  input  wire [10:0]   io_upperIns_6,
  input  wire [10:0]   io_upperIns_7,
  input  wire [10:0]   io_lowerIns_0,
  input  wire [10:0]   io_lowerIns_1,
  input  wire [10:0]   io_lowerIns_2,
  input  wire [10:0]   io_lowerIns_3,
  input  wire [10:0]   io_lowerIns_4,
  input  wire [10:0]   io_lowerIns_5,
  input  wire [10:0]   io_lowerIns_6,
  input  wire [10:0]   io_lowerIns_7,
  output wire [10:0]   io_outs_0,
  output wire [10:0]   io_outs_1,
  output wire [10:0]   io_outs_2,
  output wire [10:0]   io_outs_3,
  output wire [10:0]   io_outs_4,
  output wire [10:0]   io_outs_5,
  output wire [10:0]   io_outs_6,
  output wire [10:0]   io_outs_7,
  output wire [10:0]   io_outs_8,
  output wire [10:0]   io_outs_9,
  output wire [10:0]   io_outs_10,
  output wire [10:0]   io_outs_11,
  output wire [10:0]   io_outs_12,
  output wire [10:0]   io_outs_13,
  output wire [10:0]   io_outs_14,
  output wire [10:0]   io_outs_15,
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
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_16;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_17;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_18;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_19;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_20;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_21;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_22;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_23;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_24;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_25;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_26;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_27;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_28;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_29;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_30;
  wire       [10:0]   redundancyRemoverFrontend_3_io_outs_31;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_0;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_1;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_2;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_3;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_4;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_5;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_6;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_7;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_8;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_9;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_10;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_11;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_12;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_13;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_14;
  wire       [10:0]   redundancyRemoverBackend_3_io_outs_15;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_0;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_1;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_2;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_3;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_4;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_5;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_6;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_7;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_8;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_9;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_10;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_11;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_12;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_13;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_14;
  wire                redundancyRemoverBackend_3_io_stg1CompRes_15;
  wire       [10:0]   redundancyMover_7_io_outputSeq_0;
  wire       [10:0]   redundancyMover_7_io_outputSeq_1;
  wire       [10:0]   redundancyMover_7_io_outputSeq_2;
  wire       [10:0]   redundancyMover_7_io_outputSeq_3;
  wire       [10:0]   redundancyMover_7_io_outputSeq_4;
  wire       [10:0]   redundancyMover_7_io_outputSeq_5;
  wire       [10:0]   redundancyMover_7_io_outputSeq_6;
  wire       [10:0]   redundancyMover_7_io_outputSeq_7;
  wire       [10:0]   redundancyMover_7_io_outputSeq_8;
  wire       [10:0]   redundancyMover_7_io_outputSeq_9;
  wire       [10:0]   redundancyMover_7_io_outputSeq_10;
  wire       [10:0]   redundancyMover_7_io_outputSeq_11;
  wire       [10:0]   redundancyMover_7_io_outputSeq_12;
  wire       [10:0]   redundancyMover_7_io_outputSeq_13;
  wire       [10:0]   redundancyMover_7_io_outputSeq_14;
  wire       [10:0]   redundancyMover_7_io_outputSeq_15;
  reg        [10:0]   sortedOuts_0;
  reg        [10:0]   sortedOuts_1;
  reg        [10:0]   sortedOuts_2;
  reg        [10:0]   sortedOuts_3;
  reg        [10:0]   sortedOuts_4;
  reg        [10:0]   sortedOuts_5;
  reg        [10:0]   sortedOuts_6;
  reg        [10:0]   sortedOuts_7;
  reg        [10:0]   sortedOuts_8;
  reg        [10:0]   sortedOuts_9;
  reg        [10:0]   sortedOuts_10;
  reg        [10:0]   sortedOuts_11;
  reg        [10:0]   sortedOuts_12;
  reg        [10:0]   sortedOuts_13;
  reg        [10:0]   sortedOuts_14;
  reg        [10:0]   sortedOuts_15;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_0;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_1;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_2;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_3;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_4;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_5;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_6;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_7;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_8;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_9;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_10;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_11;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_12;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_13;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_14;
  reg        [10:0]   redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_15;

  RedundancyRemoverFrontend redundancyRemoverFrontend_3 (
    .io_upperIns_0    (io_upperIns_0[10:0]                         ), //i
    .io_upperIns_1    (io_upperIns_1[10:0]                         ), //i
    .io_upperIns_2    (io_upperIns_2[10:0]                         ), //i
    .io_upperIns_3    (io_upperIns_3[10:0]                         ), //i
    .io_upperIns_4    (io_upperIns_4[10:0]                         ), //i
    .io_upperIns_5    (io_upperIns_5[10:0]                         ), //i
    .io_upperIns_6    (io_upperIns_6[10:0]                         ), //i
    .io_upperIns_7    (io_upperIns_7[10:0]                         ), //i
    .io_lowerIns_0    (io_lowerIns_0[10:0]                         ), //i
    .io_lowerIns_1    (io_lowerIns_1[10:0]                         ), //i
    .io_lowerIns_2    (io_lowerIns_2[10:0]                         ), //i
    .io_lowerIns_3    (io_lowerIns_3[10:0]                         ), //i
    .io_lowerIns_4    (io_lowerIns_4[10:0]                         ), //i
    .io_lowerIns_5    (io_lowerIns_5[10:0]                         ), //i
    .io_lowerIns_6    (io_lowerIns_6[10:0]                         ), //i
    .io_lowerIns_7    (io_lowerIns_7[10:0]                         ), //i
    .io_outs_0        (redundancyRemoverFrontend_3_io_outs_0[10:0] ), //o
    .io_outs_1        (redundancyRemoverFrontend_3_io_outs_1[10:0] ), //o
    .io_outs_2        (redundancyRemoverFrontend_3_io_outs_2[10:0] ), //o
    .io_outs_3        (redundancyRemoverFrontend_3_io_outs_3[10:0] ), //o
    .io_outs_4        (redundancyRemoverFrontend_3_io_outs_4[10:0] ), //o
    .io_outs_5        (redundancyRemoverFrontend_3_io_outs_5[10:0] ), //o
    .io_outs_6        (redundancyRemoverFrontend_3_io_outs_6[10:0] ), //o
    .io_outs_7        (redundancyRemoverFrontend_3_io_outs_7[10:0] ), //o
    .io_outs_8        (redundancyRemoverFrontend_3_io_outs_8[10:0] ), //o
    .io_outs_9        (redundancyRemoverFrontend_3_io_outs_9[10:0] ), //o
    .io_outs_10       (redundancyRemoverFrontend_3_io_outs_10[10:0]), //o
    .io_outs_11       (redundancyRemoverFrontend_3_io_outs_11[10:0]), //o
    .io_outs_12       (redundancyRemoverFrontend_3_io_outs_12[10:0]), //o
    .io_outs_13       (redundancyRemoverFrontend_3_io_outs_13[10:0]), //o
    .io_outs_14       (redundancyRemoverFrontend_3_io_outs_14[10:0]), //o
    .io_outs_15       (redundancyRemoverFrontend_3_io_outs_15[10:0]), //o
    .io_outs_16       (redundancyRemoverFrontend_3_io_outs_16[10:0]), //o
    .io_outs_17       (redundancyRemoverFrontend_3_io_outs_17[10:0]), //o
    .io_outs_18       (redundancyRemoverFrontend_3_io_outs_18[10:0]), //o
    .io_outs_19       (redundancyRemoverFrontend_3_io_outs_19[10:0]), //o
    .io_outs_20       (redundancyRemoverFrontend_3_io_outs_20[10:0]), //o
    .io_outs_21       (redundancyRemoverFrontend_3_io_outs_21[10:0]), //o
    .io_outs_22       (redundancyRemoverFrontend_3_io_outs_22[10:0]), //o
    .io_outs_23       (redundancyRemoverFrontend_3_io_outs_23[10:0]), //o
    .io_outs_24       (redundancyRemoverFrontend_3_io_outs_24[10:0]), //o
    .io_outs_25       (redundancyRemoverFrontend_3_io_outs_25[10:0]), //o
    .io_outs_26       (redundancyRemoverFrontend_3_io_outs_26[10:0]), //o
    .io_outs_27       (redundancyRemoverFrontend_3_io_outs_27[10:0]), //o
    .io_outs_28       (redundancyRemoverFrontend_3_io_outs_28[10:0]), //o
    .io_outs_29       (redundancyRemoverFrontend_3_io_outs_29[10:0]), //o
    .io_outs_30       (redundancyRemoverFrontend_3_io_outs_30[10:0]), //o
    .io_outs_31       (redundancyRemoverFrontend_3_io_outs_31[10:0]), //o
    .io_fifoPopSig_0  (redundancyRemoverBackend_3_io_stg1CompRes_0 ), //i
    .io_fifoPopSig_1  (redundancyRemoverBackend_3_io_stg1CompRes_1 ), //i
    .io_fifoPopSig_2  (redundancyRemoverBackend_3_io_stg1CompRes_2 ), //i
    .io_fifoPopSig_3  (redundancyRemoverBackend_3_io_stg1CompRes_3 ), //i
    .io_fifoPopSig_4  (redundancyRemoverBackend_3_io_stg1CompRes_4 ), //i
    .io_fifoPopSig_5  (redundancyRemoverBackend_3_io_stg1CompRes_5 ), //i
    .io_fifoPopSig_6  (redundancyRemoverBackend_3_io_stg1CompRes_6 ), //i
    .io_fifoPopSig_7  (redundancyRemoverBackend_3_io_stg1CompRes_7 ), //i
    .io_fifoPopSig_8  (redundancyRemoverBackend_3_io_stg1CompRes_8 ), //i
    .io_fifoPopSig_9  (redundancyRemoverBackend_3_io_stg1CompRes_9 ), //i
    .io_fifoPopSig_10 (redundancyRemoverBackend_3_io_stg1CompRes_10), //i
    .io_fifoPopSig_11 (redundancyRemoverBackend_3_io_stg1CompRes_11), //i
    .io_fifoPopSig_12 (redundancyRemoverBackend_3_io_stg1CompRes_12), //i
    .io_fifoPopSig_13 (redundancyRemoverBackend_3_io_stg1CompRes_13), //i
    .io_fifoPopSig_14 (redundancyRemoverBackend_3_io_stg1CompRes_14), //i
    .io_fifoPopSig_15 (redundancyRemoverBackend_3_io_stg1CompRes_15), //i
    .clk              (clk                                         ), //i
    .clrn             (clrn                                        )  //i
  );
  RedundancyRemoverBackend redundancyRemoverBackend_3 (
    .io_ins_0          (redundancyRemoverFrontend_3_io_outs_0[10:0] ), //i
    .io_ins_1          (redundancyRemoverFrontend_3_io_outs_1[10:0] ), //i
    .io_ins_2          (redundancyRemoverFrontend_3_io_outs_2[10:0] ), //i
    .io_ins_3          (redundancyRemoverFrontend_3_io_outs_3[10:0] ), //i
    .io_ins_4          (redundancyRemoverFrontend_3_io_outs_4[10:0] ), //i
    .io_ins_5          (redundancyRemoverFrontend_3_io_outs_5[10:0] ), //i
    .io_ins_6          (redundancyRemoverFrontend_3_io_outs_6[10:0] ), //i
    .io_ins_7          (redundancyRemoverFrontend_3_io_outs_7[10:0] ), //i
    .io_ins_8          (redundancyRemoverFrontend_3_io_outs_8[10:0] ), //i
    .io_ins_9          (redundancyRemoverFrontend_3_io_outs_9[10:0] ), //i
    .io_ins_10         (redundancyRemoverFrontend_3_io_outs_10[10:0]), //i
    .io_ins_11         (redundancyRemoverFrontend_3_io_outs_11[10:0]), //i
    .io_ins_12         (redundancyRemoverFrontend_3_io_outs_12[10:0]), //i
    .io_ins_13         (redundancyRemoverFrontend_3_io_outs_13[10:0]), //i
    .io_ins_14         (redundancyRemoverFrontend_3_io_outs_14[10:0]), //i
    .io_ins_15         (redundancyRemoverFrontend_3_io_outs_15[10:0]), //i
    .io_ins_16         (redundancyRemoverFrontend_3_io_outs_16[10:0]), //i
    .io_ins_17         (redundancyRemoverFrontend_3_io_outs_17[10:0]), //i
    .io_ins_18         (redundancyRemoverFrontend_3_io_outs_18[10:0]), //i
    .io_ins_19         (redundancyRemoverFrontend_3_io_outs_19[10:0]), //i
    .io_ins_20         (redundancyRemoverFrontend_3_io_outs_20[10:0]), //i
    .io_ins_21         (redundancyRemoverFrontend_3_io_outs_21[10:0]), //i
    .io_ins_22         (redundancyRemoverFrontend_3_io_outs_22[10:0]), //i
    .io_ins_23         (redundancyRemoverFrontend_3_io_outs_23[10:0]), //i
    .io_ins_24         (redundancyRemoverFrontend_3_io_outs_24[10:0]), //i
    .io_ins_25         (redundancyRemoverFrontend_3_io_outs_25[10:0]), //i
    .io_ins_26         (redundancyRemoverFrontend_3_io_outs_26[10:0]), //i
    .io_ins_27         (redundancyRemoverFrontend_3_io_outs_27[10:0]), //i
    .io_ins_28         (redundancyRemoverFrontend_3_io_outs_28[10:0]), //i
    .io_ins_29         (redundancyRemoverFrontend_3_io_outs_29[10:0]), //i
    .io_ins_30         (redundancyRemoverFrontend_3_io_outs_30[10:0]), //i
    .io_ins_31         (redundancyRemoverFrontend_3_io_outs_31[10:0]), //i
    .io_outs_0         (redundancyRemoverBackend_3_io_outs_0[10:0]  ), //o
    .io_outs_1         (redundancyRemoverBackend_3_io_outs_1[10:0]  ), //o
    .io_outs_2         (redundancyRemoverBackend_3_io_outs_2[10:0]  ), //o
    .io_outs_3         (redundancyRemoverBackend_3_io_outs_3[10:0]  ), //o
    .io_outs_4         (redundancyRemoverBackend_3_io_outs_4[10:0]  ), //o
    .io_outs_5         (redundancyRemoverBackend_3_io_outs_5[10:0]  ), //o
    .io_outs_6         (redundancyRemoverBackend_3_io_outs_6[10:0]  ), //o
    .io_outs_7         (redundancyRemoverBackend_3_io_outs_7[10:0]  ), //o
    .io_outs_8         (redundancyRemoverBackend_3_io_outs_8[10:0]  ), //o
    .io_outs_9         (redundancyRemoverBackend_3_io_outs_9[10:0]  ), //o
    .io_outs_10        (redundancyRemoverBackend_3_io_outs_10[10:0] ), //o
    .io_outs_11        (redundancyRemoverBackend_3_io_outs_11[10:0] ), //o
    .io_outs_12        (redundancyRemoverBackend_3_io_outs_12[10:0] ), //o
    .io_outs_13        (redundancyRemoverBackend_3_io_outs_13[10:0] ), //o
    .io_outs_14        (redundancyRemoverBackend_3_io_outs_14[10:0] ), //o
    .io_outs_15        (redundancyRemoverBackend_3_io_outs_15[10:0] ), //o
    .io_stg1CompRes_0  (redundancyRemoverBackend_3_io_stg1CompRes_0 ), //o
    .io_stg1CompRes_1  (redundancyRemoverBackend_3_io_stg1CompRes_1 ), //o
    .io_stg1CompRes_2  (redundancyRemoverBackend_3_io_stg1CompRes_2 ), //o
    .io_stg1CompRes_3  (redundancyRemoverBackend_3_io_stg1CompRes_3 ), //o
    .io_stg1CompRes_4  (redundancyRemoverBackend_3_io_stg1CompRes_4 ), //o
    .io_stg1CompRes_5  (redundancyRemoverBackend_3_io_stg1CompRes_5 ), //o
    .io_stg1CompRes_6  (redundancyRemoverBackend_3_io_stg1CompRes_6 ), //o
    .io_stg1CompRes_7  (redundancyRemoverBackend_3_io_stg1CompRes_7 ), //o
    .io_stg1CompRes_8  (redundancyRemoverBackend_3_io_stg1CompRes_8 ), //o
    .io_stg1CompRes_9  (redundancyRemoverBackend_3_io_stg1CompRes_9 ), //o
    .io_stg1CompRes_10 (redundancyRemoverBackend_3_io_stg1CompRes_10), //o
    .io_stg1CompRes_11 (redundancyRemoverBackend_3_io_stg1CompRes_11), //o
    .io_stg1CompRes_12 (redundancyRemoverBackend_3_io_stg1CompRes_12), //o
    .io_stg1CompRes_13 (redundancyRemoverBackend_3_io_stg1CompRes_13), //o
    .io_stg1CompRes_14 (redundancyRemoverBackend_3_io_stg1CompRes_14), //o
    .io_stg1CompRes_15 (redundancyRemoverBackend_3_io_stg1CompRes_15), //o
    .clk               (clk                                         ), //i
    .clrn              (clrn                                        )  //i
  );
  RedundancyMover redundancyMover_7 (
    .io_inputSeq_0   (sortedOuts_0[10:0]                     ), //i
    .io_inputSeq_1   (sortedOuts_1[10:0]                     ), //i
    .io_inputSeq_2   (sortedOuts_2[10:0]                     ), //i
    .io_inputSeq_3   (sortedOuts_3[10:0]                     ), //i
    .io_inputSeq_4   (sortedOuts_4[10:0]                     ), //i
    .io_inputSeq_5   (sortedOuts_5[10:0]                     ), //i
    .io_inputSeq_6   (sortedOuts_6[10:0]                     ), //i
    .io_inputSeq_7   (sortedOuts_7[10:0]                     ), //i
    .io_inputSeq_8   (sortedOuts_8[10:0]                     ), //i
    .io_inputSeq_9   (sortedOuts_9[10:0]                     ), //i
    .io_inputSeq_10  (sortedOuts_10[10:0]                    ), //i
    .io_inputSeq_11  (sortedOuts_11[10:0]                    ), //i
    .io_inputSeq_12  (sortedOuts_12[10:0]                    ), //i
    .io_inputSeq_13  (sortedOuts_13[10:0]                    ), //i
    .io_inputSeq_14  (sortedOuts_14[10:0]                    ), //i
    .io_inputSeq_15  (sortedOuts_15[10:0]                    ), //i
    .io_outputSeq_0  (redundancyMover_7_io_outputSeq_0[10:0] ), //o
    .io_outputSeq_1  (redundancyMover_7_io_outputSeq_1[10:0] ), //o
    .io_outputSeq_2  (redundancyMover_7_io_outputSeq_2[10:0] ), //o
    .io_outputSeq_3  (redundancyMover_7_io_outputSeq_3[10:0] ), //o
    .io_outputSeq_4  (redundancyMover_7_io_outputSeq_4[10:0] ), //o
    .io_outputSeq_5  (redundancyMover_7_io_outputSeq_5[10:0] ), //o
    .io_outputSeq_6  (redundancyMover_7_io_outputSeq_6[10:0] ), //o
    .io_outputSeq_7  (redundancyMover_7_io_outputSeq_7[10:0] ), //o
    .io_outputSeq_8  (redundancyMover_7_io_outputSeq_8[10:0] ), //o
    .io_outputSeq_9  (redundancyMover_7_io_outputSeq_9[10:0] ), //o
    .io_outputSeq_10 (redundancyMover_7_io_outputSeq_10[10:0]), //o
    .io_outputSeq_11 (redundancyMover_7_io_outputSeq_11[10:0]), //o
    .io_outputSeq_12 (redundancyMover_7_io_outputSeq_12[10:0]), //o
    .io_outputSeq_13 (redundancyMover_7_io_outputSeq_13[10:0]), //o
    .io_outputSeq_14 (redundancyMover_7_io_outputSeq_14[10:0]), //o
    .io_outputSeq_15 (redundancyMover_7_io_outputSeq_15[10:0])  //o
  );
  assign io_outs_0 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_0;
  assign io_outs_1 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_1;
  assign io_outs_2 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_2;
  assign io_outs_3 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_3;
  assign io_outs_4 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_4;
  assign io_outs_5 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_5;
  assign io_outs_6 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_6;
  assign io_outs_7 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_7;
  assign io_outs_8 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_8;
  assign io_outs_9 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_9;
  assign io_outs_10 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_10;
  assign io_outs_11 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_11;
  assign io_outs_12 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_12;
  assign io_outs_13 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_13;
  assign io_outs_14 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_14;
  assign io_outs_15 = redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_15;
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
      sortedOuts_8 <= 11'h000;
      sortedOuts_9 <= 11'h000;
      sortedOuts_10 <= 11'h000;
      sortedOuts_11 <= 11'h000;
      sortedOuts_12 <= 11'h000;
      sortedOuts_13 <= 11'h000;
      sortedOuts_14 <= 11'h000;
      sortedOuts_15 <= 11'h000;
    end else begin
      sortedOuts_0 <= redundancyRemoverBackend_3_io_outs_0;
      sortedOuts_1 <= redundancyRemoverBackend_3_io_outs_1;
      sortedOuts_2 <= redundancyRemoverBackend_3_io_outs_2;
      sortedOuts_3 <= redundancyRemoverBackend_3_io_outs_3;
      sortedOuts_4 <= redundancyRemoverBackend_3_io_outs_4;
      sortedOuts_5 <= redundancyRemoverBackend_3_io_outs_5;
      sortedOuts_6 <= redundancyRemoverBackend_3_io_outs_6;
      sortedOuts_7 <= redundancyRemoverBackend_3_io_outs_7;
      sortedOuts_8 <= redundancyRemoverBackend_3_io_outs_8;
      sortedOuts_9 <= redundancyRemoverBackend_3_io_outs_9;
      sortedOuts_10 <= redundancyRemoverBackend_3_io_outs_10;
      sortedOuts_11 <= redundancyRemoverBackend_3_io_outs_11;
      sortedOuts_12 <= redundancyRemoverBackend_3_io_outs_12;
      sortedOuts_13 <= redundancyRemoverBackend_3_io_outs_13;
      sortedOuts_14 <= redundancyRemoverBackend_3_io_outs_14;
      sortedOuts_15 <= redundancyRemoverBackend_3_io_outs_15;
    end
  end

  always @(posedge clk) begin
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_0 <= redundancyMover_7_io_outputSeq_0;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_1 <= redundancyMover_7_io_outputSeq_1;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_2 <= redundancyMover_7_io_outputSeq_2;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_3 <= redundancyMover_7_io_outputSeq_3;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_4 <= redundancyMover_7_io_outputSeq_4;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_5 <= redundancyMover_7_io_outputSeq_5;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_6 <= redundancyMover_7_io_outputSeq_6;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_7 <= redundancyMover_7_io_outputSeq_7;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_8 <= redundancyMover_7_io_outputSeq_8;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_9 <= redundancyMover_7_io_outputSeq_9;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_10 <= redundancyMover_7_io_outputSeq_10;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_11 <= redundancyMover_7_io_outputSeq_11;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_12 <= redundancyMover_7_io_outputSeq_12;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_13 <= redundancyMover_7_io_outputSeq_13;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_14 <= redundancyMover_7_io_outputSeq_14;
    redundancyRemover_13_redundancyMover_7_io_outputSeq_delay_1_15 <= redundancyMover_7_io_outputSeq_15;
  end


endmodule
