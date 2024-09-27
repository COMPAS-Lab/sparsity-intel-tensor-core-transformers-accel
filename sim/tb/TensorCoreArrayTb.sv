`timescale 1ns/100ps

module TensorCoreArrayTb;

// Parameters
localparam CHAIN_LEN = 3;

// Ports
logic          io_matALoad_0_valid;
logic          io_matALoad_0_ready;
logic [87:0]   io_matALoad_0_payload_blkData;
logic [8:0]    io_matALoad_0_payload_rIdx;
logic          io_matALoad_1_valid;
logic          io_matALoad_1_ready;
logic [87:0]   io_matALoad_1_payload_blkData;
logic [8:0]    io_matALoad_1_payload_rIdx;
logic          io_matALoad_2_valid;
logic          io_matALoad_2_ready;
logic [87:0]   io_matALoad_2_payload_blkData;
logic [8:0]    io_matALoad_2_payload_rIdx;
logic          io_matALoad_3_valid;
logic          io_matALoad_3_ready;
logic [87:0]   io_matALoad_3_payload_blkData;
logic [8:0]    io_matALoad_3_payload_rIdx;
logic          io_matALoad_4_valid;
logic          io_matALoad_4_ready;
logic [87:0]   io_matALoad_4_payload_blkData;
logic [8:0]    io_matALoad_4_payload_rIdx;
logic          io_matALoad_5_valid;
logic          io_matALoad_5_ready;
logic [87:0]   io_matALoad_5_payload_blkData;
logic [8:0]    io_matALoad_5_payload_rIdx;
logic          io_matALoad_6_valid;
logic          io_matALoad_6_ready;
logic [87:0]   io_matALoad_6_payload_blkData;
logic [8:0]    io_matALoad_6_payload_rIdx;
logic          io_matALoad_7_valid;
logic          io_matALoad_7_ready;
logic [87:0]   io_matALoad_7_payload_blkData;
logic [8:0]    io_matALoad_7_payload_rIdx;
logic          io_matALoad_8_valid;
logic          io_matALoad_8_ready;
logic [87:0]   io_matALoad_8_payload_blkData;
logic [8:0]    io_matALoad_8_payload_rIdx;
logic          io_matALoad_9_valid;
logic          io_matALoad_9_ready;
logic [87:0]   io_matALoad_9_payload_blkData;
logic [8:0]    io_matALoad_9_payload_rIdx;
logic          io_matALoad_10_valid;
logic          io_matALoad_10_ready;
logic [87:0]   io_matALoad_10_payload_blkData;
logic [8:0]    io_matALoad_10_payload_rIdx;
logic          io_matALoad_11_valid;
logic [87:0]   io_matALoad_11_payload_blkData;
logic [8:0]    io_matALoad_11_payload_rIdx;
logic          io_matBLoad_0_valid;
logic          io_matBLoad_0_ready;
logic [87:0]   io_matBLoad_0_payload;
logic          io_matBLoad_1_valid;
logic          io_matBLoad_1_ready;
logic [87:0]   io_matBLoad_1_payload;
logic          io_matBLoad_2_valid;
logic          io_matBLoad_2_ready;
logic [87:0]   io_matBLoad_2_payload;
logic          io_matBLoad_3_valid;
logic          io_matBLoad_3_ready;
logic [87:0]   io_matBLoad_3_payload;
logic          io_matBLoad_4_valid;
logic          io_matBLoad_4_ready;
logic [87:0]   io_matBLoad_4_payload;
logic          io_matBLoad_5_valid;
logic          io_matBLoad_5_ready;
logic [87:0]   io_matBLoad_5_payload;
logic          io_sortedColIdx_valid;
logic [8:0]    io_sortedColIdx_payload_idxData;
logic [11:0]   io_sortedColIdx_payload_destId;
logic          io_calEn;
logic          io_colIdxFifoNotEmpty;
logic          io_res_0_valid;
logic          io_res_0_ready;
logic [98:0]   io_res_0_payload;
logic          io_res_1_valid;
logic          io_res_1_ready;
logic [98:0]   io_res_1_payload;
logic          io_res_2_valid;
logic          io_res_2_ready;
logic [98:0]   io_res_2_payload;
logic          io_res_3_valid;
logic          io_res_3_ready;
logic [98:0]   io_res_3_payload;
logic          io_res_4_valid;
logic          io_res_4_ready;
logic [98:0]   io_res_4_payload;
logic          io_res_5_valid;
logic          io_res_5_ready;
logic [98:0]   io_res_5_payload;
logic [6:0]    io_tccRowBufferId;
logic          clk=1;
logic          clrn=0;


// Mat A: 9x90, each ceil 8 bitsx10 elems + 1 shared exp 
logic [319:0] mat_a0 [3*9-1:0];
logic [319:0] mat_a1 [3*9-1:0];
logic [319:0] mat_a2 [3*9-1:0];
// Mat B: 90x18, each ceil 3x (8bits x 10 elems + 1 shared exp)
logic [319:0] mat_b0 [9*9-1:0];
logic [319:0] mat_b1 [9*9-1:0];
// res: 3x9 matrix, each 24 bit
logic [71:0] res [9*6-1:0];

TensorCoreChainArray dut(
  .io_matALoad_0_valid             (io_matALoad_0_valid             ),
  .io_matALoad_0_ready             (io_matALoad_0_ready             ),
  .io_matALoad_0_payload_blkData   (io_matALoad_0_payload_blkData   ),
  .io_matALoad_0_payload_rIdx      (io_matALoad_0_payload_rIdx      ),
  .io_matALoad_1_valid             (io_matALoad_1_valid             ),
  .io_matALoad_1_ready             (io_matALoad_1_ready             ),
  .io_matALoad_1_payload_blkData   (io_matALoad_1_payload_blkData   ),
  .io_matALoad_1_payload_rIdx      (io_matALoad_1_payload_rIdx      ),
  .io_matALoad_2_valid             (io_matALoad_2_valid             ),
  .io_matALoad_2_ready             (io_matALoad_2_ready             ),
  .io_matALoad_2_payload_blkData   (io_matALoad_2_payload_blkData   ),
  .io_matALoad_2_payload_rIdx      (io_matALoad_2_payload_rIdx      ),
  .io_matALoad_3_valid             (io_matALoad_3_valid             ),
  .io_matALoad_3_ready             (io_matALoad_3_ready             ),
  .io_matALoad_3_payload_blkData   (io_matALoad_3_payload_blkData   ),
  .io_matALoad_3_payload_rIdx      (io_matALoad_3_payload_rIdx      ),
  .io_matALoad_4_valid             (io_matALoad_4_valid             ),
  .io_matALoad_4_ready             (io_matALoad_4_ready             ),
  .io_matALoad_4_payload_blkData   (io_matALoad_4_payload_blkData   ),
  .io_matALoad_4_payload_rIdx      (io_matALoad_4_payload_rIdx      ),
  .io_matALoad_5_valid             (io_matALoad_5_valid             ),
  .io_matALoad_5_ready             (io_matALoad_5_ready             ),
  .io_matALoad_5_payload_blkData   (io_matALoad_5_payload_blkData   ),
  .io_matALoad_5_payload_rIdx      (io_matALoad_5_payload_rIdx      ),
  .io_matALoad_6_valid             (io_matALoad_6_valid             ),
  .io_matALoad_6_ready             (io_matALoad_6_ready             ),
  .io_matALoad_6_payload_blkData   (io_matALoad_6_payload_blkData   ),
  .io_matALoad_6_payload_rIdx      (io_matALoad_6_payload_rIdx      ),
  .io_matALoad_7_valid             (io_matALoad_7_valid             ),
  .io_matALoad_7_ready             (io_matALoad_7_ready             ),
  .io_matALoad_7_payload_blkData   (io_matALoad_7_payload_blkData   ),
  .io_matALoad_7_payload_rIdx      (io_matALoad_7_payload_rIdx      ),
  .io_matALoad_8_valid             (io_matALoad_8_valid             ),
  .io_matALoad_8_ready             (io_matALoad_8_ready             ),
  .io_matALoad_8_payload_blkData   (io_matALoad_8_payload_blkData   ),
  .io_matALoad_8_payload_rIdx      (io_matALoad_8_payload_rIdx      ),
  .io_matALoad_9_valid             (io_matALoad_9_valid             ),
  .io_matALoad_9_ready             (io_matALoad_9_ready             ),
  .io_matALoad_9_payload_blkData   (io_matALoad_9_payload_blkData   ),
  .io_matALoad_9_payload_rIdx      (io_matALoad_9_payload_rIdx      ),
  .io_matALoad_10_valid            (io_matALoad_10_valid            ),
  .io_matALoad_10_ready            (io_matALoad_10_ready            ),
  .io_matALoad_10_payload_blkData  (io_matALoad_10_payload_blkData  ),
  .io_matALoad_10_payload_rIdx     (io_matALoad_10_payload_rIdx     ),
  .io_matALoad_11_valid            (io_matALoad_11_valid            ),
  .io_matALoad_11_payload_blkData  (io_matALoad_11_payload_blkData  ),
  .io_matALoad_11_payload_rIdx     (io_matALoad_11_payload_rIdx     ),
  .io_matBLoad_0_valid             (io_matBLoad_0_valid             ),
  .io_matBLoad_0_ready             (io_matBLoad_0_ready             ),
  .io_matBLoad_0_payload           (io_matBLoad_0_payload           ),
  .io_matBLoad_1_valid             (io_matBLoad_1_valid             ),
  .io_matBLoad_1_ready             (io_matBLoad_1_ready             ),
  .io_matBLoad_1_payload           (io_matBLoad_1_payload           ),
  .io_matBLoad_2_valid             (io_matBLoad_2_valid             ),
  .io_matBLoad_2_ready             (io_matBLoad_2_ready             ),
  .io_matBLoad_2_payload           (io_matBLoad_2_payload           ),
  .io_matBLoad_3_valid             (io_matBLoad_3_valid             ),
  .io_matBLoad_3_ready             (io_matBLoad_3_ready             ),
  .io_matBLoad_3_payload           (io_matBLoad_3_payload           ),
  .io_matBLoad_4_valid             (io_matBLoad_4_valid             ),
  .io_matBLoad_4_ready             (io_matBLoad_4_ready             ),
  .io_matBLoad_4_payload           (io_matBLoad_4_payload           ),
  .io_matBLoad_5_valid             (io_matBLoad_5_valid             ),
  .io_matBLoad_5_ready             (io_matBLoad_5_ready             ),
  .io_matBLoad_5_payload           (io_matBLoad_5_payload           ),
  .io_sortedColIdx_valid           (io_sortedColIdx_valid           ),
  .io_sortedColIdx_payload_idxData (io_sortedColIdx_payload_idxData ),
  .io_sortedColIdx_payload_destId  (io_sortedColIdx_payload_destId  ),
  .io_calEn                        (io_calEn                        ),
  .io_colIdxFifoNotEmpty           (io_colIdxFifoNotEmpty           ),
  .io_res_0_valid                  (io_res_0_valid                  ),
  .io_res_0_ready                  (io_res_0_ready                  ),
  .io_res_0_payload                (io_res_0_payload                ),
  .io_res_1_valid                  (io_res_1_valid                  ),
  .io_res_1_ready                  (io_res_1_ready                  ),
  .io_res_1_payload                (io_res_1_payload                ),
  .io_res_2_valid                  (io_res_2_valid                  ),
  .io_res_2_ready                  (io_res_2_ready                  ),
  .io_res_2_payload                (io_res_2_payload                ),
  .io_res_3_valid                  (io_res_3_valid                  ),
  .io_res_3_ready                  (io_res_3_ready                  ),
  .io_res_3_payload                (io_res_3_payload                ),
  .io_res_4_valid                  (io_res_4_valid                  ),
  .io_res_4_ready                  (io_res_4_ready                  ),
  .io_res_4_payload                (io_res_4_payload                ),
  .io_res_5_valid                  (io_res_5_valid                  ),
  .io_res_5_ready                  (io_res_5_ready                  ),
  .io_res_5_payload                (io_res_5_payload                ),
  .io_tccRowBufferId               (io_tccRowBufferId               ),
  .clk                             (clk                             ),
  .clrn                            (clrn                            )
);


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