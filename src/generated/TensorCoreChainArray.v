// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : TensorCoreChainArray
// Git hash  : 53eff90a3519d23f96b4893b53d9481a3fc7b3d9


`define ctrlStateMachine_enumDefinition_binary_sequential_type [2:0]
`define ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT 3'b000
`define ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle 3'b001
`define ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad 3'b010
`define ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute 3'b011
`define ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes 3'b100


module TensorCoreChainArray (
  input               io_matALoad_0_valid,
  input      [319:0]  io_matALoad_0_payload,
  input               io_matALoad_1_valid,
  input      [319:0]  io_matALoad_1_payload,
  input               io_matALoad_2_valid,
  input      [319:0]  io_matALoad_2_payload,
  input               io_matBLoad_0_0_valid,
  input      [319:0]  io_matBLoad_0_0_payload,
  input               io_matBLoad_0_1_valid,
  input      [319:0]  io_matBLoad_0_1_payload,
  input               io_matBLoad_0_2_valid,
  input      [319:0]  io_matBLoad_0_2_payload,
  input               io_matBLoad_1_0_valid,
  input      [319:0]  io_matBLoad_1_0_payload,
  input               io_matBLoad_1_1_valid,
  input      [319:0]  io_matBLoad_1_1_payload,
  input               io_matBLoad_1_2_valid,
  input      [319:0]  io_matBLoad_1_2_payload,
  input               io_calEn,
  input      [7:0]    io_computeIters,
  output              io_res_valid,
  input               io_res_ready,
  output     [431:0]  io_res_payload,
  input               clk,
  input               resetn
);
  wire       [79:0]   tensorCoreChain_6_io_dataIn_0;
  wire       [79:0]   tensorCoreChain_6_io_dataIn_1;
  wire       [79:0]   tensorCoreChain_6_io_dataIn_2;
  wire       [79:0]   tensorCoreChain_6_io_loadCascadeIn;
  wire       [7:0]    tensorCoreChain_6_io_expIn_0;
  wire       [7:0]    tensorCoreChain_6_io_expIn_1;
  wire       [7:0]    tensorCoreChain_6_io_expIn_2;
  wire       [7:0]    tensorCoreChain_6_io_expCascadeIn;
  wire       [79:0]   tensorCoreChain_7_io_dataIn_0;
  wire       [79:0]   tensorCoreChain_7_io_dataIn_1;
  wire       [79:0]   tensorCoreChain_7_io_dataIn_2;
  wire       [79:0]   tensorCoreChain_7_io_loadCascadeIn;
  wire       [7:0]    tensorCoreChain_7_io_expIn_0;
  wire       [7:0]    tensorCoreChain_7_io_expIn_1;
  wire       [7:0]    tensorCoreChain_7_io_expIn_2;
  wire       [7:0]    tensorCoreChain_7_io_expCascadeIn;
  wire       [79:0]   tensorCoreChain_8_io_dataIn_0;
  wire       [79:0]   tensorCoreChain_8_io_dataIn_1;
  wire       [79:0]   tensorCoreChain_8_io_dataIn_2;
  wire       [79:0]   tensorCoreChain_8_io_loadCascadeIn;
  wire       [7:0]    tensorCoreChain_8_io_expIn_0;
  wire       [7:0]    tensorCoreChain_8_io_expIn_1;
  wire       [7:0]    tensorCoreChain_8_io_expIn_2;
  wire       [7:0]    tensorCoreChain_8_io_expCascadeIn;
  wire       [79:0]   tensorCoreChain_9_io_dataIn_0;
  wire       [79:0]   tensorCoreChain_9_io_dataIn_1;
  wire       [79:0]   tensorCoreChain_9_io_dataIn_2;
  wire       [79:0]   tensorCoreChain_9_io_loadCascadeIn;
  wire       [7:0]    tensorCoreChain_9_io_expIn_0;
  wire       [7:0]    tensorCoreChain_9_io_expIn_1;
  wire       [7:0]    tensorCoreChain_9_io_expIn_2;
  wire       [7:0]    tensorCoreChain_9_io_expCascadeIn;
  wire       [79:0]   tensorCoreChain_10_io_dataIn_0;
  wire       [79:0]   tensorCoreChain_10_io_dataIn_1;
  wire       [79:0]   tensorCoreChain_10_io_dataIn_2;
  wire       [79:0]   tensorCoreChain_10_io_loadCascadeIn;
  wire       [7:0]    tensorCoreChain_10_io_expIn_0;
  wire       [7:0]    tensorCoreChain_10_io_expIn_1;
  wire       [7:0]    tensorCoreChain_10_io_expIn_2;
  wire       [7:0]    tensorCoreChain_10_io_expCascadeIn;
  wire       [79:0]   tensorCoreChain_11_io_dataIn_0;
  wire       [79:0]   tensorCoreChain_11_io_dataIn_1;
  wire       [79:0]   tensorCoreChain_11_io_dataIn_2;
  wire       [79:0]   tensorCoreChain_11_io_loadCascadeIn;
  wire       [7:0]    tensorCoreChain_11_io_expIn_0;
  wire       [7:0]    tensorCoreChain_11_io_expIn_1;
  wire       [7:0]    tensorCoreChain_11_io_expIn_2;
  wire       [7:0]    tensorCoreChain_11_io_expCascadeIn;
  reg                 colMem_0_wren;
  wire       [6:0]    colMem_0_rdaddress;
  wire       [6:0]    colMem_0_wraddress;
  reg                 colMem_1_wren;
  wire       [6:0]    colMem_1_rdaddress;
  wire       [6:0]    colMem_1_wraddress;
  reg                 colMem_2_wren;
  wire       [6:0]    colMem_2_rdaddress;
  wire       [6:0]    colMem_2_wraddress;
  reg                 rowMem_0_wren;
  wire       [6:0]    rowMem_0_rdaddress;
  wire       [6:0]    rowMem_0_wraddress;
  reg                 rowMem_1_wren;
  wire       [6:0]    rowMem_1_rdaddress;
  wire       [6:0]    rowMem_1_wraddress;
  reg                 rowMem_2_wren;
  wire       [6:0]    rowMem_2_rdaddress;
  wire       [6:0]    rowMem_2_wraddress;
  reg                 rowMem_3_wren;
  wire       [6:0]    rowMem_3_rdaddress;
  wire       [6:0]    rowMem_3_wraddress;
  reg                 rowMem_4_wren;
  wire       [6:0]    rowMem_4_rdaddress;
  wire       [6:0]    rowMem_4_wraddress;
  reg                 rowMem_5_wren;
  wire       [6:0]    rowMem_5_rdaddress;
  wire       [6:0]    rowMem_5_wraddress;
  wire                outputBuffer_wrreq;
  wire       [431:0]  outputBuffer_data;
  wire                tensorCoreChain_6_io_dataIterReady;
  wire                tensorCoreChain_6_io_loadReady;
  wire       [23:0]   tensorCoreChain_6_io_res_0;
  wire       [23:0]   tensorCoreChain_6_io_res_1;
  wire       [23:0]   tensorCoreChain_6_io_res_2;
  wire                tensorCoreChain_6_io_outValid;
  wire                tensorCoreChain_7_io_dataIterReady;
  wire                tensorCoreChain_7_io_loadReady;
  wire       [23:0]   tensorCoreChain_7_io_res_0;
  wire       [23:0]   tensorCoreChain_7_io_res_1;
  wire       [23:0]   tensorCoreChain_7_io_res_2;
  wire                tensorCoreChain_7_io_outValid;
  wire                tensorCoreChain_8_io_dataIterReady;
  wire                tensorCoreChain_8_io_loadReady;
  wire       [23:0]   tensorCoreChain_8_io_res_0;
  wire       [23:0]   tensorCoreChain_8_io_res_1;
  wire       [23:0]   tensorCoreChain_8_io_res_2;
  wire                tensorCoreChain_8_io_outValid;
  wire                tensorCoreChain_9_io_dataIterReady;
  wire                tensorCoreChain_9_io_loadReady;
  wire       [23:0]   tensorCoreChain_9_io_res_0;
  wire       [23:0]   tensorCoreChain_9_io_res_1;
  wire       [23:0]   tensorCoreChain_9_io_res_2;
  wire                tensorCoreChain_9_io_outValid;
  wire                tensorCoreChain_10_io_dataIterReady;
  wire                tensorCoreChain_10_io_loadReady;
  wire       [23:0]   tensorCoreChain_10_io_res_0;
  wire       [23:0]   tensorCoreChain_10_io_res_1;
  wire       [23:0]   tensorCoreChain_10_io_res_2;
  wire                tensorCoreChain_10_io_outValid;
  wire                tensorCoreChain_11_io_dataIterReady;
  wire                tensorCoreChain_11_io_loadReady;
  wire       [23:0]   tensorCoreChain_11_io_res_0;
  wire       [23:0]   tensorCoreChain_11_io_res_1;
  wire       [23:0]   tensorCoreChain_11_io_res_2;
  wire                tensorCoreChain_11_io_outValid;
  wire       [87:0]   colMem_0_q;
  wire       [87:0]   colMem_1_q;
  wire       [87:0]   colMem_2_q;
  wire       [87:0]   rowMem_0_q;
  wire       [87:0]   rowMem_1_q;
  wire       [87:0]   rowMem_2_q;
  wire       [87:0]   rowMem_3_q;
  wire       [87:0]   rowMem_4_q;
  wire       [87:0]   rowMem_5_q;
  wire                colConverters_0_io_dataOut_valid;
  wire       [87:0]   colConverters_0_io_dataOut_payload;
  wire                colConverters_1_io_dataOut_valid;
  wire       [87:0]   colConverters_1_io_dataOut_payload;
  wire                colConverters_2_io_dataOut_valid;
  wire       [87:0]   colConverters_2_io_dataOut_payload;
  wire                fixedBfpConverter_9_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_9_io_dataOut_payload;
  wire                fixedBfpConverter_10_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_10_io_dataOut_payload;
  wire                fixedBfpConverter_11_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_11_io_dataOut_payload;
  wire                fixedBfpConverter_12_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_12_io_dataOut_payload;
  wire                fixedBfpConverter_13_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_13_io_dataOut_payload;
  wire                fixedBfpConverter_14_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_14_io_dataOut_payload;
  wire                outputBuffer_full;
  wire                outputBuffer_empty;
  wire       [431:0]  outputBuffer_q;
  wire       [4:0]    _zz_rowBufferRdCounter_valueNext;
  wire       [0:0]    _zz_rowBufferRdCounter_valueNext_1;
  wire       [4:0]    _zz_colBufferRdCounter_valueNext;
  wire       [0:0]    _zz_colBufferRdCounter_valueNext_1;
  wire       [4:0]    _zz__zz_wraddress_1;
  wire       [0:0]    _zz__zz_wraddress_1_1;
  wire       [4:0]    _zz__zz_wraddress_4;
  wire       [0:0]    _zz__zz_wraddress_4_1;
  wire       [4:0]    _zz__zz_wraddress_7;
  wire       [0:0]    _zz__zz_wraddress_7_1;
  wire       [4:0]    _zz__zz_wraddress_10;
  wire       [0:0]    _zz__zz_wraddress_10_1;
  wire       [4:0]    _zz__zz_wraddress_13;
  wire       [0:0]    _zz__zz_wraddress_13_1;
  wire       [4:0]    _zz__zz_wraddress_16;
  wire       [0:0]    _zz__zz_wraddress_16_1;
  wire       [4:0]    _zz__zz_wraddress_19;
  wire       [0:0]    _zz__zz_wraddress_19_1;
  wire       [4:0]    _zz__zz_wraddress_22;
  wire       [0:0]    _zz__zz_wraddress_22_1;
  wire       [4:0]    _zz__zz_wraddress_25;
  wire       [0:0]    _zz__zz_wraddress_25_1;
  wire       [7:0]    _zz_ctrlStateMachine_loadIterCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_loadIterCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_computeIterCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_computeIterCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_resValidCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_resValidCounter_valueNext_1;
  reg                 rowBufferRdCounter_willIncrement;
  reg                 rowBufferRdCounter_willClear;
  reg        [4:0]    rowBufferRdCounter_valueNext;
  reg        [4:0]    rowBufferRdCounter_value;
  wire                rowBufferRdCounter_willOverflowIfInc;
  wire                rowBufferRdCounter_willOverflow;
  reg                 colBufferRdCounter_willIncrement;
  reg                 colBufferRdCounter_willClear;
  reg        [4:0]    colBufferRdCounter_valueNext;
  reg        [4:0]    colBufferRdCounter_value;
  wire                colBufferRdCounter_willOverflowIfInc;
  wire                colBufferRdCounter_willOverflow;
  reg                 tensorLoadValid;
  reg                 tensorDataValid;
  reg        [7:0]    computeItersReg;
  reg                 io_calEn_delay_1;
  reg                 calEnDelay;
  reg        [7:0]    io_computeIters_delay_1;
  reg        [7:0]    computeItersDelay;
  reg                 tcArrayRes_valid;
  wire       [71:0]   tcArrayRes_payload_0;
  wire       [71:0]   tcArrayRes_payload_1;
  wire       [71:0]   tcArrayRes_payload_2;
  wire       [71:0]   tcArrayRes_payload_3;
  wire       [71:0]   tcArrayRes_payload_4;
  wire       [71:0]   tcArrayRes_payload_5;
  reg                 _zz_wraddress;
  reg                 _zz_1;
  reg        [4:0]    _zz_wraddress_1;
  reg        [4:0]    _zz_wraddress_2;
  wire                _zz_2;
  wire                _zz_3;
  reg                 _zz_wraddress_3;
  reg                 _zz_4;
  reg        [4:0]    _zz_wraddress_4;
  reg        [4:0]    _zz_wraddress_5;
  wire                _zz_5;
  wire                _zz_6;
  reg                 _zz_wraddress_6;
  reg                 _zz_7;
  reg        [4:0]    _zz_wraddress_7;
  reg        [4:0]    _zz_wraddress_8;
  wire                _zz_8;
  wire                _zz_9;
  reg                 _zz_wraddress_9;
  reg                 _zz_10;
  reg        [4:0]    _zz_wraddress_10;
  reg        [4:0]    _zz_wraddress_11;
  wire                _zz_11;
  wire                _zz_12;
  reg                 _zz_wraddress_12;
  reg                 _zz_13;
  reg        [4:0]    _zz_wraddress_13;
  reg        [4:0]    _zz_wraddress_14;
  wire                _zz_14;
  wire                _zz_15;
  reg                 _zz_wraddress_15;
  reg                 _zz_16;
  reg        [4:0]    _zz_wraddress_16;
  reg        [4:0]    _zz_wraddress_17;
  wire                _zz_17;
  wire                _zz_18;
  reg                 _zz_wraddress_18;
  reg                 _zz_19;
  reg        [4:0]    _zz_wraddress_19;
  reg        [4:0]    _zz_wraddress_20;
  wire                _zz_20;
  wire                _zz_21;
  reg                 _zz_wraddress_21;
  reg                 _zz_22;
  reg        [4:0]    _zz_wraddress_22;
  reg        [4:0]    _zz_wraddress_23;
  wire                _zz_23;
  wire                _zz_24;
  reg                 _zz_wraddress_24;
  reg                 _zz_25;
  reg        [4:0]    _zz_wraddress_25;
  reg        [4:0]    _zz_wraddress_26;
  wire                _zz_26;
  wire                _zz_27;
  wire       [87:0]   _zz_io_dataIn_0;
  wire       [87:0]   _zz_io_dataIn_1;
  wire       [87:0]   _zz_io_dataIn_2;
  reg                 tensorLoadValid_delay_1;
  reg                 tensorDataValid_delay_1;
  wire       [87:0]   _zz_io_dataIn_0_1;
  wire       [87:0]   _zz_io_dataIn_1_1;
  wire       [87:0]   _zz_io_dataIn_2_1;
  reg                 tensorLoadValid_delay_1_1;
  reg                 tensorDataValid_delay_1_1;
  wire       [87:0]   _zz_io_dataIn_0_2;
  wire       [87:0]   _zz_io_dataIn_1_2;
  wire       [87:0]   _zz_io_dataIn_2_2;
  reg                 tensorLoadValid_delay_1_2;
  reg                 tensorDataValid_delay_1_2;
  wire       [87:0]   _zz_io_dataIn_0_3;
  wire       [87:0]   _zz_io_dataIn_1_3;
  wire       [87:0]   _zz_io_dataIn_2_3;
  reg                 tensorLoadValid_delay_1_3;
  reg                 tensorDataValid_delay_1_3;
  wire       [87:0]   _zz_io_dataIn_0_4;
  wire       [87:0]   _zz_io_dataIn_1_4;
  wire       [87:0]   _zz_io_dataIn_2_4;
  reg                 tensorLoadValid_delay_1_4;
  reg                 tensorDataValid_delay_1_4;
  wire       [87:0]   _zz_io_dataIn_0_5;
  wire       [87:0]   _zz_io_dataIn_1_5;
  wire       [87:0]   _zz_io_dataIn_2_5;
  reg                 tensorLoadValid_delay_1_5;
  reg                 tensorDataValid_delay_1_5;
  wire                ctrlStateMachine_wantExit;
  reg                 ctrlStateMachine_wantStart;
  wire                ctrlStateMachine_wantKill;
  wire                ctrlStateMachine_loadRdy;
  wire                ctrlStateMachine_dataInIterReady;
  wire                ctrlStateMachine_resOutValid;
  reg                 ctrlStateMachine_loadFinish;
  reg                 ctrlStateMachine_dataInFinish;
  wire       [7:0]    ctrlStateMachine_loadIterCounter_overflowVal;
  reg                 ctrlStateMachine_loadIterCounter_willIncrement;
  reg                 ctrlStateMachine_loadIterCounter_willClear;
  reg        [7:0]    ctrlStateMachine_loadIterCounter_valueNext;
  reg        [7:0]    ctrlStateMachine_loadIterCounter_value;
  wire                ctrlStateMachine_loadIterCounter_willOverflowIfInc;
  wire                ctrlStateMachine_loadIterCounter_willOverflow;
  wire       [7:0]    ctrlStateMachine_computeIterCounter_overflowVal;
  reg                 ctrlStateMachine_computeIterCounter_willIncrement;
  reg                 ctrlStateMachine_computeIterCounter_willClear;
  reg        [7:0]    ctrlStateMachine_computeIterCounter_valueNext;
  reg        [7:0]    ctrlStateMachine_computeIterCounter_value;
  wire                ctrlStateMachine_computeIterCounter_willOverflowIfInc;
  wire                ctrlStateMachine_computeIterCounter_willOverflow;
  wire       [7:0]    ctrlStateMachine_resValidCounter_overflowVal;
  reg                 ctrlStateMachine_resValidCounter_willIncrement;
  reg                 ctrlStateMachine_resValidCounter_willClear;
  reg        [7:0]    ctrlStateMachine_resValidCounter_valueNext;
  reg        [7:0]    ctrlStateMachine_resValidCounter_value;
  wire                ctrlStateMachine_resValidCounter_willOverflowIfInc;
  wire                ctrlStateMachine_resValidCounter_willOverflow;
  reg        `ctrlStateMachine_enumDefinition_binary_sequential_type ctrlStateMachine_stateReg;
  reg        `ctrlStateMachine_enumDefinition_binary_sequential_type ctrlStateMachine_stateNext;
  wire                when_TensorCoreChainArray_l164;
  wire                when_TensorCoreChainArray_l174;
  wire                when_StateMachine_l230;
  wire                when_StateMachine_l230_1;
  wire                when_StateMachine_l230_2;
  `ifndef SYNTHESIS
  reg [207:0] ctrlStateMachine_stateReg_string;
  reg [207:0] ctrlStateMachine_stateNext_string;
  `endif


  assign _zz_rowBufferRdCounter_valueNext_1 = rowBufferRdCounter_willIncrement;
  assign _zz_rowBufferRdCounter_valueNext = {4'd0, _zz_rowBufferRdCounter_valueNext_1};
  assign _zz_colBufferRdCounter_valueNext_1 = colBufferRdCounter_willIncrement;
  assign _zz_colBufferRdCounter_valueNext = {4'd0, _zz_colBufferRdCounter_valueNext_1};
  assign _zz__zz_wraddress_1_1 = _zz_wraddress;
  assign _zz__zz_wraddress_1 = {4'd0, _zz__zz_wraddress_1_1};
  assign _zz__zz_wraddress_4_1 = _zz_wraddress_3;
  assign _zz__zz_wraddress_4 = {4'd0, _zz__zz_wraddress_4_1};
  assign _zz__zz_wraddress_7_1 = _zz_wraddress_6;
  assign _zz__zz_wraddress_7 = {4'd0, _zz__zz_wraddress_7_1};
  assign _zz__zz_wraddress_10_1 = _zz_wraddress_9;
  assign _zz__zz_wraddress_10 = {4'd0, _zz__zz_wraddress_10_1};
  assign _zz__zz_wraddress_13_1 = _zz_wraddress_12;
  assign _zz__zz_wraddress_13 = {4'd0, _zz__zz_wraddress_13_1};
  assign _zz__zz_wraddress_16_1 = _zz_wraddress_15;
  assign _zz__zz_wraddress_16 = {4'd0, _zz__zz_wraddress_16_1};
  assign _zz__zz_wraddress_19_1 = _zz_wraddress_18;
  assign _zz__zz_wraddress_19 = {4'd0, _zz__zz_wraddress_19_1};
  assign _zz__zz_wraddress_22_1 = _zz_wraddress_21;
  assign _zz__zz_wraddress_22 = {4'd0, _zz__zz_wraddress_22_1};
  assign _zz__zz_wraddress_25_1 = _zz_wraddress_24;
  assign _zz__zz_wraddress_25 = {4'd0, _zz__zz_wraddress_25_1};
  assign _zz_ctrlStateMachine_loadIterCounter_valueNext_1 = ctrlStateMachine_loadIterCounter_willIncrement;
  assign _zz_ctrlStateMachine_loadIterCounter_valueNext = {7'd0, _zz_ctrlStateMachine_loadIterCounter_valueNext_1};
  assign _zz_ctrlStateMachine_computeIterCounter_valueNext_1 = ctrlStateMachine_computeIterCounter_willIncrement;
  assign _zz_ctrlStateMachine_computeIterCounter_valueNext = {7'd0, _zz_ctrlStateMachine_computeIterCounter_valueNext_1};
  assign _zz_ctrlStateMachine_resValidCounter_valueNext_1 = ctrlStateMachine_resValidCounter_willIncrement;
  assign _zz_ctrlStateMachine_resValidCounter_valueNext = {7'd0, _zz_ctrlStateMachine_resValidCounter_valueNext_1};
  TensorCoreChain tensorCoreChain_6 (
    .io_dataIn_0         (tensorCoreChain_6_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_6_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_6_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_6_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_6_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_6_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_6_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_6_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid_delay_1             ), //i
    .io_dataIterReady    (tensorCoreChain_6_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid_delay_1             ), //i
    .io_loadReady        (tensorCoreChain_6_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_6_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_6_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_6_io_res_2          ), //o
    .io_inputIters       (8'h09                               ), //i
    .io_outValid         (tensorCoreChain_6_io_outValid       ), //o
    .clk                 (clk                                 ), //i
    .resetn              (resetn                              )  //i
  );
  TensorCoreChain tensorCoreChain_7 (
    .io_dataIn_0         (tensorCoreChain_7_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_7_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_7_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_7_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_7_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_7_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_7_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_7_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid_delay_1_1           ), //i
    .io_dataIterReady    (tensorCoreChain_7_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid_delay_1_1           ), //i
    .io_loadReady        (tensorCoreChain_7_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_7_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_7_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_7_io_res_2          ), //o
    .io_inputIters       (8'h09                               ), //i
    .io_outValid         (tensorCoreChain_7_io_outValid       ), //o
    .clk                 (clk                                 ), //i
    .resetn              (resetn                              )  //i
  );
  TensorCoreChain tensorCoreChain_8 (
    .io_dataIn_0         (tensorCoreChain_8_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_8_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_8_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_8_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_8_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_8_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_8_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_8_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid_delay_1_2           ), //i
    .io_dataIterReady    (tensorCoreChain_8_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid_delay_1_2           ), //i
    .io_loadReady        (tensorCoreChain_8_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_8_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_8_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_8_io_res_2          ), //o
    .io_inputIters       (8'h09                               ), //i
    .io_outValid         (tensorCoreChain_8_io_outValid       ), //o
    .clk                 (clk                                 ), //i
    .resetn              (resetn                              )  //i
  );
  TensorCoreChain tensorCoreChain_9 (
    .io_dataIn_0         (tensorCoreChain_9_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_9_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_9_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_9_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_9_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_9_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_9_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_9_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid_delay_1_3           ), //i
    .io_dataIterReady    (tensorCoreChain_9_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid_delay_1_3           ), //i
    .io_loadReady        (tensorCoreChain_9_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_9_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_9_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_9_io_res_2          ), //o
    .io_inputIters       (8'h09                               ), //i
    .io_outValid         (tensorCoreChain_9_io_outValid       ), //o
    .clk                 (clk                                 ), //i
    .resetn              (resetn                              )  //i
  );
  TensorCoreChain tensorCoreChain_10 (
    .io_dataIn_0         (tensorCoreChain_10_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_10_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_10_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_10_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_10_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_10_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_10_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_10_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid_delay_1_4            ), //i
    .io_dataIterReady    (tensorCoreChain_10_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid_delay_1_4            ), //i
    .io_loadReady        (tensorCoreChain_10_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_10_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_10_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_10_io_res_2          ), //o
    .io_inputIters       (8'h09                                ), //i
    .io_outValid         (tensorCoreChain_10_io_outValid       ), //o
    .clk                 (clk                                  ), //i
    .resetn              (resetn                               )  //i
  );
  TensorCoreChain tensorCoreChain_11 (
    .io_dataIn_0         (tensorCoreChain_11_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_11_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_11_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_11_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_11_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_11_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_11_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_11_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid_delay_1_5            ), //i
    .io_dataIterReady    (tensorCoreChain_11_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid_delay_1_5            ), //i
    .io_loadReady        (tensorCoreChain_11_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_11_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_11_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_11_io_res_2          ), //o
    .io_inputIters       (8'h09                                ), //i
    .io_outValid         (tensorCoreChain_11_io_outValid       ), //o
    .clk                 (clk                                  ), //i
    .resetn              (resetn                               )  //i
  );
  in_buffer colMem_0 (
    .clock        (clk                                 ), //i
    .wren         (colMem_0_wren                       ), //i
    .rdaddress    (colMem_0_rdaddress                  ), //i
    .wraddress    (colMem_0_wraddress                  ), //i
    .data         (colConverters_0_io_dataOut_payload  ), //i
    .q            (colMem_0_q                          )  //o
  );
  in_buffer colMem_1 (
    .clock        (clk                                 ), //i
    .wren         (colMem_1_wren                       ), //i
    .rdaddress    (colMem_1_rdaddress                  ), //i
    .wraddress    (colMem_1_wraddress                  ), //i
    .data         (colConverters_1_io_dataOut_payload  ), //i
    .q            (colMem_1_q                          )  //o
  );
  in_buffer colMem_2 (
    .clock        (clk                                 ), //i
    .wren         (colMem_2_wren                       ), //i
    .rdaddress    (colMem_2_rdaddress                  ), //i
    .wraddress    (colMem_2_wraddress                  ), //i
    .data         (colConverters_2_io_dataOut_payload  ), //i
    .q            (colMem_2_q                          )  //o
  );
  in_buffer rowMem_0 (
    .clock        (clk                                     ), //i
    .wren         (rowMem_0_wren                           ), //i
    .rdaddress    (rowMem_0_rdaddress                      ), //i
    .wraddress    (rowMem_0_wraddress                      ), //i
    .data         (fixedBfpConverter_9_io_dataOut_payload  ), //i
    .q            (rowMem_0_q                              )  //o
  );
  in_buffer rowMem_1 (
    .clock        (clk                                      ), //i
    .wren         (rowMem_1_wren                            ), //i
    .rdaddress    (rowMem_1_rdaddress                       ), //i
    .wraddress    (rowMem_1_wraddress                       ), //i
    .data         (fixedBfpConverter_10_io_dataOut_payload  ), //i
    .q            (rowMem_1_q                               )  //o
  );
  in_buffer rowMem_2 (
    .clock        (clk                                      ), //i
    .wren         (rowMem_2_wren                            ), //i
    .rdaddress    (rowMem_2_rdaddress                       ), //i
    .wraddress    (rowMem_2_wraddress                       ), //i
    .data         (fixedBfpConverter_11_io_dataOut_payload  ), //i
    .q            (rowMem_2_q                               )  //o
  );
  in_buffer rowMem_3 (
    .clock        (clk                                      ), //i
    .wren         (rowMem_3_wren                            ), //i
    .rdaddress    (rowMem_3_rdaddress                       ), //i
    .wraddress    (rowMem_3_wraddress                       ), //i
    .data         (fixedBfpConverter_12_io_dataOut_payload  ), //i
    .q            (rowMem_3_q                               )  //o
  );
  in_buffer rowMem_4 (
    .clock        (clk                                      ), //i
    .wren         (rowMem_4_wren                            ), //i
    .rdaddress    (rowMem_4_rdaddress                       ), //i
    .wraddress    (rowMem_4_wraddress                       ), //i
    .data         (fixedBfpConverter_13_io_dataOut_payload  ), //i
    .q            (rowMem_4_q                               )  //o
  );
  in_buffer rowMem_5 (
    .clock        (clk                                      ), //i
    .wren         (rowMem_5_wren                            ), //i
    .rdaddress    (rowMem_5_rdaddress                       ), //i
    .wraddress    (rowMem_5_wraddress                       ), //i
    .data         (fixedBfpConverter_14_io_dataOut_payload  ), //i
    .q            (rowMem_5_q                               )  //o
  );
  FixedBfpConverter colConverters_0 (
    .io_dataIn_valid       (io_matALoad_0_valid                 ), //i
    .io_dataIn_payload     (io_matALoad_0_payload               ), //i
    .io_dataOut_valid      (colConverters_0_io_dataOut_valid    ), //o
    .io_dataOut_payload    (colConverters_0_io_dataOut_payload  ), //o
    .clk                   (clk                                 ), //i
    .resetn                (resetn                              )  //i
  );
  FixedBfpConverter colConverters_1 (
    .io_dataIn_valid       (io_matALoad_1_valid                 ), //i
    .io_dataIn_payload     (io_matALoad_1_payload               ), //i
    .io_dataOut_valid      (colConverters_1_io_dataOut_valid    ), //o
    .io_dataOut_payload    (colConverters_1_io_dataOut_payload  ), //o
    .clk                   (clk                                 ), //i
    .resetn                (resetn                              )  //i
  );
  FixedBfpConverter colConverters_2 (
    .io_dataIn_valid       (io_matALoad_2_valid                 ), //i
    .io_dataIn_payload     (io_matALoad_2_payload               ), //i
    .io_dataOut_valid      (colConverters_2_io_dataOut_valid    ), //o
    .io_dataOut_payload    (colConverters_2_io_dataOut_payload  ), //o
    .clk                   (clk                                 ), //i
    .resetn                (resetn                              )  //i
  );
  FixedBfpConverter fixedBfpConverter_9 (
    .io_dataIn_valid       (io_matBLoad_0_0_valid                   ), //i
    .io_dataIn_payload     (io_matBLoad_0_0_payload                 ), //i
    .io_dataOut_valid      (fixedBfpConverter_9_io_dataOut_valid    ), //o
    .io_dataOut_payload    (fixedBfpConverter_9_io_dataOut_payload  ), //o
    .clk                   (clk                                     ), //i
    .resetn                (resetn                                  )  //i
  );
  FixedBfpConverter fixedBfpConverter_10 (
    .io_dataIn_valid       (io_matBLoad_0_1_valid                    ), //i
    .io_dataIn_payload     (io_matBLoad_0_1_payload                  ), //i
    .io_dataOut_valid      (fixedBfpConverter_10_io_dataOut_valid    ), //o
    .io_dataOut_payload    (fixedBfpConverter_10_io_dataOut_payload  ), //o
    .clk                   (clk                                      ), //i
    .resetn                (resetn                                   )  //i
  );
  FixedBfpConverter fixedBfpConverter_11 (
    .io_dataIn_valid       (io_matBLoad_0_2_valid                    ), //i
    .io_dataIn_payload     (io_matBLoad_0_2_payload                  ), //i
    .io_dataOut_valid      (fixedBfpConverter_11_io_dataOut_valid    ), //o
    .io_dataOut_payload    (fixedBfpConverter_11_io_dataOut_payload  ), //o
    .clk                   (clk                                      ), //i
    .resetn                (resetn                                   )  //i
  );
  FixedBfpConverter fixedBfpConverter_12 (
    .io_dataIn_valid       (io_matBLoad_1_0_valid                    ), //i
    .io_dataIn_payload     (io_matBLoad_1_0_payload                  ), //i
    .io_dataOut_valid      (fixedBfpConverter_12_io_dataOut_valid    ), //o
    .io_dataOut_payload    (fixedBfpConverter_12_io_dataOut_payload  ), //o
    .clk                   (clk                                      ), //i
    .resetn                (resetn                                   )  //i
  );
  FixedBfpConverter fixedBfpConverter_13 (
    .io_dataIn_valid       (io_matBLoad_1_1_valid                    ), //i
    .io_dataIn_payload     (io_matBLoad_1_1_payload                  ), //i
    .io_dataOut_valid      (fixedBfpConverter_13_io_dataOut_valid    ), //o
    .io_dataOut_payload    (fixedBfpConverter_13_io_dataOut_payload  ), //o
    .clk                   (clk                                      ), //i
    .resetn                (resetn                                   )  //i
  );
  FixedBfpConverter fixedBfpConverter_14 (
    .io_dataIn_valid       (io_matBLoad_1_2_valid                    ), //i
    .io_dataIn_payload     (io_matBLoad_1_2_payload                  ), //i
    .io_dataOut_valid      (fixedBfpConverter_14_io_dataOut_valid    ), //o
    .io_dataOut_payload    (fixedBfpConverter_14_io_dataOut_payload  ), //o
    .clk                   (clk                                      ), //i
    .resetn                (resetn                                   )  //i
  );
  out_fifo outputBuffer (
    .clock    (clk                 ), //i
    .wrreq    (outputBuffer_wrreq  ), //i
    .rdreq    (io_res_ready        ), //i
    .full     (outputBuffer_full   ), //o
    .empty    (outputBuffer_empty  ), //o
    .data     (outputBuffer_data   ), //i
    .q        (outputBuffer_q      )  //o
  );
  `ifndef SYNTHESIS
  always @(*) begin
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT : ctrlStateMachine_stateReg_string = "ctrlStateMachine_BOOT     ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : ctrlStateMachine_stateReg_string = "ctrlStateMachine_sIdle    ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : ctrlStateMachine_stateReg_string = "ctrlStateMachine_sPreLoad ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : ctrlStateMachine_stateReg_string = "ctrlStateMachine_sCompute ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : ctrlStateMachine_stateReg_string = "ctrlStateMachine_sWriteRes";
      default : ctrlStateMachine_stateReg_string = "??????????????????????????";
    endcase
  end
  always @(*) begin
    case(ctrlStateMachine_stateNext)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT : ctrlStateMachine_stateNext_string = "ctrlStateMachine_BOOT     ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : ctrlStateMachine_stateNext_string = "ctrlStateMachine_sIdle    ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : ctrlStateMachine_stateNext_string = "ctrlStateMachine_sPreLoad ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : ctrlStateMachine_stateNext_string = "ctrlStateMachine_sCompute ";
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : ctrlStateMachine_stateNext_string = "ctrlStateMachine_sWriteRes";
      default : ctrlStateMachine_stateNext_string = "??????????????????????????";
    endcase
  end
  `endif

  always @(*) begin
    rowBufferRdCounter_willIncrement = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(when_TensorCoreChainArray_l164) begin
          rowBufferRdCounter_willIncrement = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l230_2) begin
      rowBufferRdCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowBufferRdCounter_willClear = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(!when_TensorCoreChainArray_l164) begin
          rowBufferRdCounter_willClear = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l230) begin
      rowBufferRdCounter_willClear = 1'b1;
    end
  end

  assign rowBufferRdCounter_willOverflowIfInc = (rowBufferRdCounter_value == 5'h1a);
  assign rowBufferRdCounter_willOverflow = (rowBufferRdCounter_willOverflowIfInc && rowBufferRdCounter_willIncrement);
  always @(*) begin
    if(rowBufferRdCounter_willOverflow) begin
      rowBufferRdCounter_valueNext = 5'h0;
    end else begin
      rowBufferRdCounter_valueNext = (rowBufferRdCounter_value + _zz_rowBufferRdCounter_valueNext);
    end
    if(rowBufferRdCounter_willClear) begin
      rowBufferRdCounter_valueNext = 5'h0;
    end
  end

  always @(*) begin
    colBufferRdCounter_willIncrement = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
        colBufferRdCounter_willIncrement = 1'b1;
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(when_TensorCoreChainArray_l174) begin
          colBufferRdCounter_willIncrement = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l230_1) begin
      colBufferRdCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    colBufferRdCounter_willClear = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(!when_TensorCoreChainArray_l174) begin
          colBufferRdCounter_willClear = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l230) begin
      colBufferRdCounter_willClear = 1'b1;
    end
  end

  assign colBufferRdCounter_willOverflowIfInc = (colBufferRdCounter_value == 5'h1a);
  assign colBufferRdCounter_willOverflow = (colBufferRdCounter_willOverflowIfInc && colBufferRdCounter_willIncrement);
  always @(*) begin
    if(colBufferRdCounter_willOverflow) begin
      colBufferRdCounter_valueNext = 5'h0;
    end else begin
      colBufferRdCounter_valueNext = (colBufferRdCounter_value + _zz_colBufferRdCounter_valueNext);
    end
    if(colBufferRdCounter_willClear) begin
      colBufferRdCounter_valueNext = 5'h0;
    end
  end

  always @(*) begin
    _zz_wraddress = 1'b0;
    if(colConverters_0_io_dataOut_valid) begin
      _zz_wraddress = 1'b1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(!colConverters_0_io_dataOut_valid) begin
      _zz_1 = 1'b1;
    end
  end

  assign _zz_2 = (_zz_wraddress_2 == 5'h1a);
  assign _zz_3 = (_zz_2 && _zz_wraddress);
  always @(*) begin
    if(_zz_3) begin
      _zz_wraddress_1 = 5'h0;
    end else begin
      _zz_wraddress_1 = (_zz_wraddress_2 + _zz__zz_wraddress_1);
    end
    if(_zz_1) begin
      _zz_wraddress_1 = 5'h0;
    end
  end

  assign colMem_0_wraddress = {2'd0, _zz_wraddress_2};
  assign colMem_0_rdaddress = {2'd0, colBufferRdCounter_value};
  always @(*) begin
    if(colConverters_0_io_dataOut_valid) begin
      colMem_0_wren = 1'b1;
    end else begin
      colMem_0_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_3 = 1'b0;
    if(colConverters_1_io_dataOut_valid) begin
      _zz_wraddress_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(!colConverters_1_io_dataOut_valid) begin
      _zz_4 = 1'b1;
    end
  end

  assign _zz_5 = (_zz_wraddress_5 == 5'h1a);
  assign _zz_6 = (_zz_5 && _zz_wraddress_3);
  always @(*) begin
    if(_zz_6) begin
      _zz_wraddress_4 = 5'h0;
    end else begin
      _zz_wraddress_4 = (_zz_wraddress_5 + _zz__zz_wraddress_4);
    end
    if(_zz_4) begin
      _zz_wraddress_4 = 5'h0;
    end
  end

  assign colMem_1_wraddress = {2'd0, _zz_wraddress_5};
  assign colMem_1_rdaddress = {2'd0, colBufferRdCounter_value};
  always @(*) begin
    if(colConverters_1_io_dataOut_valid) begin
      colMem_1_wren = 1'b1;
    end else begin
      colMem_1_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_6 = 1'b0;
    if(colConverters_2_io_dataOut_valid) begin
      _zz_wraddress_6 = 1'b1;
    end
  end

  always @(*) begin
    _zz_7 = 1'b0;
    if(!colConverters_2_io_dataOut_valid) begin
      _zz_7 = 1'b1;
    end
  end

  assign _zz_8 = (_zz_wraddress_8 == 5'h1a);
  assign _zz_9 = (_zz_8 && _zz_wraddress_6);
  always @(*) begin
    if(_zz_9) begin
      _zz_wraddress_7 = 5'h0;
    end else begin
      _zz_wraddress_7 = (_zz_wraddress_8 + _zz__zz_wraddress_7);
    end
    if(_zz_7) begin
      _zz_wraddress_7 = 5'h0;
    end
  end

  assign colMem_2_wraddress = {2'd0, _zz_wraddress_8};
  assign colMem_2_rdaddress = {2'd0, colBufferRdCounter_value};
  always @(*) begin
    if(colConverters_2_io_dataOut_valid) begin
      colMem_2_wren = 1'b1;
    end else begin
      colMem_2_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_9 = 1'b0;
    if(fixedBfpConverter_9_io_dataOut_valid) begin
      _zz_wraddress_9 = 1'b1;
    end
  end

  always @(*) begin
    _zz_10 = 1'b0;
    if(!fixedBfpConverter_9_io_dataOut_valid) begin
      _zz_10 = 1'b1;
    end
  end

  assign _zz_11 = (_zz_wraddress_11 == 5'h1a);
  assign _zz_12 = (_zz_11 && _zz_wraddress_9);
  always @(*) begin
    if(_zz_12) begin
      _zz_wraddress_10 = 5'h0;
    end else begin
      _zz_wraddress_10 = (_zz_wraddress_11 + _zz__zz_wraddress_10);
    end
    if(_zz_10) begin
      _zz_wraddress_10 = 5'h0;
    end
  end

  assign rowMem_0_wraddress = {2'd0, _zz_wraddress_11};
  assign rowMem_0_rdaddress = {2'd0, rowBufferRdCounter_value};
  always @(*) begin
    if(fixedBfpConverter_9_io_dataOut_valid) begin
      rowMem_0_wren = 1'b1;
    end else begin
      rowMem_0_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_12 = 1'b0;
    if(fixedBfpConverter_10_io_dataOut_valid) begin
      _zz_wraddress_12 = 1'b1;
    end
  end

  always @(*) begin
    _zz_13 = 1'b0;
    if(!fixedBfpConverter_10_io_dataOut_valid) begin
      _zz_13 = 1'b1;
    end
  end

  assign _zz_14 = (_zz_wraddress_14 == 5'h1a);
  assign _zz_15 = (_zz_14 && _zz_wraddress_12);
  always @(*) begin
    if(_zz_15) begin
      _zz_wraddress_13 = 5'h0;
    end else begin
      _zz_wraddress_13 = (_zz_wraddress_14 + _zz__zz_wraddress_13);
    end
    if(_zz_13) begin
      _zz_wraddress_13 = 5'h0;
    end
  end

  assign rowMem_1_wraddress = {2'd0, _zz_wraddress_14};
  assign rowMem_1_rdaddress = {2'd0, rowBufferRdCounter_value};
  always @(*) begin
    if(fixedBfpConverter_10_io_dataOut_valid) begin
      rowMem_1_wren = 1'b1;
    end else begin
      rowMem_1_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_15 = 1'b0;
    if(fixedBfpConverter_11_io_dataOut_valid) begin
      _zz_wraddress_15 = 1'b1;
    end
  end

  always @(*) begin
    _zz_16 = 1'b0;
    if(!fixedBfpConverter_11_io_dataOut_valid) begin
      _zz_16 = 1'b1;
    end
  end

  assign _zz_17 = (_zz_wraddress_17 == 5'h1a);
  assign _zz_18 = (_zz_17 && _zz_wraddress_15);
  always @(*) begin
    if(_zz_18) begin
      _zz_wraddress_16 = 5'h0;
    end else begin
      _zz_wraddress_16 = (_zz_wraddress_17 + _zz__zz_wraddress_16);
    end
    if(_zz_16) begin
      _zz_wraddress_16 = 5'h0;
    end
  end

  assign rowMem_2_wraddress = {2'd0, _zz_wraddress_17};
  assign rowMem_2_rdaddress = {2'd0, rowBufferRdCounter_value};
  always @(*) begin
    if(fixedBfpConverter_11_io_dataOut_valid) begin
      rowMem_2_wren = 1'b1;
    end else begin
      rowMem_2_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_18 = 1'b0;
    if(fixedBfpConverter_12_io_dataOut_valid) begin
      _zz_wraddress_18 = 1'b1;
    end
  end

  always @(*) begin
    _zz_19 = 1'b0;
    if(!fixedBfpConverter_12_io_dataOut_valid) begin
      _zz_19 = 1'b1;
    end
  end

  assign _zz_20 = (_zz_wraddress_20 == 5'h1a);
  assign _zz_21 = (_zz_20 && _zz_wraddress_18);
  always @(*) begin
    if(_zz_21) begin
      _zz_wraddress_19 = 5'h0;
    end else begin
      _zz_wraddress_19 = (_zz_wraddress_20 + _zz__zz_wraddress_19);
    end
    if(_zz_19) begin
      _zz_wraddress_19 = 5'h0;
    end
  end

  assign rowMem_3_wraddress = {2'd0, _zz_wraddress_20};
  assign rowMem_3_rdaddress = {2'd0, rowBufferRdCounter_value};
  always @(*) begin
    if(fixedBfpConverter_12_io_dataOut_valid) begin
      rowMem_3_wren = 1'b1;
    end else begin
      rowMem_3_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_21 = 1'b0;
    if(fixedBfpConverter_13_io_dataOut_valid) begin
      _zz_wraddress_21 = 1'b1;
    end
  end

  always @(*) begin
    _zz_22 = 1'b0;
    if(!fixedBfpConverter_13_io_dataOut_valid) begin
      _zz_22 = 1'b1;
    end
  end

  assign _zz_23 = (_zz_wraddress_23 == 5'h1a);
  assign _zz_24 = (_zz_23 && _zz_wraddress_21);
  always @(*) begin
    if(_zz_24) begin
      _zz_wraddress_22 = 5'h0;
    end else begin
      _zz_wraddress_22 = (_zz_wraddress_23 + _zz__zz_wraddress_22);
    end
    if(_zz_22) begin
      _zz_wraddress_22 = 5'h0;
    end
  end

  assign rowMem_4_wraddress = {2'd0, _zz_wraddress_23};
  assign rowMem_4_rdaddress = {2'd0, rowBufferRdCounter_value};
  always @(*) begin
    if(fixedBfpConverter_13_io_dataOut_valid) begin
      rowMem_4_wren = 1'b1;
    end else begin
      rowMem_4_wren = 1'b0;
    end
  end

  always @(*) begin
    _zz_wraddress_24 = 1'b0;
    if(fixedBfpConverter_14_io_dataOut_valid) begin
      _zz_wraddress_24 = 1'b1;
    end
  end

  always @(*) begin
    _zz_25 = 1'b0;
    if(!fixedBfpConverter_14_io_dataOut_valid) begin
      _zz_25 = 1'b1;
    end
  end

  assign _zz_26 = (_zz_wraddress_26 == 5'h1a);
  assign _zz_27 = (_zz_26 && _zz_wraddress_24);
  always @(*) begin
    if(_zz_27) begin
      _zz_wraddress_25 = 5'h0;
    end else begin
      _zz_wraddress_25 = (_zz_wraddress_26 + _zz__zz_wraddress_25);
    end
    if(_zz_25) begin
      _zz_wraddress_25 = 5'h0;
    end
  end

  assign rowMem_5_wraddress = {2'd0, _zz_wraddress_26};
  assign rowMem_5_rdaddress = {2'd0, rowBufferRdCounter_value};
  always @(*) begin
    if(fixedBfpConverter_14_io_dataOut_valid) begin
      rowMem_5_wren = 1'b1;
    end else begin
      rowMem_5_wren = 1'b0;
    end
  end

  assign _zz_io_dataIn_0 = rowMem_0_q;
  assign _zz_io_dataIn_1 = rowMem_1_q;
  assign _zz_io_dataIn_2 = rowMem_2_q;
  assign tensorCoreChain_6_io_dataIn_0 = _zz_io_dataIn_0[87 : 8];
  assign tensorCoreChain_6_io_expIn_0 = _zz_io_dataIn_0[7 : 0];
  assign tensorCoreChain_6_io_dataIn_1 = _zz_io_dataIn_1[87 : 8];
  assign tensorCoreChain_6_io_expIn_1 = _zz_io_dataIn_1[7 : 0];
  assign tensorCoreChain_6_io_dataIn_2 = _zz_io_dataIn_2[87 : 8];
  assign tensorCoreChain_6_io_expIn_2 = _zz_io_dataIn_2[7 : 0];
  assign tensorCoreChain_6_io_loadCascadeIn = colMem_0_q[87 : 8];
  assign tensorCoreChain_6_io_expCascadeIn = colMem_0_q[7 : 0];
  assign tcArrayRes_payload_0 = {tensorCoreChain_6_io_res_2,{tensorCoreChain_6_io_res_1,tensorCoreChain_6_io_res_0}};
  assign _zz_io_dataIn_0_1 = rowMem_0_q;
  assign _zz_io_dataIn_1_1 = rowMem_1_q;
  assign _zz_io_dataIn_2_1 = rowMem_2_q;
  assign tensorCoreChain_7_io_dataIn_0 = _zz_io_dataIn_0_1[87 : 8];
  assign tensorCoreChain_7_io_expIn_0 = _zz_io_dataIn_0_1[7 : 0];
  assign tensorCoreChain_7_io_dataIn_1 = _zz_io_dataIn_1_1[87 : 8];
  assign tensorCoreChain_7_io_expIn_1 = _zz_io_dataIn_1_1[7 : 0];
  assign tensorCoreChain_7_io_dataIn_2 = _zz_io_dataIn_2_1[87 : 8];
  assign tensorCoreChain_7_io_expIn_2 = _zz_io_dataIn_2_1[7 : 0];
  assign tensorCoreChain_7_io_loadCascadeIn = colMem_1_q[87 : 8];
  assign tensorCoreChain_7_io_expCascadeIn = colMem_1_q[7 : 0];
  assign tcArrayRes_payload_1 = {tensorCoreChain_7_io_res_2,{tensorCoreChain_7_io_res_1,tensorCoreChain_7_io_res_0}};
  assign _zz_io_dataIn_0_2 = rowMem_0_q;
  assign _zz_io_dataIn_1_2 = rowMem_1_q;
  assign _zz_io_dataIn_2_2 = rowMem_2_q;
  assign tensorCoreChain_8_io_dataIn_0 = _zz_io_dataIn_0_2[87 : 8];
  assign tensorCoreChain_8_io_expIn_0 = _zz_io_dataIn_0_2[7 : 0];
  assign tensorCoreChain_8_io_dataIn_1 = _zz_io_dataIn_1_2[87 : 8];
  assign tensorCoreChain_8_io_expIn_1 = _zz_io_dataIn_1_2[7 : 0];
  assign tensorCoreChain_8_io_dataIn_2 = _zz_io_dataIn_2_2[87 : 8];
  assign tensorCoreChain_8_io_expIn_2 = _zz_io_dataIn_2_2[7 : 0];
  assign tensorCoreChain_8_io_loadCascadeIn = colMem_2_q[87 : 8];
  assign tensorCoreChain_8_io_expCascadeIn = colMem_2_q[7 : 0];
  assign tcArrayRes_payload_2 = {tensorCoreChain_8_io_res_2,{tensorCoreChain_8_io_res_1,tensorCoreChain_8_io_res_0}};
  assign _zz_io_dataIn_0_3 = rowMem_3_q;
  assign _zz_io_dataIn_1_3 = rowMem_4_q;
  assign _zz_io_dataIn_2_3 = rowMem_5_q;
  assign tensorCoreChain_9_io_dataIn_0 = _zz_io_dataIn_0_3[87 : 8];
  assign tensorCoreChain_9_io_expIn_0 = _zz_io_dataIn_0_3[7 : 0];
  assign tensorCoreChain_9_io_dataIn_1 = _zz_io_dataIn_1_3[87 : 8];
  assign tensorCoreChain_9_io_expIn_1 = _zz_io_dataIn_1_3[7 : 0];
  assign tensorCoreChain_9_io_dataIn_2 = _zz_io_dataIn_2_3[87 : 8];
  assign tensorCoreChain_9_io_expIn_2 = _zz_io_dataIn_2_3[7 : 0];
  assign tensorCoreChain_9_io_loadCascadeIn = colMem_0_q[87 : 8];
  assign tensorCoreChain_9_io_expCascadeIn = colMem_0_q[7 : 0];
  assign tcArrayRes_payload_3 = {tensorCoreChain_9_io_res_2,{tensorCoreChain_9_io_res_1,tensorCoreChain_9_io_res_0}};
  assign _zz_io_dataIn_0_4 = rowMem_3_q;
  assign _zz_io_dataIn_1_4 = rowMem_4_q;
  assign _zz_io_dataIn_2_4 = rowMem_5_q;
  assign tensorCoreChain_10_io_dataIn_0 = _zz_io_dataIn_0_4[87 : 8];
  assign tensorCoreChain_10_io_expIn_0 = _zz_io_dataIn_0_4[7 : 0];
  assign tensorCoreChain_10_io_dataIn_1 = _zz_io_dataIn_1_4[87 : 8];
  assign tensorCoreChain_10_io_expIn_1 = _zz_io_dataIn_1_4[7 : 0];
  assign tensorCoreChain_10_io_dataIn_2 = _zz_io_dataIn_2_4[87 : 8];
  assign tensorCoreChain_10_io_expIn_2 = _zz_io_dataIn_2_4[7 : 0];
  assign tensorCoreChain_10_io_loadCascadeIn = colMem_1_q[87 : 8];
  assign tensorCoreChain_10_io_expCascadeIn = colMem_1_q[7 : 0];
  assign tcArrayRes_payload_4 = {tensorCoreChain_10_io_res_2,{tensorCoreChain_10_io_res_1,tensorCoreChain_10_io_res_0}};
  assign _zz_io_dataIn_0_5 = rowMem_3_q;
  assign _zz_io_dataIn_1_5 = rowMem_4_q;
  assign _zz_io_dataIn_2_5 = rowMem_5_q;
  assign tensorCoreChain_11_io_dataIn_0 = _zz_io_dataIn_0_5[87 : 8];
  assign tensorCoreChain_11_io_expIn_0 = _zz_io_dataIn_0_5[7 : 0];
  assign tensorCoreChain_11_io_dataIn_1 = _zz_io_dataIn_1_5[87 : 8];
  assign tensorCoreChain_11_io_expIn_1 = _zz_io_dataIn_1_5[7 : 0];
  assign tensorCoreChain_11_io_dataIn_2 = _zz_io_dataIn_2_5[87 : 8];
  assign tensorCoreChain_11_io_expIn_2 = _zz_io_dataIn_2_5[7 : 0];
  assign tensorCoreChain_11_io_loadCascadeIn = colMem_2_q[87 : 8];
  assign tensorCoreChain_11_io_expCascadeIn = colMem_2_q[7 : 0];
  assign tcArrayRes_payload_5 = {tensorCoreChain_11_io_res_2,{tensorCoreChain_11_io_res_1,tensorCoreChain_11_io_res_0}};
  always @(*) begin
    tcArrayRes_valid = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
        tcArrayRes_valid = ctrlStateMachine_resValidCounter_willOverflowIfInc;
      end
      default : begin
      end
    endcase
  end

  assign ctrlStateMachine_wantExit = 1'b0;
  always @(*) begin
    ctrlStateMachine_wantStart = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
        ctrlStateMachine_wantStart = 1'b1;
      end
    endcase
  end

  assign ctrlStateMachine_wantKill = 1'b0;
  assign ctrlStateMachine_loadRdy = tensorCoreChain_6_io_loadReady;
  assign ctrlStateMachine_dataInIterReady = tensorCoreChain_6_io_dataIterReady;
  assign ctrlStateMachine_resOutValid = tensorCoreChain_6_io_outValid;
  always @(*) begin
    ctrlStateMachine_loadIterCounter_willIncrement = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
        if(ctrlStateMachine_loadRdy) begin
          ctrlStateMachine_loadIterCounter_willIncrement = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(ctrlStateMachine_loadRdy) begin
          ctrlStateMachine_loadIterCounter_willIncrement = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ctrlStateMachine_loadIterCounter_willClear = 1'b0;
    if(when_StateMachine_l230_1) begin
      ctrlStateMachine_loadIterCounter_willClear = 1'b1;
    end
  end

  assign ctrlStateMachine_loadIterCounter_willOverflowIfInc = (ctrlStateMachine_loadIterCounter_overflowVal <= ctrlStateMachine_loadIterCounter_value);
  assign ctrlStateMachine_loadIterCounter_willOverflow = (ctrlStateMachine_loadIterCounter_willOverflowIfInc && ctrlStateMachine_loadIterCounter_willIncrement);
  always @(*) begin
    if(ctrlStateMachine_loadIterCounter_willOverflow) begin
      ctrlStateMachine_loadIterCounter_valueNext = 8'h0;
    end else begin
      ctrlStateMachine_loadIterCounter_valueNext = (ctrlStateMachine_loadIterCounter_value + _zz_ctrlStateMachine_loadIterCounter_valueNext);
    end
    if(ctrlStateMachine_loadIterCounter_willClear) begin
      ctrlStateMachine_loadIterCounter_valueNext = 8'h0;
    end
  end

  assign ctrlStateMachine_loadIterCounter_overflowVal = (computeItersReg - 8'h01);
  always @(*) begin
    ctrlStateMachine_computeIterCounter_willIncrement = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(ctrlStateMachine_dataInIterReady) begin
          ctrlStateMachine_computeIterCounter_willIncrement = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ctrlStateMachine_computeIterCounter_willClear = 1'b0;
    if(when_StateMachine_l230) begin
      ctrlStateMachine_computeIterCounter_willClear = 1'b1;
    end
  end

  assign ctrlStateMachine_computeIterCounter_willOverflowIfInc = (ctrlStateMachine_computeIterCounter_overflowVal <= ctrlStateMachine_computeIterCounter_value);
  assign ctrlStateMachine_computeIterCounter_willOverflow = (ctrlStateMachine_computeIterCounter_willOverflowIfInc && ctrlStateMachine_computeIterCounter_willIncrement);
  always @(*) begin
    if(ctrlStateMachine_computeIterCounter_willOverflow) begin
      ctrlStateMachine_computeIterCounter_valueNext = 8'h0;
    end else begin
      ctrlStateMachine_computeIterCounter_valueNext = (ctrlStateMachine_computeIterCounter_value + _zz_ctrlStateMachine_computeIterCounter_valueNext);
    end
    if(ctrlStateMachine_computeIterCounter_willClear) begin
      ctrlStateMachine_computeIterCounter_valueNext = 8'h0;
    end
  end

  assign ctrlStateMachine_computeIterCounter_overflowVal = (computeItersReg - 8'h01);
  always @(*) begin
    ctrlStateMachine_resValidCounter_willIncrement = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(ctrlStateMachine_resOutValid) begin
          ctrlStateMachine_resValidCounter_willIncrement = 1'b1;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
        if(ctrlStateMachine_resOutValid) begin
          ctrlStateMachine_resValidCounter_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    ctrlStateMachine_resValidCounter_willClear = 1'b0;
    if(when_StateMachine_l230) begin
      ctrlStateMachine_resValidCounter_willClear = 1'b1;
    end
  end

  assign ctrlStateMachine_resValidCounter_willOverflowIfInc = (ctrlStateMachine_resValidCounter_overflowVal <= ctrlStateMachine_resValidCounter_value);
  assign ctrlStateMachine_resValidCounter_willOverflow = (ctrlStateMachine_resValidCounter_willOverflowIfInc && ctrlStateMachine_resValidCounter_willIncrement);
  always @(*) begin
    if(ctrlStateMachine_resValidCounter_willOverflow) begin
      ctrlStateMachine_resValidCounter_valueNext = 8'h0;
    end else begin
      ctrlStateMachine_resValidCounter_valueNext = (ctrlStateMachine_resValidCounter_value + _zz_ctrlStateMachine_resValidCounter_valueNext);
    end
    if(ctrlStateMachine_resValidCounter_willClear) begin
      ctrlStateMachine_resValidCounter_valueNext = 8'h0;
    end
  end

  assign ctrlStateMachine_resValidCounter_overflowVal = (computeItersReg - 8'h01);
  assign outputBuffer_wrreq = (tcArrayRes_valid && (! outputBuffer_full));
  assign outputBuffer_data = {tcArrayRes_payload_5,{tcArrayRes_payload_4,{tcArrayRes_payload_3,{tcArrayRes_payload_2,{tcArrayRes_payload_1,tcArrayRes_payload_0}}}}};
  assign io_res_payload = outputBuffer_q;
  assign io_res_valid = (! outputBuffer_empty);
  always @(*) begin
    ctrlStateMachine_stateNext = ctrlStateMachine_stateReg;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
        if(calEnDelay) begin
          ctrlStateMachine_stateNext = `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
        if(ctrlStateMachine_loadRdy) begin
          ctrlStateMachine_stateNext = `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(ctrlStateMachine_computeIterCounter_willOverflow) begin
          ctrlStateMachine_stateNext = `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes;
        end
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
        if(ctrlStateMachine_resValidCounter_willOverflow) begin
          ctrlStateMachine_stateNext = `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle;
        end
      end
      default : begin
      end
    endcase
    if(ctrlStateMachine_wantStart) begin
      ctrlStateMachine_stateNext = `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle;
    end
    if(ctrlStateMachine_wantKill) begin
      ctrlStateMachine_stateNext = `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT;
    end
  end

  assign when_TensorCoreChainArray_l164 = (ctrlStateMachine_dataInFinish == 1'b0);
  assign when_TensorCoreChainArray_l174 = (ctrlStateMachine_loadFinish == 1'b0);
  assign when_StateMachine_l230 = ((! (ctrlStateMachine_stateReg == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle)) && (ctrlStateMachine_stateNext == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle));
  assign when_StateMachine_l230_1 = ((! (ctrlStateMachine_stateReg == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad)) && (ctrlStateMachine_stateNext == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad));
  assign when_StateMachine_l230_2 = ((! (ctrlStateMachine_stateReg == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute)) && (ctrlStateMachine_stateNext == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute));
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      rowBufferRdCounter_value <= 5'h0;
      colBufferRdCounter_value <= 5'h0;
      tensorLoadValid <= 1'b0;
      tensorDataValid <= 1'b0;
      computeItersReg <= 8'h0;
      calEnDelay <= 1'b0;
      computeItersDelay <= 8'h0;
      _zz_wraddress_2 <= 5'h0;
      _zz_wraddress_5 <= 5'h0;
      _zz_wraddress_8 <= 5'h0;
      _zz_wraddress_11 <= 5'h0;
      _zz_wraddress_14 <= 5'h0;
      _zz_wraddress_17 <= 5'h0;
      _zz_wraddress_20 <= 5'h0;
      _zz_wraddress_23 <= 5'h0;
      _zz_wraddress_26 <= 5'h0;
      tensorLoadValid_delay_1 <= 1'b0;
      tensorDataValid_delay_1 <= 1'b0;
      tensorLoadValid_delay_1_1 <= 1'b0;
      tensorDataValid_delay_1_1 <= 1'b0;
      tensorLoadValid_delay_1_2 <= 1'b0;
      tensorDataValid_delay_1_2 <= 1'b0;
      tensorLoadValid_delay_1_3 <= 1'b0;
      tensorDataValid_delay_1_3 <= 1'b0;
      tensorLoadValid_delay_1_4 <= 1'b0;
      tensorDataValid_delay_1_4 <= 1'b0;
      tensorLoadValid_delay_1_5 <= 1'b0;
      tensorDataValid_delay_1_5 <= 1'b0;
      ctrlStateMachine_loadFinish <= 1'b0;
      ctrlStateMachine_dataInFinish <= 1'b0;
      ctrlStateMachine_loadIterCounter_value <= 8'h0;
      ctrlStateMachine_computeIterCounter_value <= 8'h0;
      ctrlStateMachine_resValidCounter_value <= 8'h0;
      ctrlStateMachine_stateReg <= `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT;
    end else begin
      rowBufferRdCounter_value <= rowBufferRdCounter_valueNext;
      colBufferRdCounter_value <= colBufferRdCounter_valueNext;
      calEnDelay <= io_calEn_delay_1;
      computeItersDelay <= io_computeIters_delay_1;
      _zz_wraddress_2 <= _zz_wraddress_1;
      _zz_wraddress_5 <= _zz_wraddress_4;
      _zz_wraddress_8 <= _zz_wraddress_7;
      _zz_wraddress_11 <= _zz_wraddress_10;
      _zz_wraddress_14 <= _zz_wraddress_13;
      _zz_wraddress_17 <= _zz_wraddress_16;
      _zz_wraddress_20 <= _zz_wraddress_19;
      _zz_wraddress_23 <= _zz_wraddress_22;
      _zz_wraddress_26 <= _zz_wraddress_25;
      tensorLoadValid_delay_1 <= tensorLoadValid;
      tensorDataValid_delay_1 <= tensorDataValid;
      tensorLoadValid_delay_1_1 <= tensorLoadValid;
      tensorDataValid_delay_1_1 <= tensorDataValid;
      tensorLoadValid_delay_1_2 <= tensorLoadValid;
      tensorDataValid_delay_1_2 <= tensorDataValid;
      tensorLoadValid_delay_1_3 <= tensorLoadValid;
      tensorDataValid_delay_1_3 <= tensorDataValid;
      tensorLoadValid_delay_1_4 <= tensorLoadValid;
      tensorDataValid_delay_1_4 <= tensorDataValid;
      tensorLoadValid_delay_1_5 <= tensorLoadValid;
      tensorDataValid_delay_1_5 <= tensorDataValid;
      ctrlStateMachine_loadIterCounter_value <= ctrlStateMachine_loadIterCounter_valueNext;
      ctrlStateMachine_computeIterCounter_value <= ctrlStateMachine_computeIterCounter_valueNext;
      ctrlStateMachine_resValidCounter_value <= ctrlStateMachine_resValidCounter_valueNext;
      ctrlStateMachine_stateReg <= ctrlStateMachine_stateNext;
      case(ctrlStateMachine_stateReg)
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
          if(calEnDelay) begin
            computeItersReg <= computeItersDelay;
          end
        end
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
        end
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
          if(!when_TensorCoreChainArray_l164) begin
            tensorDataValid <= 1'b0;
          end
          if(rowBufferRdCounter_willOverflow) begin
            ctrlStateMachine_dataInFinish <= 1'b1;
          end
          if(!when_TensorCoreChainArray_l174) begin
            tensorLoadValid <= 1'b0;
          end
          if(colBufferRdCounter_willOverflow) begin
            ctrlStateMachine_loadFinish <= 1'b1;
          end
        end
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l230) begin
        computeItersReg <= 8'h0;
        tensorLoadValid <= 1'b0;
        tensorDataValid <= 1'b0;
        ctrlStateMachine_loadFinish <= 1'b0;
        ctrlStateMachine_dataInFinish <= 1'b0;
      end
      if(when_StateMachine_l230_1) begin
        tensorLoadValid <= 1'b1;
      end
      if(when_StateMachine_l230_2) begin
        tensorDataValid <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    io_calEn_delay_1 <= io_calEn;
    io_computeIters_delay_1 <= io_computeIters;
  end


endmodule

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

//FixedBfpConverter replaced by FixedBfpConverter

module FixedBfpConverter (
  input               io_dataIn_valid,
  input      [319:0]  io_dataIn_payload,
  output              io_dataOut_valid,
  output     [87:0]   io_dataOut_payload,
  input               clk,
  input               resetn
);
  wire       [7:0]    _zz__zz_resMants_0;
  wire       [9:0]    _zz_resMants_0_2;
  wire       [9:0]    _zz_resMants_0_3;
  wire       [8:0]    _zz_resMants_0_4;
  wire       [9:0]    _zz_resMants_0_5;
  wire       [7:0]    _zz__zz_resMants_1;
  wire       [9:0]    _zz_resMants_1_2;
  wire       [9:0]    _zz_resMants_1_3;
  wire       [8:0]    _zz_resMants_1_4;
  wire       [9:0]    _zz_resMants_1_5;
  wire       [7:0]    _zz__zz_resMants_2;
  wire       [9:0]    _zz_resMants_2_2;
  wire       [9:0]    _zz_resMants_2_3;
  wire       [8:0]    _zz_resMants_2_4;
  wire       [9:0]    _zz_resMants_2_5;
  wire       [7:0]    _zz__zz_resMants_3;
  wire       [9:0]    _zz_resMants_3_2;
  wire       [9:0]    _zz_resMants_3_3;
  wire       [8:0]    _zz_resMants_3_4;
  wire       [9:0]    _zz_resMants_3_5;
  wire       [7:0]    _zz__zz_resMants_4;
  wire       [9:0]    _zz_resMants_4_2;
  wire       [9:0]    _zz_resMants_4_3;
  wire       [8:0]    _zz_resMants_4_4;
  wire       [9:0]    _zz_resMants_4_5;
  wire       [7:0]    _zz__zz_resMants_5;
  wire       [9:0]    _zz_resMants_5_2;
  wire       [9:0]    _zz_resMants_5_3;
  wire       [8:0]    _zz_resMants_5_4;
  wire       [9:0]    _zz_resMants_5_5;
  wire       [7:0]    _zz__zz_resMants_6;
  wire       [9:0]    _zz_resMants_6_2;
  wire       [9:0]    _zz_resMants_6_3;
  wire       [8:0]    _zz_resMants_6_4;
  wire       [9:0]    _zz_resMants_6_5;
  wire       [7:0]    _zz__zz_resMants_7;
  wire       [9:0]    _zz_resMants_7_2;
  wire       [9:0]    _zz_resMants_7_3;
  wire       [8:0]    _zz_resMants_7_4;
  wire       [9:0]    _zz_resMants_7_5;
  wire       [7:0]    _zz__zz_resMants_8;
  wire       [9:0]    _zz_resMants_8_2;
  wire       [9:0]    _zz_resMants_8_3;
  wire       [8:0]    _zz_resMants_8_4;
  wire       [9:0]    _zz_resMants_8_5;
  wire       [7:0]    _zz__zz_resMants_9;
  wire       [9:0]    _zz_resMants_9_2;
  wire       [9:0]    _zz_resMants_9_3;
  wire       [8:0]    _zz_resMants_9_4;
  wire       [9:0]    _zz_resMants_9_5;
  wire       [7:0]    _zz_io_dataOut_payload;
  wire       [7:0]    _zz_io_dataOut_payload_1;
  wire                dataIn_0_signBit;
  wire       [22:0]   dataIn_0_mantissa;
  wire       [7:0]    dataIn_0_exp;
  wire                dataIn_1_signBit;
  wire       [22:0]   dataIn_1_mantissa;
  wire       [7:0]    dataIn_1_exp;
  wire                dataIn_2_signBit;
  wire       [22:0]   dataIn_2_mantissa;
  wire       [7:0]    dataIn_2_exp;
  wire                dataIn_3_signBit;
  wire       [22:0]   dataIn_3_mantissa;
  wire       [7:0]    dataIn_3_exp;
  wire                dataIn_4_signBit;
  wire       [22:0]   dataIn_4_mantissa;
  wire       [7:0]    dataIn_4_exp;
  wire                dataIn_5_signBit;
  wire       [22:0]   dataIn_5_mantissa;
  wire       [7:0]    dataIn_5_exp;
  wire                dataIn_6_signBit;
  wire       [22:0]   dataIn_6_mantissa;
  wire       [7:0]    dataIn_6_exp;
  wire                dataIn_7_signBit;
  wire       [22:0]   dataIn_7_mantissa;
  wire       [7:0]    dataIn_7_exp;
  wire                dataIn_8_signBit;
  wire       [22:0]   dataIn_8_mantissa;
  wire       [7:0]    dataIn_8_exp;
  wire                dataIn_9_signBit;
  wire       [22:0]   dataIn_9_mantissa;
  wire       [7:0]    dataIn_9_exp;
  wire       [31:0]   dataVec_0;
  wire       [31:0]   dataVec_1;
  wire       [31:0]   dataVec_2;
  wire       [31:0]   dataVec_3;
  wire       [31:0]   dataVec_4;
  wire       [31:0]   dataVec_5;
  wire       [31:0]   dataVec_6;
  wire       [31:0]   dataVec_7;
  wire       [31:0]   dataVec_8;
  wire       [31:0]   dataVec_9;
  wire       [7:0]    exceptionalCompRes;
  reg        [7:0]    _zz_exceptionalCompRes;
  reg        [7:0]    _zz_exceptionalCompRes_1;
  reg        [7:0]    _zz_exceptionalCompRes_2;
  reg        [7:0]    intermediateCompRes_0;
  reg        [7:0]    intermediateCompRes_1;
  reg        [7:0]    intermediateCompRes_2;
  reg        [7:0]    intermediateCompRes_3;
  reg        [7:0]    intermediateCompRes_4;
  reg        [7:0]    intermediateCompRes_5;
  reg        [7:0]    intermediateCompRes_6;
  reg        [7:0]    largestExp;
  wire                voidData_signBit;
  wire       [22:0]   voidData_mantissa;
  wire       [7:0]    voidData_exp;
  reg                 dataIn_delay_1_0_signBit;
  reg        [22:0]   dataIn_delay_1_0_mantissa;
  reg        [7:0]    dataIn_delay_1_0_exp;
  reg                 dataIn_delay_1_1_signBit;
  reg        [22:0]   dataIn_delay_1_1_mantissa;
  reg        [7:0]    dataIn_delay_1_1_exp;
  reg                 dataIn_delay_1_2_signBit;
  reg        [22:0]   dataIn_delay_1_2_mantissa;
  reg        [7:0]    dataIn_delay_1_2_exp;
  reg                 dataIn_delay_1_3_signBit;
  reg        [22:0]   dataIn_delay_1_3_mantissa;
  reg        [7:0]    dataIn_delay_1_3_exp;
  reg                 dataIn_delay_1_4_signBit;
  reg        [22:0]   dataIn_delay_1_4_mantissa;
  reg        [7:0]    dataIn_delay_1_4_exp;
  reg                 dataIn_delay_1_5_signBit;
  reg        [22:0]   dataIn_delay_1_5_mantissa;
  reg        [7:0]    dataIn_delay_1_5_exp;
  reg                 dataIn_delay_1_6_signBit;
  reg        [22:0]   dataIn_delay_1_6_mantissa;
  reg        [7:0]    dataIn_delay_1_6_exp;
  reg                 dataIn_delay_1_7_signBit;
  reg        [22:0]   dataIn_delay_1_7_mantissa;
  reg        [7:0]    dataIn_delay_1_7_exp;
  reg                 dataIn_delay_1_8_signBit;
  reg        [22:0]   dataIn_delay_1_8_mantissa;
  reg        [7:0]    dataIn_delay_1_8_exp;
  reg                 dataIn_delay_1_9_signBit;
  reg        [22:0]   dataIn_delay_1_9_mantissa;
  reg        [7:0]    dataIn_delay_1_9_exp;
  reg                 dataIn_delay_2_0_signBit;
  reg        [22:0]   dataIn_delay_2_0_mantissa;
  reg        [7:0]    dataIn_delay_2_0_exp;
  reg                 dataIn_delay_2_1_signBit;
  reg        [22:0]   dataIn_delay_2_1_mantissa;
  reg        [7:0]    dataIn_delay_2_1_exp;
  reg                 dataIn_delay_2_2_signBit;
  reg        [22:0]   dataIn_delay_2_2_mantissa;
  reg        [7:0]    dataIn_delay_2_2_exp;
  reg                 dataIn_delay_2_3_signBit;
  reg        [22:0]   dataIn_delay_2_3_mantissa;
  reg        [7:0]    dataIn_delay_2_3_exp;
  reg                 dataIn_delay_2_4_signBit;
  reg        [22:0]   dataIn_delay_2_4_mantissa;
  reg        [7:0]    dataIn_delay_2_4_exp;
  reg                 dataIn_delay_2_5_signBit;
  reg        [22:0]   dataIn_delay_2_5_mantissa;
  reg        [7:0]    dataIn_delay_2_5_exp;
  reg                 dataIn_delay_2_6_signBit;
  reg        [22:0]   dataIn_delay_2_6_mantissa;
  reg        [7:0]    dataIn_delay_2_6_exp;
  reg                 dataIn_delay_2_7_signBit;
  reg        [22:0]   dataIn_delay_2_7_mantissa;
  reg        [7:0]    dataIn_delay_2_7_exp;
  reg                 dataIn_delay_2_8_signBit;
  reg        [22:0]   dataIn_delay_2_8_mantissa;
  reg        [7:0]    dataIn_delay_2_8_exp;
  reg                 dataIn_delay_2_9_signBit;
  reg        [22:0]   dataIn_delay_2_9_mantissa;
  reg        [7:0]    dataIn_delay_2_9_exp;
  reg                 dataIn_delay_3_0_signBit;
  reg        [22:0]   dataIn_delay_3_0_mantissa;
  reg        [7:0]    dataIn_delay_3_0_exp;
  reg                 dataIn_delay_3_1_signBit;
  reg        [22:0]   dataIn_delay_3_1_mantissa;
  reg        [7:0]    dataIn_delay_3_1_exp;
  reg                 dataIn_delay_3_2_signBit;
  reg        [22:0]   dataIn_delay_3_2_mantissa;
  reg        [7:0]    dataIn_delay_3_2_exp;
  reg                 dataIn_delay_3_3_signBit;
  reg        [22:0]   dataIn_delay_3_3_mantissa;
  reg        [7:0]    dataIn_delay_3_3_exp;
  reg                 dataIn_delay_3_4_signBit;
  reg        [22:0]   dataIn_delay_3_4_mantissa;
  reg        [7:0]    dataIn_delay_3_4_exp;
  reg                 dataIn_delay_3_5_signBit;
  reg        [22:0]   dataIn_delay_3_5_mantissa;
  reg        [7:0]    dataIn_delay_3_5_exp;
  reg                 dataIn_delay_3_6_signBit;
  reg        [22:0]   dataIn_delay_3_6_mantissa;
  reg        [7:0]    dataIn_delay_3_6_exp;
  reg                 dataIn_delay_3_7_signBit;
  reg        [22:0]   dataIn_delay_3_7_mantissa;
  reg        [7:0]    dataIn_delay_3_7_exp;
  reg                 dataIn_delay_3_8_signBit;
  reg        [22:0]   dataIn_delay_3_8_mantissa;
  reg        [7:0]    dataIn_delay_3_8_exp;
  reg                 dataIn_delay_3_9_signBit;
  reg        [22:0]   dataIn_delay_3_9_mantissa;
  reg        [7:0]    dataIn_delay_3_9_exp;
  reg                 delayedData_0_signBit;
  reg        [22:0]   delayedData_0_mantissa;
  reg        [7:0]    delayedData_0_exp;
  reg                 delayedData_1_signBit;
  reg        [22:0]   delayedData_1_mantissa;
  reg        [7:0]    delayedData_1_exp;
  reg                 delayedData_2_signBit;
  reg        [22:0]   delayedData_2_mantissa;
  reg        [7:0]    delayedData_2_exp;
  reg                 delayedData_3_signBit;
  reg        [22:0]   delayedData_3_mantissa;
  reg        [7:0]    delayedData_3_exp;
  reg                 delayedData_4_signBit;
  reg        [22:0]   delayedData_4_mantissa;
  reg        [7:0]    delayedData_4_exp;
  reg                 delayedData_5_signBit;
  reg        [22:0]   delayedData_5_mantissa;
  reg        [7:0]    delayedData_5_exp;
  reg                 delayedData_6_signBit;
  reg        [22:0]   delayedData_6_mantissa;
  reg        [7:0]    delayedData_6_exp;
  reg                 delayedData_7_signBit;
  reg        [22:0]   delayedData_7_mantissa;
  reg        [7:0]    delayedData_7_exp;
  reg                 delayedData_8_signBit;
  reg        [22:0]   delayedData_8_mantissa;
  reg        [7:0]    delayedData_8_exp;
  reg                 delayedData_9_signBit;
  reg        [22:0]   delayedData_9_mantissa;
  reg        [7:0]    delayedData_9_exp;
  reg                 delayedData_delay_1_0_signBit;
  reg        [22:0]   delayedData_delay_1_0_mantissa;
  reg        [7:0]    delayedData_delay_1_0_exp;
  reg                 delayedData_delay_1_1_signBit;
  reg        [22:0]   delayedData_delay_1_1_mantissa;
  reg        [7:0]    delayedData_delay_1_1_exp;
  reg                 delayedData_delay_1_2_signBit;
  reg        [22:0]   delayedData_delay_1_2_mantissa;
  reg        [7:0]    delayedData_delay_1_2_exp;
  reg                 delayedData_delay_1_3_signBit;
  reg        [22:0]   delayedData_delay_1_3_mantissa;
  reg        [7:0]    delayedData_delay_1_3_exp;
  reg                 delayedData_delay_1_4_signBit;
  reg        [22:0]   delayedData_delay_1_4_mantissa;
  reg        [7:0]    delayedData_delay_1_4_exp;
  reg                 delayedData_delay_1_5_signBit;
  reg        [22:0]   delayedData_delay_1_5_mantissa;
  reg        [7:0]    delayedData_delay_1_5_exp;
  reg                 delayedData_delay_1_6_signBit;
  reg        [22:0]   delayedData_delay_1_6_mantissa;
  reg        [7:0]    delayedData_delay_1_6_exp;
  reg                 delayedData_delay_1_7_signBit;
  reg        [22:0]   delayedData_delay_1_7_mantissa;
  reg        [7:0]    delayedData_delay_1_7_exp;
  reg                 delayedData_delay_1_8_signBit;
  reg        [22:0]   delayedData_delay_1_8_mantissa;
  reg        [7:0]    delayedData_delay_1_8_exp;
  reg                 delayedData_delay_1_9_signBit;
  reg        [22:0]   delayedData_delay_1_9_mantissa;
  reg        [7:0]    delayedData_delay_1_9_exp;
  reg                 delayedDataForResMants_0_signBit;
  reg        [22:0]   delayedDataForResMants_0_mantissa;
  reg        [7:0]    delayedDataForResMants_0_exp;
  reg                 delayedDataForResMants_1_signBit;
  reg        [22:0]   delayedDataForResMants_1_mantissa;
  reg        [7:0]    delayedDataForResMants_1_exp;
  reg                 delayedDataForResMants_2_signBit;
  reg        [22:0]   delayedDataForResMants_2_mantissa;
  reg        [7:0]    delayedDataForResMants_2_exp;
  reg                 delayedDataForResMants_3_signBit;
  reg        [22:0]   delayedDataForResMants_3_mantissa;
  reg        [7:0]    delayedDataForResMants_3_exp;
  reg                 delayedDataForResMants_4_signBit;
  reg        [22:0]   delayedDataForResMants_4_mantissa;
  reg        [7:0]    delayedDataForResMants_4_exp;
  reg                 delayedDataForResMants_5_signBit;
  reg        [22:0]   delayedDataForResMants_5_mantissa;
  reg        [7:0]    delayedDataForResMants_5_exp;
  reg                 delayedDataForResMants_6_signBit;
  reg        [22:0]   delayedDataForResMants_6_mantissa;
  reg        [7:0]    delayedDataForResMants_6_exp;
  reg                 delayedDataForResMants_7_signBit;
  reg        [22:0]   delayedDataForResMants_7_mantissa;
  reg        [7:0]    delayedDataForResMants_7_exp;
  reg                 delayedDataForResMants_8_signBit;
  reg        [22:0]   delayedDataForResMants_8_mantissa;
  reg        [7:0]    delayedDataForResMants_8_exp;
  reg                 delayedDataForResMants_9_signBit;
  reg        [22:0]   delayedDataForResMants_9_mantissa;
  reg        [7:0]    delayedDataForResMants_9_exp;
  reg        [7:0]    resMants_0;
  reg        [7:0]    resMants_1;
  reg        [7:0]    resMants_2;
  reg        [7:0]    resMants_3;
  reg        [7:0]    resMants_4;
  reg        [7:0]    resMants_5;
  reg        [7:0]    resMants_6;
  reg        [7:0]    resMants_7;
  reg        [7:0]    resMants_8;
  reg        [7:0]    resMants_9;
  reg        [7:0]    resExp;
  reg        [8:0]    _zz_resMants_0;
  reg        [8:0]    _zz_resMants_0_1;
  reg        [8:0]    _zz_resMants_1;
  reg        [8:0]    _zz_resMants_1_1;
  reg        [8:0]    _zz_resMants_2;
  reg        [8:0]    _zz_resMants_2_1;
  reg        [8:0]    _zz_resMants_3;
  reg        [8:0]    _zz_resMants_3_1;
  reg        [8:0]    _zz_resMants_4;
  reg        [8:0]    _zz_resMants_4_1;
  reg        [8:0]    _zz_resMants_5;
  reg        [8:0]    _zz_resMants_5_1;
  reg        [8:0]    _zz_resMants_6;
  reg        [8:0]    _zz_resMants_6_1;
  reg        [8:0]    _zz_resMants_7;
  reg        [8:0]    _zz_resMants_7_1;
  reg        [8:0]    _zz_resMants_8;
  reg        [8:0]    _zz_resMants_8_1;
  reg        [8:0]    _zz_resMants_9;
  reg        [8:0]    _zz_resMants_9_1;
  reg        [7:0]    _zz_resExp;
  reg        [7:0]    _zz_resExp_1;
  reg                 io_dataIn_valid_delay_1;
  reg                 io_dataIn_valid_delay_2;
  reg                 io_dataIn_valid_delay_3;
  reg                 io_dataIn_valid_delay_4;
  reg                 io_dataIn_valid_delay_5;
  reg                 io_dataIn_valid_delay_6;
  reg                 io_dataIn_valid_delay_7;

  assign _zz__zz_resMants_0 = (largestExp - delayedData_0_exp);
  assign _zz_resMants_0_2 = ({1'b1,(~ _zz_resMants_0_1)} + _zz_resMants_0_3);
  assign _zz_resMants_0_4 = 9'h001;
  assign _zz_resMants_0_3 = {1'd0, _zz_resMants_0_4};
  assign _zz_resMants_0_5 = {1'b0,_zz_resMants_0_1};
  assign _zz__zz_resMants_1 = (largestExp - delayedData_1_exp);
  assign _zz_resMants_1_2 = ({1'b1,(~ _zz_resMants_1_1)} + _zz_resMants_1_3);
  assign _zz_resMants_1_4 = 9'h001;
  assign _zz_resMants_1_3 = {1'd0, _zz_resMants_1_4};
  assign _zz_resMants_1_5 = {1'b0,_zz_resMants_1_1};
  assign _zz__zz_resMants_2 = (largestExp - delayedData_2_exp);
  assign _zz_resMants_2_2 = ({1'b1,(~ _zz_resMants_2_1)} + _zz_resMants_2_3);
  assign _zz_resMants_2_4 = 9'h001;
  assign _zz_resMants_2_3 = {1'd0, _zz_resMants_2_4};
  assign _zz_resMants_2_5 = {1'b0,_zz_resMants_2_1};
  assign _zz__zz_resMants_3 = (largestExp - delayedData_3_exp);
  assign _zz_resMants_3_2 = ({1'b1,(~ _zz_resMants_3_1)} + _zz_resMants_3_3);
  assign _zz_resMants_3_4 = 9'h001;
  assign _zz_resMants_3_3 = {1'd0, _zz_resMants_3_4};
  assign _zz_resMants_3_5 = {1'b0,_zz_resMants_3_1};
  assign _zz__zz_resMants_4 = (largestExp - delayedData_4_exp);
  assign _zz_resMants_4_2 = ({1'b1,(~ _zz_resMants_4_1)} + _zz_resMants_4_3);
  assign _zz_resMants_4_4 = 9'h001;
  assign _zz_resMants_4_3 = {1'd0, _zz_resMants_4_4};
  assign _zz_resMants_4_5 = {1'b0,_zz_resMants_4_1};
  assign _zz__zz_resMants_5 = (largestExp - delayedData_5_exp);
  assign _zz_resMants_5_2 = ({1'b1,(~ _zz_resMants_5_1)} + _zz_resMants_5_3);
  assign _zz_resMants_5_4 = 9'h001;
  assign _zz_resMants_5_3 = {1'd0, _zz_resMants_5_4};
  assign _zz_resMants_5_5 = {1'b0,_zz_resMants_5_1};
  assign _zz__zz_resMants_6 = (largestExp - delayedData_6_exp);
  assign _zz_resMants_6_2 = ({1'b1,(~ _zz_resMants_6_1)} + _zz_resMants_6_3);
  assign _zz_resMants_6_4 = 9'h001;
  assign _zz_resMants_6_3 = {1'd0, _zz_resMants_6_4};
  assign _zz_resMants_6_5 = {1'b0,_zz_resMants_6_1};
  assign _zz__zz_resMants_7 = (largestExp - delayedData_7_exp);
  assign _zz_resMants_7_2 = ({1'b1,(~ _zz_resMants_7_1)} + _zz_resMants_7_3);
  assign _zz_resMants_7_4 = 9'h001;
  assign _zz_resMants_7_3 = {1'd0, _zz_resMants_7_4};
  assign _zz_resMants_7_5 = {1'b0,_zz_resMants_7_1};
  assign _zz__zz_resMants_8 = (largestExp - delayedData_8_exp);
  assign _zz_resMants_8_2 = ({1'b1,(~ _zz_resMants_8_1)} + _zz_resMants_8_3);
  assign _zz_resMants_8_4 = 9'h001;
  assign _zz_resMants_8_3 = {1'd0, _zz_resMants_8_4};
  assign _zz_resMants_8_5 = {1'b0,_zz_resMants_8_1};
  assign _zz__zz_resMants_9 = (largestExp - delayedData_9_exp);
  assign _zz_resMants_9_2 = ({1'b1,(~ _zz_resMants_9_1)} + _zz_resMants_9_3);
  assign _zz_resMants_9_4 = 9'h001;
  assign _zz_resMants_9_3 = {1'd0, _zz_resMants_9_4};
  assign _zz_resMants_9_5 = {1'b0,_zz_resMants_9_1};
  assign _zz_io_dataOut_payload = resMants_1;
  assign _zz_io_dataOut_payload_1 = resMants_0;
  assign dataVec_0 = io_dataIn_payload[31 : 0];
  assign dataVec_1 = io_dataIn_payload[63 : 32];
  assign dataVec_2 = io_dataIn_payload[95 : 64];
  assign dataVec_3 = io_dataIn_payload[127 : 96];
  assign dataVec_4 = io_dataIn_payload[159 : 128];
  assign dataVec_5 = io_dataIn_payload[191 : 160];
  assign dataVec_6 = io_dataIn_payload[223 : 192];
  assign dataVec_7 = io_dataIn_payload[255 : 224];
  assign dataVec_8 = io_dataIn_payload[287 : 256];
  assign dataVec_9 = io_dataIn_payload[319 : 288];
  assign dataIn_0_signBit = dataVec_0[31];
  assign dataIn_0_exp = dataVec_0[30 : 23];
  assign dataIn_0_mantissa = dataVec_0[22 : 0];
  assign dataIn_1_signBit = dataVec_1[31];
  assign dataIn_1_exp = dataVec_1[30 : 23];
  assign dataIn_1_mantissa = dataVec_1[22 : 0];
  assign dataIn_2_signBit = dataVec_2[31];
  assign dataIn_2_exp = dataVec_2[30 : 23];
  assign dataIn_2_mantissa = dataVec_2[22 : 0];
  assign dataIn_3_signBit = dataVec_3[31];
  assign dataIn_3_exp = dataVec_3[30 : 23];
  assign dataIn_3_mantissa = dataVec_3[22 : 0];
  assign dataIn_4_signBit = dataVec_4[31];
  assign dataIn_4_exp = dataVec_4[30 : 23];
  assign dataIn_4_mantissa = dataVec_4[22 : 0];
  assign dataIn_5_signBit = dataVec_5[31];
  assign dataIn_5_exp = dataVec_5[30 : 23];
  assign dataIn_5_mantissa = dataVec_5[22 : 0];
  assign dataIn_6_signBit = dataVec_6[31];
  assign dataIn_6_exp = dataVec_6[30 : 23];
  assign dataIn_6_mantissa = dataVec_6[22 : 0];
  assign dataIn_7_signBit = dataVec_7[31];
  assign dataIn_7_exp = dataVec_7[30 : 23];
  assign dataIn_7_mantissa = dataVec_7[22 : 0];
  assign dataIn_8_signBit = dataVec_8[31];
  assign dataIn_8_exp = dataVec_8[30 : 23];
  assign dataIn_8_mantissa = dataVec_8[22 : 0];
  assign dataIn_9_signBit = dataVec_9[31];
  assign dataIn_9_exp = dataVec_9[30 : 23];
  assign dataIn_9_mantissa = dataVec_9[22 : 0];
  assign exceptionalCompRes = _zz_exceptionalCompRes_2;
  assign voidData_signBit = 1'b0;
  assign voidData_mantissa = 23'h0;
  assign voidData_exp = 8'h0;
  assign io_dataOut_payload = {{resMants_9,{resMants_8,{resMants_7,{resMants_6,{resMants_5,{resMants_4,{resMants_3,{resMants_2,{_zz_io_dataOut_payload,_zz_io_dataOut_payload_1}}}}}}}}},resExp};
  assign io_dataOut_valid = io_dataIn_valid_delay_7;
  always @(posedge clk) begin
    _zz_exceptionalCompRes <= ((dataIn_9_exp <= dataIn_8_exp) ? dataIn_8_exp : dataIn_9_exp);
    _zz_exceptionalCompRes_1 <= _zz_exceptionalCompRes;
    io_dataIn_valid_delay_1 <= io_dataIn_valid;
    io_dataIn_valid_delay_2 <= io_dataIn_valid_delay_1;
    io_dataIn_valid_delay_3 <= io_dataIn_valid_delay_2;
    io_dataIn_valid_delay_4 <= io_dataIn_valid_delay_3;
    io_dataIn_valid_delay_5 <= io_dataIn_valid_delay_4;
    io_dataIn_valid_delay_6 <= io_dataIn_valid_delay_5;
  end

  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      _zz_exceptionalCompRes_2 <= 8'h0;
      intermediateCompRes_0 <= 8'h0;
      intermediateCompRes_1 <= 8'h0;
      intermediateCompRes_2 <= 8'h0;
      intermediateCompRes_3 <= 8'h0;
      intermediateCompRes_4 <= 8'h0;
      intermediateCompRes_5 <= 8'h0;
      intermediateCompRes_6 <= 8'h0;
      largestExp <= 8'h0;
      dataIn_delay_1_0_signBit <= voidData_signBit;
      dataIn_delay_1_0_mantissa <= voidData_mantissa;
      dataIn_delay_1_0_exp <= voidData_exp;
      dataIn_delay_1_1_signBit <= voidData_signBit;
      dataIn_delay_1_1_mantissa <= voidData_mantissa;
      dataIn_delay_1_1_exp <= voidData_exp;
      dataIn_delay_1_2_signBit <= voidData_signBit;
      dataIn_delay_1_2_mantissa <= voidData_mantissa;
      dataIn_delay_1_2_exp <= voidData_exp;
      dataIn_delay_1_3_signBit <= voidData_signBit;
      dataIn_delay_1_3_mantissa <= voidData_mantissa;
      dataIn_delay_1_3_exp <= voidData_exp;
      dataIn_delay_1_4_signBit <= voidData_signBit;
      dataIn_delay_1_4_mantissa <= voidData_mantissa;
      dataIn_delay_1_4_exp <= voidData_exp;
      dataIn_delay_1_5_signBit <= voidData_signBit;
      dataIn_delay_1_5_mantissa <= voidData_mantissa;
      dataIn_delay_1_5_exp <= voidData_exp;
      dataIn_delay_1_6_signBit <= voidData_signBit;
      dataIn_delay_1_6_mantissa <= voidData_mantissa;
      dataIn_delay_1_6_exp <= voidData_exp;
      dataIn_delay_1_7_signBit <= voidData_signBit;
      dataIn_delay_1_7_mantissa <= voidData_mantissa;
      dataIn_delay_1_7_exp <= voidData_exp;
      dataIn_delay_1_8_signBit <= voidData_signBit;
      dataIn_delay_1_8_mantissa <= voidData_mantissa;
      dataIn_delay_1_8_exp <= voidData_exp;
      dataIn_delay_1_9_signBit <= voidData_signBit;
      dataIn_delay_1_9_mantissa <= voidData_mantissa;
      dataIn_delay_1_9_exp <= voidData_exp;
      dataIn_delay_2_0_signBit <= voidData_signBit;
      dataIn_delay_2_0_mantissa <= voidData_mantissa;
      dataIn_delay_2_0_exp <= voidData_exp;
      dataIn_delay_2_1_signBit <= voidData_signBit;
      dataIn_delay_2_1_mantissa <= voidData_mantissa;
      dataIn_delay_2_1_exp <= voidData_exp;
      dataIn_delay_2_2_signBit <= voidData_signBit;
      dataIn_delay_2_2_mantissa <= voidData_mantissa;
      dataIn_delay_2_2_exp <= voidData_exp;
      dataIn_delay_2_3_signBit <= voidData_signBit;
      dataIn_delay_2_3_mantissa <= voidData_mantissa;
      dataIn_delay_2_3_exp <= voidData_exp;
      dataIn_delay_2_4_signBit <= voidData_signBit;
      dataIn_delay_2_4_mantissa <= voidData_mantissa;
      dataIn_delay_2_4_exp <= voidData_exp;
      dataIn_delay_2_5_signBit <= voidData_signBit;
      dataIn_delay_2_5_mantissa <= voidData_mantissa;
      dataIn_delay_2_5_exp <= voidData_exp;
      dataIn_delay_2_6_signBit <= voidData_signBit;
      dataIn_delay_2_6_mantissa <= voidData_mantissa;
      dataIn_delay_2_6_exp <= voidData_exp;
      dataIn_delay_2_7_signBit <= voidData_signBit;
      dataIn_delay_2_7_mantissa <= voidData_mantissa;
      dataIn_delay_2_7_exp <= voidData_exp;
      dataIn_delay_2_8_signBit <= voidData_signBit;
      dataIn_delay_2_8_mantissa <= voidData_mantissa;
      dataIn_delay_2_8_exp <= voidData_exp;
      dataIn_delay_2_9_signBit <= voidData_signBit;
      dataIn_delay_2_9_mantissa <= voidData_mantissa;
      dataIn_delay_2_9_exp <= voidData_exp;
      dataIn_delay_3_0_signBit <= voidData_signBit;
      dataIn_delay_3_0_mantissa <= voidData_mantissa;
      dataIn_delay_3_0_exp <= voidData_exp;
      dataIn_delay_3_1_signBit <= voidData_signBit;
      dataIn_delay_3_1_mantissa <= voidData_mantissa;
      dataIn_delay_3_1_exp <= voidData_exp;
      dataIn_delay_3_2_signBit <= voidData_signBit;
      dataIn_delay_3_2_mantissa <= voidData_mantissa;
      dataIn_delay_3_2_exp <= voidData_exp;
      dataIn_delay_3_3_signBit <= voidData_signBit;
      dataIn_delay_3_3_mantissa <= voidData_mantissa;
      dataIn_delay_3_3_exp <= voidData_exp;
      dataIn_delay_3_4_signBit <= voidData_signBit;
      dataIn_delay_3_4_mantissa <= voidData_mantissa;
      dataIn_delay_3_4_exp <= voidData_exp;
      dataIn_delay_3_5_signBit <= voidData_signBit;
      dataIn_delay_3_5_mantissa <= voidData_mantissa;
      dataIn_delay_3_5_exp <= voidData_exp;
      dataIn_delay_3_6_signBit <= voidData_signBit;
      dataIn_delay_3_6_mantissa <= voidData_mantissa;
      dataIn_delay_3_6_exp <= voidData_exp;
      dataIn_delay_3_7_signBit <= voidData_signBit;
      dataIn_delay_3_7_mantissa <= voidData_mantissa;
      dataIn_delay_3_7_exp <= voidData_exp;
      dataIn_delay_3_8_signBit <= voidData_signBit;
      dataIn_delay_3_8_mantissa <= voidData_mantissa;
      dataIn_delay_3_8_exp <= voidData_exp;
      dataIn_delay_3_9_signBit <= voidData_signBit;
      dataIn_delay_3_9_mantissa <= voidData_mantissa;
      dataIn_delay_3_9_exp <= voidData_exp;
      delayedData_0_signBit <= voidData_signBit;
      delayedData_0_mantissa <= voidData_mantissa;
      delayedData_0_exp <= voidData_exp;
      delayedData_1_signBit <= voidData_signBit;
      delayedData_1_mantissa <= voidData_mantissa;
      delayedData_1_exp <= voidData_exp;
      delayedData_2_signBit <= voidData_signBit;
      delayedData_2_mantissa <= voidData_mantissa;
      delayedData_2_exp <= voidData_exp;
      delayedData_3_signBit <= voidData_signBit;
      delayedData_3_mantissa <= voidData_mantissa;
      delayedData_3_exp <= voidData_exp;
      delayedData_4_signBit <= voidData_signBit;
      delayedData_4_mantissa <= voidData_mantissa;
      delayedData_4_exp <= voidData_exp;
      delayedData_5_signBit <= voidData_signBit;
      delayedData_5_mantissa <= voidData_mantissa;
      delayedData_5_exp <= voidData_exp;
      delayedData_6_signBit <= voidData_signBit;
      delayedData_6_mantissa <= voidData_mantissa;
      delayedData_6_exp <= voidData_exp;
      delayedData_7_signBit <= voidData_signBit;
      delayedData_7_mantissa <= voidData_mantissa;
      delayedData_7_exp <= voidData_exp;
      delayedData_8_signBit <= voidData_signBit;
      delayedData_8_mantissa <= voidData_mantissa;
      delayedData_8_exp <= voidData_exp;
      delayedData_9_signBit <= voidData_signBit;
      delayedData_9_mantissa <= voidData_mantissa;
      delayedData_9_exp <= voidData_exp;
      delayedData_delay_1_0_signBit <= voidData_signBit;
      delayedData_delay_1_0_mantissa <= voidData_mantissa;
      delayedData_delay_1_0_exp <= voidData_exp;
      delayedData_delay_1_1_signBit <= voidData_signBit;
      delayedData_delay_1_1_mantissa <= voidData_mantissa;
      delayedData_delay_1_1_exp <= voidData_exp;
      delayedData_delay_1_2_signBit <= voidData_signBit;
      delayedData_delay_1_2_mantissa <= voidData_mantissa;
      delayedData_delay_1_2_exp <= voidData_exp;
      delayedData_delay_1_3_signBit <= voidData_signBit;
      delayedData_delay_1_3_mantissa <= voidData_mantissa;
      delayedData_delay_1_3_exp <= voidData_exp;
      delayedData_delay_1_4_signBit <= voidData_signBit;
      delayedData_delay_1_4_mantissa <= voidData_mantissa;
      delayedData_delay_1_4_exp <= voidData_exp;
      delayedData_delay_1_5_signBit <= voidData_signBit;
      delayedData_delay_1_5_mantissa <= voidData_mantissa;
      delayedData_delay_1_5_exp <= voidData_exp;
      delayedData_delay_1_6_signBit <= voidData_signBit;
      delayedData_delay_1_6_mantissa <= voidData_mantissa;
      delayedData_delay_1_6_exp <= voidData_exp;
      delayedData_delay_1_7_signBit <= voidData_signBit;
      delayedData_delay_1_7_mantissa <= voidData_mantissa;
      delayedData_delay_1_7_exp <= voidData_exp;
      delayedData_delay_1_8_signBit <= voidData_signBit;
      delayedData_delay_1_8_mantissa <= voidData_mantissa;
      delayedData_delay_1_8_exp <= voidData_exp;
      delayedData_delay_1_9_signBit <= voidData_signBit;
      delayedData_delay_1_9_mantissa <= voidData_mantissa;
      delayedData_delay_1_9_exp <= voidData_exp;
      delayedDataForResMants_0_signBit <= voidData_signBit;
      delayedDataForResMants_0_mantissa <= voidData_mantissa;
      delayedDataForResMants_0_exp <= voidData_exp;
      delayedDataForResMants_1_signBit <= voidData_signBit;
      delayedDataForResMants_1_mantissa <= voidData_mantissa;
      delayedDataForResMants_1_exp <= voidData_exp;
      delayedDataForResMants_2_signBit <= voidData_signBit;
      delayedDataForResMants_2_mantissa <= voidData_mantissa;
      delayedDataForResMants_2_exp <= voidData_exp;
      delayedDataForResMants_3_signBit <= voidData_signBit;
      delayedDataForResMants_3_mantissa <= voidData_mantissa;
      delayedDataForResMants_3_exp <= voidData_exp;
      delayedDataForResMants_4_signBit <= voidData_signBit;
      delayedDataForResMants_4_mantissa <= voidData_mantissa;
      delayedDataForResMants_4_exp <= voidData_exp;
      delayedDataForResMants_5_signBit <= voidData_signBit;
      delayedDataForResMants_5_mantissa <= voidData_mantissa;
      delayedDataForResMants_5_exp <= voidData_exp;
      delayedDataForResMants_6_signBit <= voidData_signBit;
      delayedDataForResMants_6_mantissa <= voidData_mantissa;
      delayedDataForResMants_6_exp <= voidData_exp;
      delayedDataForResMants_7_signBit <= voidData_signBit;
      delayedDataForResMants_7_mantissa <= voidData_mantissa;
      delayedDataForResMants_7_exp <= voidData_exp;
      delayedDataForResMants_8_signBit <= voidData_signBit;
      delayedDataForResMants_8_mantissa <= voidData_mantissa;
      delayedDataForResMants_8_exp <= voidData_exp;
      delayedDataForResMants_9_signBit <= voidData_signBit;
      delayedDataForResMants_9_mantissa <= voidData_mantissa;
      delayedDataForResMants_9_exp <= voidData_exp;
      resMants_0 <= 8'h0;
      resMants_1 <= 8'h0;
      resMants_2 <= 8'h0;
      resMants_3 <= 8'h0;
      resMants_4 <= 8'h0;
      resMants_5 <= 8'h0;
      resMants_6 <= 8'h0;
      resMants_7 <= 8'h0;
      resMants_8 <= 8'h0;
      resMants_9 <= 8'h0;
      resExp <= 8'h0;
      _zz_resMants_0 <= 9'h0;
      _zz_resMants_0_1 <= 9'h0;
      _zz_resMants_1 <= 9'h0;
      _zz_resMants_1_1 <= 9'h0;
      _zz_resMants_2 <= 9'h0;
      _zz_resMants_2_1 <= 9'h0;
      _zz_resMants_3 <= 9'h0;
      _zz_resMants_3_1 <= 9'h0;
      _zz_resMants_4 <= 9'h0;
      _zz_resMants_4_1 <= 9'h0;
      _zz_resMants_5 <= 9'h0;
      _zz_resMants_5_1 <= 9'h0;
      _zz_resMants_6 <= 9'h0;
      _zz_resMants_6_1 <= 9'h0;
      _zz_resMants_7 <= 9'h0;
      _zz_resMants_7_1 <= 9'h0;
      _zz_resMants_8 <= 9'h0;
      _zz_resMants_8_1 <= 9'h0;
      _zz_resMants_9 <= 9'h0;
      _zz_resMants_9_1 <= 9'h0;
      _zz_resExp <= 8'h0;
      _zz_resExp_1 <= 8'h0;
      io_dataIn_valid_delay_7 <= 1'b0;
    end else begin
      _zz_exceptionalCompRes_2 <= _zz_exceptionalCompRes_1;
      intermediateCompRes_0 <= ((dataIn_1_exp <= dataIn_0_exp) ? dataIn_0_exp : dataIn_1_exp);
      intermediateCompRes_1 <= ((dataIn_3_exp <= dataIn_2_exp) ? dataIn_2_exp : dataIn_3_exp);
      intermediateCompRes_2 <= ((dataIn_5_exp <= dataIn_4_exp) ? dataIn_4_exp : dataIn_5_exp);
      intermediateCompRes_3 <= ((dataIn_7_exp <= dataIn_6_exp) ? dataIn_6_exp : dataIn_7_exp);
      intermediateCompRes_4 <= ((intermediateCompRes_1 <= intermediateCompRes_0) ? intermediateCompRes_0 : intermediateCompRes_1);
      intermediateCompRes_5 <= ((intermediateCompRes_3 <= intermediateCompRes_2) ? intermediateCompRes_2 : intermediateCompRes_3);
      intermediateCompRes_6 <= ((intermediateCompRes_5 <= intermediateCompRes_4) ? intermediateCompRes_4 : intermediateCompRes_5);
      largestExp <= ((exceptionalCompRes <= intermediateCompRes_6) ? intermediateCompRes_6 : exceptionalCompRes);
      dataIn_delay_1_0_signBit <= dataIn_0_signBit;
      dataIn_delay_1_0_mantissa <= dataIn_0_mantissa;
      dataIn_delay_1_0_exp <= dataIn_0_exp;
      dataIn_delay_1_1_signBit <= dataIn_1_signBit;
      dataIn_delay_1_1_mantissa <= dataIn_1_mantissa;
      dataIn_delay_1_1_exp <= dataIn_1_exp;
      dataIn_delay_1_2_signBit <= dataIn_2_signBit;
      dataIn_delay_1_2_mantissa <= dataIn_2_mantissa;
      dataIn_delay_1_2_exp <= dataIn_2_exp;
      dataIn_delay_1_3_signBit <= dataIn_3_signBit;
      dataIn_delay_1_3_mantissa <= dataIn_3_mantissa;
      dataIn_delay_1_3_exp <= dataIn_3_exp;
      dataIn_delay_1_4_signBit <= dataIn_4_signBit;
      dataIn_delay_1_4_mantissa <= dataIn_4_mantissa;
      dataIn_delay_1_4_exp <= dataIn_4_exp;
      dataIn_delay_1_5_signBit <= dataIn_5_signBit;
      dataIn_delay_1_5_mantissa <= dataIn_5_mantissa;
      dataIn_delay_1_5_exp <= dataIn_5_exp;
      dataIn_delay_1_6_signBit <= dataIn_6_signBit;
      dataIn_delay_1_6_mantissa <= dataIn_6_mantissa;
      dataIn_delay_1_6_exp <= dataIn_6_exp;
      dataIn_delay_1_7_signBit <= dataIn_7_signBit;
      dataIn_delay_1_7_mantissa <= dataIn_7_mantissa;
      dataIn_delay_1_7_exp <= dataIn_7_exp;
      dataIn_delay_1_8_signBit <= dataIn_8_signBit;
      dataIn_delay_1_8_mantissa <= dataIn_8_mantissa;
      dataIn_delay_1_8_exp <= dataIn_8_exp;
      dataIn_delay_1_9_signBit <= dataIn_9_signBit;
      dataIn_delay_1_9_mantissa <= dataIn_9_mantissa;
      dataIn_delay_1_9_exp <= dataIn_9_exp;
      dataIn_delay_2_0_signBit <= dataIn_delay_1_0_signBit;
      dataIn_delay_2_0_mantissa <= dataIn_delay_1_0_mantissa;
      dataIn_delay_2_0_exp <= dataIn_delay_1_0_exp;
      dataIn_delay_2_1_signBit <= dataIn_delay_1_1_signBit;
      dataIn_delay_2_1_mantissa <= dataIn_delay_1_1_mantissa;
      dataIn_delay_2_1_exp <= dataIn_delay_1_1_exp;
      dataIn_delay_2_2_signBit <= dataIn_delay_1_2_signBit;
      dataIn_delay_2_2_mantissa <= dataIn_delay_1_2_mantissa;
      dataIn_delay_2_2_exp <= dataIn_delay_1_2_exp;
      dataIn_delay_2_3_signBit <= dataIn_delay_1_3_signBit;
      dataIn_delay_2_3_mantissa <= dataIn_delay_1_3_mantissa;
      dataIn_delay_2_3_exp <= dataIn_delay_1_3_exp;
      dataIn_delay_2_4_signBit <= dataIn_delay_1_4_signBit;
      dataIn_delay_2_4_mantissa <= dataIn_delay_1_4_mantissa;
      dataIn_delay_2_4_exp <= dataIn_delay_1_4_exp;
      dataIn_delay_2_5_signBit <= dataIn_delay_1_5_signBit;
      dataIn_delay_2_5_mantissa <= dataIn_delay_1_5_mantissa;
      dataIn_delay_2_5_exp <= dataIn_delay_1_5_exp;
      dataIn_delay_2_6_signBit <= dataIn_delay_1_6_signBit;
      dataIn_delay_2_6_mantissa <= dataIn_delay_1_6_mantissa;
      dataIn_delay_2_6_exp <= dataIn_delay_1_6_exp;
      dataIn_delay_2_7_signBit <= dataIn_delay_1_7_signBit;
      dataIn_delay_2_7_mantissa <= dataIn_delay_1_7_mantissa;
      dataIn_delay_2_7_exp <= dataIn_delay_1_7_exp;
      dataIn_delay_2_8_signBit <= dataIn_delay_1_8_signBit;
      dataIn_delay_2_8_mantissa <= dataIn_delay_1_8_mantissa;
      dataIn_delay_2_8_exp <= dataIn_delay_1_8_exp;
      dataIn_delay_2_9_signBit <= dataIn_delay_1_9_signBit;
      dataIn_delay_2_9_mantissa <= dataIn_delay_1_9_mantissa;
      dataIn_delay_2_9_exp <= dataIn_delay_1_9_exp;
      dataIn_delay_3_0_signBit <= dataIn_delay_2_0_signBit;
      dataIn_delay_3_0_mantissa <= dataIn_delay_2_0_mantissa;
      dataIn_delay_3_0_exp <= dataIn_delay_2_0_exp;
      dataIn_delay_3_1_signBit <= dataIn_delay_2_1_signBit;
      dataIn_delay_3_1_mantissa <= dataIn_delay_2_1_mantissa;
      dataIn_delay_3_1_exp <= dataIn_delay_2_1_exp;
      dataIn_delay_3_2_signBit <= dataIn_delay_2_2_signBit;
      dataIn_delay_3_2_mantissa <= dataIn_delay_2_2_mantissa;
      dataIn_delay_3_2_exp <= dataIn_delay_2_2_exp;
      dataIn_delay_3_3_signBit <= dataIn_delay_2_3_signBit;
      dataIn_delay_3_3_mantissa <= dataIn_delay_2_3_mantissa;
      dataIn_delay_3_3_exp <= dataIn_delay_2_3_exp;
      dataIn_delay_3_4_signBit <= dataIn_delay_2_4_signBit;
      dataIn_delay_3_4_mantissa <= dataIn_delay_2_4_mantissa;
      dataIn_delay_3_4_exp <= dataIn_delay_2_4_exp;
      dataIn_delay_3_5_signBit <= dataIn_delay_2_5_signBit;
      dataIn_delay_3_5_mantissa <= dataIn_delay_2_5_mantissa;
      dataIn_delay_3_5_exp <= dataIn_delay_2_5_exp;
      dataIn_delay_3_6_signBit <= dataIn_delay_2_6_signBit;
      dataIn_delay_3_6_mantissa <= dataIn_delay_2_6_mantissa;
      dataIn_delay_3_6_exp <= dataIn_delay_2_6_exp;
      dataIn_delay_3_7_signBit <= dataIn_delay_2_7_signBit;
      dataIn_delay_3_7_mantissa <= dataIn_delay_2_7_mantissa;
      dataIn_delay_3_7_exp <= dataIn_delay_2_7_exp;
      dataIn_delay_3_8_signBit <= dataIn_delay_2_8_signBit;
      dataIn_delay_3_8_mantissa <= dataIn_delay_2_8_mantissa;
      dataIn_delay_3_8_exp <= dataIn_delay_2_8_exp;
      dataIn_delay_3_9_signBit <= dataIn_delay_2_9_signBit;
      dataIn_delay_3_9_mantissa <= dataIn_delay_2_9_mantissa;
      dataIn_delay_3_9_exp <= dataIn_delay_2_9_exp;
      delayedData_0_signBit <= dataIn_delay_3_0_signBit;
      delayedData_0_mantissa <= dataIn_delay_3_0_mantissa;
      delayedData_0_exp <= dataIn_delay_3_0_exp;
      delayedData_1_signBit <= dataIn_delay_3_1_signBit;
      delayedData_1_mantissa <= dataIn_delay_3_1_mantissa;
      delayedData_1_exp <= dataIn_delay_3_1_exp;
      delayedData_2_signBit <= dataIn_delay_3_2_signBit;
      delayedData_2_mantissa <= dataIn_delay_3_2_mantissa;
      delayedData_2_exp <= dataIn_delay_3_2_exp;
      delayedData_3_signBit <= dataIn_delay_3_3_signBit;
      delayedData_3_mantissa <= dataIn_delay_3_3_mantissa;
      delayedData_3_exp <= dataIn_delay_3_3_exp;
      delayedData_4_signBit <= dataIn_delay_3_4_signBit;
      delayedData_4_mantissa <= dataIn_delay_3_4_mantissa;
      delayedData_4_exp <= dataIn_delay_3_4_exp;
      delayedData_5_signBit <= dataIn_delay_3_5_signBit;
      delayedData_5_mantissa <= dataIn_delay_3_5_mantissa;
      delayedData_5_exp <= dataIn_delay_3_5_exp;
      delayedData_6_signBit <= dataIn_delay_3_6_signBit;
      delayedData_6_mantissa <= dataIn_delay_3_6_mantissa;
      delayedData_6_exp <= dataIn_delay_3_6_exp;
      delayedData_7_signBit <= dataIn_delay_3_7_signBit;
      delayedData_7_mantissa <= dataIn_delay_3_7_mantissa;
      delayedData_7_exp <= dataIn_delay_3_7_exp;
      delayedData_8_signBit <= dataIn_delay_3_8_signBit;
      delayedData_8_mantissa <= dataIn_delay_3_8_mantissa;
      delayedData_8_exp <= dataIn_delay_3_8_exp;
      delayedData_9_signBit <= dataIn_delay_3_9_signBit;
      delayedData_9_mantissa <= dataIn_delay_3_9_mantissa;
      delayedData_9_exp <= dataIn_delay_3_9_exp;
      delayedData_delay_1_0_signBit <= delayedData_0_signBit;
      delayedData_delay_1_0_mantissa <= delayedData_0_mantissa;
      delayedData_delay_1_0_exp <= delayedData_0_exp;
      delayedData_delay_1_1_signBit <= delayedData_1_signBit;
      delayedData_delay_1_1_mantissa <= delayedData_1_mantissa;
      delayedData_delay_1_1_exp <= delayedData_1_exp;
      delayedData_delay_1_2_signBit <= delayedData_2_signBit;
      delayedData_delay_1_2_mantissa <= delayedData_2_mantissa;
      delayedData_delay_1_2_exp <= delayedData_2_exp;
      delayedData_delay_1_3_signBit <= delayedData_3_signBit;
      delayedData_delay_1_3_mantissa <= delayedData_3_mantissa;
      delayedData_delay_1_3_exp <= delayedData_3_exp;
      delayedData_delay_1_4_signBit <= delayedData_4_signBit;
      delayedData_delay_1_4_mantissa <= delayedData_4_mantissa;
      delayedData_delay_1_4_exp <= delayedData_4_exp;
      delayedData_delay_1_5_signBit <= delayedData_5_signBit;
      delayedData_delay_1_5_mantissa <= delayedData_5_mantissa;
      delayedData_delay_1_5_exp <= delayedData_5_exp;
      delayedData_delay_1_6_signBit <= delayedData_6_signBit;
      delayedData_delay_1_6_mantissa <= delayedData_6_mantissa;
      delayedData_delay_1_6_exp <= delayedData_6_exp;
      delayedData_delay_1_7_signBit <= delayedData_7_signBit;
      delayedData_delay_1_7_mantissa <= delayedData_7_mantissa;
      delayedData_delay_1_7_exp <= delayedData_7_exp;
      delayedData_delay_1_8_signBit <= delayedData_8_signBit;
      delayedData_delay_1_8_mantissa <= delayedData_8_mantissa;
      delayedData_delay_1_8_exp <= delayedData_8_exp;
      delayedData_delay_1_9_signBit <= delayedData_9_signBit;
      delayedData_delay_1_9_mantissa <= delayedData_9_mantissa;
      delayedData_delay_1_9_exp <= delayedData_9_exp;
      delayedDataForResMants_0_signBit <= delayedData_delay_1_0_signBit;
      delayedDataForResMants_0_mantissa <= delayedData_delay_1_0_mantissa;
      delayedDataForResMants_0_exp <= delayedData_delay_1_0_exp;
      delayedDataForResMants_1_signBit <= delayedData_delay_1_1_signBit;
      delayedDataForResMants_1_mantissa <= delayedData_delay_1_1_mantissa;
      delayedDataForResMants_1_exp <= delayedData_delay_1_1_exp;
      delayedDataForResMants_2_signBit <= delayedData_delay_1_2_signBit;
      delayedDataForResMants_2_mantissa <= delayedData_delay_1_2_mantissa;
      delayedDataForResMants_2_exp <= delayedData_delay_1_2_exp;
      delayedDataForResMants_3_signBit <= delayedData_delay_1_3_signBit;
      delayedDataForResMants_3_mantissa <= delayedData_delay_1_3_mantissa;
      delayedDataForResMants_3_exp <= delayedData_delay_1_3_exp;
      delayedDataForResMants_4_signBit <= delayedData_delay_1_4_signBit;
      delayedDataForResMants_4_mantissa <= delayedData_delay_1_4_mantissa;
      delayedDataForResMants_4_exp <= delayedData_delay_1_4_exp;
      delayedDataForResMants_5_signBit <= delayedData_delay_1_5_signBit;
      delayedDataForResMants_5_mantissa <= delayedData_delay_1_5_mantissa;
      delayedDataForResMants_5_exp <= delayedData_delay_1_5_exp;
      delayedDataForResMants_6_signBit <= delayedData_delay_1_6_signBit;
      delayedDataForResMants_6_mantissa <= delayedData_delay_1_6_mantissa;
      delayedDataForResMants_6_exp <= delayedData_delay_1_6_exp;
      delayedDataForResMants_7_signBit <= delayedData_delay_1_7_signBit;
      delayedDataForResMants_7_mantissa <= delayedData_delay_1_7_mantissa;
      delayedDataForResMants_7_exp <= delayedData_delay_1_7_exp;
      delayedDataForResMants_8_signBit <= delayedData_delay_1_8_signBit;
      delayedDataForResMants_8_mantissa <= delayedData_delay_1_8_mantissa;
      delayedDataForResMants_8_exp <= delayedData_delay_1_8_exp;
      delayedDataForResMants_9_signBit <= delayedData_delay_1_9_signBit;
      delayedDataForResMants_9_mantissa <= delayedData_delay_1_9_mantissa;
      delayedDataForResMants_9_exp <= delayedData_delay_1_9_exp;
      _zz_resMants_0 <= (((((delayedData_0_signBit == voidData_signBit) && (delayedData_0_mantissa == voidData_mantissa)) && (delayedData_0_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_0_mantissa[22 : 15]}) >>> _zz__zz_resMants_0);
      _zz_resMants_0_1 <= _zz_resMants_0;
      if(delayedDataForResMants_0_signBit) begin
        resMants_0 <= _zz_resMants_0_2[9 : 2];
      end else begin
        resMants_0 <= _zz_resMants_0_5[9 : 2];
      end
      _zz_resMants_1 <= (((((delayedData_1_signBit == voidData_signBit) && (delayedData_1_mantissa == voidData_mantissa)) && (delayedData_1_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_1_mantissa[22 : 15]}) >>> _zz__zz_resMants_1);
      _zz_resMants_1_1 <= _zz_resMants_1;
      if(delayedDataForResMants_1_signBit) begin
        resMants_1 <= _zz_resMants_1_2[9 : 2];
      end else begin
        resMants_1 <= _zz_resMants_1_5[9 : 2];
      end
      _zz_resMants_2 <= (((((delayedData_2_signBit == voidData_signBit) && (delayedData_2_mantissa == voidData_mantissa)) && (delayedData_2_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_2_mantissa[22 : 15]}) >>> _zz__zz_resMants_2);
      _zz_resMants_2_1 <= _zz_resMants_2;
      if(delayedDataForResMants_2_signBit) begin
        resMants_2 <= _zz_resMants_2_2[9 : 2];
      end else begin
        resMants_2 <= _zz_resMants_2_5[9 : 2];
      end
      _zz_resMants_3 <= (((((delayedData_3_signBit == voidData_signBit) && (delayedData_3_mantissa == voidData_mantissa)) && (delayedData_3_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_3_mantissa[22 : 15]}) >>> _zz__zz_resMants_3);
      _zz_resMants_3_1 <= _zz_resMants_3;
      if(delayedDataForResMants_3_signBit) begin
        resMants_3 <= _zz_resMants_3_2[9 : 2];
      end else begin
        resMants_3 <= _zz_resMants_3_5[9 : 2];
      end
      _zz_resMants_4 <= (((((delayedData_4_signBit == voidData_signBit) && (delayedData_4_mantissa == voidData_mantissa)) && (delayedData_4_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_4_mantissa[22 : 15]}) >>> _zz__zz_resMants_4);
      _zz_resMants_4_1 <= _zz_resMants_4;
      if(delayedDataForResMants_4_signBit) begin
        resMants_4 <= _zz_resMants_4_2[9 : 2];
      end else begin
        resMants_4 <= _zz_resMants_4_5[9 : 2];
      end
      _zz_resMants_5 <= (((((delayedData_5_signBit == voidData_signBit) && (delayedData_5_mantissa == voidData_mantissa)) && (delayedData_5_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_5_mantissa[22 : 15]}) >>> _zz__zz_resMants_5);
      _zz_resMants_5_1 <= _zz_resMants_5;
      if(delayedDataForResMants_5_signBit) begin
        resMants_5 <= _zz_resMants_5_2[9 : 2];
      end else begin
        resMants_5 <= _zz_resMants_5_5[9 : 2];
      end
      _zz_resMants_6 <= (((((delayedData_6_signBit == voidData_signBit) && (delayedData_6_mantissa == voidData_mantissa)) && (delayedData_6_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_6_mantissa[22 : 15]}) >>> _zz__zz_resMants_6);
      _zz_resMants_6_1 <= _zz_resMants_6;
      if(delayedDataForResMants_6_signBit) begin
        resMants_6 <= _zz_resMants_6_2[9 : 2];
      end else begin
        resMants_6 <= _zz_resMants_6_5[9 : 2];
      end
      _zz_resMants_7 <= (((((delayedData_7_signBit == voidData_signBit) && (delayedData_7_mantissa == voidData_mantissa)) && (delayedData_7_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_7_mantissa[22 : 15]}) >>> _zz__zz_resMants_7);
      _zz_resMants_7_1 <= _zz_resMants_7;
      if(delayedDataForResMants_7_signBit) begin
        resMants_7 <= _zz_resMants_7_2[9 : 2];
      end else begin
        resMants_7 <= _zz_resMants_7_5[9 : 2];
      end
      _zz_resMants_8 <= (((((delayedData_8_signBit == voidData_signBit) && (delayedData_8_mantissa == voidData_mantissa)) && (delayedData_8_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_8_mantissa[22 : 15]}) >>> _zz__zz_resMants_8);
      _zz_resMants_8_1 <= _zz_resMants_8;
      if(delayedDataForResMants_8_signBit) begin
        resMants_8 <= _zz_resMants_8_2[9 : 2];
      end else begin
        resMants_8 <= _zz_resMants_8_5[9 : 2];
      end
      _zz_resMants_9 <= (((((delayedData_9_signBit == voidData_signBit) && (delayedData_9_mantissa == voidData_mantissa)) && (delayedData_9_exp == voidData_exp)) ? 9'h0 : {1'b1,delayedData_9_mantissa[22 : 15]}) >>> _zz__zz_resMants_9);
      _zz_resMants_9_1 <= _zz_resMants_9;
      if(delayedDataForResMants_9_signBit) begin
        resMants_9 <= _zz_resMants_9_2[9 : 2];
      end else begin
        resMants_9 <= _zz_resMants_9_5[9 : 2];
      end
      _zz_resExp <= (largestExp - 8'h06);
      _zz_resExp_1 <= _zz_resExp;
      resExp <= _zz_resExp_1;
      io_dataIn_valid_delay_7 <= io_dataIn_valid_delay_6;
    end
  end


endmodule

//TensorCoreChain replaced by TensorCoreChain

//TensorCoreChain replaced by TensorCoreChain

//TensorCoreChain replaced by TensorCoreChain

//TensorCoreChain replaced by TensorCoreChain

//TensorCoreChain replaced by TensorCoreChain

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
  output              io_dataIterReady,
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
  wire       [23:0]   accuFbDelay_0;
  wire       [23:0]   accuFbDelay_1;
  wire       [23:0]   accuFbDelay_2;
  reg        [23:0]   accuFbDelay_0_delay_1;
  reg        [23:0]   accuFbDelay_0_delay_2;
  reg        [23:0]   accuFbDelay_0_delay_3;
  reg        [23:0]   accuFbDelay_0_delay_4;
  reg        [23:0]   accuFbDelay_0_delay_5;
  reg        [23:0]   accuFbDelay_0_delay_6;
  reg        [23:0]   accuFbDelay_1_delay_1;
  reg        [23:0]   accuFbDelay_1_delay_2;
  reg        [23:0]   accuFbDelay_1_delay_3;
  reg        [23:0]   accuFbDelay_1_delay_4;
  reg        [23:0]   accuFbDelay_1_delay_5;
  reg        [23:0]   accuFbDelay_1_delay_6;
  reg        [23:0]   accuFbDelay_2_delay_1;
  reg        [23:0]   accuFbDelay_2_delay_2;
  reg        [23:0]   accuFbDelay_2_delay_3;
  reg        [23:0]   accuFbDelay_2_delay_4;
  reg        [23:0]   accuFbDelay_2_delay_5;
  reg        [23:0]   accuFbDelay_2_delay_6;

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
    .bf24_a1                   (accuFbDelay_0_delay_6                 ), //i
    .bf24_a2                   (accuFbDelay_1_delay_6                 ), //i
    .bf24_a3                   (accuFbDelay_2_delay_6                 ), //i
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
  assign io_dataIterReady = inputCounter_willOverflow;
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
  assign accuFbDelay_0 = (oBufferLoadValid ? tcAccu_bf24_col_1 : 24'h0);
  assign accuFbDelay_1 = (oBufferLoadValid ? tcAccu_bf24_col_2 : 24'h0);
  assign accuFbDelay_2 = (oBufferLoadValid ? tcAccu_bf24_col_3 : 24'h0);
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
      accuFbDelay_0_delay_1 <= 24'h0;
      accuFbDelay_0_delay_2 <= 24'h0;
      accuFbDelay_0_delay_3 <= 24'h0;
      accuFbDelay_0_delay_4 <= 24'h0;
      accuFbDelay_0_delay_5 <= 24'h0;
      accuFbDelay_0_delay_6 <= 24'h0;
      accuFbDelay_1_delay_1 <= 24'h0;
      accuFbDelay_1_delay_2 <= 24'h0;
      accuFbDelay_1_delay_3 <= 24'h0;
      accuFbDelay_1_delay_4 <= 24'h0;
      accuFbDelay_1_delay_5 <= 24'h0;
      accuFbDelay_1_delay_6 <= 24'h0;
      accuFbDelay_2_delay_1 <= 24'h0;
      accuFbDelay_2_delay_2 <= 24'h0;
      accuFbDelay_2_delay_3 <= 24'h0;
      accuFbDelay_2_delay_4 <= 24'h0;
      accuFbDelay_2_delay_5 <= 24'h0;
      accuFbDelay_2_delay_6 <= 24'h0;
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
      accuFbDelay_0_delay_1 <= accuFbDelay_0;
      accuFbDelay_0_delay_2 <= accuFbDelay_0_delay_1;
      accuFbDelay_0_delay_3 <= accuFbDelay_0_delay_2;
      accuFbDelay_0_delay_4 <= accuFbDelay_0_delay_3;
      accuFbDelay_0_delay_5 <= accuFbDelay_0_delay_4;
      accuFbDelay_0_delay_6 <= accuFbDelay_0_delay_5;
      accuFbDelay_1_delay_1 <= accuFbDelay_1;
      accuFbDelay_1_delay_2 <= accuFbDelay_1_delay_1;
      accuFbDelay_1_delay_3 <= accuFbDelay_1_delay_2;
      accuFbDelay_1_delay_4 <= accuFbDelay_1_delay_3;
      accuFbDelay_1_delay_5 <= accuFbDelay_1_delay_4;
      accuFbDelay_1_delay_6 <= accuFbDelay_1_delay_5;
      accuFbDelay_2_delay_1 <= accuFbDelay_2;
      accuFbDelay_2_delay_2 <= accuFbDelay_2_delay_1;
      accuFbDelay_2_delay_3 <= accuFbDelay_2_delay_2;
      accuFbDelay_2_delay_4 <= accuFbDelay_2_delay_3;
      accuFbDelay_2_delay_5 <= accuFbDelay_2_delay_4;
      accuFbDelay_2_delay_6 <= accuFbDelay_2_delay_5;
    end
  end


endmodule
