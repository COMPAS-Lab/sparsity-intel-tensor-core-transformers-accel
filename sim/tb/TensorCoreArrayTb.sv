`timescale 1ns/100ps

module TensorCoreArrayTb;

// Parameters
localparam CHAIN_LEN = 3;

// Ports
logic          io_matALoad_0_valid;
logic [319:0]  io_matALoad_0_payload;
logic          io_matALoad_1_valid;
logic [319:0]  io_matALoad_1_payload;
logic          io_matALoad_2_valid;
logic [319:0]  io_matALoad_2_payload;
logic          io_matBLoad_0_0_valid;
logic [319:0]  io_matBLoad_0_0_payload;
logic          io_matBLoad_0_1_valid;
logic [319:0]  io_matBLoad_0_1_payload;
logic          io_matBLoad_0_2_valid;
logic [319:0]  io_matBLoad_0_2_payload;
logic          io_matBLoad_1_0_valid;
logic [319:0]  io_matBLoad_1_0_payload;
logic          io_matBLoad_1_1_valid;
logic [319:0]  io_matBLoad_1_1_payload;
logic          io_matBLoad_1_2_valid;
logic [319:0]  io_matBLoad_1_2_payload;
logic          io_calEn;
logic [7:0]    io_configPorts_matAColSubGrpLen = 3;
logic [7:0]    io_configPorts_matBColsPerTccRow = 9;
logic [7:0]    io_configPorts_tccRowBufferCnterRange = 27;
logic [7:0]    io_configPorts_tccColBufferCnterRange = 9/3/3 * 90/10 * 3;
logic          io_res_valid;
logic          io_res_ready;
logic [431:0]  io_res_payload;
logic          clk=1;
logic          resetn=0;

// Mat A: 9x90, each ceil 8 bitsx10 elems + 1 shared exp 
logic [319:0] mat_a0 [3*9-1:0];
logic [319:0] mat_a1 [3*9-1:0];
logic [319:0] mat_a2 [3*9-1:0];
// Mat B: 90x18, each ceil 3x (8bits x 10 elems + 1 shared exp)
logic [319:0] mat_b0 [9*9-1:0];
logic [319:0] mat_b1 [9*9-1:0];
// res: 3x9 matrix, each 24 bit
logic [71:0] res [9*6-1:0];

TensorCoreChainArray dut (.*);

integer i, j, k;
integer matBRow;

initial begin
  $readmemh("./tb/MAT_A_FP32_0.mem", mat_a0);
  $readmemh("./tb/MAT_A_FP32_1.mem", mat_a1);
  $readmemh("./tb/MAT_A_FP32_2.mem", mat_a2);
  io_matALoad_0_payload = 320'd0;
  io_matALoad_1_payload = 320'd0;
  io_matALoad_2_payload = 320'd0;
  io_matALoad_0_valid = 0;
  io_matALoad_1_valid = 0;
  io_matALoad_2_valid = 0;
  #201 resetn = 1'b1;
  
  @(posedge clk);
  for (i = 0; i < 3*9; i++) begin
    @(posedge clk);
	#1
    io_matALoad_0_payload = mat_a0[i];
    io_matALoad_0_valid = 1;
  end

  @(posedge clk);
  #1
  io_matALoad_0_payload = 320'd0;
  io_matALoad_0_valid = 0;

  @(posedge clk);
  for (i = 0; i < 3*9; i++) begin
    @(posedge clk);
	#1
    io_matALoad_1_payload = mat_a1[i];
    io_matALoad_1_valid = 1;
  end

  @(posedge clk);
  #1
  io_matALoad_1_payload = 320'd0;
  io_matALoad_1_valid = 0;

  @(posedge clk);
  for (i = 0; i < 3*9; i++) begin
    @(posedge clk);
	#1
    io_matALoad_2_payload = mat_a2[i];
    io_matALoad_2_valid = 1;
  end

  @(posedge clk);
  #1
  io_matALoad_2_payload = 320'd0;
  io_matALoad_2_valid = 0;
  
end

initial begin
  $readmemh("./tb/MAT_B_FP32_0.mem", mat_b0);
  $readmemh("./tb/MAT_B_FP32_1.mem", mat_b1);
  io_computeIters = 8'd3;
  io_matBLoad_0_0_valid = '0;
  io_matBLoad_0_0_payload = '0;
  io_matBLoad_0_1_valid = '0;
  io_matBLoad_0_1_payload = '0;
  io_matBLoad_0_2_valid = '0;
  io_matBLoad_0_2_payload = '0;
  io_matBLoad_1_0_valid = '0;
  io_matBLoad_1_0_payload = '0;
  io_matBLoad_1_1_valid = '0;
  io_matBLoad_1_1_payload = '0;
  io_matBLoad_1_2_valid = '0;
  io_matBLoad_1_2_payload = '0;
  
  wait(resetn)
  for (j=0; j<3; j++) begin
	@(posedge clk);
  end

  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    io_matBLoad_0_0_payload = mat_b0[j*3];
    io_matBLoad_0_0_valid = 1'b1;
  end

  @(posedge clk);
  #1
  io_matBLoad_0_0_valid = '0;
  io_matBLoad_0_0_payload = '0;

  // b01
  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    io_matBLoad_0_1_payload = mat_b0[j*3+1];
    io_matBLoad_0_1_valid = 1'b1;
  end

  @(posedge clk);
  #1
  io_matBLoad_0_1_valid = '0;
  io_matBLoad_0_1_payload = '0;

  // b02
  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    io_matBLoad_0_2_payload = mat_b0[j*3+2];
    io_matBLoad_0_2_valid = 1'b1;
  end

  @(posedge clk);
  #1
  io_matBLoad_0_2_valid = '0;
  io_matBLoad_0_2_payload = '0;

  //b10
  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    io_matBLoad_1_0_payload = mat_b1[j*3];
    io_matBLoad_1_0_valid = 1'b1;
  end

  @(posedge clk);
  #1
  io_matBLoad_1_0_valid = '0;
  io_matBLoad_1_0_payload = '0;

  //b11
  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    io_matBLoad_1_1_payload = mat_b1[j*3+1];
    io_matBLoad_1_1_valid = 1'b1;
  end

  @(posedge clk);
  #1
  io_matBLoad_1_1_valid = '0;
  io_matBLoad_1_1_payload = '0;

  //b12
  for (j=0; j<3*9; j++) begin
    @(posedge clk);
	#1
    io_matBLoad_1_2_payload = mat_b1[j*3+2];
    io_matBLoad_1_2_valid = 1'b1;
  end

  @(posedge clk);
  #1
  io_matBLoad_1_2_valid = '0;
  io_matBLoad_1_2_payload = '0;
  
end

logic [5:0][71:0] res_payload_72;

initial begin
  io_calEn = 1'b0;
  io_res_ready = 1'b0;
  for(k=0; k<500; k++) begin
    @(posedge clk);
  end

  @(posedge clk);
  io_calEn = 1'b1;

  @(posedge clk);
  io_calEn = 1'b0;

  wait(io_res_valid == 1);
  #9
  io_res_ready = 1;
  @(posedge clk);
  for(k=0; k<9; k++) begin
	@(posedge clk);
    res_payload_72 = io_res_payload;
    res[(6*k)+0] = res_payload_72[0];
    res[(6*k)+1] = res_payload_72[1];
    res[(6*k)+2] = res_payload_72[2];
    res[(6*k)+3] = res_payload_72[3];
    res[(6*k)+4] = res_payload_72[4];
    res[(6*k)+5] = res_payload_72[5];
  end

  $writememh("./tb/res.mem", res);
  $finish;
end

always #5 clk = ! clk ;


endmodule