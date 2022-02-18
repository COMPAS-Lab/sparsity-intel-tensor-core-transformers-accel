module bfp_converter_tb;

  // Parameters
  localparam V = 10;
  localparam P = 10;
  localparam BIT=32;
  localparam FPM=23;
  localparam BFPM=6;
  localparam EXP = BIT-FPM-1;

  // Ports
  logic clk = 0;
  logic rst_n = 0;
  logic vector_rdy = 0;
  logic [P*BIT-1:0] in_vector_flatten;
  logic [P*(BFPM+2)-1:0] outMants_flatten;
  logic [EXP-1:0] outExp;
  logic valid_out;

  localparam DAT_ROWS = 81;
  logic [BIT*P-1:0] mat_in [DAT_ROWS-1:0];
  logic [(BFPM+2)*P+8-1:0] mat_res [DAT_ROWS-1:0];

  bfp_converter 
  #(
    .V(V),
    .P(P),
    .BIT(BIT),
    .FPM(FPM),
    .BFPM(BFPM)
  )
  bfp_converter_dut (
    .clk (clk ),
    .rst_n ( rst_n ),
    .vector_rdy ( vector_rdy ),
    .in_vector_flatten (in_vector_flatten ),
    .outMants_flatten (outMants_flatten ),
    .outExp (outExp ),
    .valid_out (valid_out )
  );

  integer r_in, r_res;
  initial begin
    $readmemh("./tb/MAT_B_FP32.mem", mat_in);
    in_vector_flatten = '0;
    repeat(5) @(posedge clk);
    rst_n = 1;

    repeat(3) @(posedge clk);

    for(r_in=0; r_in<DAT_ROWS; r_in++) begin
      @(posedge clk);
      vector_rdy = 1;
      in_vector_flatten = mat_in[r_in];
    end

    @(posedge clk);
    vector_rdy = 0;
    in_vector_flatten = '0;
  end

  initial begin
    for(r_res=0; r_res<DAT_ROWS; r_res++) begin
      wait(valid_out)
      @(posedge clk);
      mat_res[r_res] = {outMants_flatten, outExp};
    end

    $writememh("./tb/MAT_B_BFP8.mem", mat_res);
    repeat(20) @(posedge clk);
    $finish;
  end

  always
    #5  clk = ! clk ;

endmodule
