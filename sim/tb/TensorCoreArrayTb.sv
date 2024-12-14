`timescale 1ns/100ps

module TensorCoreArrayTb;

// Parameters
localparam CHAIN_LEN = 8;
localparam TC_ROW_SIZE = 6;
localparam TC_COL_SIZE = 12;
localparam RIDX_BITWIDTH = 12;
localparam CIDX_BITWIDTH = 10;

// Ports
logic          io_matALoad_0_valid;
logic          io_matALoad_0_ready;
logic [87:0]   io_matALoad_0_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_0_payload_rIdx;
logic          io_matALoad_1_valid;
logic          io_matALoad_1_ready;
logic [87:0]   io_matALoad_1_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_1_payload_rIdx;
logic          io_matALoad_2_valid;
logic          io_matALoad_2_ready;
logic [87:0]   io_matALoad_2_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_2_payload_rIdx;
logic          io_matALoad_3_valid;
logic          io_matALoad_3_ready;
logic [87:0]   io_matALoad_3_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_3_payload_rIdx;
logic          io_matALoad_4_valid;
logic          io_matALoad_4_ready;
logic [87:0]   io_matALoad_4_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_4_payload_rIdx;
logic          io_matALoad_5_valid;
logic          io_matALoad_5_ready;
logic [87:0]   io_matALoad_5_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_5_payload_rIdx;
logic          io_matALoad_6_valid;
logic          io_matALoad_6_ready;
logic [87:0]   io_matALoad_6_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_6_payload_rIdx;
logic          io_matALoad_7_valid;
logic          io_matALoad_7_ready;
logic [87:0]   io_matALoad_7_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_7_payload_rIdx;
logic          io_matALoad_8_valid;
logic          io_matALoad_8_ready;
logic [87:0]   io_matALoad_8_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_8_payload_rIdx;
logic          io_matALoad_9_valid;
logic          io_matALoad_9_ready;
logic [87:0]   io_matALoad_9_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_9_payload_rIdx;
logic          io_matALoad_10_valid;
logic          io_matALoad_10_ready;
logic [87:0]   io_matALoad_10_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_10_payload_rIdx;
logic          io_matALoad_11_valid;
logic          io_matALoad_11_ready;
logic [87:0]   io_matALoad_11_payload_blkData;
logic [RIDX_BITWIDTH-1:0]    io_matALoad_11_payload_rIdx;
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
logic          io_sortedColIdxSlow_valid;
logic          io_sortedColIdxSlow_ready;
logic [CIDX_BITWIDTH-1:0]    io_sortedColIdxSlow_payload_idxData;
logic [TC_COL_SIZE-1:0]   io_sortedColIdxSlow_payload_destId;
logic          io_sortedColIdxFast_valid;
logic          io_sortedColIdxFast_ready;
logic [CIDX_BITWIDTH-1:0]    io_sortedColIdxFast_payload_idxData;
logic [TC_COL_SIZE-1:0]   io_sortedColIdxFast_payload_destId;
logic          io_calEn;
logic          io_colIdxFifoNotEmpty;
logic          io_res_0_valid;
logic          io_res_0_ready;
logic [(24+RIDX_BITWIDTH)*3-1:0]   io_res_0_payload;
logic          io_res_1_valid;
logic          io_res_1_ready;
logic [(24+RIDX_BITWIDTH)*3-1:0]   io_res_1_payload;
logic          io_res_2_valid;
logic          io_res_2_ready;
logic [(24+RIDX_BITWIDTH)*3-1:0]   io_res_2_payload;
logic          io_res_3_valid;
logic          io_res_3_ready;
logic [(24+RIDX_BITWIDTH)*3-1:0]   io_res_3_payload;
logic          io_res_4_valid;
logic          io_res_4_ready;
logic [(24+RIDX_BITWIDTH)*3-1:0]   io_res_4_payload;
logic          io_res_5_valid;
logic          io_res_5_ready;
logic [(24+RIDX_BITWIDTH)*3-1:0]   io_res_5_payload;
logic [7:0]    io_configRowBuffWrBound;
logic [15:0]   io_latCounter;
logic          softClrnArea_newReset=0;


logic          clk=0;


// Mat A: 9x90, each ceil 8 bitsx10 elems + 1 shared exp 
logic [88+RIDX_BITWIDTH-1:0] mat_a_stimu [TC_COL_SIZE-1:0][$];
// Mat B: 90x18, each ceil 3x (8bits x 10 elems + 1 shared exp)
logic [88-1:0] mat_b_stimu [TC_ROW_SIZE-1:0][$];
// unique(indices)
logic [CIDX_BITWIDTH+TC_COL_SIZE-1:0] index_stimu [$];
// res: 3x9 matrix, each 24 bit
// TODO: fix res size here
logic [(24+RIDX_BITWIDTH)*3-1:0] res [$];

TensorCoreChainArray dut(.*);

logic [88-1:0] io_matALoad_payload_blkData [TC_COL_SIZE-1:0];
logic [RIDX_BITWIDTH-1:0] io_matALoad_payload_rIdx [TC_COL_SIZE-1:0];
logic [TC_COL_SIZE-1:0] io_matALoad_valid;
logic [TC_COL_SIZE-1:0] io_matALoad_ready;

assign io_matALoad_11_payload_blkData = io_matALoad_payload_blkData[11];
assign io_matALoad_10_payload_blkData = io_matALoad_payload_blkData[10];
assign io_matALoad_9_payload_blkData  = io_matALoad_payload_blkData[9];
assign io_matALoad_8_payload_blkData  = io_matALoad_payload_blkData[8];
assign io_matALoad_7_payload_blkData  = io_matALoad_payload_blkData[7];
assign io_matALoad_6_payload_blkData  = io_matALoad_payload_blkData[6];
assign io_matALoad_5_payload_blkData  = io_matALoad_payload_blkData[5];
assign io_matALoad_4_payload_blkData  = io_matALoad_payload_blkData[4];
assign io_matALoad_3_payload_blkData  = io_matALoad_payload_blkData[3];
assign io_matALoad_2_payload_blkData  = io_matALoad_payload_blkData[2];
assign io_matALoad_1_payload_blkData  = io_matALoad_payload_blkData[1];
assign io_matALoad_0_payload_blkData  = io_matALoad_payload_blkData[0];

assign io_matALoad_11_payload_rIdx = io_matALoad_payload_rIdx[11];
assign io_matALoad_10_payload_rIdx = io_matALoad_payload_rIdx[10];
assign io_matALoad_9_payload_rIdx  = io_matALoad_payload_rIdx[9];
assign io_matALoad_8_payload_rIdx  = io_matALoad_payload_rIdx[8];
assign io_matALoad_7_payload_rIdx  = io_matALoad_payload_rIdx[7];
assign io_matALoad_6_payload_rIdx  = io_matALoad_payload_rIdx[6];
assign io_matALoad_5_payload_rIdx  = io_matALoad_payload_rIdx[5];
assign io_matALoad_4_payload_rIdx  = io_matALoad_payload_rIdx[4];
assign io_matALoad_3_payload_rIdx  = io_matALoad_payload_rIdx[3];
assign io_matALoad_2_payload_rIdx  = io_matALoad_payload_rIdx[2];
assign io_matALoad_1_payload_rIdx  = io_matALoad_payload_rIdx[1];
assign io_matALoad_0_payload_rIdx  = io_matALoad_payload_rIdx[0];

assign {io_matALoad_11_valid,
        io_matALoad_10_valid,
        io_matALoad_9_valid,
        io_matALoad_8_valid,
        io_matALoad_7_valid,
        io_matALoad_6_valid,
        io_matALoad_5_valid,
        io_matALoad_4_valid,
        io_matALoad_3_valid,
        io_matALoad_2_valid,
        io_matALoad_1_valid,
        io_matALoad_0_valid} = io_matALoad_valid;

assign io_matALoad_ready = {io_matALoad_11_ready,
                              io_matALoad_10_ready,
                              io_matALoad_9_ready,
                              io_matALoad_8_ready,
                              io_matALoad_7_ready,
                              io_matALoad_6_ready,
                              io_matALoad_5_ready,
                              io_matALoad_4_ready,
                              io_matALoad_3_ready,
                              io_matALoad_2_ready,
                              io_matALoad_1_ready,
                              io_matALoad_0_ready};

logic [88-1:0] io_matBLoad_payload [TC_ROW_SIZE-1:0];
logic [TC_ROW_SIZE-1:0] io_matBLoad_valid;
logic [TC_ROW_SIZE-1:0] io_matBLoad_ready;

assign io_matBLoad_5_payload = io_matBLoad_payload[5];
assign io_matBLoad_4_payload = io_matBLoad_payload[4];
assign io_matBLoad_3_payload = io_matBLoad_payload[3];
assign io_matBLoad_2_payload = io_matBLoad_payload[2];
assign io_matBLoad_1_payload = io_matBLoad_payload[1];
assign io_matBLoad_0_payload = io_matBLoad_payload[0];

assign {io_matBLoad_5_valid,
        io_matBLoad_4_valid,
        io_matBLoad_3_valid,
        io_matBLoad_2_valid,
        io_matBLoad_1_valid,
        io_matBLoad_0_valid} = io_matBLoad_valid;

assign io_matBLoad_ready = {io_matBLoad_5_ready,
                            io_matBLoad_4_ready,
                            io_matBLoad_3_ready,
                            io_matBLoad_2_ready,
                            io_matBLoad_1_ready,
                            io_matBLoad_0_ready};

integer tc_col_idx, tc_row_idx;
string stimu_path, out_path;
//matrix a and b buffer load
initial begin
  for (tc_col_idx = 0; tc_col_idx < TC_COL_SIZE; tc_col_idx++) begin
    stimu_path = $sformatf("./tb/sparse_matmul_data/MAT_A_BFP12_b%0d_h581.bin", tc_col_idx);
    $readmemb(stimu_path, mat_a_stimu[tc_col_idx]);
  end

  for (tc_row_idx = 0; tc_row_idx < TC_ROW_SIZE; tc_row_idx++) begin
    stimu_path = $sformatf("./tb/sparse_matmul_data/MAT_B_BFP12_b%0d.bin", tc_row_idx);
    $readmemb(stimu_path, mat_b_stimu[tc_row_idx]);
  end 

  stimu_path = "./tb/sparse_matmul_data/IDX_GEN_h581.bin";
  $readmemb(stimu_path, index_stimu);

  #61 softClrnArea_newReset = 1'b1;

end


// mat a load ctrl
genvar col_buffer_port_ptr;
integer mat_a_load_ptr[TC_COL_SIZE-1 : 0];

generate  
  for (col_buffer_port_ptr = 0; col_buffer_port_ptr < TC_COL_SIZE; col_buffer_port_ptr++) begin
    always @( posedge clk ) begin
      if (io_matALoad_valid[col_buffer_port_ptr] && io_matALoad_ready[col_buffer_port_ptr]) begin
        mat_a_load_ptr[col_buffer_port_ptr] = mat_a_load_ptr[col_buffer_port_ptr] + 1;
      end
    end

    initial begin
      io_matALoad_payload_blkData[col_buffer_port_ptr] = '0;
      io_matALoad_payload_rIdx[col_buffer_port_ptr] = '1;
      io_matALoad_valid[col_buffer_port_ptr] = 0;

      mat_a_load_ptr[col_buffer_port_ptr] = 0;
      
      wait(softClrnArea_newReset == 1);
      repeat(3) begin @(posedge clk); end
      while (! $isunknown(mat_a_stimu[col_buffer_port_ptr][mat_a_load_ptr[col_buffer_port_ptr]])) begin
        #1
        io_matALoad_payload_blkData[col_buffer_port_ptr] = 
          mat_a_stimu[col_buffer_port_ptr][mat_a_load_ptr[col_buffer_port_ptr]][87:0];
        io_matALoad_payload_rIdx[col_buffer_port_ptr] = 
          mat_a_stimu[col_buffer_port_ptr][mat_a_load_ptr[col_buffer_port_ptr]][88+RIDX_BITWIDTH-1 -: RIDX_BITWIDTH];
        io_matALoad_valid[col_buffer_port_ptr] = 1'b1;

        @(posedge clk);
      end

      #1
      io_matALoad_payload_blkData[col_buffer_port_ptr] = '0;
      io_matALoad_payload_rIdx[col_buffer_port_ptr] = '1;
      io_matALoad_valid[col_buffer_port_ptr] = 1'b0;
    end
  end
endgenerate

// mat b load ctrl
genvar row_buffer_port_ptr;
integer mat_b_load_ptr[TC_ROW_SIZE-1 : 0];

generate
  for (row_buffer_port_ptr = 0; row_buffer_port_ptr < TC_ROW_SIZE; row_buffer_port_ptr++) begin
    always @( posedge clk ) begin
      if (io_matBLoad_valid[row_buffer_port_ptr] && io_matBLoad_ready[row_buffer_port_ptr]) begin
        mat_b_load_ptr[row_buffer_port_ptr] = mat_b_load_ptr[row_buffer_port_ptr] + 1;
      end
    end

    initial begin
      io_matBLoad_payload[row_buffer_port_ptr] = '0;
      io_matBLoad_valid[row_buffer_port_ptr] = 0;

      mat_b_load_ptr[row_buffer_port_ptr] = 0;

      wait(softClrnArea_newReset == 1);
      repeat(3) begin @(posedge clk); end
      while (! $isunknown(mat_b_stimu[row_buffer_port_ptr][mat_b_load_ptr[row_buffer_port_ptr]])) begin
        #1
        io_matBLoad_payload[row_buffer_port_ptr] = 
          mat_b_stimu[row_buffer_port_ptr][mat_b_load_ptr[row_buffer_port_ptr]];
        io_matBLoad_valid[row_buffer_port_ptr] = 1'b1;

        @(posedge clk);
      end

      #1
      io_matBLoad_payload[row_buffer_port_ptr] = '0;
      io_matBLoad_valid[row_buffer_port_ptr] = 0;
    end
  end
endgenerate

// index loading

integer index_stimu_slow_ptr;
integer index_stimu_fast_ptr;

always @( posedge clk ) begin
  if (io_sortedColIdxSlow_valid && io_sortedColIdxSlow_ready) begin
    index_stimu_slow_ptr = index_stimu_slow_ptr + 1;
  end
  if (io_sortedColIdxFast_valid && io_sortedColIdxFast_ready) begin
    index_stimu_fast_ptr = index_stimu_fast_ptr + 1;
  end
end

initial begin
  io_sortedColIdxSlow_valid = 1'b0;
  io_sortedColIdxSlow_payload_idxData = '0;
  io_sortedColIdxSlow_payload_destId = '0;
  index_stimu_slow_ptr = 0;
  io_colIdxFifoNotEmpty = 1'b0;
  
  wait(softClrnArea_newReset == 1);
  repeat(3) begin @(posedge clk); end

  while (! $isunknown(index_stimu[index_stimu_slow_ptr])) begin
    #1
    {io_sortedColIdxSlow_payload_idxData, io_sortedColIdxSlow_payload_destId} =
      index_stimu[index_stimu_slow_ptr];
    io_sortedColIdxSlow_valid = 1'b1;
    io_colIdxFifoNotEmpty = 1'b1;
  
    @(posedge clk);
  end

  #1
  io_sortedColIdxSlow_valid = 1'b0;
  io_sortedColIdxSlow_payload_idxData = '1;
  io_sortedColIdxSlow_payload_destId = '0;
  io_colIdxFifoNotEmpty = 1'b0;
end

initial begin
  io_sortedColIdxFast_valid = 1'b0;
  io_sortedColIdxFast_payload_idxData = '0;
  io_sortedColIdxFast_payload_destId = '0;
  index_stimu_fast_ptr = 0;
  
  wait(softClrnArea_newReset == 1);
  repeat(3) begin @(posedge clk); end

  while (! $isunknown(index_stimu[index_stimu_fast_ptr])) begin
    #1
    {io_sortedColIdxFast_payload_idxData, io_sortedColIdxFast_payload_destId} =
      index_stimu[index_stimu_fast_ptr];
    io_sortedColIdxFast_valid = 1'b1;
  
    @(posedge clk);
  end

  #1
  io_sortedColIdxFast_valid = 1'b0;
  io_sortedColIdxFast_payload_idxData = '1;
  io_sortedColIdxFast_payload_destId = '0;
end

logic [(24+RIDX_BITWIDTH)*3-1:0] io_res_payload [TC_ROW_SIZE-1:0];
logic [TC_ROW_SIZE-1:0] io_res_valid;
logic [TC_ROW_SIZE-1:0] io_res_ready;

assign io_res_payload = {io_res_5_payload, 
                          io_res_4_payload,
                          io_res_3_payload,
                          io_res_2_payload,
                          io_res_1_payload,
                          io_res_0_payload};

assign io_res_valid = {io_res_5_valid,
                        io_res_4_valid,
                        io_res_3_valid,
                        io_res_2_valid,
                        io_res_1_valid,
                        io_res_0_valid};
                        
assign {io_res_5_ready, 
       io_res_4_ready,
       io_res_3_ready,
       io_res_2_ready,
       io_res_1_ready,
       io_res_0_ready} = io_res_ready;



initial begin
  io_calEn = 1'b0;
  io_res_ready = 1'b0;
  // rowBuffWrBound is the length of each mat b vector
  // e.g., seq len = 4355, rowBuffWrBound = 4480/20 = 224
  io_configRowBuffWrBound = 8'd228;

  wait(softClrnArea_newReset & io_matBLoad_0_valid & io_matBLoad_0_ready);
  repeat (10) begin @(posedge clk); end
  wait(io_matBLoad_0_valid == 0);
  repeat (4) begin @(posedge clk); end
  #1
  io_calEn = 1'b1;
  io_res_ready = 1'b1;

  repeat(3) begin @(posedge clk); end;
  io_calEn = 1'b0;

end

always #5 clk = ! clk ;


endmodule