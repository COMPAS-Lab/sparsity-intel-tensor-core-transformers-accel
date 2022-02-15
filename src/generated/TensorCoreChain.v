// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : TensorCoreChain
// Git hash  : 6bca74ef562bde80f4e7860f23593b4ba24f4515



module TensorCoreChain (
  input      [79:0]   io_dataIn_0,
  input      [79:0]   io_dataIn_1,
  input      [79:0]   io_dataIn_2,
  input      [79:0]   io_loadCascadeIn,
  input      [7:0]    io_expIn_0,
  input      [7:0]    io_expIn_1,
  input      [7:0]    io_expIn_2,
  input      [7:0]    io_expCascadeIn,
  input               io_data_valid,
  input               io_load_valid,
  output reg          io_load_ready,
  output     [23:0]   io_res_0,
  output     [23:0]   io_res_1,
  output     [23:0]   io_res_2,
  input               clk,
  input               resetn
);
  wire       [7:0]    tcEntry_data_in_1;
  wire       [7:0]    tcEntry_data_in_2;
  wire       [7:0]    tcEntry_data_in_3;
  wire       [7:0]    tcEntry_data_in_4;
  wire       [7:0]    tcEntry_data_in_5;
  wire       [7:0]    tcEntry_data_in_6;
  wire       [7:0]    tcEntry_data_in_7;
  wire       [7:0]    tcEntry_data_in_8;
  wire       [7:0]    tcEntry_data_in_9;
  wire       [7:0]    tcEntry_data_in_10;
  wire                tcEntry_load_bb_one;
  wire                tcEntry_load_bb_two;
  wire       [7:0]    tensor_core_1_data_in_1;
  wire       [7:0]    tensor_core_1_data_in_2;
  wire       [7:0]    tensor_core_1_data_in_3;
  wire       [7:0]    tensor_core_1_data_in_4;
  wire       [7:0]    tensor_core_1_data_in_5;
  wire       [7:0]    tensor_core_1_data_in_6;
  wire       [7:0]    tensor_core_1_data_in_7;
  wire       [7:0]    tensor_core_1_data_in_8;
  wire       [7:0]    tensor_core_1_data_in_9;
  wire       [7:0]    tensor_core_1_data_in_10;
  wire                tensor_core_1_load_bb_one;
  wire                tensor_core_1_load_bb_two;
  wire       [7:0]    tensor_core_2_data_in_1;
  wire       [7:0]    tensor_core_2_data_in_2;
  wire       [7:0]    tensor_core_2_data_in_3;
  wire       [7:0]    tensor_core_2_data_in_4;
  wire       [7:0]    tensor_core_2_data_in_5;
  wire       [7:0]    tensor_core_2_data_in_6;
  wire       [7:0]    tensor_core_2_data_in_7;
  wire       [7:0]    tensor_core_2_data_in_8;
  wire       [7:0]    tensor_core_2_data_in_9;
  wire       [7:0]    tensor_core_2_data_in_10;
  wire                tensor_core_2_load_bb_one;
  wire                tensor_core_2_load_bb_two;
  wire       [7:0]    tensor_core_3_data_in_1;
  wire       [7:0]    tensor_core_3_data_in_2;
  wire       [7:0]    tensor_core_3_data_in_3;
  wire       [7:0]    tensor_core_3_data_in_4;
  wire       [7:0]    tensor_core_3_data_in_5;
  wire       [7:0]    tensor_core_3_data_in_6;
  wire       [7:0]    tensor_core_3_data_in_7;
  wire       [7:0]    tensor_core_3_data_in_8;
  wire       [7:0]    tensor_core_3_data_in_9;
  wire       [7:0]    tensor_core_3_data_in_10;
  wire                tensor_core_3_load_bb_one;
  wire                tensor_core_3_load_bb_two;
  wire       [31:0]   tcEntry_cascade_data_out_col_1;
  wire       [31:0]   tcEntry_cascade_data_out_col_2;
  wire       [31:0]   tcEntry_cascade_data_out_col_3;
  wire       [87:0]   tcEntry_cascade_weight_out;
  wire       [23:0]   tcEntry_bf24_col_1;
  wire       [23:0]   tcEntry_bf24_col_2;
  wire       [23:0]   tcEntry_bf24_col_3;
  wire       [23:0]   tcAccu_bf24_col_1;
  wire       [23:0]   tcAccu_bf24_col_2;
  wire       [23:0]   tcAccu_bf24_col_3;
  wire       [31:0]   tcAccu_cascade_data_out_col_1;
  wire       [31:0]   tcAccu_cascade_data_out_col_2;
  wire       [31:0]   tcAccu_cascade_data_out_col_3;
  wire       [31:0]   tensor_core_1_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_1_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_1_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_1_cascade_weight_out;
  wire       [23:0]   tensor_core_1_bf24_col_1;
  wire       [23:0]   tensor_core_1_bf24_col_2;
  wire       [23:0]   tensor_core_1_bf24_col_3;
  wire       [31:0]   tensor_core_2_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_2_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_2_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_2_cascade_weight_out;
  wire       [23:0]   tensor_core_2_bf24_col_1;
  wire       [23:0]   tensor_core_2_bf24_col_2;
  wire       [23:0]   tensor_core_2_bf24_col_3;
  wire       [31:0]   tensor_core_3_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_3_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_3_cascade_data_out_col_3;
  wire       [87:0]   tensor_core_3_cascade_weight_out;
  wire       [23:0]   tensor_core_3_bf24_col_1;
  wire       [23:0]   tensor_core_3_bf24_col_2;
  wire       [23:0]   tensor_core_3_bf24_col_3;
  wire       [3:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [3:0]    _zz_inputCounter_valueNext;
  wire       [0:0]    _zz_inputCounter_valueNext_1;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willClear;
  reg        [3:0]    loadCounter_valueNext;
  reg        [3:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willOverflow;
  reg        [1:0]    loadBufCtrlReg;
  wire       [1:0]    loadBufCtrl;
  reg                 inputCounter_willIncrement;
  wire                inputCounter_willClear;
  reg        [3:0]    inputCounter_valueNext;
  reg        [3:0]    inputCounter_value;
  wire                inputCounter_willOverflowIfInc;
  wire                inputCounter_willOverflow;
  reg                 loadBufSel;
  reg                 io_data_valid_delay_1;
  reg                 io_data_valid_delay_2;
  reg                 io_data_valid_delay_3;
  reg                 io_data_valid_delay_4;
  reg                 io_data_valid_delay_5;
  reg                 io_data_valid_delay_6;
  reg                 io_data_valid_delay_7;
  reg                 io_data_valid_delay_8;
  reg                 io_data_valid_delay_9;
  reg                 oBufferLoadValid;
  reg        [79:0]   io_dataIn_1_delay_1;
  reg        [79:0]   io_dataIn_1_delay_2;
  reg        [7:0]    io_expIn_1_delay_1;
  reg        [79:0]   io_dataIn_2_delay_1;
  reg        [79:0]   io_dataIn_2_delay_2;
  reg        [79:0]   io_dataIn_2_delay_3;
  reg        [79:0]   io_dataIn_2_delay_4;
  reg        [7:0]    io_expIn_2_delay_1;
  reg        [7:0]    io_expIn_2_delay_2;
  reg        [23:0]   oBuffer_0;
  reg        [23:0]   oBuffer_1;
  reg        [23:0]   oBuffer_2;
  reg        [23:0]   oBuffer_0_delay_1;
  reg        [23:0]   oBuffer_0_delay_2;
  reg        [23:0]   oBuffer_1_delay_1;
  reg        [23:0]   oBuffer_1_delay_2;
  reg        [23:0]   oBuffer_2_delay_1;
  reg        [23:0]   oBuffer_2_delay_2;

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {3'd0, _zz_loadCounter_valueNext_1};
  assign _zz_inputCounter_valueNext_1 = inputCounter_willIncrement;
  assign _zz_inputCounter_valueNext = {3'd0, _zz_inputCounter_valueNext_1};
  tensor_core tcEntry (
    .clk                       (clk                             ), //i
    .data_in_1                 (tcEntry_data_in_1               ), //i
    .data_in_2                 (tcEntry_data_in_2               ), //i
    .data_in_3                 (tcEntry_data_in_3               ), //i
    .data_in_4                 (tcEntry_data_in_4               ), //i
    .data_in_5                 (tcEntry_data_in_5               ), //i
    .data_in_6                 (tcEntry_data_in_6               ), //i
    .data_in_7                 (tcEntry_data_in_7               ), //i
    .data_in_8                 (tcEntry_data_in_8               ), //i
    .data_in_9                 (tcEntry_data_in_9               ), //i
    .data_in_10                (tcEntry_data_in_10              ), //i
    .side_in_1                 (8'h0                            ), //i
    .side_in_2                 (8'h0                            ), //i
    .shared_exponent_data      (io_expCascadeIn                 ), //i
    .feed_sel                  (2'b00                           ), //i
    .load_bb_one               (tcEntry_load_bb_one             ), //i
    .load_bb_two               (tcEntry_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                      ), //i
    .zero_en                   (1'b0                            ), //i
    .acc_en                    (1'b0                            ), //i
    .cascade_data_in_col_1     (32'h0                           ), //i
    .cascade_data_in_col_2     (32'h0                           ), //i
    .cascade_data_in_col_3     (32'h0                           ), //i
    .cascade_data_out_col_1    (tcEntry_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tcEntry_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tcEntry_cascade_data_out_col_3  ), //o
    .cascade_weight_in         (88'h0                           ), //i
    .cascade_weight_out        (tcEntry_cascade_weight_out      ), //o
    .bf24_col_1                (tcEntry_bf24_col_1              ), //o
    .bf24_col_2                (tcEntry_bf24_col_2              ), //o
    .bf24_col_3                (tcEntry_bf24_col_3              )  //o
  );
  tensor_core_accu_24 tcAccu (
    .clk                       (clk                                   ), //i
    .acc_en                    (1'b0                                  ), //i
    .zero_en                   (1'b0                                  ), //i
    .bf24_a1                   (oBuffer_0_delay_2                     ), //i
    .bf24_a2                   (oBuffer_1_delay_2                     ), //i
    .bf24_a3                   (oBuffer_2_delay_2                     ), //i
    .cascade_data_in_col_1     (tensor_core_3_cascade_data_out_col_1  ), //i
    .cascade_data_in_col_2     (tensor_core_3_cascade_data_out_col_2  ), //i
    .cascade_data_in_col_3     (tensor_core_3_cascade_data_out_col_3  ), //i
    .bf24_col_1                (tcAccu_bf24_col_1                     ), //o
    .bf24_col_2                (tcAccu_bf24_col_2                     ), //o
    .bf24_col_3                (tcAccu_bf24_col_3                     ), //o
    .cascade_data_out_col_1    (tcAccu_cascade_data_out_col_1         ), //o
    .cascade_data_out_col_2    (tcAccu_cascade_data_out_col_2         ), //o
    .cascade_data_out_col_3    (tcAccu_cascade_data_out_col_3         )  //o
  );
  tensor_core tensor_core_1 (
    .clk                       (clk                                   ), //i
    .data_in_1                 (tensor_core_1_data_in_1               ), //i
    .data_in_2                 (tensor_core_1_data_in_2               ), //i
    .data_in_3                 (tensor_core_1_data_in_3               ), //i
    .data_in_4                 (tensor_core_1_data_in_4               ), //i
    .data_in_5                 (tensor_core_1_data_in_5               ), //i
    .data_in_6                 (tensor_core_1_data_in_6               ), //i
    .data_in_7                 (tensor_core_1_data_in_7               ), //i
    .data_in_8                 (tensor_core_1_data_in_8               ), //i
    .data_in_9                 (tensor_core_1_data_in_9               ), //i
    .data_in_10                (tensor_core_1_data_in_10              ), //i
    .side_in_1                 (8'h0                                  ), //i
    .side_in_2                 (8'h0                                  ), //i
    .shared_exponent_data      (io_expIn_0                            ), //i
    .feed_sel                  (2'b10                                 ), //i
    .load_bb_one               (tensor_core_1_load_bb_one             ), //i
    .load_bb_two               (tensor_core_1_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                            ), //i
    .zero_en                   (1'b0                                  ), //i
    .acc_en                    (1'b0                                  ), //i
    .cascade_data_in_col_1     (32'h0                                 ), //i
    .cascade_data_in_col_2     (32'h0                                 ), //i
    .cascade_data_in_col_3     (32'h0                                 ), //i
    .cascade_data_out_col_1    (tensor_core_1_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tensor_core_1_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tensor_core_1_cascade_data_out_col_3  ), //o
    .cascade_weight_in         (tcEntry_cascade_weight_out            ), //i
    .cascade_weight_out        (tensor_core_1_cascade_weight_out      ), //o
    .bf24_col_1                (tensor_core_1_bf24_col_1              ), //o
    .bf24_col_2                (tensor_core_1_bf24_col_2              ), //o
    .bf24_col_3                (tensor_core_1_bf24_col_3              )  //o
  );
  tensor_core tensor_core_2 (
    .clk                       (clk                                   ), //i
    .data_in_1                 (tensor_core_2_data_in_1               ), //i
    .data_in_2                 (tensor_core_2_data_in_2               ), //i
    .data_in_3                 (tensor_core_2_data_in_3               ), //i
    .data_in_4                 (tensor_core_2_data_in_4               ), //i
    .data_in_5                 (tensor_core_2_data_in_5               ), //i
    .data_in_6                 (tensor_core_2_data_in_6               ), //i
    .data_in_7                 (tensor_core_2_data_in_7               ), //i
    .data_in_8                 (tensor_core_2_data_in_8               ), //i
    .data_in_9                 (tensor_core_2_data_in_9               ), //i
    .data_in_10                (tensor_core_2_data_in_10              ), //i
    .side_in_1                 (8'h0                                  ), //i
    .side_in_2                 (8'h0                                  ), //i
    .shared_exponent_data      (io_expIn_1_delay_1                    ), //i
    .feed_sel                  (2'b10                                 ), //i
    .load_bb_one               (tensor_core_2_load_bb_one             ), //i
    .load_bb_two               (tensor_core_2_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                            ), //i
    .zero_en                   (1'b0                                  ), //i
    .acc_en                    (1'b0                                  ), //i
    .cascade_data_in_col_1     (tensor_core_1_cascade_data_out_col_1  ), //i
    .cascade_data_in_col_2     (tensor_core_1_cascade_data_out_col_2  ), //i
    .cascade_data_in_col_3     (tensor_core_1_cascade_data_out_col_3  ), //i
    .cascade_data_out_col_1    (tensor_core_2_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tensor_core_2_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tensor_core_2_cascade_data_out_col_3  ), //o
    .cascade_weight_in         (tensor_core_1_cascade_weight_out      ), //i
    .cascade_weight_out        (tensor_core_2_cascade_weight_out      ), //o
    .bf24_col_1                (tensor_core_2_bf24_col_1              ), //o
    .bf24_col_2                (tensor_core_2_bf24_col_2              ), //o
    .bf24_col_3                (tensor_core_2_bf24_col_3              )  //o
  );
  tensor_core tensor_core_3 (
    .clk                       (clk                                   ), //i
    .data_in_1                 (tensor_core_3_data_in_1               ), //i
    .data_in_2                 (tensor_core_3_data_in_2               ), //i
    .data_in_3                 (tensor_core_3_data_in_3               ), //i
    .data_in_4                 (tensor_core_3_data_in_4               ), //i
    .data_in_5                 (tensor_core_3_data_in_5               ), //i
    .data_in_6                 (tensor_core_3_data_in_6               ), //i
    .data_in_7                 (tensor_core_3_data_in_7               ), //i
    .data_in_8                 (tensor_core_3_data_in_8               ), //i
    .data_in_9                 (tensor_core_3_data_in_9               ), //i
    .data_in_10                (tensor_core_3_data_in_10              ), //i
    .side_in_1                 (8'h0                                  ), //i
    .side_in_2                 (8'h0                                  ), //i
    .shared_exponent_data      (io_expIn_2_delay_2                    ), //i
    .feed_sel                  (2'b10                                 ), //i
    .load_bb_one               (tensor_core_3_load_bb_one             ), //i
    .load_bb_two               (tensor_core_3_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                            ), //i
    .zero_en                   (1'b0                                  ), //i
    .acc_en                    (1'b0                                  ), //i
    .cascade_data_in_col_1     (tensor_core_2_cascade_data_out_col_1  ), //i
    .cascade_data_in_col_2     (tensor_core_2_cascade_data_out_col_2  ), //i
    .cascade_data_in_col_3     (tensor_core_2_cascade_data_out_col_3  ), //i
    .cascade_data_out_col_1    (tensor_core_3_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tensor_core_3_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tensor_core_3_cascade_data_out_col_3  ), //o
    .cascade_weight_in         (tensor_core_2_cascade_weight_out      ), //i
    .cascade_weight_out        (tensor_core_3_cascade_weight_out      ), //o
    .bf24_col_1                (tensor_core_3_bf24_col_1              ), //o
    .bf24_col_2                (tensor_core_3_bf24_col_2              ), //o
    .bf24_col_3                (tensor_core_3_bf24_col_3              )  //o
  );
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(io_load_valid) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willClear = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 4'b1011);
  assign loadCounter_willOverflow = (loadCounter_willOverflowIfInc && loadCounter_willIncrement);
  always @(*) begin
    if(loadCounter_willOverflow) begin
      loadCounter_valueNext = 4'b0000;
    end else begin
      loadCounter_valueNext = (loadCounter_value + _zz_loadCounter_valueNext);
    end
    if(loadCounter_willClear) begin
      loadCounter_valueNext = 4'b0000;
    end
  end

  always @(*) begin
    if(loadCounter_willOverflow) begin
      io_load_ready = 1'b1;
    end else begin
      io_load_ready = 1'b0;
    end
  end

  assign loadBufCtrl = (io_load_valid ? loadBufCtrlReg : 2'b00);
  always @(*) begin
    inputCounter_willIncrement = 1'b0;
    if(io_data_valid) begin
      inputCounter_willIncrement = 1'b1;
    end
  end

  assign inputCounter_willClear = 1'b0;
  assign inputCounter_willOverflowIfInc = (inputCounter_value == 4'b1011);
  assign inputCounter_willOverflow = (inputCounter_willOverflowIfInc && inputCounter_willIncrement);
  always @(*) begin
    if(inputCounter_willOverflow) begin
      inputCounter_valueNext = 4'b0000;
    end else begin
      inputCounter_valueNext = (inputCounter_value + _zz_inputCounter_valueNext);
    end
    if(inputCounter_willClear) begin
      inputCounter_valueNext = 4'b0000;
    end
  end

  assign tcEntry_data_in_1 = io_loadCascadeIn[7 : 0];
  assign tcEntry_data_in_2 = io_loadCascadeIn[15 : 8];
  assign tcEntry_data_in_3 = io_loadCascadeIn[23 : 16];
  assign tcEntry_data_in_4 = io_loadCascadeIn[31 : 24];
  assign tcEntry_data_in_5 = io_loadCascadeIn[39 : 32];
  assign tcEntry_data_in_6 = io_loadCascadeIn[47 : 40];
  assign tcEntry_data_in_7 = io_loadCascadeIn[55 : 48];
  assign tcEntry_data_in_8 = io_loadCascadeIn[63 : 56];
  assign tcEntry_data_in_9 = io_loadCascadeIn[71 : 64];
  assign tcEntry_data_in_10 = io_loadCascadeIn[79 : 72];
  assign tcEntry_load_bb_one = loadBufCtrl[0];
  assign tcEntry_load_bb_two = loadBufCtrl[1];
  assign tensor_core_1_data_in_1 = io_dataIn_0[7 : 0];
  assign tensor_core_1_data_in_2 = io_dataIn_0[15 : 8];
  assign tensor_core_1_data_in_3 = io_dataIn_0[23 : 16];
  assign tensor_core_1_data_in_4 = io_dataIn_0[31 : 24];
  assign tensor_core_1_data_in_5 = io_dataIn_0[39 : 32];
  assign tensor_core_1_data_in_6 = io_dataIn_0[47 : 40];
  assign tensor_core_1_data_in_7 = io_dataIn_0[55 : 48];
  assign tensor_core_1_data_in_8 = io_dataIn_0[63 : 56];
  assign tensor_core_1_data_in_9 = io_dataIn_0[71 : 64];
  assign tensor_core_1_data_in_10 = io_dataIn_0[79 : 72];
  assign tensor_core_1_load_bb_one = loadBufCtrl[0];
  assign tensor_core_1_load_bb_two = loadBufCtrl[1];
  assign tensor_core_2_data_in_1 = io_dataIn_1_delay_2[7 : 0];
  assign tensor_core_2_data_in_2 = io_dataIn_1_delay_2[15 : 8];
  assign tensor_core_2_data_in_3 = io_dataIn_1_delay_2[23 : 16];
  assign tensor_core_2_data_in_4 = io_dataIn_1_delay_2[31 : 24];
  assign tensor_core_2_data_in_5 = io_dataIn_1_delay_2[39 : 32];
  assign tensor_core_2_data_in_6 = io_dataIn_1_delay_2[47 : 40];
  assign tensor_core_2_data_in_7 = io_dataIn_1_delay_2[55 : 48];
  assign tensor_core_2_data_in_8 = io_dataIn_1_delay_2[63 : 56];
  assign tensor_core_2_data_in_9 = io_dataIn_1_delay_2[71 : 64];
  assign tensor_core_2_data_in_10 = io_dataIn_1_delay_2[79 : 72];
  assign tensor_core_2_load_bb_one = loadBufCtrl[0];
  assign tensor_core_2_load_bb_two = loadBufCtrl[1];
  assign tensor_core_3_data_in_1 = io_dataIn_2_delay_4[7 : 0];
  assign tensor_core_3_data_in_2 = io_dataIn_2_delay_4[15 : 8];
  assign tensor_core_3_data_in_3 = io_dataIn_2_delay_4[23 : 16];
  assign tensor_core_3_data_in_4 = io_dataIn_2_delay_4[31 : 24];
  assign tensor_core_3_data_in_5 = io_dataIn_2_delay_4[39 : 32];
  assign tensor_core_3_data_in_6 = io_dataIn_2_delay_4[47 : 40];
  assign tensor_core_3_data_in_7 = io_dataIn_2_delay_4[55 : 48];
  assign tensor_core_3_data_in_8 = io_dataIn_2_delay_4[63 : 56];
  assign tensor_core_3_data_in_9 = io_dataIn_2_delay_4[71 : 64];
  assign tensor_core_3_data_in_10 = io_dataIn_2_delay_4[79 : 72];
  assign tensor_core_3_load_bb_one = loadBufCtrl[0];
  assign tensor_core_3_load_bb_two = loadBufCtrl[1];
  assign io_res_0 = tcAccu_bf24_col_1;
  assign io_res_1 = tcAccu_bf24_col_2;
  assign io_res_2 = tcAccu_bf24_col_3;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      loadCounter_value <= 4'b0000;
      loadBufCtrlReg <= 2'b01;
      inputCounter_value <= 4'b0000;
      loadBufSel <= 1'b0;
      oBuffer_0 <= 24'h0;
      oBuffer_1 <= 24'h0;
      oBuffer_2 <= 24'h0;
    end else begin
      loadCounter_value <= loadCounter_valueNext;
      if(loadCounter_willOverflow) begin
        loadBufCtrlReg <= {loadBufCtrlReg[0 : 0],loadBufCtrlReg[1 : 1]};
      end
      inputCounter_value <= inputCounter_valueNext;
      if(inputCounter_willOverflow) begin
        loadBufSel <= (! loadBufSel);
      end
      if(oBufferLoadValid) begin
        oBuffer_0 <= tcAccu_bf24_col_1;
        oBuffer_1 <= tcAccu_bf24_col_2;
        oBuffer_2 <= tcAccu_bf24_col_3;
      end else begin
        oBuffer_0 <= 24'h0;
        oBuffer_1 <= 24'h0;
        oBuffer_2 <= 24'h0;
      end
    end
  end

  always @(posedge clk) begin
    io_data_valid_delay_1 <= io_data_valid;
    io_data_valid_delay_2 <= io_data_valid_delay_1;
    io_data_valid_delay_3 <= io_data_valid_delay_2;
    io_data_valid_delay_4 <= io_data_valid_delay_3;
    io_data_valid_delay_5 <= io_data_valid_delay_4;
    io_data_valid_delay_6 <= io_data_valid_delay_5;
    io_data_valid_delay_7 <= io_data_valid_delay_6;
    io_data_valid_delay_8 <= io_data_valid_delay_7;
    io_data_valid_delay_9 <= io_data_valid_delay_8;
    oBufferLoadValid <= io_data_valid_delay_9;
    io_dataIn_1_delay_1 <= io_dataIn_1;
    io_dataIn_1_delay_2 <= io_dataIn_1_delay_1;
    io_expIn_1_delay_1 <= io_expIn_1;
    io_dataIn_2_delay_1 <= io_dataIn_2;
    io_dataIn_2_delay_2 <= io_dataIn_2_delay_1;
    io_dataIn_2_delay_3 <= io_dataIn_2_delay_2;
    io_dataIn_2_delay_4 <= io_dataIn_2_delay_3;
    io_expIn_2_delay_1 <= io_expIn_2;
    io_expIn_2_delay_2 <= io_expIn_2_delay_1;
    oBuffer_0_delay_1 <= oBuffer_0;
    oBuffer_0_delay_2 <= oBuffer_0_delay_1;
    oBuffer_1_delay_1 <= oBuffer_1;
    oBuffer_1_delay_2 <= oBuffer_1_delay_1;
    oBuffer_2_delay_1 <= oBuffer_2;
    oBuffer_2_delay_2 <= oBuffer_2_delay_1;
  end


endmodule
