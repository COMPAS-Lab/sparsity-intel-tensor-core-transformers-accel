// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : IndexGenerator
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module IndexGenerator (
  input  wire [10:0]   io_seqIn_0,
  input  wire [10:0]   io_seqIn_1,
  input  wire [10:0]   io_seqIn_2,
  input  wire [10:0]   io_seqIn_3,
  input  wire [10:0]   io_seqIn_4,
  input  wire [10:0]   io_seqIn_5,
  input  wire [10:0]   io_seqIn_6,
  input  wire [10:0]   io_seqIn_7,
  input  wire [10:0]   io_seqIn_8,
  input  wire [10:0]   io_seqIn_9,
  input  wire [10:0]   io_seqIn_10,
  input  wire [10:0]   io_seqIn_11,
  output wire [10:0]   io_seqOut_0,
  output wire [10:0]   io_seqOut_1,
  output wire [10:0]   io_seqOut_2,
  output wire [10:0]   io_seqOut_3,
  output wire [10:0]   io_seqOut_4,
  output wire [10:0]   io_seqOut_5,
  output wire [10:0]   io_seqOut_6,
  output wire [10:0]   io_seqOut_7,
  output wire [10:0]   io_seqOut_8,
  output wire [10:0]   io_seqOut_9,
  output wire [10:0]   io_seqOut_10,
  output wire [10:0]   io_seqOut_11,
  output wire [10:0]   io_seqOut_12,
  output wire [10:0]   io_seqOut_13,
  output wire [10:0]   io_seqOut_14,
  output wire [10:0]   io_seqOut_15,
  input  wire          clk,
  input  wire          clrn
);

  wire       [10:0]   redundancyRemover_7_io_outs_0;
  wire       [10:0]   redundancyRemover_7_io_outs_1;
  wire       [10:0]   redundancyRemover_7_io_outs_2;
  wire       [10:0]   redundancyRemover_7_io_outs_3;
  wire       [10:0]   redundancyRemover_8_io_outs_0;
  wire       [10:0]   redundancyRemover_8_io_outs_1;
  wire       [10:0]   redundancyRemover_8_io_outs_2;
  wire       [10:0]   redundancyRemover_8_io_outs_3;
  wire       [10:0]   redundancyRemover_9_io_outs_0;
  wire       [10:0]   redundancyRemover_9_io_outs_1;
  wire       [10:0]   redundancyRemover_9_io_outs_2;
  wire       [10:0]   redundancyRemover_9_io_outs_3;
  wire       [10:0]   redundancyRemover_10_io_outs_0;
  wire       [10:0]   redundancyRemover_10_io_outs_1;
  wire       [10:0]   redundancyRemover_10_io_outs_2;
  wire       [10:0]   redundancyRemover_10_io_outs_3;
  wire       [10:0]   redundancyRemover_11_io_outs_0;
  wire       [10:0]   redundancyRemover_11_io_outs_1;
  wire       [10:0]   redundancyRemover_11_io_outs_2;
  wire       [10:0]   redundancyRemover_11_io_outs_3;
  wire       [10:0]   redundancyRemover_11_io_outs_4;
  wire       [10:0]   redundancyRemover_11_io_outs_5;
  wire       [10:0]   redundancyRemover_11_io_outs_6;
  wire       [10:0]   redundancyRemover_11_io_outs_7;
  wire       [10:0]   redundancyRemover_12_io_outs_0;
  wire       [10:0]   redundancyRemover_12_io_outs_1;
  wire       [10:0]   redundancyRemover_12_io_outs_2;
  wire       [10:0]   redundancyRemover_12_io_outs_3;
  wire       [10:0]   redundancyRemover_12_io_outs_4;
  wire       [10:0]   redundancyRemover_12_io_outs_5;
  wire       [10:0]   redundancyRemover_12_io_outs_6;
  wire       [10:0]   redundancyRemover_12_io_outs_7;
  wire       [10:0]   redundancyRemover_13_io_outs_0;
  wire       [10:0]   redundancyRemover_13_io_outs_1;
  wire       [10:0]   redundancyRemover_13_io_outs_2;
  wire       [10:0]   redundancyRemover_13_io_outs_3;
  wire       [10:0]   redundancyRemover_13_io_outs_4;
  wire       [10:0]   redundancyRemover_13_io_outs_5;
  wire       [10:0]   redundancyRemover_13_io_outs_6;
  wire       [10:0]   redundancyRemover_13_io_outs_7;
  wire       [10:0]   redundancyRemover_13_io_outs_8;
  wire       [10:0]   redundancyRemover_13_io_outs_9;
  wire       [10:0]   redundancyRemover_13_io_outs_10;
  wire       [10:0]   redundancyRemover_13_io_outs_11;
  wire       [10:0]   redundancyRemover_13_io_outs_12;
  wire       [10:0]   redundancyRemover_13_io_outs_13;
  wire       [10:0]   redundancyRemover_13_io_outs_14;
  wire       [10:0]   redundancyRemover_13_io_outs_15;
  wire       [10:0]   interRes_0_0;
  wire       [10:0]   interRes_0_1;
  wire       [10:0]   interRes_0_2;
  wire       [10:0]   interRes_0_3;
  wire       [10:0]   interRes_0_4;
  wire       [10:0]   interRes_0_5;
  wire       [10:0]   interRes_0_6;
  wire       [10:0]   interRes_0_7;
  wire       [10:0]   interRes_0_8;
  wire       [10:0]   interRes_0_9;
  wire       [10:0]   interRes_0_10;
  wire       [10:0]   interRes_0_11;
  wire       [10:0]   interRes_0_12;
  wire       [10:0]   interRes_0_13;
  wire       [10:0]   interRes_0_14;
  wire       [10:0]   interRes_0_15;
  wire       [10:0]   interRes_1_0;
  wire       [10:0]   interRes_1_1;
  wire       [10:0]   interRes_1_2;
  wire       [10:0]   interRes_1_3;
  wire       [10:0]   interRes_1_4;
  wire       [10:0]   interRes_1_5;
  wire       [10:0]   interRes_1_6;
  wire       [10:0]   interRes_1_7;
  wire       [10:0]   interRes_1_8;
  wire       [10:0]   interRes_1_9;
  wire       [10:0]   interRes_1_10;
  wire       [10:0]   interRes_1_11;
  wire       [10:0]   interRes_1_12;
  wire       [10:0]   interRes_1_13;
  wire       [10:0]   interRes_1_14;
  wire       [10:0]   interRes_1_15;
  wire       [10:0]   interRes_2_0;
  wire       [10:0]   interRes_2_1;
  wire       [10:0]   interRes_2_2;
  wire       [10:0]   interRes_2_3;
  wire       [10:0]   interRes_2_4;
  wire       [10:0]   interRes_2_5;
  wire       [10:0]   interRes_2_6;
  wire       [10:0]   interRes_2_7;
  wire       [10:0]   interRes_2_8;
  wire       [10:0]   interRes_2_9;
  wire       [10:0]   interRes_2_10;
  wire       [10:0]   interRes_2_11;
  wire       [10:0]   interRes_2_12;
  wire       [10:0]   interRes_2_13;
  wire       [10:0]   interRes_2_14;
  wire       [10:0]   interRes_2_15;
  wire       [10:0]   interRes_3_0;
  wire       [10:0]   interRes_3_1;
  wire       [10:0]   interRes_3_2;
  wire       [10:0]   interRes_3_3;
  wire       [10:0]   interRes_3_4;
  wire       [10:0]   interRes_3_5;
  wire       [10:0]   interRes_3_6;
  wire       [10:0]   interRes_3_7;
  wire       [10:0]   interRes_3_8;
  wire       [10:0]   interRes_3_9;
  wire       [10:0]   interRes_3_10;
  wire       [10:0]   interRes_3_11;
  wire       [10:0]   interRes_3_12;
  wire       [10:0]   interRes_3_13;
  wire       [10:0]   interRes_3_14;
  wire       [10:0]   interRes_3_15;

  RedundancyRemover redundancyRemover_7 (
    .io_upperIns_0 (interRes_0_0[10:0]                 ), //i
    .io_upperIns_1 (interRes_0_1[10:0]                 ), //i
    .io_lowerIns_0 (interRes_0_2[10:0]                 ), //i
    .io_lowerIns_1 (interRes_0_3[10:0]                 ), //i
    .io_outs_0     (redundancyRemover_7_io_outs_0[10:0]), //o
    .io_outs_1     (redundancyRemover_7_io_outs_1[10:0]), //o
    .io_outs_2     (redundancyRemover_7_io_outs_2[10:0]), //o
    .io_outs_3     (redundancyRemover_7_io_outs_3[10:0]), //o
    .clk           (clk                                ), //i
    .clrn          (clrn                               )  //i
  );
  RedundancyRemover_1 redundancyRemover_8 (
    .io_upperIns_0 (interRes_0_4[10:0]                 ), //i
    .io_upperIns_1 (interRes_0_5[10:0]                 ), //i
    .io_lowerIns_0 (interRes_0_6[10:0]                 ), //i
    .io_lowerIns_1 (interRes_0_7[10:0]                 ), //i
    .io_outs_0     (redundancyRemover_8_io_outs_0[10:0]), //o
    .io_outs_1     (redundancyRemover_8_io_outs_1[10:0]), //o
    .io_outs_2     (redundancyRemover_8_io_outs_2[10:0]), //o
    .io_outs_3     (redundancyRemover_8_io_outs_3[10:0]), //o
    .clk           (clk                                ), //i
    .clrn          (clrn                               )  //i
  );
  RedundancyRemover_2 redundancyRemover_9 (
    .io_upperIns_0 (interRes_0_8[10:0]                 ), //i
    .io_upperIns_1 (interRes_0_9[10:0]                 ), //i
    .io_lowerIns_0 (interRes_0_10[10:0]                ), //i
    .io_lowerIns_1 (interRes_0_11[10:0]                ), //i
    .io_outs_0     (redundancyRemover_9_io_outs_0[10:0]), //o
    .io_outs_1     (redundancyRemover_9_io_outs_1[10:0]), //o
    .io_outs_2     (redundancyRemover_9_io_outs_2[10:0]), //o
    .io_outs_3     (redundancyRemover_9_io_outs_3[10:0]), //o
    .clk           (clk                                ), //i
    .clrn          (clrn                               )  //i
  );
  RedundancyRemover_3 redundancyRemover_10 (
    .io_upperIns_0 (interRes_0_12[10:0]                 ), //i
    .io_upperIns_1 (interRes_0_13[10:0]                 ), //i
    .io_lowerIns_0 (interRes_0_14[10:0]                 ), //i
    .io_lowerIns_1 (interRes_0_15[10:0]                 ), //i
    .io_outs_0     (redundancyRemover_10_io_outs_0[10:0]), //o
    .io_outs_1     (redundancyRemover_10_io_outs_1[10:0]), //o
    .io_outs_2     (redundancyRemover_10_io_outs_2[10:0]), //o
    .io_outs_3     (redundancyRemover_10_io_outs_3[10:0]), //o
    .clk           (clk                                 ), //i
    .clrn          (clrn                                )  //i
  );
  RedundancyRemover_4 redundancyRemover_11 (
    .io_upperIns_0 (interRes_1_0[10:0]                  ), //i
    .io_upperIns_1 (interRes_1_1[10:0]                  ), //i
    .io_upperIns_2 (interRes_1_2[10:0]                  ), //i
    .io_upperIns_3 (interRes_1_3[10:0]                  ), //i
    .io_lowerIns_0 (interRes_1_4[10:0]                  ), //i
    .io_lowerIns_1 (interRes_1_5[10:0]                  ), //i
    .io_lowerIns_2 (interRes_1_6[10:0]                  ), //i
    .io_lowerIns_3 (interRes_1_7[10:0]                  ), //i
    .io_outs_0     (redundancyRemover_11_io_outs_0[10:0]), //o
    .io_outs_1     (redundancyRemover_11_io_outs_1[10:0]), //o
    .io_outs_2     (redundancyRemover_11_io_outs_2[10:0]), //o
    .io_outs_3     (redundancyRemover_11_io_outs_3[10:0]), //o
    .io_outs_4     (redundancyRemover_11_io_outs_4[10:0]), //o
    .io_outs_5     (redundancyRemover_11_io_outs_5[10:0]), //o
    .io_outs_6     (redundancyRemover_11_io_outs_6[10:0]), //o
    .io_outs_7     (redundancyRemover_11_io_outs_7[10:0]), //o
    .clk           (clk                                 ), //i
    .clrn          (clrn                                )  //i
  );
  RedundancyRemover_5 redundancyRemover_12 (
    .io_upperIns_0 (interRes_1_8[10:0]                  ), //i
    .io_upperIns_1 (interRes_1_9[10:0]                  ), //i
    .io_upperIns_2 (interRes_1_10[10:0]                 ), //i
    .io_upperIns_3 (interRes_1_11[10:0]                 ), //i
    .io_lowerIns_0 (interRes_1_12[10:0]                 ), //i
    .io_lowerIns_1 (interRes_1_13[10:0]                 ), //i
    .io_lowerIns_2 (interRes_1_14[10:0]                 ), //i
    .io_lowerIns_3 (interRes_1_15[10:0]                 ), //i
    .io_outs_0     (redundancyRemover_12_io_outs_0[10:0]), //o
    .io_outs_1     (redundancyRemover_12_io_outs_1[10:0]), //o
    .io_outs_2     (redundancyRemover_12_io_outs_2[10:0]), //o
    .io_outs_3     (redundancyRemover_12_io_outs_3[10:0]), //o
    .io_outs_4     (redundancyRemover_12_io_outs_4[10:0]), //o
    .io_outs_5     (redundancyRemover_12_io_outs_5[10:0]), //o
    .io_outs_6     (redundancyRemover_12_io_outs_6[10:0]), //o
    .io_outs_7     (redundancyRemover_12_io_outs_7[10:0]), //o
    .clk           (clk                                 ), //i
    .clrn          (clrn                                )  //i
  );
  RedundancyRemover_6 redundancyRemover_13 (
    .io_upperIns_0 (interRes_2_0[10:0]                   ), //i
    .io_upperIns_1 (interRes_2_1[10:0]                   ), //i
    .io_upperIns_2 (interRes_2_2[10:0]                   ), //i
    .io_upperIns_3 (interRes_2_3[10:0]                   ), //i
    .io_upperIns_4 (interRes_2_4[10:0]                   ), //i
    .io_upperIns_5 (interRes_2_5[10:0]                   ), //i
    .io_upperIns_6 (interRes_2_6[10:0]                   ), //i
    .io_upperIns_7 (interRes_2_7[10:0]                   ), //i
    .io_lowerIns_0 (interRes_2_8[10:0]                   ), //i
    .io_lowerIns_1 (interRes_2_9[10:0]                   ), //i
    .io_lowerIns_2 (interRes_2_10[10:0]                  ), //i
    .io_lowerIns_3 (interRes_2_11[10:0]                  ), //i
    .io_lowerIns_4 (interRes_2_12[10:0]                  ), //i
    .io_lowerIns_5 (interRes_2_13[10:0]                  ), //i
    .io_lowerIns_6 (interRes_2_14[10:0]                  ), //i
    .io_lowerIns_7 (interRes_2_15[10:0]                  ), //i
    .io_outs_0     (redundancyRemover_13_io_outs_0[10:0] ), //o
    .io_outs_1     (redundancyRemover_13_io_outs_1[10:0] ), //o
    .io_outs_2     (redundancyRemover_13_io_outs_2[10:0] ), //o
    .io_outs_3     (redundancyRemover_13_io_outs_3[10:0] ), //o
    .io_outs_4     (redundancyRemover_13_io_outs_4[10:0] ), //o
    .io_outs_5     (redundancyRemover_13_io_outs_5[10:0] ), //o
    .io_outs_6     (redundancyRemover_13_io_outs_6[10:0] ), //o
    .io_outs_7     (redundancyRemover_13_io_outs_7[10:0] ), //o
    .io_outs_8     (redundancyRemover_13_io_outs_8[10:0] ), //o
    .io_outs_9     (redundancyRemover_13_io_outs_9[10:0] ), //o
    .io_outs_10    (redundancyRemover_13_io_outs_10[10:0]), //o
    .io_outs_11    (redundancyRemover_13_io_outs_11[10:0]), //o
    .io_outs_12    (redundancyRemover_13_io_outs_12[10:0]), //o
    .io_outs_13    (redundancyRemover_13_io_outs_13[10:0]), //o
    .io_outs_14    (redundancyRemover_13_io_outs_14[10:0]), //o
    .io_outs_15    (redundancyRemover_13_io_outs_15[10:0]), //o
    .clk           (clk                                  ), //i
    .clrn          (clrn                                 )  //i
  );
  assign interRes_0_0 = io_seqIn_0;
  assign interRes_0_1 = io_seqIn_1;
  assign interRes_0_2 = io_seqIn_2;
  assign interRes_0_3 = 11'h400;
  assign interRes_0_4 = io_seqIn_3;
  assign interRes_0_5 = io_seqIn_4;
  assign interRes_0_6 = io_seqIn_5;
  assign interRes_0_7 = 11'h400;
  assign interRes_0_8 = io_seqIn_6;
  assign interRes_0_9 = io_seqIn_7;
  assign interRes_0_10 = io_seqIn_8;
  assign interRes_0_11 = 11'h400;
  assign interRes_0_12 = io_seqIn_9;
  assign interRes_0_13 = io_seqIn_10;
  assign interRes_0_14 = io_seqIn_11;
  assign interRes_0_15 = 11'h400;
  assign interRes_1_0 = redundancyRemover_7_io_outs_0;
  assign interRes_1_1 = redundancyRemover_7_io_outs_1;
  assign interRes_1_2 = redundancyRemover_7_io_outs_2;
  assign interRes_1_3 = redundancyRemover_7_io_outs_3;
  assign interRes_1_4 = redundancyRemover_8_io_outs_0;
  assign interRes_1_5 = redundancyRemover_8_io_outs_1;
  assign interRes_1_6 = redundancyRemover_8_io_outs_2;
  assign interRes_1_7 = redundancyRemover_8_io_outs_3;
  assign interRes_1_8 = redundancyRemover_9_io_outs_0;
  assign interRes_1_9 = redundancyRemover_9_io_outs_1;
  assign interRes_1_10 = redundancyRemover_9_io_outs_2;
  assign interRes_1_11 = redundancyRemover_9_io_outs_3;
  assign interRes_1_12 = redundancyRemover_10_io_outs_0;
  assign interRes_1_13 = redundancyRemover_10_io_outs_1;
  assign interRes_1_14 = redundancyRemover_10_io_outs_2;
  assign interRes_1_15 = redundancyRemover_10_io_outs_3;
  assign interRes_2_0 = redundancyRemover_11_io_outs_0;
  assign interRes_2_1 = redundancyRemover_11_io_outs_1;
  assign interRes_2_2 = redundancyRemover_11_io_outs_2;
  assign interRes_2_3 = redundancyRemover_11_io_outs_3;
  assign interRes_2_4 = redundancyRemover_11_io_outs_4;
  assign interRes_2_5 = redundancyRemover_11_io_outs_5;
  assign interRes_2_6 = redundancyRemover_11_io_outs_6;
  assign interRes_2_7 = redundancyRemover_11_io_outs_7;
  assign interRes_2_8 = redundancyRemover_12_io_outs_0;
  assign interRes_2_9 = redundancyRemover_12_io_outs_1;
  assign interRes_2_10 = redundancyRemover_12_io_outs_2;
  assign interRes_2_11 = redundancyRemover_12_io_outs_3;
  assign interRes_2_12 = redundancyRemover_12_io_outs_4;
  assign interRes_2_13 = redundancyRemover_12_io_outs_5;
  assign interRes_2_14 = redundancyRemover_12_io_outs_6;
  assign interRes_2_15 = redundancyRemover_12_io_outs_7;
  assign interRes_3_0 = redundancyRemover_13_io_outs_0;
  assign interRes_3_1 = redundancyRemover_13_io_outs_1;
  assign interRes_3_2 = redundancyRemover_13_io_outs_2;
  assign interRes_3_3 = redundancyRemover_13_io_outs_3;
  assign interRes_3_4 = redundancyRemover_13_io_outs_4;
  assign interRes_3_5 = redundancyRemover_13_io_outs_5;
  assign interRes_3_6 = redundancyRemover_13_io_outs_6;
  assign interRes_3_7 = redundancyRemover_13_io_outs_7;
  assign interRes_3_8 = redundancyRemover_13_io_outs_8;
  assign interRes_3_9 = redundancyRemover_13_io_outs_9;
  assign interRes_3_10 = redundancyRemover_13_io_outs_10;
  assign interRes_3_11 = redundancyRemover_13_io_outs_11;
  assign interRes_3_12 = redundancyRemover_13_io_outs_12;
  assign interRes_3_13 = redundancyRemover_13_io_outs_13;
  assign interRes_3_14 = redundancyRemover_13_io_outs_14;
  assign interRes_3_15 = redundancyRemover_13_io_outs_15;
  assign io_seqOut_0 = interRes_3_0;
  assign io_seqOut_1 = interRes_3_1;
  assign io_seqOut_2 = interRes_3_2;
  assign io_seqOut_3 = interRes_3_3;
  assign io_seqOut_4 = interRes_3_4;
  assign io_seqOut_5 = interRes_3_5;
  assign io_seqOut_6 = interRes_3_6;
  assign io_seqOut_7 = interRes_3_7;
  assign io_seqOut_8 = interRes_3_8;
  assign io_seqOut_9 = interRes_3_9;
  assign io_seqOut_10 = interRes_3_10;
  assign io_seqOut_11 = interRes_3_11;
  assign io_seqOut_12 = interRes_3_12;
  assign io_seqOut_13 = interRes_3_13;
  assign io_seqOut_14 = interRes_3_14;
  assign io_seqOut_15 = interRes_3_15;

endmodule
