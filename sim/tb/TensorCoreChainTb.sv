`timescale 1ns/100ps

module TensorCoreChainTb;

// Parameters
localparam CHAIN_LEN = 12;
// number of dot cols in the tensor core
localparam NUM_COLS = 3;
// how many grps of mat A to load
localparam NUM_ITERS = 8;

localparam NUM_B_COLS = 32;

// Ports
logic [79:0] io_dataIn_payload_0 = '0;
logic [79:0] io_dataIn_payload_1 = '0;
logic [79:0] io_dataIn_payload_2 = '0;
logic [79:0] io_dataIn_payload_3 = '0;
logic [79:0] io_dataIn_payload_4 = '0;
logic [79:0] io_dataIn_payload_5 = '0;
logic [79:0] io_dataIn_payload_6 = '0;
logic [79:0] io_dataIn_payload_7 = '0;
logic [79:0] io_dataIn_payload_8 = '0;
logic [79:0] io_dataIn_payload_9 = '0;
logic [79:0] io_dataIn_payload_10 = '0;
logic [79:0] io_dataIn_payload_11 = '0;
logic [79:0] io_loadCascadeIn_payload = '0;
logic io_loadCascadeIn_valid = '0;
logic [7:0] io_expIn_0 = '0;
logic [7:0] io_expIn_1 = '0;
logic [7:0] io_expIn_2 = '0;
logic [7:0] io_expIn_3 = '0;
logic [7:0] io_expIn_4 = '0;
logic [7:0] io_expIn_5 = '0;
logic [7:0] io_expIn_6 = '0;
logic [7:0] io_expIn_7 = '0;
logic [7:0] io_expIn_8 = '0;
logic [7:0] io_expIn_9 = '0;
logic [7:0] io_expIn_10 = '0;
logic [7:0] io_expIn_11 = '0;
logic [7:0] io_expCascadeIn = '0;
logic io_dataIn_valid = 0;
logic io_loadReady;
logic [23:0] io_res_payload_0;
logic [23:0] io_res_payload_1;
logic [23:0] io_res_payload_2;
logic [15:0] io_matAColSubGrpLen = NUM_ITERS[15:0];
logic [15:0] io_matABroadcastIters = NUM_B_COLS[15:0];
logic io_res_valid;
logic io_outValid, io_dataIterReady;
logic clk = 0;
logic resetn = 0;

logic [8*11-1:0] mat_a [NUM_ITERS * CHAIN_LEN * NUM_COLS -1:0];
logic [88 * CHAIN_LEN-1:0] mat_b [NUM_B_COLS * NUM_ITERS-1:0];
logic [31:0] res [3*NUM_B_COLS-1:0];

TensorCoreChainBf12 dut(
  .io_dataIn_valid          (io_dataIn_valid          ),
  .io_dataIn_payload_0      (io_dataIn_payload_0      ),
  .io_dataIn_payload_1      (io_dataIn_payload_1      ),
  .io_dataIn_payload_2      (io_dataIn_payload_2      ),
  .io_dataIn_payload_3      (io_dataIn_payload_3      ),
  .io_dataIn_payload_4      (io_dataIn_payload_4      ),
  .io_dataIn_payload_5      (io_dataIn_payload_5      ),
  .io_dataIn_payload_6      (io_dataIn_payload_6      ),
  .io_dataIn_payload_7      (io_dataIn_payload_7      ),
  .io_dataIn_payload_8      (io_dataIn_payload_8      ),
  .io_dataIn_payload_9      (io_dataIn_payload_9      ),
  .io_dataIn_payload_10     (io_dataIn_payload_10     ),
  .io_dataIn_payload_11     (io_dataIn_payload_11     ),
  .io_loadCascadeIn_valid   (io_loadCascadeIn_valid   ),
  .io_loadCascadeIn_payload (io_loadCascadeIn_payload ),
  .io_expIn_0               (io_expIn_0               ),
  .io_expIn_1               (io_expIn_1               ),
  .io_expIn_2               (io_expIn_2               ),
  .io_expIn_3               (io_expIn_3               ),
  .io_expIn_4               (io_expIn_4               ),
  .io_expIn_5               (io_expIn_5               ),
  .io_expIn_6               (io_expIn_6               ),
  .io_expIn_7               (io_expIn_7               ),
  .io_expIn_8               (io_expIn_8               ),
  .io_expIn_9               (io_expIn_9               ),
  .io_expIn_10              (io_expIn_10              ),
  .io_expIn_11              (io_expIn_11              ),
  .io_expCascadeIn          (io_expCascadeIn          ),
  .io_dataIterReady         (io_dataIterReady         ),
  .io_loadReady             (io_loadReady             ),
  .io_res_valid             (io_res_valid             ),
  .io_res_ready             (1'b1                     ),
  .io_res_payload_0         (io_res_payload_0         ),
  .io_res_payload_1         (io_res_payload_1         ),
  .io_res_payload_2         (io_res_payload_2         ),
  .io_matABroadcastIters    (io_matABroadcastIters    ),
  .io_matAColSubGrpLen      (io_matAColSubGrpLen      ),
  .io_outValid              (io_outValid              ),
  .clk                      (clk                      ),
  .resetn                   (resetn                   )
);


integer i, j, k;
integer iter_idx, comp_counter;
integer iter_idx_data;
integer matBRow;

generate
  if (CHAIN_LEN * 3 > NUM_B_COLS) begin
    // mat A loading process: each iter of mat A loading 
    // does not need to wait for the computation because it 
    // takes longer
    initial begin
      $readmemb("./tb/MAT_A_BFP12.bin", mat_a);
      $readmemb("./tb/MAT_B_BFP12.bin", mat_b);
      #41 resetn = 1'b1;
      // load first iteration's weight

      @(posedge clk); 
      for (i = 0; i < CHAIN_LEN * NUM_COLS; i++) begin
        @(posedge clk);
      #1
        {io_expCascadeIn, io_loadCascadeIn_payload} = mat_a[i];
        io_loadCascadeIn_valid = 1'b1;
      end

      for (iter_idx = 1; iter_idx < NUM_ITERS; iter_idx++) begin
        for (i = iter_idx * CHAIN_LEN * NUM_COLS; i < (iter_idx + 1) * CHAIN_LEN * NUM_COLS; i++) begin
          @(posedge clk);
        #1
          {io_expCascadeIn, io_loadCascadeIn_payload} = mat_a[i];
          io_loadCascadeIn_valid = 1'b1;
        end

        @(posedge clk);
        #1
        {io_expCascadeIn, io_loadCascadeIn_payload} = 88'd0;
        io_loadCascadeIn_valid = 1'b0;
      end

      @(posedge clk);
      #1
      {io_expCascadeIn, io_loadCascadeIn_payload} = 88'd0;
      io_loadCascadeIn_valid = 1'b0;
    end
    // compute process: need to wait for the weights loading
    initial begin
      wait(io_loadReady);
      
      for (iter_idx_data=0; iter_idx_data<NUM_ITERS; iter_idx_data++) begin
        for (j=NUM_B_COLS*iter_idx_data; j<NUM_B_COLS * (iter_idx_data+1); j++) begin
          @(posedge clk);
        #1
          {io_expIn_0, io_dataIn_payload_0, 
          io_expIn_1, io_dataIn_payload_1, 
          io_expIn_2, io_dataIn_payload_2,
          io_expIn_3, io_dataIn_payload_3, 
          io_expIn_4, io_dataIn_payload_4, 
          io_expIn_5, io_dataIn_payload_5,
          io_expIn_6, io_dataIn_payload_6, 
          io_expIn_7, io_dataIn_payload_7, 
          io_expIn_8, io_dataIn_payload_8,
          io_expIn_9, io_dataIn_payload_9, 
          io_expIn_10, io_dataIn_payload_10, 
          io_expIn_11, io_dataIn_payload_11} = mat_b[j];
          io_dataIn_valid = 1'b1;
        end

        @(posedge clk);
        #1
          {io_expIn_0, io_dataIn_payload_0, 
          io_expIn_1, io_dataIn_payload_1, 
          io_expIn_2, io_dataIn_payload_2,
          io_expIn_3, io_dataIn_payload_3, 
          io_expIn_4, io_dataIn_payload_4, 
          io_expIn_5, io_dataIn_payload_5,
          io_expIn_6, io_dataIn_payload_6, 
          io_expIn_7, io_dataIn_payload_7, 
          io_expIn_8, io_dataIn_payload_8,
          io_expIn_9, io_dataIn_payload_9, 
          io_expIn_10, io_dataIn_payload_10, 
          io_expIn_11, io_dataIn_payload_11} = '0;
        io_dataIn_valid = 1'b0;      

        wait(io_loadReady);
      end

      @(posedge clk);
      @(posedge clk);
    end
  end else begin
    // mat A loading process: each iter of mat A loading waits 
    // for the computation
    initial begin
      $readmemb("./tb/MAT_A_BFP12.bin", mat_a);
      $readmemb("./tb/MAT_B_BFP12.bin", mat_b);
      #41 resetn = 1'b1;
      // load first iteration's weight

      @(posedge clk); 
      for (i = 0; i < CHAIN_LEN * NUM_COLS; i++) begin
        @(posedge clk);
      #1
        {io_expCascadeIn, io_loadCascadeIn_payload} = mat_a[i];
        io_loadCascadeIn_valid = 1'b1;
      end

      for (iter_idx = 1; iter_idx < NUM_ITERS; iter_idx++) begin
        for (i = iter_idx * CHAIN_LEN * NUM_COLS; i < (iter_idx + 1) * CHAIN_LEN * NUM_COLS; i++) begin
          @(posedge clk);
        #1
          {io_expCascadeIn, io_loadCascadeIn_payload} = mat_a[i];
          io_loadCascadeIn_valid = 1'b1;
        end

        @(posedge clk);
        #1
        {io_expCascadeIn, io_loadCascadeIn_payload} = 88'd0;
        io_loadCascadeIn_valid = 1'b0;

        wait(io_dataIterReady);
        @(posedge clk);
        wait(io_outValid);
        @(posedge clk);
      end

      @(posedge clk);
      #1
      {io_expCascadeIn, io_loadCascadeIn_payload} = 88'd0;
      io_loadCascadeIn_valid = 1'b0;
    end
    // compute process: does not need to wait for the weights loading, 
    // for each iteration there are several void clock cycles inserted
    initial begin
      wait(io_loadReady == 1'b1);
      
      for (iter_idx_data=0; iter_idx_data<NUM_ITERS; iter_idx_data++) begin
        for (j=NUM_B_COLS*iter_idx_data; j<NUM_B_COLS * (iter_idx_data+1); j++) begin
          @(posedge clk);
        #1
          {io_expIn_0, io_dataIn_payload_0, 
          io_expIn_1, io_dataIn_payload_1, 
          io_expIn_2, io_dataIn_payload_2,
          io_expIn_3, io_dataIn_payload_3, 
          io_expIn_4, io_dataIn_payload_4, 
          io_expIn_5, io_dataIn_payload_5,
          io_expIn_6, io_dataIn_payload_6, 
          io_expIn_7, io_dataIn_payload_7, 
          io_expIn_8, io_dataIn_payload_8,
          io_expIn_9, io_dataIn_payload_9, 
          io_expIn_10, io_dataIn_payload_10, 
          io_expIn_11, io_dataIn_payload_11} = mat_b[j];
          io_dataIn_valid = 1'b1;
        end

        @(posedge clk);
        #1
          {io_expIn_0, io_dataIn_payload_0, 
            io_expIn_1, io_dataIn_payload_1, 
            io_expIn_2, io_dataIn_payload_2,
          io_expIn_3, io_dataIn_payload_3, 
          io_expIn_4, io_dataIn_payload_4, 
          io_expIn_5, io_dataIn_payload_5,
          io_expIn_6, io_dataIn_payload_6, 
          io_expIn_7, io_dataIn_payload_7, 
          io_expIn_8, io_dataIn_payload_8,
          io_expIn_9, io_dataIn_payload_9, 
          io_expIn_10, io_dataIn_payload_10, 
          io_expIn_11, io_dataIn_payload_11} = '0;
        io_dataIn_valid = 1'b0;      
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
      end

      @(posedge clk);
      @(posedge clk);
    end
  end
endgenerate


initial begin
  wait(io_res_valid == 1);
  for(k=0; k<NUM_B_COLS; k++) begin
	@(posedge clk);
    res[3*k] = {io_res_payload_0, 8'd0};
    res[(3*k)+1] = {io_res_payload_1, 8'd0};
    res[(3*k)+2] = {io_res_payload_2, 8'd0};
  end

  $writememh("./tb/res.mem", res);
  
  @(posedge clk);
  @(posedge clk);
end

always #5 clk = ! clk ;


endmodule