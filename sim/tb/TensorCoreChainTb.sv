`timescale 1ns/100ps

module TensorCoreChainTb;

// Parameters
localparam CHAIN_LEN = 3;

// Ports
logic [79:0] io_dataIn_0 = '0;
logic [79:0] io_dataIn_1 = '0;
logic [79:0] io_dataIn_2 = '0;
logic [79:0] io_loadCascadeIn = '0;
logic [7:0] io_expIn_0 = '0;
logic [7:0] io_expIn_1 = '0;
logic [7:0] io_expIn_2 = '0;
logic [7:0] io_expCascadeIn = '0;
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
logic [8*11-1:0] mat_a [3*9-1:0];
// Mat B: 90x9, each ceill 3x (8bits x 10 elems + 1 shared exp)
logic [11*8-1:0] mat_b [9*9-1:0];
// res: 3x9 matrix, each 24 bit
logic [31:0] res [3*9-1:0];

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

integer i, j, k;
integer matBRow;

initial begin
  $readmemh("./tb/MAT_A_BFP8.mem", mat_a);
  $readmemh("./tb/MAT_B_BFP8.mem", mat_b);
  #21 resetn = 1'b1;
  
  @(posedge clk);
  for (i = 0; i < 3*9; i++) begin
    @(posedge clk);
	#1
    {io_loadCascadeIn, io_expCascadeIn} = mat_a[i];
    io_loadValid = 1'b1;
  end

  @(posedge clk);
  #1
  {io_loadCascadeIn, io_expCascadeIn} = 88'd0;
  io_loadValid = 1'b0;
end

initial begin
  io_inputIters = 8'd9;
  wait(io_loadReady == 1'b1);

  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    {io_dataIn_0, io_expIn_0, io_dataIn_1, io_expIn_1, io_dataIn_2, io_expIn_2} = 
      {mat_b[j*3], mat_b[j*3+1], mat_b[j*3+2]};
    io_dataValid = 1'b1;
  end

  @(posedge clk);
  #1
  {io_dataIn_0, io_expIn_0, io_dataIn_1, io_expIn_1, io_dataIn_2, io_expIn_2} = 264'd0;
  io_dataValid = 1'b0;
end

logic [7:0] res_counter = 0;
always_ff @(posedge clk) begin
	if (io_outValid)
		res_counter <= res_counter + 1;
end

initial begin
  wait(res_counter == 8'd2);
  for(k=0; k<9; k++) begin
	@(posedge clk);
    res[3*k] = {io_res_0, 8'd0};
    res[(3*k)+1] = {io_res_1, 8'd0};
    res[(3*k)+2] = {io_res_2, 8'd0};
  end

  $writememh("./tb/res.mem", res);
  $finish;
end

always #5 clk = ! clk ;


endmodule