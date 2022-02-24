// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : TensorCoreChain
// Git hash  : db127909416713c25272d1a7a0d9caf1b34d4dbe



module TensorCoreChain (
  input      [79:0]   io_dataIn_0,
  input      [79:0]   io_dataIn_1,
  input      [79:0]   io_dataIn_2,
  input      [79:0]   io_loadCascadeIn,
  input      [7:0]    io_expIn_0,
  input      [7:0]    io_expIn_1,
  input      [7:0]    io_expIn_2,
  input      [7:0]    io_expCascadeIn,
  input               io_dataValid,
  input               io_loadValid,
  output              io_loadReady,
  output     [23:0]   io_res_0,
  output     [23:0]   io_res_1,
  output     [23:0]   io_res_2,
  input      [7:0]    io_inputIters,
  output              io_outValid,
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
  wire       [7:0]    tcStartPoint_data_in_1;
  wire       [7:0]    tcStartPoint_data_in_2;
  wire       [7:0]    tcStartPoint_data_in_3;
  wire       [7:0]    tcStartPoint_data_in_4;
  wire       [7:0]    tcStartPoint_data_in_5;
  wire       [7:0]    tcStartPoint_data_in_6;
  wire       [7:0]    tcStartPoint_data_in_7;
  wire       [7:0]    tcStartPoint_data_in_8;
  wire       [7:0]    tcStartPoint_data_in_9;
  wire       [7:0]    tcStartPoint_data_in_10;
  wire                tcStartPoint_load_bb_one;
  wire                tcStartPoint_load_bb_two;
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
  wire       [23:0]   tcEntry_bf24_col_1;
  wire       [23:0]   tcEntry_bf24_col_2;
  wire       [23:0]   tcEntry_bf24_col_3;
  wire       [87:0]   tcEntry_cascade_weight_out;
  wire       [31:0]   tcEntry_cascade_data_out_col_1;
  wire       [31:0]   tcEntry_cascade_data_out_col_2;
  wire       [31:0]   tcEntry_cascade_data_out_col_3;
  wire       [23:0]   tcStartPoint_bf24_col_1;
  wire       [23:0]   tcStartPoint_bf24_col_2;
  wire       [23:0]   tcStartPoint_bf24_col_3;
  wire       [87:0]   tcStartPoint_cascade_weight_out;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_1;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_2;
  wire       [31:0]   tcStartPoint_cascade_data_out_col_3;
  wire       [23:0]   tcAccu_bf24_col_1;
  wire       [23:0]   tcAccu_bf24_col_2;
  wire       [23:0]   tcAccu_bf24_col_3;
  wire       [31:0]   tcAccu_cascade_data_out_col_1;
  wire       [31:0]   tcAccu_cascade_data_out_col_2;
  wire       [31:0]   tcAccu_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_1_bf24_col_1;
  wire       [23:0]   tensor_core_1_bf24_col_2;
  wire       [23:0]   tensor_core_1_bf24_col_3;
  wire       [87:0]   tensor_core_1_cascade_weight_out;
  wire       [31:0]   tensor_core_1_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_1_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_1_cascade_data_out_col_3;
  wire       [23:0]   tensor_core_2_bf24_col_1;
  wire       [23:0]   tensor_core_2_bf24_col_2;
  wire       [23:0]   tensor_core_2_bf24_col_3;
  wire       [87:0]   tensor_core_2_cascade_weight_out;
  wire       [31:0]   tensor_core_2_cascade_data_out_col_1;
  wire       [31:0]   tensor_core_2_cascade_data_out_col_2;
  wire       [31:0]   tensor_core_2_cascade_data_out_col_3;
  wire       [3:0]    _zz_loadCounter_valueNext;
  wire       [0:0]    _zz_loadCounter_valueNext_1;
  wire       [3:0]    _zz_loadSelCounter_valueNext;
  wire       [0:0]    _zz_loadSelCounter_valueNext_1;
  wire       [7:0]    _zz_inputCounter_valueNext;
  wire       [0:0]    _zz_inputCounter_valueNext_1;
  wire       [7:0]    _zz_outValidCounter_valueNext;
  wire       [0:0]    _zz_outValidCounter_valueNext_1;
  reg                 io_loadValid_delay_1;
  reg                 io_loadValid_delay_2;
  reg                 loadValidD3t;
  reg                 io_loadValid_delay_1_1;
  reg                 loadValidD2t;
  reg                 loadCounter_willIncrement;
  wire                loadCounter_willClear;
  reg        [3:0]    loadCounter_valueNext;
  reg        [3:0]    loadCounter_value;
  wire                loadCounter_willOverflowIfInc;
  wire                loadCounter_willOverflow;
  reg                 loadSelCounter_willIncrement;
  wire                loadSelCounter_willClear;
  reg        [3:0]    loadSelCounter_valueNext;
  reg        [3:0]    loadSelCounter_value;
  wire                loadSelCounter_willOverflowIfInc;
  wire                loadSelCounter_willOverflow;
  reg        [1:0]    loadBufCtrlReg;
  wire       [1:0]    loadBufCtrl;
  wire       [7:0]    inputCounter_overflowVal;
  reg                 inputCounter_willIncrement;
  wire                inputCounter_willClear;
  reg        [7:0]    inputCounter_valueNext;
  reg        [7:0]    inputCounter_value;
  wire                inputCounter_willOverflowIfInc;
  wire                inputCounter_willOverflow;
  reg                 loadBufSel;
  reg                 io_dataValid_delay_1;
  reg                 io_dataValid_delay_2;
  reg                 io_dataValid_delay_3;
  reg                 io_dataValid_delay_4;
  reg                 io_dataValid_delay_5;
  reg                 io_dataValid_delay_6;
  reg                 io_dataValid_delay_7;
  reg                 io_dataValid_delay_8;
  reg                 io_dataValid_delay_9;
  reg                 oBufferLoadValid;
  wire       [7:0]    outValidCounter_overflowVal;
  reg                 outValidCounter_willIncrement;
  wire                outValidCounter_willClear;
  reg        [7:0]    outValidCounter_valueNext;
  reg        [7:0]    outValidCounter_value;
  wire                outValidCounter_willOverflowIfInc;
  wire                outValidCounter_willOverflow;
  reg        [79:0]   io_dataIn_1_delay_1;
  reg        [79:0]   io_dataIn_1_delay_2;
  reg        [7:0]    io_expIn_1_delay_1;
  reg        [7:0]    io_expIn_1_delay_2;
  reg        [79:0]   io_dataIn_2_delay_1;
  reg        [79:0]   io_dataIn_2_delay_2;
  reg        [79:0]   io_dataIn_2_delay_3;
  reg        [79:0]   io_dataIn_2_delay_4;
  reg        [7:0]    io_expIn_2_delay_1;
  reg        [7:0]    io_expIn_2_delay_2;
  reg        [7:0]    io_expIn_2_delay_3;
  reg        [7:0]    io_expIn_2_delay_4;
  reg        [23:0]   tcAccu_bf24_col_1_delay_1;
  reg        [23:0]   tcAccu_bf24_col_1_delay_2;
  reg        [23:0]   tcAccu_bf24_col_1_delay_3;
  reg        [23:0]   tcAccu_bf24_col_1_delay_4;
  reg        [23:0]   tcAccu_bf24_col_1_delay_5;
  reg        [23:0]   tcAccu_bf24_col_1_delay_6;
  reg        [23:0]   tcAccu_bf24_col_2_delay_1;
  reg        [23:0]   tcAccu_bf24_col_2_delay_2;
  reg        [23:0]   tcAccu_bf24_col_2_delay_3;
  reg        [23:0]   tcAccu_bf24_col_2_delay_4;
  reg        [23:0]   tcAccu_bf24_col_2_delay_5;
  reg        [23:0]   tcAccu_bf24_col_2_delay_6;
  reg        [23:0]   tcAccu_bf24_col_3_delay_1;
  reg        [23:0]   tcAccu_bf24_col_3_delay_2;
  reg        [23:0]   tcAccu_bf24_col_3_delay_3;
  reg        [23:0]   tcAccu_bf24_col_3_delay_4;
  reg        [23:0]   tcAccu_bf24_col_3_delay_5;
  reg        [23:0]   tcAccu_bf24_col_3_delay_6;

  assign _zz_loadCounter_valueNext_1 = loadCounter_willIncrement;
  assign _zz_loadCounter_valueNext = {3'd0, _zz_loadCounter_valueNext_1};
  assign _zz_loadSelCounter_valueNext_1 = loadSelCounter_willIncrement;
  assign _zz_loadSelCounter_valueNext = {3'd0, _zz_loadSelCounter_valueNext_1};
  assign _zz_inputCounter_valueNext_1 = inputCounter_willIncrement;
  assign _zz_inputCounter_valueNext = {7'd0, _zz_inputCounter_valueNext_1};
  assign _zz_outValidCounter_valueNext_1 = outValidCounter_willIncrement;
  assign _zz_outValidCounter_valueNext = {7'd0, _zz_outValidCounter_valueNext_1};
  tensor_core_entry tcEntry (
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
    .load_bb_one               (1'b1                            ), //i
    .load_bb_two               (1'b0                            ), //i
    .load_buf_sel              (1'b0                            ), //i
    .bf24_col_1                (tcEntry_bf24_col_1              ), //o
    .bf24_col_2                (tcEntry_bf24_col_2              ), //o
    .bf24_col_3                (tcEntry_bf24_col_3              ), //o
    .cascade_weight_out        (tcEntry_cascade_weight_out      ), //o
    .cascade_data_out_col_1    (tcEntry_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tcEntry_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tcEntry_cascade_data_out_col_3  )  //o
  );
  tensor_core_start tcStartPoint (
    .clk                       (clk                                  ), //i
    .data_in_1                 (tcStartPoint_data_in_1               ), //i
    .data_in_2                 (tcStartPoint_data_in_2               ), //i
    .data_in_3                 (tcStartPoint_data_in_3               ), //i
    .data_in_4                 (tcStartPoint_data_in_4               ), //i
    .data_in_5                 (tcStartPoint_data_in_5               ), //i
    .data_in_6                 (tcStartPoint_data_in_6               ), //i
    .data_in_7                 (tcStartPoint_data_in_7               ), //i
    .data_in_8                 (tcStartPoint_data_in_8               ), //i
    .data_in_9                 (tcStartPoint_data_in_9               ), //i
    .data_in_10                (tcStartPoint_data_in_10              ), //i
    .side_in_1                 (8'h0                                 ), //i
    .side_in_2                 (8'h0                                 ), //i
    .shared_exponent_data      (io_expIn_0                           ), //i
    .feed_sel                  (2'b01                                ), //i
    .load_bb_one               (tcStartPoint_load_bb_one             ), //i
    .load_bb_two               (tcStartPoint_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                           ), //i
    .bf24_col_1                (tcStartPoint_bf24_col_1              ), //o
    .bf24_col_2                (tcStartPoint_bf24_col_2              ), //o
    .bf24_col_3                (tcStartPoint_bf24_col_3              ), //o
    .cascade_weight_in         (tcEntry_cascade_weight_out           ), //i
    .cascade_weight_out        (tcStartPoint_cascade_weight_out      ), //o
    .cascade_data_out_col_1    (tcStartPoint_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tcStartPoint_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tcStartPoint_cascade_data_out_col_3  )  //o
  );
  tensor_core_accu tcAccu (
    .clk                       (clk                                   ), //i
    .acc_en                    (1'b0                                  ), //i
    .zero_en                   (1'b0                                  ), //i
    .bf24_a1                   (tcAccu_bf24_col_1_delay_6             ), //i
    .bf24_a2                   (tcAccu_bf24_col_2_delay_6             ), //i
    .bf24_a3                   (tcAccu_bf24_col_3_delay_6             ), //i
    .cascade_data_in_col_1     (tensor_core_2_cascade_data_out_col_1  ), //i
    .cascade_data_in_col_2     (tensor_core_2_cascade_data_out_col_2  ), //i
    .cascade_data_in_col_3     (tensor_core_2_cascade_data_out_col_3  ), //i
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
    .shared_exponent_data      (io_expIn_1_delay_2                    ), //i
    .feed_sel                  (2'b01                                 ), //i
    .load_bb_one               (tensor_core_1_load_bb_one             ), //i
    .load_bb_two               (tensor_core_1_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                            ), //i
    .bf24_col_1                (tensor_core_1_bf24_col_1              ), //o
    .bf24_col_2                (tensor_core_1_bf24_col_2              ), //o
    .bf24_col_3                (tensor_core_1_bf24_col_3              ), //o
    .acc_en                    (1'b0                                  ), //i
    .zero_en                   (1'b0                                  ), //i
    .cascade_weight_in         (tcStartPoint_cascade_weight_out       ), //i
    .cascade_weight_out        (tensor_core_1_cascade_weight_out      ), //o
    .cascade_data_in_col_1     (tcStartPoint_cascade_data_out_col_1   ), //i
    .cascade_data_in_col_2     (tcStartPoint_cascade_data_out_col_2   ), //i
    .cascade_data_in_col_3     (tcStartPoint_cascade_data_out_col_3   ), //i
    .cascade_data_out_col_1    (tensor_core_1_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tensor_core_1_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tensor_core_1_cascade_data_out_col_3  )  //o
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
    .shared_exponent_data      (io_expIn_2_delay_4                    ), //i
    .feed_sel                  (2'b01                                 ), //i
    .load_bb_one               (tensor_core_2_load_bb_one             ), //i
    .load_bb_two               (tensor_core_2_load_bb_two             ), //i
    .load_buf_sel              (loadBufSel                            ), //i
    .bf24_col_1                (tensor_core_2_bf24_col_1              ), //o
    .bf24_col_2                (tensor_core_2_bf24_col_2              ), //o
    .bf24_col_3                (tensor_core_2_bf24_col_3              ), //o
    .acc_en                    (1'b0                                  ), //i
    .zero_en                   (1'b0                                  ), //i
    .cascade_weight_in         (tensor_core_1_cascade_weight_out      ), //i
    .cascade_weight_out        (tensor_core_2_cascade_weight_out      ), //o
    .cascade_data_in_col_1     (tensor_core_1_cascade_data_out_col_1  ), //i
    .cascade_data_in_col_2     (tensor_core_1_cascade_data_out_col_2  ), //i
    .cascade_data_in_col_3     (tensor_core_1_cascade_data_out_col_3  ), //i
    .cascade_data_out_col_1    (tensor_core_2_cascade_data_out_col_1  ), //o
    .cascade_data_out_col_2    (tensor_core_2_cascade_data_out_col_2  ), //o
    .cascade_data_out_col_3    (tensor_core_2_cascade_data_out_col_3  )  //o
  );
  always @(*) begin
    loadCounter_willIncrement = 1'b0;
    if(loadValidD3t) begin
      loadCounter_willIncrement = 1'b1;
    end
  end

  assign loadCounter_willClear = 1'b0;
  assign loadCounter_willOverflowIfInc = (loadCounter_value == 4'b1000);
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
    loadSelCounter_willIncrement = 1'b0;
    if(loadValidD2t) begin
      loadSelCounter_willIncrement = 1'b1;
    end
  end

  assign loadSelCounter_willClear = 1'b0;
  assign loadSelCounter_willOverflowIfInc = (loadSelCounter_value == 4'b1000);
  assign loadSelCounter_willOverflow = (loadSelCounter_willOverflowIfInc && loadSelCounter_willIncrement);
  always @(*) begin
    if(loadSelCounter_willOverflow) begin
      loadSelCounter_valueNext = 4'b0000;
    end else begin
      loadSelCounter_valueNext = (loadSelCounter_value + _zz_loadSelCounter_valueNext);
    end
    if(loadSelCounter_willClear) begin
      loadSelCounter_valueNext = 4'b0000;
    end
  end

  assign loadBufCtrl = (loadValidD2t ? loadBufCtrlReg : 2'b00);
  assign io_loadReady = loadCounter_willOverflow;
  always @(*) begin
    inputCounter_willIncrement = 1'b0;
    if(io_dataValid) begin
      inputCounter_willIncrement = 1'b1;
    end
  end

  assign inputCounter_willClear = 1'b0;
  assign inputCounter_willOverflowIfInc = (inputCounter_overflowVal <= inputCounter_value);
  assign inputCounter_willOverflow = (inputCounter_willOverflowIfInc && inputCounter_willIncrement);
  always @(*) begin
    if(inputCounter_willOverflow) begin
      inputCounter_valueNext = 8'h0;
    end else begin
      inputCounter_valueNext = (inputCounter_value + _zz_inputCounter_valueNext);
    end
    if(inputCounter_willClear) begin
      inputCounter_valueNext = 8'h0;
    end
  end

  assign inputCounter_overflowVal = (io_inputIters - 8'h01);
  always @(*) begin
    outValidCounter_willIncrement = 1'b0;
    if(oBufferLoadValid) begin
      outValidCounter_willIncrement = 1'b1;
    end
  end

  assign outValidCounter_willClear = 1'b0;
  assign outValidCounter_willOverflowIfInc = (outValidCounter_overflowVal <= outValidCounter_value);
  assign outValidCounter_willOverflow = (outValidCounter_willOverflowIfInc && outValidCounter_willIncrement);
  always @(*) begin
    if(outValidCounter_willOverflow) begin
      outValidCounter_valueNext = 8'h0;
    end else begin
      outValidCounter_valueNext = (outValidCounter_value + _zz_outValidCounter_valueNext);
    end
    if(outValidCounter_willClear) begin
      outValidCounter_valueNext = 8'h0;
    end
  end

  assign outValidCounter_overflowVal = (io_inputIters - 8'h01);
  assign io_outValid = outValidCounter_willOverflow;
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
  assign tcStartPoint_data_in_1 = io_dataIn_0[7 : 0];
  assign tcStartPoint_data_in_2 = io_dataIn_0[15 : 8];
  assign tcStartPoint_data_in_3 = io_dataIn_0[23 : 16];
  assign tcStartPoint_data_in_4 = io_dataIn_0[31 : 24];
  assign tcStartPoint_data_in_5 = io_dataIn_0[39 : 32];
  assign tcStartPoint_data_in_6 = io_dataIn_0[47 : 40];
  assign tcStartPoint_data_in_7 = io_dataIn_0[55 : 48];
  assign tcStartPoint_data_in_8 = io_dataIn_0[63 : 56];
  assign tcStartPoint_data_in_9 = io_dataIn_0[71 : 64];
  assign tcStartPoint_data_in_10 = io_dataIn_0[79 : 72];
  assign tcStartPoint_load_bb_one = loadBufCtrl[0];
  assign tcStartPoint_load_bb_two = loadBufCtrl[1];
  assign tensor_core_1_data_in_1 = io_dataIn_1_delay_2[7 : 0];
  assign tensor_core_1_data_in_2 = io_dataIn_1_delay_2[15 : 8];
  assign tensor_core_1_data_in_3 = io_dataIn_1_delay_2[23 : 16];
  assign tensor_core_1_data_in_4 = io_dataIn_1_delay_2[31 : 24];
  assign tensor_core_1_data_in_5 = io_dataIn_1_delay_2[39 : 32];
  assign tensor_core_1_data_in_6 = io_dataIn_1_delay_2[47 : 40];
  assign tensor_core_1_data_in_7 = io_dataIn_1_delay_2[55 : 48];
  assign tensor_core_1_data_in_8 = io_dataIn_1_delay_2[63 : 56];
  assign tensor_core_1_data_in_9 = io_dataIn_1_delay_2[71 : 64];
  assign tensor_core_1_data_in_10 = io_dataIn_1_delay_2[79 : 72];
  assign tensor_core_1_load_bb_one = loadBufCtrl[0];
  assign tensor_core_1_load_bb_two = loadBufCtrl[1];
  assign tensor_core_2_data_in_1 = io_dataIn_2_delay_4[7 : 0];
  assign tensor_core_2_data_in_2 = io_dataIn_2_delay_4[15 : 8];
  assign tensor_core_2_data_in_3 = io_dataIn_2_delay_4[23 : 16];
  assign tensor_core_2_data_in_4 = io_dataIn_2_delay_4[31 : 24];
  assign tensor_core_2_data_in_5 = io_dataIn_2_delay_4[39 : 32];
  assign tensor_core_2_data_in_6 = io_dataIn_2_delay_4[47 : 40];
  assign tensor_core_2_data_in_7 = io_dataIn_2_delay_4[55 : 48];
  assign tensor_core_2_data_in_8 = io_dataIn_2_delay_4[63 : 56];
  assign tensor_core_2_data_in_9 = io_dataIn_2_delay_4[71 : 64];
  assign tensor_core_2_data_in_10 = io_dataIn_2_delay_4[79 : 72];
  assign tensor_core_2_load_bb_one = loadBufCtrl[0];
  assign tensor_core_2_load_bb_two = loadBufCtrl[1];
  assign io_res_0 = tcAccu_bf24_col_1;
  assign io_res_1 = tcAccu_bf24_col_2;
  assign io_res_2 = tcAccu_bf24_col_3;
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      io_loadValid_delay_1 <= 1'b0;
      io_loadValid_delay_2 <= 1'b0;
      loadValidD3t <= 1'b0;
      io_loadValid_delay_1_1 <= 1'b0;
      loadValidD2t <= 1'b0;
      loadCounter_value <= 4'b0000;
      loadSelCounter_value <= 4'b0000;
      loadBufCtrlReg <= 2'b01;
      inputCounter_value <= 8'h0;
      loadBufSel <= 1'b0;
      io_dataValid_delay_1 <= 1'b0;
      io_dataValid_delay_2 <= 1'b0;
      io_dataValid_delay_3 <= 1'b0;
      io_dataValid_delay_4 <= 1'b0;
      io_dataValid_delay_5 <= 1'b0;
      io_dataValid_delay_6 <= 1'b0;
      io_dataValid_delay_7 <= 1'b0;
      io_dataValid_delay_8 <= 1'b0;
      io_dataValid_delay_9 <= 1'b0;
      oBufferLoadValid <= 1'b0;
      outValidCounter_value <= 8'h0;
      io_dataIn_1_delay_1 <= 80'h0;
      io_dataIn_1_delay_2 <= 80'h0;
      io_expIn_1_delay_1 <= 8'h0;
      io_expIn_1_delay_2 <= 8'h0;
      io_dataIn_2_delay_1 <= 80'h0;
      io_dataIn_2_delay_2 <= 80'h0;
      io_dataIn_2_delay_3 <= 80'h0;
      io_dataIn_2_delay_4 <= 80'h0;
      io_expIn_2_delay_1 <= 8'h0;
      io_expIn_2_delay_2 <= 8'h0;
      io_expIn_2_delay_3 <= 8'h0;
      io_expIn_2_delay_4 <= 8'h0;
      tcAccu_bf24_col_1_delay_1 <= 24'h0;
      tcAccu_bf24_col_1_delay_2 <= 24'h0;
      tcAccu_bf24_col_1_delay_3 <= 24'h0;
      tcAccu_bf24_col_1_delay_4 <= 24'h0;
      tcAccu_bf24_col_1_delay_5 <= 24'h0;
      tcAccu_bf24_col_1_delay_6 <= 24'h0;
      tcAccu_bf24_col_2_delay_1 <= 24'h0;
      tcAccu_bf24_col_2_delay_2 <= 24'h0;
      tcAccu_bf24_col_2_delay_3 <= 24'h0;
      tcAccu_bf24_col_2_delay_4 <= 24'h0;
      tcAccu_bf24_col_2_delay_5 <= 24'h0;
      tcAccu_bf24_col_2_delay_6 <= 24'h0;
      tcAccu_bf24_col_3_delay_1 <= 24'h0;
      tcAccu_bf24_col_3_delay_2 <= 24'h0;
      tcAccu_bf24_col_3_delay_3 <= 24'h0;
      tcAccu_bf24_col_3_delay_4 <= 24'h0;
      tcAccu_bf24_col_3_delay_5 <= 24'h0;
      tcAccu_bf24_col_3_delay_6 <= 24'h0;
    end else begin
      io_loadValid_delay_1 <= io_loadValid;
      io_loadValid_delay_2 <= io_loadValid_delay_1;
      loadValidD3t <= io_loadValid_delay_2;
      io_loadValid_delay_1_1 <= io_loadValid;
      loadValidD2t <= io_loadValid_delay_1_1;
      loadCounter_value <= loadCounter_valueNext;
      loadSelCounter_value <= loadSelCounter_valueNext;
      if(loadSelCounter_willOverflow) begin
        loadBufCtrlReg <= {loadBufCtrlReg[0 : 0],loadBufCtrlReg[1 : 1]};
      end
      inputCounter_value <= inputCounter_valueNext;
      if(inputCounter_willOverflow) begin
        loadBufSel <= (! loadBufSel);
      end
      io_dataValid_delay_1 <= io_dataValid;
      io_dataValid_delay_2 <= io_dataValid_delay_1;
      io_dataValid_delay_3 <= io_dataValid_delay_2;
      io_dataValid_delay_4 <= io_dataValid_delay_3;
      io_dataValid_delay_5 <= io_dataValid_delay_4;
      io_dataValid_delay_6 <= io_dataValid_delay_5;
      io_dataValid_delay_7 <= io_dataValid_delay_6;
      io_dataValid_delay_8 <= io_dataValid_delay_7;
      io_dataValid_delay_9 <= io_dataValid_delay_8;
      oBufferLoadValid <= io_dataValid_delay_9;
      outValidCounter_value <= outValidCounter_valueNext;
      io_dataIn_1_delay_1 <= io_dataIn_1;
      io_dataIn_1_delay_2 <= io_dataIn_1_delay_1;
      io_expIn_1_delay_1 <= io_expIn_1;
      io_expIn_1_delay_2 <= io_expIn_1_delay_1;
      io_dataIn_2_delay_1 <= io_dataIn_2;
      io_dataIn_2_delay_2 <= io_dataIn_2_delay_1;
      io_dataIn_2_delay_3 <= io_dataIn_2_delay_2;
      io_dataIn_2_delay_4 <= io_dataIn_2_delay_3;
      io_expIn_2_delay_1 <= io_expIn_2;
      io_expIn_2_delay_2 <= io_expIn_2_delay_1;
      io_expIn_2_delay_3 <= io_expIn_2_delay_2;
      io_expIn_2_delay_4 <= io_expIn_2_delay_3;
      tcAccu_bf24_col_1_delay_1 <= tcAccu_bf24_col_1;
      tcAccu_bf24_col_1_delay_2 <= tcAccu_bf24_col_1_delay_1;
      tcAccu_bf24_col_1_delay_3 <= tcAccu_bf24_col_1_delay_2;
      tcAccu_bf24_col_1_delay_4 <= tcAccu_bf24_col_1_delay_3;
      tcAccu_bf24_col_1_delay_5 <= tcAccu_bf24_col_1_delay_4;
      tcAccu_bf24_col_1_delay_6 <= tcAccu_bf24_col_1_delay_5;
      tcAccu_bf24_col_2_delay_1 <= tcAccu_bf24_col_2;
      tcAccu_bf24_col_2_delay_2 <= tcAccu_bf24_col_2_delay_1;
      tcAccu_bf24_col_2_delay_3 <= tcAccu_bf24_col_2_delay_2;
      tcAccu_bf24_col_2_delay_4 <= tcAccu_bf24_col_2_delay_3;
      tcAccu_bf24_col_2_delay_5 <= tcAccu_bf24_col_2_delay_4;
      tcAccu_bf24_col_2_delay_6 <= tcAccu_bf24_col_2_delay_5;
      tcAccu_bf24_col_3_delay_1 <= tcAccu_bf24_col_3;
      tcAccu_bf24_col_3_delay_2 <= tcAccu_bf24_col_3_delay_1;
      tcAccu_bf24_col_3_delay_3 <= tcAccu_bf24_col_3_delay_2;
      tcAccu_bf24_col_3_delay_4 <= tcAccu_bf24_col_3_delay_3;
      tcAccu_bf24_col_3_delay_5 <= tcAccu_bf24_col_3_delay_4;
      tcAccu_bf24_col_3_delay_6 <= tcAccu_bf24_col_3_delay_5;
    end
  end


endmodule
