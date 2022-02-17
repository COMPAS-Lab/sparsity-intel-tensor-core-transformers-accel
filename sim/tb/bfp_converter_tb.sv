module bfp_converter_tb;

  // Parameters
  localparam V = 4;
  localparam P = 4;
  localparam BIT=32;
  localparam FPM=23;
  localparam BFPM=6;
  localparam EXP = BIT-FPM-1;

  // Ports
  reg clk = 0;
  reg  rst_n = 0;
  reg  vector_rdy = 0;
  reg [P*BIT-1:0] in_vector_flatten;
  wire [P*(BFPM+2)-1:0] outMants_flatten;
  wire [EXP-1:0] outExp;
  wire valid_out;
  wire done;

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
    .valid_out (valid_out ),
    .done  ( done)
  );

  initial begin
    repeat(5) @(posedge clk);
    rst_n = 1;

    repeat(3) @(posedge clk);
    vector_rdy = 1;
    in_vector_flatten = {4{32'h3f800000}};

    @(posedge clk);
    in_vector_flatten = {32'h3f9d70a4, 32'h40933333, 32'h3fc00000, 32'hc0000000};

    @(posedge clk);
    vector_rdy = 0;
    in_vector_flatten = '0;

    repeat(20) @(posedge clk);
    $finish;
  end

  always
    #5  clk = ! clk ;

endmodule
