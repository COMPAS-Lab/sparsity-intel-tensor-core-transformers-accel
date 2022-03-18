//Converting FP32 to Block FP 1-8-7

module bfp_converter(
  clk, rst_n,
  vector_rdy, in_vector_flatten,
  outMants_flatten, outExp,
  valid_out);
  //very simple testbench, last 2 modules do not successfully parameterize with V or P

  //V is vector length, P is parallelism, BIT is incoming FP size, FPM is mantissa size of FP,
  //BFPM is mantissa size of BFP, Exponent lengths are calculated based off of these parameters,
  //Exponent length for BFP is assumed to be the same as that of FP.

  //Steps/modules:
  //1)split incoming vector into P parallel chunks
  //2)find largest exponent in P values, for all V/P groups
  //3)adjust mantissa of each value (P at a time)
  parameter                   V=8, P=4, BIT=32, FPM=23, BFPM=4;
  localparam                  EXP=BIT-FPM-1;//-1 since we exclude sign bit
  localparam                  LONGBFPM=2*(BFPM+2);//mantissa+sign+invisible1, times 2
  localparam                  SHIFTMAX=((LONGBFPM+$clog2(V)+1)/2);
  localparam                  TREE_WIDTH=2**($clog2((LONGBFPM+$clog2(V))/2));
  localparam                  ENC_WIDTH=$clog2((LONGBFPM+$clog2(V))/2)+2;

  input                           clk, rst_n, vector_rdy;
  input [P*BIT-1:0]               in_vector_flatten;
  logic [P-1:0][BIT-1:0]          vector;

  logic                           reset;
  logic [P-1:0][BFPM+EXP:0]       outvect;

  logic                           valid_outLE;
  logic [P-1:0][BIT-1:0]          outvalsVT;
  logic [EXP-1:0]                 outExpLE;

  logic [P-1:0][BFPM+1:0]                outMants;
  output logic [P*(BFPM+2)-1:0]          outMants_flatten;
  output logic [EXP-1:0]                 outExp;
  output logic                           valid_out;



  assign reset = ~rst_n;
  //flattening input and output array
  genvar i;
  generate
    for (i=0; i<P; i++) begin: IN_FLATTEN
      assign vector[i] = in_vector_flatten[BIT*(i+1)-1:BIT*i];
    end 

    for (i=0; i<P; i++) begin: OUT_PACK
      assign outMants_flatten[(BFPM+2)*(i+1)-1:(BFPM+2)*i] = outMants[i];
    end
  endgenerate

  largestExp #(V, P, BIT, FPM, BFPM) l0(.clk(clk), .reset(reset), .invals(vector),
                                  .invals_rdy(vector_rdy), .valid_out(valid_outLE), .outvect(outvect),
                                  .outExp(outExpLE));

  mantissaAdj #(V, P, BIT, FPM, BFPM) m0(.clk(clk), .reset(reset), .invals_rdy(valid_outLE), 
                                  .valid_out(valid_out), .vect(outvect), .mants(outMants), .inExp(outExpLE), .outExp(outExp));

endmodule
