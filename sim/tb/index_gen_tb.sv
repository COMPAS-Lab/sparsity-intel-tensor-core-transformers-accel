`timescale 1ns/100ps

module index_gen_tb ();

localparam DWIDTH = 9;
localparam IN_NUM_WORDS = 12;
localparam OUT_NUM_WORDS = 12;
integer LAYER = 11;
integer HEAD = 6;
integer IN_SIZE = 3874;

logic [DWIDTH-1:0] PLACEHOLDER = '1;

logic                io_seqIn_0_valid;
logic [DWIDTH-1:0]   io_seqIn_0_payload;
logic                io_seqIn_1_valid;
logic [DWIDTH-1:0]   io_seqIn_1_payload;
logic                io_seqIn_2_valid;
logic [DWIDTH-1:0]   io_seqIn_2_payload;
logic                io_seqIn_3_valid;
logic [DWIDTH-1:0]   io_seqIn_3_payload;
logic                io_seqIn_4_valid;
logic [DWIDTH-1:0]   io_seqIn_4_payload;
logic                io_seqIn_5_valid;
logic [DWIDTH-1:0]   io_seqIn_5_payload;
logic                io_seqIn_6_valid;
logic [DWIDTH-1:0]   io_seqIn_6_payload;
logic                io_seqIn_7_valid;
logic [DWIDTH-1:0]   io_seqIn_7_payload;
logic                io_seqIn_8_valid;
logic [DWIDTH-1:0]   io_seqIn_8_payload;
logic                io_seqIn_9_valid;
logic [DWIDTH-1:0]   io_seqIn_9_payload;
logic                io_seqIn_10_valid;
logic [DWIDTH-1:0]   io_seqIn_10_payload;
logic                io_seqIn_11_valid;
logic [DWIDTH-1:0]   io_seqIn_11_payload;
logic                io_seqOut_valid;
logic [DWIDTH-1:0]   io_seqOut_payload_0;
logic [DWIDTH-1:0]   io_seqOut_payload_1;
logic [DWIDTH-1:0]   io_seqOut_payload_2;
logic [DWIDTH-1:0]   io_seqOut_payload_3;
logic [DWIDTH-1:0]   io_seqOut_payload_4;
logic [DWIDTH-1:0]   io_seqOut_payload_5;
logic [DWIDTH-1:0]   io_seqOut_payload_6;
logic [DWIDTH-1:0]   io_seqOut_payload_7;
logic [DWIDTH-1:0]   io_seqOut_payload_8;
logic [DWIDTH-1:0]   io_seqOut_payload_9;
logic [DWIDTH-1:0]   io_seqOut_payload_10;
logic [DWIDTH-1:0]   io_seqOut_payload_11;
logic                io_lastGrpIn=0;
logic                io_lastGrpOut;
logic                clk=1;
logic                resetn=0;

IndexGenerator u_IndexGenerator(
    .io_seqIn_0_valid     (io_seqIn_0_valid     ),
    .io_seqIn_0_payload   (io_seqIn_0_payload   ),
    .io_seqIn_1_valid     (io_seqIn_1_valid     ),
    .io_seqIn_1_payload   (io_seqIn_1_payload   ),
    .io_seqIn_2_valid     (io_seqIn_2_valid     ),
    .io_seqIn_2_payload   (io_seqIn_2_payload   ),
    .io_seqIn_3_valid     (io_seqIn_3_valid     ),
    .io_seqIn_3_payload   (io_seqIn_3_payload   ),
    .io_seqIn_4_valid     (io_seqIn_4_valid     ),
    .io_seqIn_4_payload   (io_seqIn_4_payload   ),
    .io_seqIn_5_valid     (io_seqIn_5_valid     ),
    .io_seqIn_5_payload   (io_seqIn_5_payload   ),
    .io_seqIn_6_valid     (io_seqIn_6_valid     ),
    .io_seqIn_6_payload   (io_seqIn_6_payload   ),
    .io_seqIn_7_valid     (io_seqIn_7_valid     ),
    .io_seqIn_7_payload   (io_seqIn_7_payload   ),
    .io_seqIn_8_valid     (io_seqIn_8_valid     ),
    .io_seqIn_8_payload   (io_seqIn_8_payload   ),
    .io_seqIn_9_valid     (io_seqIn_9_valid     ),
    .io_seqIn_9_payload   (io_seqIn_9_payload   ),
    .io_seqIn_10_valid    (io_seqIn_10_valid    ),
    .io_seqIn_10_payload  (io_seqIn_10_payload  ),
    .io_seqIn_11_valid    (io_seqIn_11_valid    ),
    .io_seqIn_11_payload  (io_seqIn_11_payload  ),
    .io_seqOut_valid      (io_seqOut_valid      ),
    .io_seqOut_payload_0  (io_seqOut_payload_0  ),
    .io_seqOut_payload_1  (io_seqOut_payload_1  ),
    .io_seqOut_payload_2  (io_seqOut_payload_2  ),
    .io_seqOut_payload_3  (io_seqOut_payload_3  ),
    .io_seqOut_payload_4  (io_seqOut_payload_4  ),
    .io_seqOut_payload_5  (io_seqOut_payload_5  ),
    .io_seqOut_payload_6  (io_seqOut_payload_6  ),
    .io_seqOut_payload_7  (io_seqOut_payload_7  ),
    .io_seqOut_payload_8  (io_seqOut_payload_8  ),
    .io_seqOut_payload_9  (io_seqOut_payload_9  ),
    .io_seqOut_payload_10 (io_seqOut_payload_10 ),
    .io_seqOut_payload_11 (io_seqOut_payload_11 ),
    .io_lastGrpIn         (io_lastGrpIn         ),
    .io_lastGrpOut        (io_lastGrpOut        ),
    .clk                  (clk                  ),
    .resetn               (resetn               )
);

logic [DWIDTH * IN_NUM_WORDS-1:0] input_vectors [7000-1:0];
logic [DWIDTH * IN_NUM_WORDS-1:0] curr_ins;

logic [DWIDTH * IN_NUM_WORDS-1:0] concat_ins = '0;
logic [IN_NUM_WORDS-1:0] concat_ins_valid = '0;

assign {io_seqIn_0_payload, 
        io_seqIn_1_payload,
        io_seqIn_2_payload,
        io_seqIn_3_payload,
        io_seqIn_4_payload,
        io_seqIn_5_payload, 
        io_seqIn_6_payload,
        io_seqIn_7_payload,
        io_seqIn_8_payload, 
        io_seqIn_9_payload, 
        io_seqIn_10_payload,
        io_seqIn_11_payload} = concat_ins;

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

initial begin
    $value$plusargs("nlayers=%d", LAYER);
    $value$plusargs("nheads=%d", HEAD);
    $value$plusargs("insize=%d", IN_SIZE);
    $display("simulating l%0dh%0d, total input %0d", LAYER, HEAD, IN_SIZE);
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
        io_lastGrpIn = 0;
        curr_ins = input_vectors[iter];
        if (curr_ins == '1) begin
            concat_ins = {12{PLACEHOLDER}};
            concat_ins_valid = '0;
            wait(io_lastGrpOut);
        end else begin
            concat_ins_valid = '1;
            concat_ins = curr_ins;
            if (iter+1 < IN_SIZE) begin
                if (input_vectors[iter+1] == '1) begin
                    io_lastGrpIn = '1;
                end else begin
                    io_lastGrpIn = '0;
                end
            end else begin
                io_lastGrpIn = '1;
            end
        end
    end

    @(posedge clk);
    concat_ins_valid = '0;
    io_lastGrpIn = '0;
    concat_ins = {12{PLACEHOLDER}};
    @(posedge clk);
    @(posedge clk);
end

logic [DWIDTH * OUT_NUM_WORDS-1:0] curr_out [7000:0];
integer outfd, word_idx;
integer out_counter = 0;

initial forever begin
    wait(io_seqOut_valid || io_lastGrpOut);
    @(posedge clk);
    if (io_seqOut_valid) begin 
        curr_out[out_counter] = {
            io_seqOut_payload_11, 
            io_seqOut_payload_10,
            io_seqOut_payload_9,
            io_seqOut_payload_8,
            io_seqOut_payload_7,
            io_seqOut_payload_6,
            io_seqOut_payload_5,
            io_seqOut_payload_4,
            io_seqOut_payload_3,
            io_seqOut_payload_2,
            io_seqOut_payload_1,
            io_seqOut_payload_0};
        out_counter = out_counter + 1;
    end

    if (io_lastGrpOut) begin
        curr_out[out_counter] = '0;
        out_counter = out_counter + 1;
    end

    if(iter == IN_SIZE) begin
        out_path = $sformatf("./tb/idxgen_stimu/idxgen_res_l%0d_h%0d.bin", LAYER, HEAD);
        $writememb(out_path, curr_out, 0, out_counter-1);
        $display("sim finished");
        $finish();
    end
end

always #5 clk = ! clk;
    
endmodule