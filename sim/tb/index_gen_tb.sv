`timescale 1ns/100ps

module index_gen_tb ();

localparam DWIDTH = 9;
localparam IN_NUM_WORDS = 12;
integer LAYER = 11;
integer HEAD = 6;
integer IN_SIZE = 3874;

logic [DWIDTH-1:0] PLACEHOLDER = '1;

logic                           io_seqIn_0_valid;
logic                           io_seqIn_0_ready;
logic [DWIDTH-1:0]              io_seqIn_0_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_0_payload_destId;
logic                           io_seqIn_1_valid;
logic                           io_seqIn_1_ready;
logic [DWIDTH-1:0]              io_seqIn_1_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_1_payload_destId;
logic                           io_seqIn_2_valid;
logic                           io_seqIn_2_ready;
logic [DWIDTH-1:0]              io_seqIn_2_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_2_payload_destId;
logic                           io_seqIn_3_valid;
logic                           io_seqIn_3_ready;
logic [DWIDTH-1:0]              io_seqIn_3_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_3_payload_destId;
logic                           io_seqIn_4_valid;
logic                           io_seqIn_4_ready;
logic [DWIDTH-1:0]              io_seqIn_4_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_4_payload_destId;
logic                           io_seqIn_5_valid;
logic                           io_seqIn_5_ready;
logic [DWIDTH-1:0]              io_seqIn_5_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_5_payload_destId;
logic                           io_seqIn_6_valid;
logic                           io_seqIn_6_ready;
logic [DWIDTH-1:0]              io_seqIn_6_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_6_payload_destId;
logic                           io_seqIn_7_valid;
logic                           io_seqIn_7_ready;
logic [DWIDTH-1:0]              io_seqIn_7_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_7_payload_destId;
logic                           io_seqIn_8_valid;
logic                           io_seqIn_8_ready;
logic [DWIDTH-1:0]              io_seqIn_8_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_8_payload_destId;
logic                           io_seqIn_9_valid;
logic                           io_seqIn_9_ready;
logic [DWIDTH-1:0]              io_seqIn_9_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_9_payload_destId;
logic                           io_seqIn_10_valid;
logic                           io_seqIn_10_ready;
logic [DWIDTH-1:0]              io_seqIn_10_payload_idxData;
logic [IN_NUM_WORDS-1:0]        io_seqIn_10_payload_destId;
logic                           io_seqIn_11_valid;
logic                           io_seqIn_11_ready;
logic [DWIDTH-1:0]              io_seqIn_11_payload_idxData;
logic [11:0]                    io_seqIn_11_payload_destId;
logic                           io_seqOut_valid;
logic                           io_seqOut_ready=1;
logic [DWIDTH-1:0]              io_seqOut_payload_idxData;
logic [11:0]                    io_seqOut_payload_destId;
logic [11:0]                    io_lastGrpIns='0;
logic                           io_lastGrpOut=0;
logic                           clk=1;
logic                           resetn=0;


IndexGenerator u_IndexGenerator(
    .io_seqIn_0_valid            (io_seqIn_0_valid            ),
    .io_seqIn_0_ready            (io_seqIn_0_ready            ),
    .io_seqIn_0_payload_idxData  (io_seqIn_0_payload_idxData  ),
    .io_seqIn_0_payload_destId   (io_seqIn_0_payload_destId   ),
    .io_seqIn_1_valid            (io_seqIn_1_valid            ),
    .io_seqIn_1_ready            (io_seqIn_1_ready            ),
    .io_seqIn_1_payload_idxData  (io_seqIn_1_payload_idxData  ),
    .io_seqIn_1_payload_destId   (io_seqIn_1_payload_destId   ),
    .io_seqIn_2_valid            (io_seqIn_2_valid            ),
    .io_seqIn_2_ready            (io_seqIn_2_ready            ),
    .io_seqIn_2_payload_idxData  (io_seqIn_2_payload_idxData  ),
    .io_seqIn_2_payload_destId   (io_seqIn_2_payload_destId   ),
    .io_seqIn_3_valid            (io_seqIn_3_valid            ),
    .io_seqIn_3_ready            (io_seqIn_3_ready            ),
    .io_seqIn_3_payload_idxData  (io_seqIn_3_payload_idxData  ),
    .io_seqIn_3_payload_destId   (io_seqIn_3_payload_destId   ),
    .io_seqIn_4_valid            (io_seqIn_4_valid            ),
    .io_seqIn_4_ready            (io_seqIn_4_ready            ),
    .io_seqIn_4_payload_idxData  (io_seqIn_4_payload_idxData  ),
    .io_seqIn_4_payload_destId   (io_seqIn_4_payload_destId   ),
    .io_seqIn_5_valid            (io_seqIn_5_valid            ),
    .io_seqIn_5_ready            (io_seqIn_5_ready            ),
    .io_seqIn_5_payload_idxData  (io_seqIn_5_payload_idxData  ),
    .io_seqIn_5_payload_destId   (io_seqIn_5_payload_destId   ),
    .io_seqIn_6_valid            (io_seqIn_6_valid            ),
    .io_seqIn_6_ready            (io_seqIn_6_ready            ),
    .io_seqIn_6_payload_idxData  (io_seqIn_6_payload_idxData  ),
    .io_seqIn_6_payload_destId   (io_seqIn_6_payload_destId   ),
    .io_seqIn_7_valid            (io_seqIn_7_valid            ),
    .io_seqIn_7_ready            (io_seqIn_7_ready            ),
    .io_seqIn_7_payload_idxData  (io_seqIn_7_payload_idxData  ),
    .io_seqIn_7_payload_destId   (io_seqIn_7_payload_destId   ),
    .io_seqIn_8_valid            (io_seqIn_8_valid            ),
    .io_seqIn_8_ready            (io_seqIn_8_ready            ),
    .io_seqIn_8_payload_idxData  (io_seqIn_8_payload_idxData  ),
    .io_seqIn_8_payload_destId   (io_seqIn_8_payload_destId   ),
    .io_seqIn_9_valid            (io_seqIn_9_valid            ),
    .io_seqIn_9_ready            (io_seqIn_9_ready            ),
    .io_seqIn_9_payload_idxData  (io_seqIn_9_payload_idxData  ),
    .io_seqIn_9_payload_destId   (io_seqIn_9_payload_destId   ),
    .io_seqIn_10_valid           (io_seqIn_10_valid           ),
    .io_seqIn_10_ready           (io_seqIn_10_ready           ),
    .io_seqIn_10_payload_idxData (io_seqIn_10_payload_idxData ),
    .io_seqIn_10_payload_destId  (io_seqIn_10_payload_destId  ),
    .io_seqIn_11_valid           (io_seqIn_11_valid           ),
    .io_seqIn_11_ready           (io_seqIn_11_ready           ),
    .io_seqIn_11_payload_idxData (io_seqIn_11_payload_idxData ),
    .io_seqIn_11_payload_destId  (io_seqIn_11_payload_destId  ),
    .io_seqOut_valid             (io_seqOut_valid             ),
    .io_seqOut_ready             (io_seqOut_ready             ),
    .io_seqOut_payload_idxData   (io_seqOut_payload_idxData   ),
    .io_seqOut_payload_destId    (io_seqOut_payload_destId    ),
    .io_lastGrpIns               (io_lastGrpIns               ),
    .io_lastGrpOut               (io_lastGrpOut               ),
    .clk                         (clk                         ),
    .resetn                      (resetn                      )
);

logic [DWIDTH * IN_NUM_WORDS-1:0] input_vectors [7000-1:0];
logic [IN_NUM_WORDS-1:0] all_in_ready;

logic [DWIDTH * IN_NUM_WORDS-1:0] concat_ins = '0;
logic [IN_NUM_WORDS-1:0] concat_ins_valid = '0;
logic [IN_NUM_WORDS-1:0] io_lastGrpAsserted = '0;

logic [DWIDTH-1:0]              io_seqIn_0_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_1_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_2_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_3_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_4_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_5_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_6_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_7_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_8_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_9_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_10_payload_idxData_tmp;
logic [DWIDTH-1:0]              io_seqIn_11_payload_idxData_tmp;

assign {io_seqIn_0_payload_idxData_tmp, 
        io_seqIn_1_payload_idxData_tmp,
        io_seqIn_2_payload_idxData_tmp,
        io_seqIn_3_payload_idxData_tmp,
        io_seqIn_4_payload_idxData_tmp,
        io_seqIn_5_payload_idxData_tmp, 
        io_seqIn_6_payload_idxData_tmp,
        io_seqIn_7_payload_idxData_tmp,
        io_seqIn_8_payload_idxData_tmp, 
        io_seqIn_9_payload_idxData_tmp, 
        io_seqIn_10_payload_idxData_tmp,
        io_seqIn_11_payload_idxData_tmp} = concat_ins;

assign io_seqIn_0_payload_idxData = all_in_ready ? io_seqIn_0_payload_idxData_tmp : {1'b1, io_seqIn_0_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_1_payload_idxData = all_in_ready ? io_seqIn_1_payload_idxData_tmp : {1'b1, io_seqIn_1_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_2_payload_idxData = all_in_ready ? io_seqIn_2_payload_idxData_tmp : {1'b1, io_seqIn_2_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_3_payload_idxData = all_in_ready ? io_seqIn_3_payload_idxData_tmp : {1'b1, io_seqIn_3_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_4_payload_idxData = all_in_ready ? io_seqIn_4_payload_idxData_tmp : {1'b1, io_seqIn_4_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_5_payload_idxData = all_in_ready ? io_seqIn_5_payload_idxData_tmp : {1'b1, io_seqIn_5_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_6_payload_idxData = all_in_ready ? io_seqIn_6_payload_idxData_tmp : {1'b1, io_seqIn_6_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_7_payload_idxData = all_in_ready ? io_seqIn_7_payload_idxData_tmp : {1'b1, io_seqIn_7_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_8_payload_idxData = all_in_ready ? io_seqIn_8_payload_idxData_tmp : {1'b1, io_seqIn_8_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_9_payload_idxData = all_in_ready ? io_seqIn_9_payload_idxData_tmp : {1'b1, io_seqIn_9_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_10_payload_idxData = all_in_ready ? io_seqIn_10_payload_idxData_tmp : {1'b1, io_seqIn_10_payload_idxData_tmp[DWIDTH-2:0]};
assign io_seqIn_11_payload_idxData = all_in_ready ? io_seqIn_11_payload_idxData_tmp : {1'b1, io_seqIn_11_payload_idxData_tmp[DWIDTH-2:0]};

assign {io_seqIn_0_valid, 
        io_seqIn_1_valid,
        io_seqIn_2_valid,
        io_seqIn_3_valid,
        io_seqIn_4_valid,
        io_seqIn_5_valid, 
        io_seqIn_6_valid,
        io_seqIn_7_valid,
        io_seqIn_8_valid, 
        io_seqIn_9_valid, 
        io_seqIn_10_valid,
        io_seqIn_11_valid} = concat_ins_valid;

assign all_in_ready = {io_seqIn_0_ready, 
                        io_seqIn_1_ready,
                        io_seqIn_2_ready,
                        io_seqIn_3_ready,
                        io_seqIn_4_ready,
                        io_seqIn_5_ready, 
                        io_seqIn_6_ready,
                        io_seqIn_7_ready,
                        io_seqIn_8_ready, 
                        io_seqIn_9_ready, 
                        io_seqIn_10_ready,
                        io_seqIn_11_ready};

initial begin
    $value$plusargs("nlayers=%d", LAYER);
    $value$plusargs("nheads=%d", HEAD);
    $value$plusargs("insize=%d", IN_SIZE);
    $display("simulating l%0dh%0d, total input %0d", LAYER, HEAD, IN_SIZE);
end

always_comb begin
    io_seqIn_0_payload_destId  = io_seqIn_0_valid  ? 12'b0000_0000_0001 : 12'd0;
    io_seqIn_1_payload_destId  = io_seqIn_1_valid  ? 12'b0000_0000_0010 : 12'd0;
    io_seqIn_2_payload_destId  = io_seqIn_2_valid  ? 12'b0000_0000_0100 : 12'd0;
    io_seqIn_3_payload_destId  = io_seqIn_3_valid  ? 12'b0000_0000_1000 : 12'd0;
    io_seqIn_4_payload_destId  = io_seqIn_4_valid  ? 12'b0000_0001_0000 : 12'd0;
    io_seqIn_5_payload_destId  = io_seqIn_5_valid  ? 12'b0000_0010_0000 : 12'd0;
    io_seqIn_6_payload_destId  = io_seqIn_6_valid  ? 12'b0000_0100_0000 : 12'd0;
    io_seqIn_7_payload_destId  = io_seqIn_7_valid  ? 12'b0000_1000_0000 : 12'd0;
    io_seqIn_8_payload_destId  = io_seqIn_8_valid  ? 12'b0001_0000_0000 : 12'd0;
    io_seqIn_9_payload_destId  = io_seqIn_9_valid  ? 12'b0010_0000_0000 : 12'd0;
    io_seqIn_10_payload_destId = io_seqIn_10_valid ? 12'b0100_0000_0000 : 12'd0;
    io_seqIn_11_payload_destId = io_seqIn_11_valid ? 12'b1000_0000_0000 : 12'd0;
end

integer iter;
string stimu_path, out_path;

initial begin
    // load stimulus and init circuits
    stimu_path = $sformatf("./tb/idxgen_stimu/ig_stimulus_l%0d_h%0d.bin", LAYER, HEAD);
    $readmemb(stimu_path, input_vectors);
    #41 resetn = 1'b1;

    // send inputs in
    for (iter = 0; iter < IN_SIZE; iter++) begin
        @(posedge clk);
        #1 
        if (all_in_ready != {12{1'b1}}) begin
            iter = iter - 1;
        end
        if (input_vectors[iter] == '1) begin
            concat_ins = {12{PLACEHOLDER}};
            concat_ins_valid = '0;
            wait(io_lastGrpOut);
        end else begin
            concat_ins = input_vectors[iter];
            // construct valid and tlast for each index
            for (int blk=0; blk < IN_NUM_WORDS; blk++) begin
                concat_ins_valid[blk] = (all_in_ready == {12{1'b1}}) ? ~concat_ins[(blk+1)*DWIDTH-1] : ~all_in_ready[blk];
            end
        end
    end

    @(posedge clk);
    concat_ins_valid = '0;
    concat_ins = {12{PLACEHOLDER}};
    @(posedge clk);
    @(posedge clk);
end

genvar tlast_blk_idx;
logic [IN_NUM_WORDS-1:0] lastValidSig = 0;
logic [IN_NUM_WORDS-1:0] lastValidTracker = 0;

generate
    for (tlast_blk_idx = 0; tlast_blk_idx < IN_NUM_WORDS; tlast_blk_idx=tlast_blk_idx+1) begin
        always_ff @( posedge clk ) begin
            lastValidSig[tlast_blk_idx] <= concat_ins[(tlast_blk_idx+1)*DWIDTH-1];
            if (io_lastGrpOut == '1) begin
                lastValidTracker[tlast_blk_idx] <= 0;
            end else begin
                lastValidTracker[tlast_blk_idx] <= 
                    lastValidTracker[tlast_blk_idx] ? 1 : io_lastGrpIns[IN_NUM_WORDS - 1 - tlast_blk_idx];
            end
        end

        always_comb begin
            if (concat_ins == '1 && ~lastValidTracker[tlast_blk_idx]) begin
                io_lastGrpIns[IN_NUM_WORDS - 1 - tlast_blk_idx] = 1;
            end else begin
                io_lastGrpIns[IN_NUM_WORDS - 1 - tlast_blk_idx] = 
                    (~lastValidSig[tlast_blk_idx]) & concat_ins[(tlast_blk_idx+1)*DWIDTH-1];
            end
        end
    end
endgenerate

logic [DWIDTH-1:0] curr_out [20000:0];
logic [IN_NUM_WORDS-1:0] curr_dest_out [20000:0];
integer outfd, word_idx;
integer out_counter = 0;
integer fd;

initial forever begin
    wait(io_seqOut_valid || io_lastGrpOut);
    @(posedge clk);
    if (io_seqOut_valid) begin 
        curr_out[out_counter] = io_seqOut_payload_idxData;
        curr_dest_out[out_counter] = io_seqOut_payload_destId;
        out_counter = out_counter + 1;
    end

    if (io_lastGrpOut) begin
        curr_out[out_counter] = '0;
        curr_dest_out[out_counter] = '0;
        out_counter = out_counter + 1;
    end

    if(iter == IN_SIZE) begin
        out_path = $sformatf("./tb/idxgen_stimu/idxgen_res_l%0d_h%0d.bin", LAYER, HEAD);
        fd = $fopen(out_path, "w");
        for (int i = 0; i < out_counter; i++) begin
            $fdisplay(fd, "%b,%b", curr_out[i], curr_dest_out[i]);
        end
        $fclose(fd);
        $display("sim finished");
        $finish();
    end
end

// timeout check
logic [31:0] timeticker;
always_ff @( posedge clk ) begin
    if(~io_lastGrpOut) begin
        timeticker <= timeticker + 1;
    end else begin
        timeticker <= 0;
    end
end
initial forever begin
    wait(timeticker > 10000)
    $display("sim timeout, deadlock found");
    $finish();
end

always #5 clk = ! clk;
    
endmodule