`timescale 1ns/100ps

module TensorCoreChainTb;

// Parameters
localparam CHAIN_LEN = 3;

// Ports
logic [79:0] io_dataIn_0;
logic [79:0] io_dataIn_1;
logic [79:0] io_dataIn_2;
logic [79:0] io_loadCascadeIn;
logic [7:0] io_expIn_0;
logic [7:0] io_expIn_1;
logic [7:0] io_expIn_2;
logic [7:0] io_expCascadeIn;
logic io_dataValid = 0;
logic io_loadValid = 0;
logic io_loadReady;
logic [23:0] io_res_0;
logic [23:0] io_res_1;
logic [23:0] io_res_2;
logic [7:0] io_inputIters;
logic io_outValid;
logic clk = 0;
logic resetn = 0;

// Mat A: 3x90, each ceill 8 bitsx10 elems + 1 shared exp 
logic [3*9-1:0] mat_a [8*11-1:0];
// Mat B: 90x9, each ceill 3x (8bits x 10 elems + 1 shared exp)
logic [3*9-1:0] mat_b [CHAIN_LEN*(11*8)-1:0];
// res: 3x9 matrix, each 24 bit
logic [3*9-1:0] res [23:0];

TensorCoreChain dut (
  .io_dataIn_0 (io_dataIn_0 ),
  .io_dataIn_1 (io_dataIn_1 ),
  .io_dataIn_2 (io_dataIn_2 ),
  .io_loadCascadeIn (io_loadCascadeIn ),
  .io_expIn_0 (io_expIn_0 ),
  .io_expIn_1 (io_expIn_1 ),
  .io_expIn_2 (io_expIn_2 ),
  .io_expCascadeIn (io_expCascadeIn ),
  .io_dataValid (io_dataValid ),
  .io_loadValid (io_loadValid ),
  .io_loadReady (io_loadReady ),
  .io_res_0 (io_res_0 ),
  .io_res_1 (io_res_1 ),
  .io_res_2 (io_res_2 ),
  .io_inputIters(io_inputIters),
  .io_outValid(io_outValid),
  .clk (clk ),
  .resetn  (resetn)
);

initial begin
  $readmemh("./sim/tb/mat_a.mem", mat_a);
  $readmemh("./sim/tb/mat_b.mem", mat_b);
  #21 resetn = 1'b1;
  
  @(posedge clk);
  integer i;
  for (i = 0; i < 3*9; i++) begin
    @(posedge clk);
    {io_loadCascadeIn, io_expCascadeIn} = mat_a[i];
    io_loadValid = 1'b1;
  end

  @(posedge clk);
  {io_loadCascadeIn, io_expCascadeIn} = 88'd0;
  io_loadValid = 1'b0;
end

initial begin
  io_inputIters = 8'd9;
  wait(io_loadReady == 1'b1);

  integer i;
  for (i=0; i<3*9; i++) begin
    @(posedge clk);
    {io_dataIn_0, io_expIn_0, io_dataIn_1, io_expIn_1, io_dataIn_2, io_expIn_2} = 
      mat_b[i];
    io_dataValid = 1'b1;
  end

  @(posedge clk);
  {io_dataIn_0, io_expIn_0, io_dataIn_1, io_expIn_1, io_dataIn_2, io_expIn_2} = 264'd0;
  io_dataValid = 1'b0;
end

initial begin
  integer i;
  for (i=0; i<3; i++) begin
    wait(io_outValid);
  end

  for(i=0; i<9; i++) begin
    @(posedge clk)
    res[3*i] = io_res_0;
    res[(3*i)+1] = io_res_1;
    res[(3*i)+2] = io_res_2;
  end

  $writememh("./sim/tb/res.mem", res);
end

always #5 clk = ! clk ;


endmodule