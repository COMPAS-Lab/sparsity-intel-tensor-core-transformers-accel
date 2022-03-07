// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : TensorCoreChainArray
// Git hash  : 3e056ff35b72d76d3c5a17858b2bde7127081fbb


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
  output reg          io_res_valid,
  output     [95:0]   io_res_payload_0_0,
  output     [95:0]   io_res_payload_0_1,
  output     [95:0]   io_res_payload_0_2,
  output     [95:0]   io_res_payload_1_0,
  output     [95:0]   io_res_payload_1_1,
  output     [95:0]   io_res_payload_1_2,
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
  reg        [87:0]   _zz_colMem_0_port0;
  reg        [87:0]   _zz_colMem_0_port1;
  reg        [87:0]   _zz_colMem_1_port0;
  reg        [87:0]   _zz_colMem_1_port1;
  reg        [87:0]   _zz_colMem_2_port0;
  reg        [87:0]   _zz_colMem_2_port1;
  reg        [263:0]  _zz_rowMem_0_port0;
  reg        [263:0]  _zz_rowMem_0_port1;
  reg        [263:0]  _zz_rowMem_0_port2;
  reg        [263:0]  _zz_rowMem_1_port0;
  reg        [263:0]  _zz_rowMem_1_port1;
  reg        [263:0]  _zz_rowMem_1_port2;
  wire                tensorCoreChain_6_io_dataIterReady;
  wire                tensorCoreChain_6_io_loadReady;
  wire       [31:0]   tensorCoreChain_6_io_res_0;
  wire       [31:0]   tensorCoreChain_6_io_res_1;
  wire       [31:0]   tensorCoreChain_6_io_res_2;
  wire                tensorCoreChain_6_io_outValid;
  wire                tensorCoreChain_7_io_dataIterReady;
  wire                tensorCoreChain_7_io_loadReady;
  wire       [31:0]   tensorCoreChain_7_io_res_0;
  wire       [31:0]   tensorCoreChain_7_io_res_1;
  wire       [31:0]   tensorCoreChain_7_io_res_2;
  wire                tensorCoreChain_7_io_outValid;
  wire                tensorCoreChain_8_io_dataIterReady;
  wire                tensorCoreChain_8_io_loadReady;
  wire       [31:0]   tensorCoreChain_8_io_res_0;
  wire       [31:0]   tensorCoreChain_8_io_res_1;
  wire       [31:0]   tensorCoreChain_8_io_res_2;
  wire                tensorCoreChain_8_io_outValid;
  wire                tensorCoreChain_9_io_dataIterReady;
  wire                tensorCoreChain_9_io_loadReady;
  wire       [31:0]   tensorCoreChain_9_io_res_0;
  wire       [31:0]   tensorCoreChain_9_io_res_1;
  wire       [31:0]   tensorCoreChain_9_io_res_2;
  wire                tensorCoreChain_9_io_outValid;
  wire                tensorCoreChain_10_io_dataIterReady;
  wire                tensorCoreChain_10_io_loadReady;
  wire       [31:0]   tensorCoreChain_10_io_res_0;
  wire       [31:0]   tensorCoreChain_10_io_res_1;
  wire       [31:0]   tensorCoreChain_10_io_res_2;
  wire                tensorCoreChain_10_io_outValid;
  wire                tensorCoreChain_11_io_dataIterReady;
  wire                tensorCoreChain_11_io_loadReady;
  wire       [31:0]   tensorCoreChain_11_io_res_0;
  wire       [31:0]   tensorCoreChain_11_io_res_1;
  wire       [31:0]   tensorCoreChain_11_io_res_2;
  wire                tensorCoreChain_11_io_outValid;
  wire                colConverters_0_io_outBlk_flatten_valid;
  wire       [87:0]   colConverters_0_io_outBlk_flatten_payload;
  wire                colConverters_1_io_outBlk_flatten_valid;
  wire       [87:0]   colConverters_1_io_outBlk_flatten_payload;
  wire                colConverters_2_io_outBlk_flatten_valid;
  wire       [87:0]   colConverters_2_io_outBlk_flatten_payload;
  wire                bfp_converter_wrapper_9_io_outBlk_flatten_valid;
  wire       [87:0]   bfp_converter_wrapper_9_io_outBlk_flatten_payload;
  wire                bfp_converter_wrapper_10_io_outBlk_flatten_valid;
  wire       [87:0]   bfp_converter_wrapper_10_io_outBlk_flatten_payload;
  wire                bfp_converter_wrapper_11_io_outBlk_flatten_valid;
  wire       [87:0]   bfp_converter_wrapper_11_io_outBlk_flatten_payload;
  wire                bfp_converter_wrapper_12_io_outBlk_flatten_valid;
  wire       [87:0]   bfp_converter_wrapper_12_io_outBlk_flatten_payload;
  wire                bfp_converter_wrapper_13_io_outBlk_flatten_valid;
  wire       [87:0]   bfp_converter_wrapper_13_io_outBlk_flatten_payload;
  wire                bfp_converter_wrapper_14_io_outBlk_flatten_valid;
  wire       [87:0]   bfp_converter_wrapper_14_io_outBlk_flatten_payload;
  wire       [3:0]    _zz_rowBufferRdCounter_valueNext;
  wire       [0:0]    _zz_rowBufferRdCounter_valueNext_1;
  wire       [3:0]    _zz_colBufferRdCounter_valueNext;
  wire       [0:0]    _zz_colBufferRdCounter_valueNext_1;
  wire                _zz_rowMem_0_port;
  wire                _zz__zz_io_dataIn_0_1;
  wire                _zz_colMem_0_port;
  wire                _zz__zz_io_loadCascadeIn_1;
  wire                _zz_rowMem_0_port_1;
  wire                _zz__zz_io_dataIn_0_4;
  wire                _zz_colMem_1_port;
  wire                _zz__zz_io_loadCascadeIn_3;
  wire                _zz_rowMem_0_port_2;
  wire                _zz__zz_io_dataIn_0_7;
  wire                _zz_colMem_2_port;
  wire                _zz__zz_io_loadCascadeIn_5;
  wire                _zz_rowMem_1_port;
  wire                _zz__zz_io_dataIn_0_10;
  wire                _zz_colMem_0_port_1;
  wire                _zz__zz_io_loadCascadeIn_7;
  wire                _zz_rowMem_1_port_1;
  wire                _zz__zz_io_dataIn_0_13;
  wire                _zz_colMem_1_port_1;
  wire                _zz__zz_io_loadCascadeIn_9;
  wire                _zz_rowMem_1_port_2;
  wire                _zz__zz_io_dataIn_0_16;
  wire                _zz_colMem_2_port_1;
  wire                _zz__zz_io_loadCascadeIn_11;
  wire       [3:0]    _zz__zz_8;
  wire       [0:0]    _zz__zz_8_1;
  wire       [8:0]    _zz_colMem_0_port_2;
  wire       [87:0]   _zz_colMem_0_port_3;
  wire       [3:0]    _zz__zz_14;
  wire       [0:0]    _zz__zz_14_1;
  wire       [8:0]    _zz_colMem_1_port_2;
  wire       [87:0]   _zz_colMem_1_port_3;
  wire       [3:0]    _zz__zz_20;
  wire       [0:0]    _zz__zz_20_1;
  wire       [8:0]    _zz_colMem_2_port_2;
  wire       [87:0]   _zz_colMem_2_port_3;
  wire       [3:0]    _zz__zz_26;
  wire       [0:0]    _zz__zz_26_1;
  wire       [8:0]    _zz_rowMem_0_port_3;
  wire       [263:0]  _zz_rowMem_0_port_4;
  wire       [3:0]    _zz__zz_33;
  wire       [0:0]    _zz__zz_33_1;
  wire       [8:0]    _zz_rowMem_1_port_3;
  wire       [263:0]  _zz_rowMem_1_port_4;
  wire       [7:0]    _zz_ctrlStateMachine_loadIterCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_loadIterCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_computeIterCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_computeIterCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_resValidCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_resValidCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_resValidCounter_overflowVal;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  reg                 rowBufferRdCounter_willIncrement;
  reg                 rowBufferRdCounter_willClear;
  reg        [3:0]    rowBufferRdCounter_valueNext;
  reg        [3:0]    rowBufferRdCounter_value;
  wire                rowBufferRdCounter_willOverflowIfInc;
  wire                rowBufferRdCounter_willOverflow;
  reg                 colBufferRdCounter_willIncrement;
  reg                 colBufferRdCounter_willClear;
  reg        [3:0]    colBufferRdCounter_valueNext;
  reg        [3:0]    colBufferRdCounter_value;
  wire                colBufferRdCounter_willOverflowIfInc;
  wire                colBufferRdCounter_willOverflow;
  reg                 tensorLoadValid;
  reg                 tensorDataValid;
  reg        [7:0]    computeItersReg;
  wire       [8:0]    _zz_io_dataIn_0;
  wire       [263:0]  _zz_io_dataIn_0_1;
  wire       [87:0]   _zz_io_dataIn_0_2;
  wire       [87:0]   _zz_io_dataIn_1;
  wire       [87:0]   _zz_io_dataIn_2;
  wire       [8:0]    _zz_io_loadCascadeIn;
  wire       [87:0]   _zz_io_loadCascadeIn_1;
  wire       [8:0]    _zz_io_dataIn_0_3;
  wire       [263:0]  _zz_io_dataIn_0_4;
  wire       [87:0]   _zz_io_dataIn_0_5;
  wire       [87:0]   _zz_io_dataIn_1_1;
  wire       [87:0]   _zz_io_dataIn_2_1;
  wire       [8:0]    _zz_io_loadCascadeIn_2;
  wire       [87:0]   _zz_io_loadCascadeIn_3;
  wire       [8:0]    _zz_io_dataIn_0_6;
  wire       [263:0]  _zz_io_dataIn_0_7;
  wire       [87:0]   _zz_io_dataIn_0_8;
  wire       [87:0]   _zz_io_dataIn_1_2;
  wire       [87:0]   _zz_io_dataIn_2_2;
  wire       [8:0]    _zz_io_loadCascadeIn_4;
  wire       [87:0]   _zz_io_loadCascadeIn_5;
  wire       [8:0]    _zz_io_dataIn_0_9;
  wire       [263:0]  _zz_io_dataIn_0_10;
  wire       [87:0]   _zz_io_dataIn_0_11;
  wire       [87:0]   _zz_io_dataIn_1_3;
  wire       [87:0]   _zz_io_dataIn_2_3;
  wire       [8:0]    _zz_io_loadCascadeIn_6;
  wire       [87:0]   _zz_io_loadCascadeIn_7;
  wire       [8:0]    _zz_io_dataIn_0_12;
  wire       [263:0]  _zz_io_dataIn_0_13;
  wire       [87:0]   _zz_io_dataIn_0_14;
  wire       [87:0]   _zz_io_dataIn_1_4;
  wire       [87:0]   _zz_io_dataIn_2_4;
  wire       [8:0]    _zz_io_loadCascadeIn_8;
  wire       [87:0]   _zz_io_loadCascadeIn_9;
  wire       [8:0]    _zz_io_dataIn_0_15;
  wire       [263:0]  _zz_io_dataIn_0_16;
  wire       [87:0]   _zz_io_dataIn_0_17;
  wire       [87:0]   _zz_io_dataIn_1_5;
  wire       [87:0]   _zz_io_dataIn_2_5;
  wire       [8:0]    _zz_io_loadCascadeIn_10;
  wire       [87:0]   _zz_io_loadCascadeIn_11;
  reg                 _zz_6;
  reg                 _zz_7;
  reg        [3:0]    _zz_8;
  reg        [3:0]    _zz_9;
  wire                _zz_10;
  wire                _zz_11;
  reg                 _zz_12;
  reg                 _zz_13;
  reg        [3:0]    _zz_14;
  reg        [3:0]    _zz_15;
  wire                _zz_16;
  wire                _zz_17;
  reg                 _zz_18;
  reg                 _zz_19;
  reg        [3:0]    _zz_20;
  reg        [3:0]    _zz_21;
  wire                _zz_22;
  wire                _zz_23;
  reg                 _zz_24;
  reg                 _zz_25;
  reg        [3:0]    _zz_26;
  reg        [3:0]    _zz_27;
  wire                _zz_28;
  wire                _zz_29;
  reg        [263:0]  _zz_30;
  reg                 _zz_31;
  reg                 _zz_32;
  reg        [3:0]    _zz_33;
  reg        [3:0]    _zz_34;
  wire                _zz_35;
  wire                _zz_36;
  reg        [263:0]  _zz_37;
  wire                ctrlStateMachine_wantExit;
  reg                 ctrlStateMachine_wantStart;
  wire                ctrlStateMachine_wantKill;
  wire                ctrlStateMachine_loadRdy;
  wire                ctrlStateMachine_dataInIterReady;
  wire                ctrlStateMachine_resOutValid;
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
  wire                when_StateMachine_l230;
  wire                when_StateMachine_l230_1;
  wire                when_StateMachine_l230_2;
  `ifndef SYNTHESIS
  reg [207:0] ctrlStateMachine_stateReg_string;
  reg [207:0] ctrlStateMachine_stateNext_string;
  `endif

  reg [87:0] colMem_0 [0:511];
  reg [87:0] colMem_1 [0:511];
  reg [87:0] colMem_2 [0:511];
  reg [263:0] rowMem_0 [0:511];
  reg [263:0] rowMem_1 [0:511];

  assign _zz_rowBufferRdCounter_valueNext_1 = rowBufferRdCounter_willIncrement;
  assign _zz_rowBufferRdCounter_valueNext = {3'd0, _zz_rowBufferRdCounter_valueNext_1};
  assign _zz_colBufferRdCounter_valueNext_1 = colBufferRdCounter_willIncrement;
  assign _zz_colBufferRdCounter_valueNext = {3'd0, _zz_colBufferRdCounter_valueNext_1};
  assign _zz__zz_8_1 = _zz_6;
  assign _zz__zz_8 = {3'd0, _zz__zz_8_1};
  assign _zz_colMem_0_port_2 = {5'd0, _zz_9};
  assign _zz__zz_14_1 = _zz_12;
  assign _zz__zz_14 = {3'd0, _zz__zz_14_1};
  assign _zz_colMem_1_port_2 = {5'd0, _zz_15};
  assign _zz__zz_20_1 = _zz_18;
  assign _zz__zz_20 = {3'd0, _zz__zz_20_1};
  assign _zz_colMem_2_port_2 = {5'd0, _zz_21};
  assign _zz__zz_26_1 = _zz_24;
  assign _zz__zz_26 = {3'd0, _zz__zz_26_1};
  assign _zz_rowMem_0_port_3 = {5'd0, _zz_27};
  assign _zz__zz_33_1 = _zz_31;
  assign _zz__zz_33 = {3'd0, _zz__zz_33_1};
  assign _zz_rowMem_1_port_3 = {5'd0, _zz_34};
  assign _zz_ctrlStateMachine_loadIterCounter_valueNext_1 = ctrlStateMachine_loadIterCounter_willIncrement;
  assign _zz_ctrlStateMachine_loadIterCounter_valueNext = {7'd0, _zz_ctrlStateMachine_loadIterCounter_valueNext_1};
  assign _zz_ctrlStateMachine_computeIterCounter_valueNext_1 = ctrlStateMachine_computeIterCounter_willIncrement;
  assign _zz_ctrlStateMachine_computeIterCounter_valueNext = {7'd0, _zz_ctrlStateMachine_computeIterCounter_valueNext_1};
  assign _zz_ctrlStateMachine_resValidCounter_valueNext_1 = ctrlStateMachine_resValidCounter_willIncrement;
  assign _zz_ctrlStateMachine_resValidCounter_valueNext = {7'd0, _zz_ctrlStateMachine_resValidCounter_valueNext_1};
  assign _zz_ctrlStateMachine_resValidCounter_overflowVal = (computeItersReg - 8'h01);
  assign _zz__zz_io_loadCascadeIn_1 = 1'b1;
  assign _zz__zz_io_loadCascadeIn_7 = 1'b1;
  assign _zz_colMem_0_port_3 = colConverters_0_io_outBlk_flatten_payload;
  assign _zz__zz_io_loadCascadeIn_3 = 1'b1;
  assign _zz__zz_io_loadCascadeIn_9 = 1'b1;
  assign _zz_colMem_1_port_3 = colConverters_1_io_outBlk_flatten_payload;
  assign _zz__zz_io_loadCascadeIn_5 = 1'b1;
  assign _zz__zz_io_loadCascadeIn_11 = 1'b1;
  assign _zz_colMem_2_port_3 = colConverters_2_io_outBlk_flatten_payload;
  assign _zz__zz_io_dataIn_0_1 = 1'b1;
  assign _zz__zz_io_dataIn_0_4 = 1'b1;
  assign _zz__zz_io_dataIn_0_7 = 1'b1;
  assign _zz_rowMem_0_port_4 = _zz_30;
  assign _zz__zz_io_dataIn_0_10 = 1'b1;
  assign _zz__zz_io_dataIn_0_13 = 1'b1;
  assign _zz__zz_io_dataIn_0_16 = 1'b1;
  assign _zz_rowMem_1_port_4 = _zz_37;
  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_1) begin
      _zz_colMem_0_port0 <= colMem_0[_zz_io_loadCascadeIn];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_7) begin
      _zz_colMem_0_port1 <= colMem_0[_zz_io_loadCascadeIn_6];
    end
  end

  always @(posedge clk) begin
    if(_zz_5) begin
      colMem_0[_zz_colMem_0_port_2] <= _zz_colMem_0_port_3;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_3) begin
      _zz_colMem_1_port0 <= colMem_1[_zz_io_loadCascadeIn_2];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_9) begin
      _zz_colMem_1_port1 <= colMem_1[_zz_io_loadCascadeIn_8];
    end
  end

  always @(posedge clk) begin
    if(_zz_4) begin
      colMem_1[_zz_colMem_1_port_2] <= _zz_colMem_1_port_3;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_5) begin
      _zz_colMem_2_port0 <= colMem_2[_zz_io_loadCascadeIn_4];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_11) begin
      _zz_colMem_2_port1 <= colMem_2[_zz_io_loadCascadeIn_10];
    end
  end

  always @(posedge clk) begin
    if(_zz_3) begin
      colMem_2[_zz_colMem_2_port_2] <= _zz_colMem_2_port_3;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_1) begin
      _zz_rowMem_0_port0 <= rowMem_0[_zz_io_dataIn_0];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_4) begin
      _zz_rowMem_0_port1 <= rowMem_0[_zz_io_dataIn_0_3];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_7) begin
      _zz_rowMem_0_port2 <= rowMem_0[_zz_io_dataIn_0_6];
    end
  end

  always @(posedge clk) begin
    if(_zz_2) begin
      rowMem_0[_zz_rowMem_0_port_3] <= _zz_rowMem_0_port_4;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_10) begin
      _zz_rowMem_1_port0 <= rowMem_1[_zz_io_dataIn_0_9];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_13) begin
      _zz_rowMem_1_port1 <= rowMem_1[_zz_io_dataIn_0_12];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_16) begin
      _zz_rowMem_1_port2 <= rowMem_1[_zz_io_dataIn_0_15];
    end
  end

  always @(posedge clk) begin
    if(_zz_1) begin
      rowMem_1[_zz_rowMem_1_port_3] <= _zz_rowMem_1_port_4;
    end
  end

  TensorCoreChain tensorCoreChain_6 (
    .io_dataIn_0         (tensorCoreChain_6_io_dataIn_0       ), //i
    .io_dataIn_1         (tensorCoreChain_6_io_dataIn_1       ), //i
    .io_dataIn_2         (tensorCoreChain_6_io_dataIn_2       ), //i
    .io_loadCascadeIn    (tensorCoreChain_6_io_loadCascadeIn  ), //i
    .io_expIn_0          (tensorCoreChain_6_io_expIn_0        ), //i
    .io_expIn_1          (tensorCoreChain_6_io_expIn_1        ), //i
    .io_expIn_2          (tensorCoreChain_6_io_expIn_2        ), //i
    .io_expCascadeIn     (tensorCoreChain_6_io_expCascadeIn   ), //i
    .io_dataValid        (tensorDataValid                     ), //i
    .io_dataIterReady    (tensorCoreChain_6_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid                     ), //i
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
    .io_dataValid        (tensorDataValid                     ), //i
    .io_dataIterReady    (tensorCoreChain_7_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid                     ), //i
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
    .io_dataValid        (tensorDataValid                     ), //i
    .io_dataIterReady    (tensorCoreChain_8_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid                     ), //i
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
    .io_dataValid        (tensorDataValid                     ), //i
    .io_dataIterReady    (tensorCoreChain_9_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid                     ), //i
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
    .io_dataValid        (tensorDataValid                      ), //i
    .io_dataIterReady    (tensorCoreChain_10_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid                      ), //i
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
    .io_dataValid        (tensorDataValid                      ), //i
    .io_dataIterReady    (tensorCoreChain_11_io_dataIterReady  ), //o
    .io_loadValid        (tensorLoadValid                      ), //i
    .io_loadReady        (tensorCoreChain_11_io_loadReady      ), //o
    .io_res_0            (tensorCoreChain_11_io_res_0          ), //o
    .io_res_1            (tensorCoreChain_11_io_res_1          ), //o
    .io_res_2            (tensorCoreChain_11_io_res_2          ), //o
    .io_inputIters       (8'h09                                ), //i
    .io_outValid         (tensorCoreChain_11_io_outValid       ), //o
    .clk                 (clk                                  ), //i
    .resetn              (resetn                               )  //i
  );
  bfp_converter_wrapper colConverters_0 (
    .io_in_vector_flatten_valid      (io_matALoad_0_valid                        ), //i
    .io_in_vector_flatten_payload    (io_matALoad_0_payload                      ), //i
    .io_outBlk_flatten_valid         (colConverters_0_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (colConverters_0_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                     ), //i
    .clk                             (clk                                        )  //i
  );
  bfp_converter_wrapper colConverters_1 (
    .io_in_vector_flatten_valid      (io_matALoad_1_valid                        ), //i
    .io_in_vector_flatten_payload    (io_matALoad_1_payload                      ), //i
    .io_outBlk_flatten_valid         (colConverters_1_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (colConverters_1_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                     ), //i
    .clk                             (clk                                        )  //i
  );
  bfp_converter_wrapper colConverters_2 (
    .io_in_vector_flatten_valid      (io_matALoad_2_valid                        ), //i
    .io_in_vector_flatten_payload    (io_matALoad_2_payload                      ), //i
    .io_outBlk_flatten_valid         (colConverters_2_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (colConverters_2_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                     ), //i
    .clk                             (clk                                        )  //i
  );
  bfp_converter_wrapper bfp_converter_wrapper_9 (
    .io_in_vector_flatten_valid      (io_matBLoad_0_0_valid                              ), //i
    .io_in_vector_flatten_payload    (io_matBLoad_0_0_payload                            ), //i
    .io_outBlk_flatten_valid         (bfp_converter_wrapper_9_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (bfp_converter_wrapper_9_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                             ), //i
    .clk                             (clk                                                )  //i
  );
  bfp_converter_wrapper bfp_converter_wrapper_10 (
    .io_in_vector_flatten_valid      (io_matBLoad_0_1_valid                               ), //i
    .io_in_vector_flatten_payload    (io_matBLoad_0_1_payload                             ), //i
    .io_outBlk_flatten_valid         (bfp_converter_wrapper_10_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (bfp_converter_wrapper_10_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                              ), //i
    .clk                             (clk                                                 )  //i
  );
  bfp_converter_wrapper bfp_converter_wrapper_11 (
    .io_in_vector_flatten_valid      (io_matBLoad_0_2_valid                               ), //i
    .io_in_vector_flatten_payload    (io_matBLoad_0_2_payload                             ), //i
    .io_outBlk_flatten_valid         (bfp_converter_wrapper_11_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (bfp_converter_wrapper_11_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                              ), //i
    .clk                             (clk                                                 )  //i
  );
  bfp_converter_wrapper bfp_converter_wrapper_12 (
    .io_in_vector_flatten_valid      (io_matBLoad_1_0_valid                               ), //i
    .io_in_vector_flatten_payload    (io_matBLoad_1_0_payload                             ), //i
    .io_outBlk_flatten_valid         (bfp_converter_wrapper_12_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (bfp_converter_wrapper_12_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                              ), //i
    .clk                             (clk                                                 )  //i
  );
  bfp_converter_wrapper bfp_converter_wrapper_13 (
    .io_in_vector_flatten_valid      (io_matBLoad_1_1_valid                               ), //i
    .io_in_vector_flatten_payload    (io_matBLoad_1_1_payload                             ), //i
    .io_outBlk_flatten_valid         (bfp_converter_wrapper_13_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (bfp_converter_wrapper_13_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                              ), //i
    .clk                             (clk                                                 )  //i
  );
  bfp_converter_wrapper bfp_converter_wrapper_14 (
    .io_in_vector_flatten_valid      (io_matBLoad_1_2_valid                               ), //i
    .io_in_vector_flatten_payload    (io_matBLoad_1_2_payload                             ), //i
    .io_outBlk_flatten_valid         (bfp_converter_wrapper_14_io_outBlk_flatten_valid    ), //o
    .io_outBlk_flatten_payload       (bfp_converter_wrapper_14_io_outBlk_flatten_payload  ), //o
    .resetn                          (resetn                                              ), //i
    .clk                             (clk                                                 )  //i
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
    _zz_1 = 1'b0;
    if(bfp_converter_wrapper_12_io_outBlk_flatten_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(bfp_converter_wrapper_9_io_outBlk_flatten_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(colConverters_2_io_outBlk_flatten_valid) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(colConverters_1_io_outBlk_flatten_valid) begin
      _zz_4 = 1'b1;
    end
  end

  always @(*) begin
    _zz_5 = 1'b0;
    if(colConverters_0_io_outBlk_flatten_valid) begin
      _zz_5 = 1'b1;
    end
  end

  always @(*) begin
    rowBufferRdCounter_willIncrement = 1'b0;
    if(when_StateMachine_l230_2) begin
      rowBufferRdCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowBufferRdCounter_willClear = 1'b0;
    if(when_StateMachine_l230) begin
      rowBufferRdCounter_willClear = 1'b1;
    end
  end

  assign rowBufferRdCounter_willOverflowIfInc = (rowBufferRdCounter_value == 4'b1000);
  assign rowBufferRdCounter_willOverflow = (rowBufferRdCounter_willOverflowIfInc && rowBufferRdCounter_willIncrement);
  always @(*) begin
    if(rowBufferRdCounter_willOverflow) begin
      rowBufferRdCounter_valueNext = 4'b0000;
    end else begin
      rowBufferRdCounter_valueNext = (rowBufferRdCounter_value + _zz_rowBufferRdCounter_valueNext);
    end
    if(rowBufferRdCounter_willClear) begin
      rowBufferRdCounter_valueNext = 4'b0000;
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
    if(when_StateMachine_l230) begin
      colBufferRdCounter_willClear = 1'b1;
    end
  end

  assign colBufferRdCounter_willOverflowIfInc = (colBufferRdCounter_value == 4'b1000);
  assign colBufferRdCounter_willOverflow = (colBufferRdCounter_willOverflowIfInc && colBufferRdCounter_willIncrement);
  always @(*) begin
    if(colBufferRdCounter_willOverflow) begin
      colBufferRdCounter_valueNext = 4'b0000;
    end else begin
      colBufferRdCounter_valueNext = (colBufferRdCounter_value + _zz_colBufferRdCounter_valueNext);
    end
    if(colBufferRdCounter_willClear) begin
      colBufferRdCounter_valueNext = 4'b0000;
    end
  end

  assign _zz_io_dataIn_0 = {5'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_1 = _zz_rowMem_0_port0;
  assign _zz_io_dataIn_0_2 = _zz_io_dataIn_0_1[87 : 0];
  assign _zz_io_dataIn_1 = _zz_io_dataIn_0_1[175 : 88];
  assign _zz_io_dataIn_2 = _zz_io_dataIn_0_1[263 : 176];
  assign _zz_io_loadCascadeIn = {5'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_1 = _zz_colMem_0_port0;
  assign tensorCoreChain_6_io_dataIn_0 = _zz_io_dataIn_0_2[87 : 8];
  assign tensorCoreChain_6_io_expIn_0 = _zz_io_dataIn_0_2[7 : 0];
  assign tensorCoreChain_6_io_dataIn_1 = _zz_io_dataIn_1[87 : 8];
  assign tensorCoreChain_6_io_expIn_1 = _zz_io_dataIn_1[7 : 0];
  assign tensorCoreChain_6_io_dataIn_2 = _zz_io_dataIn_2[87 : 8];
  assign tensorCoreChain_6_io_expIn_2 = _zz_io_dataIn_2[7 : 0];
  assign tensorCoreChain_6_io_loadCascadeIn = _zz_io_loadCascadeIn_1[87 : 8];
  assign tensorCoreChain_6_io_expCascadeIn = _zz_io_loadCascadeIn_1[7 : 0];
  assign io_res_payload_0_0 = {tensorCoreChain_6_io_res_2,{tensorCoreChain_6_io_res_1,tensorCoreChain_6_io_res_0}};
  assign _zz_io_dataIn_0_3 = {5'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_4 = _zz_rowMem_0_port1;
  assign _zz_io_dataIn_0_5 = _zz_io_dataIn_0_4[87 : 0];
  assign _zz_io_dataIn_1_1 = _zz_io_dataIn_0_4[175 : 88];
  assign _zz_io_dataIn_2_1 = _zz_io_dataIn_0_4[263 : 176];
  assign _zz_io_loadCascadeIn_2 = {5'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_3 = _zz_colMem_1_port0;
  assign tensorCoreChain_7_io_dataIn_0 = _zz_io_dataIn_0_5[87 : 8];
  assign tensorCoreChain_7_io_expIn_0 = _zz_io_dataIn_0_5[7 : 0];
  assign tensorCoreChain_7_io_dataIn_1 = _zz_io_dataIn_1_1[87 : 8];
  assign tensorCoreChain_7_io_expIn_1 = _zz_io_dataIn_1_1[7 : 0];
  assign tensorCoreChain_7_io_dataIn_2 = _zz_io_dataIn_2_1[87 : 8];
  assign tensorCoreChain_7_io_expIn_2 = _zz_io_dataIn_2_1[7 : 0];
  assign tensorCoreChain_7_io_loadCascadeIn = _zz_io_loadCascadeIn_3[87 : 8];
  assign tensorCoreChain_7_io_expCascadeIn = _zz_io_loadCascadeIn_3[7 : 0];
  assign io_res_payload_0_1 = {tensorCoreChain_7_io_res_2,{tensorCoreChain_7_io_res_1,tensorCoreChain_7_io_res_0}};
  assign _zz_io_dataIn_0_6 = {5'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_7 = _zz_rowMem_0_port2;
  assign _zz_io_dataIn_0_8 = _zz_io_dataIn_0_7[87 : 0];
  assign _zz_io_dataIn_1_2 = _zz_io_dataIn_0_7[175 : 88];
  assign _zz_io_dataIn_2_2 = _zz_io_dataIn_0_7[263 : 176];
  assign _zz_io_loadCascadeIn_4 = {5'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_5 = _zz_colMem_2_port0;
  assign tensorCoreChain_8_io_dataIn_0 = _zz_io_dataIn_0_8[87 : 8];
  assign tensorCoreChain_8_io_expIn_0 = _zz_io_dataIn_0_8[7 : 0];
  assign tensorCoreChain_8_io_dataIn_1 = _zz_io_dataIn_1_2[87 : 8];
  assign tensorCoreChain_8_io_expIn_1 = _zz_io_dataIn_1_2[7 : 0];
  assign tensorCoreChain_8_io_dataIn_2 = _zz_io_dataIn_2_2[87 : 8];
  assign tensorCoreChain_8_io_expIn_2 = _zz_io_dataIn_2_2[7 : 0];
  assign tensorCoreChain_8_io_loadCascadeIn = _zz_io_loadCascadeIn_5[87 : 8];
  assign tensorCoreChain_8_io_expCascadeIn = _zz_io_loadCascadeIn_5[7 : 0];
  assign io_res_payload_0_2 = {tensorCoreChain_8_io_res_2,{tensorCoreChain_8_io_res_1,tensorCoreChain_8_io_res_0}};
  assign _zz_io_dataIn_0_9 = {5'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_10 = _zz_rowMem_1_port0;
  assign _zz_io_dataIn_0_11 = _zz_io_dataIn_0_10[87 : 0];
  assign _zz_io_dataIn_1_3 = _zz_io_dataIn_0_10[175 : 88];
  assign _zz_io_dataIn_2_3 = _zz_io_dataIn_0_10[263 : 176];
  assign _zz_io_loadCascadeIn_6 = {5'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_7 = _zz_colMem_0_port1;
  assign tensorCoreChain_9_io_dataIn_0 = _zz_io_dataIn_0_11[87 : 8];
  assign tensorCoreChain_9_io_expIn_0 = _zz_io_dataIn_0_11[7 : 0];
  assign tensorCoreChain_9_io_dataIn_1 = _zz_io_dataIn_1_3[87 : 8];
  assign tensorCoreChain_9_io_expIn_1 = _zz_io_dataIn_1_3[7 : 0];
  assign tensorCoreChain_9_io_dataIn_2 = _zz_io_dataIn_2_3[87 : 8];
  assign tensorCoreChain_9_io_expIn_2 = _zz_io_dataIn_2_3[7 : 0];
  assign tensorCoreChain_9_io_loadCascadeIn = _zz_io_loadCascadeIn_7[87 : 8];
  assign tensorCoreChain_9_io_expCascadeIn = _zz_io_loadCascadeIn_7[7 : 0];
  assign io_res_payload_1_0 = {tensorCoreChain_9_io_res_2,{tensorCoreChain_9_io_res_1,tensorCoreChain_9_io_res_0}};
  assign _zz_io_dataIn_0_12 = {5'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_13 = _zz_rowMem_1_port1;
  assign _zz_io_dataIn_0_14 = _zz_io_dataIn_0_13[87 : 0];
  assign _zz_io_dataIn_1_4 = _zz_io_dataIn_0_13[175 : 88];
  assign _zz_io_dataIn_2_4 = _zz_io_dataIn_0_13[263 : 176];
  assign _zz_io_loadCascadeIn_8 = {5'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_9 = _zz_colMem_1_port1;
  assign tensorCoreChain_10_io_dataIn_0 = _zz_io_dataIn_0_14[87 : 8];
  assign tensorCoreChain_10_io_expIn_0 = _zz_io_dataIn_0_14[7 : 0];
  assign tensorCoreChain_10_io_dataIn_1 = _zz_io_dataIn_1_4[87 : 8];
  assign tensorCoreChain_10_io_expIn_1 = _zz_io_dataIn_1_4[7 : 0];
  assign tensorCoreChain_10_io_dataIn_2 = _zz_io_dataIn_2_4[87 : 8];
  assign tensorCoreChain_10_io_expIn_2 = _zz_io_dataIn_2_4[7 : 0];
  assign tensorCoreChain_10_io_loadCascadeIn = _zz_io_loadCascadeIn_9[87 : 8];
  assign tensorCoreChain_10_io_expCascadeIn = _zz_io_loadCascadeIn_9[7 : 0];
  assign io_res_payload_1_1 = {tensorCoreChain_10_io_res_2,{tensorCoreChain_10_io_res_1,tensorCoreChain_10_io_res_0}};
  assign _zz_io_dataIn_0_15 = {5'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_16 = _zz_rowMem_1_port2;
  assign _zz_io_dataIn_0_17 = _zz_io_dataIn_0_16[87 : 0];
  assign _zz_io_dataIn_1_5 = _zz_io_dataIn_0_16[175 : 88];
  assign _zz_io_dataIn_2_5 = _zz_io_dataIn_0_16[263 : 176];
  assign _zz_io_loadCascadeIn_10 = {5'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_11 = _zz_colMem_2_port1;
  assign tensorCoreChain_11_io_dataIn_0 = _zz_io_dataIn_0_17[87 : 8];
  assign tensorCoreChain_11_io_expIn_0 = _zz_io_dataIn_0_17[7 : 0];
  assign tensorCoreChain_11_io_dataIn_1 = _zz_io_dataIn_1_5[87 : 8];
  assign tensorCoreChain_11_io_expIn_1 = _zz_io_dataIn_1_5[7 : 0];
  assign tensorCoreChain_11_io_dataIn_2 = _zz_io_dataIn_2_5[87 : 8];
  assign tensorCoreChain_11_io_expIn_2 = _zz_io_dataIn_2_5[7 : 0];
  assign tensorCoreChain_11_io_loadCascadeIn = _zz_io_loadCascadeIn_11[87 : 8];
  assign tensorCoreChain_11_io_expCascadeIn = _zz_io_loadCascadeIn_11[7 : 0];
  assign io_res_payload_1_2 = {tensorCoreChain_11_io_res_2,{tensorCoreChain_11_io_res_1,tensorCoreChain_11_io_res_0}};
  always @(*) begin
    _zz_6 = 1'b0;
    if(colConverters_0_io_outBlk_flatten_valid) begin
      _zz_6 = 1'b1;
    end
  end

  always @(*) begin
    _zz_7 = 1'b0;
    if(!colConverters_0_io_outBlk_flatten_valid) begin
      _zz_7 = 1'b1;
    end
  end

  assign _zz_10 = (_zz_9 == 4'b1000);
  assign _zz_11 = (_zz_10 && _zz_6);
  always @(*) begin
    if(_zz_11) begin
      _zz_8 = 4'b0000;
    end else begin
      _zz_8 = (_zz_9 + _zz__zz_8);
    end
    if(_zz_7) begin
      _zz_8 = 4'b0000;
    end
  end

  always @(*) begin
    _zz_12 = 1'b0;
    if(colConverters_1_io_outBlk_flatten_valid) begin
      _zz_12 = 1'b1;
    end
  end

  always @(*) begin
    _zz_13 = 1'b0;
    if(!colConverters_1_io_outBlk_flatten_valid) begin
      _zz_13 = 1'b1;
    end
  end

  assign _zz_16 = (_zz_15 == 4'b1000);
  assign _zz_17 = (_zz_16 && _zz_12);
  always @(*) begin
    if(_zz_17) begin
      _zz_14 = 4'b0000;
    end else begin
      _zz_14 = (_zz_15 + _zz__zz_14);
    end
    if(_zz_13) begin
      _zz_14 = 4'b0000;
    end
  end

  always @(*) begin
    _zz_18 = 1'b0;
    if(colConverters_2_io_outBlk_flatten_valid) begin
      _zz_18 = 1'b1;
    end
  end

  always @(*) begin
    _zz_19 = 1'b0;
    if(!colConverters_2_io_outBlk_flatten_valid) begin
      _zz_19 = 1'b1;
    end
  end

  assign _zz_22 = (_zz_21 == 4'b1000);
  assign _zz_23 = (_zz_22 && _zz_18);
  always @(*) begin
    if(_zz_23) begin
      _zz_20 = 4'b0000;
    end else begin
      _zz_20 = (_zz_21 + _zz__zz_20);
    end
    if(_zz_19) begin
      _zz_20 = 4'b0000;
    end
  end

  always @(*) begin
    _zz_24 = 1'b0;
    if(bfp_converter_wrapper_9_io_outBlk_flatten_valid) begin
      _zz_24 = 1'b1;
    end
  end

  always @(*) begin
    _zz_25 = 1'b0;
    if(!bfp_converter_wrapper_9_io_outBlk_flatten_valid) begin
      _zz_25 = 1'b1;
    end
  end

  assign _zz_28 = (_zz_27 == 4'b1000);
  assign _zz_29 = (_zz_28 && _zz_24);
  always @(*) begin
    if(_zz_29) begin
      _zz_26 = 4'b0000;
    end else begin
      _zz_26 = (_zz_27 + _zz__zz_26);
    end
    if(_zz_25) begin
      _zz_26 = 4'b0000;
    end
  end

  always @(*) begin
    _zz_30[87 : 0] = bfp_converter_wrapper_9_io_outBlk_flatten_payload;
    _zz_30[175 : 88] = bfp_converter_wrapper_10_io_outBlk_flatten_payload;
    _zz_30[263 : 176] = bfp_converter_wrapper_11_io_outBlk_flatten_payload;
  end

  always @(*) begin
    _zz_31 = 1'b0;
    if(bfp_converter_wrapper_12_io_outBlk_flatten_valid) begin
      _zz_31 = 1'b1;
    end
  end

  always @(*) begin
    _zz_32 = 1'b0;
    if(!bfp_converter_wrapper_12_io_outBlk_flatten_valid) begin
      _zz_32 = 1'b1;
    end
  end

  assign _zz_35 = (_zz_34 == 4'b1000);
  assign _zz_36 = (_zz_35 && _zz_31);
  always @(*) begin
    if(_zz_36) begin
      _zz_33 = 4'b0000;
    end else begin
      _zz_33 = (_zz_34 + _zz__zz_33);
    end
    if(_zz_32) begin
      _zz_33 = 4'b0000;
    end
  end

  always @(*) begin
    _zz_37[87 : 0] = bfp_converter_wrapper_12_io_outBlk_flatten_payload;
    _zz_37[175 : 88] = bfp_converter_wrapper_13_io_outBlk_flatten_payload;
    _zz_37[263 : 176] = bfp_converter_wrapper_14_io_outBlk_flatten_payload;
  end

  always @(*) begin
    io_res_valid = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sWriteRes : begin
        io_res_valid = ctrlStateMachine_resValidCounter_willOverflowIfInc;
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

  assign ctrlStateMachine_resValidCounter_overflowVal = (_zz_ctrlStateMachine_resValidCounter_overflowVal - 8'h01);
  always @(*) begin
    ctrlStateMachine_stateNext = ctrlStateMachine_stateReg;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
        if(io_calEn) begin
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

  assign when_StateMachine_l230 = ((! (ctrlStateMachine_stateReg == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle)) && (ctrlStateMachine_stateNext == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle));
  assign when_StateMachine_l230_1 = ((! (ctrlStateMachine_stateReg == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad)) && (ctrlStateMachine_stateNext == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad));
  assign when_StateMachine_l230_2 = ((! (ctrlStateMachine_stateReg == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute)) && (ctrlStateMachine_stateNext == `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute));
  always @(posedge clk or negedge resetn) begin
    if(!resetn) begin
      rowBufferRdCounter_value <= 4'b0000;
      colBufferRdCounter_value <= 4'b0000;
      tensorLoadValid <= 1'b0;
      tensorDataValid <= 1'b0;
      computeItersReg <= 8'h0;
      _zz_9 <= 4'b0000;
      _zz_15 <= 4'b0000;
      _zz_21 <= 4'b0000;
      _zz_27 <= 4'b0000;
      _zz_34 <= 4'b0000;
      ctrlStateMachine_loadIterCounter_value <= 8'h0;
      ctrlStateMachine_computeIterCounter_value <= 8'h0;
      ctrlStateMachine_resValidCounter_value <= 8'h0;
      ctrlStateMachine_stateReg <= `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT;
    end else begin
      rowBufferRdCounter_value <= rowBufferRdCounter_valueNext;
      colBufferRdCounter_value <= colBufferRdCounter_valueNext;
      _zz_9 <= _zz_8;
      _zz_15 <= _zz_14;
      _zz_21 <= _zz_20;
      _zz_27 <= _zz_26;
      _zz_34 <= _zz_33;
      ctrlStateMachine_loadIterCounter_value <= ctrlStateMachine_loadIterCounter_valueNext;
      ctrlStateMachine_computeIterCounter_value <= ctrlStateMachine_computeIterCounter_valueNext;
      ctrlStateMachine_resValidCounter_value <= ctrlStateMachine_resValidCounter_valueNext;
      ctrlStateMachine_stateReg <= ctrlStateMachine_stateNext;
      case(ctrlStateMachine_stateReg)
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
          if(io_calEn) begin
            computeItersReg <= io_computeIters;
          end
        end
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
        end
        `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
          if(ctrlStateMachine_loadIterCounter_willOverflow) begin
            tensorLoadValid <= 1'b0;
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
      end
      if(when_StateMachine_l230_1) begin
        tensorLoadValid <= 1'b1;
      end
      if(when_StateMachine_l230_2) begin
        tensorDataValid <= 1'b1;
      end
    end
  end


endmodule

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

//bfp_converter_wrapper replaced by bfp_converter_wrapper

module bfp_converter_wrapper (
  input               io_in_vector_flatten_valid,
  input      [319:0]  io_in_vector_flatten_payload,
  output              io_outBlk_flatten_valid,
  output     [87:0]   io_outBlk_flatten_payload,
  input               resetn,
  input               clk
);
  wire       [79:0]   core_outMants_flatten;
  wire       [7:0]    core_outExp;
  wire                core_valid_out;

  bfp_converter #(
    .V(10),
    .P(10),
    .BIT(32),
    .FPM(23),
    .BFPM(6) 
  ) core (
    .clk                  (clk                           ), //i
    .rst_n                (resetn                        ), //i
    .vector_rdy           (io_in_vector_flatten_valid    ), //i
    .in_vector_flatten    (io_in_vector_flatten_payload  ), //i
    .outMants_flatten     (core_outMants_flatten         ), //o
    .outExp               (core_outExp                   ), //o
    .valid_out            (core_valid_out                )  //o
  );
  assign io_outBlk_flatten_valid = core_valid_out;
  assign io_outBlk_flatten_payload = {core_outMants_flatten,core_outExp};

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
  output     [31:0]   io_res_0,
  output     [31:0]   io_res_1,
  output     [31:0]   io_res_2,
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
  assign io_res_0 = {tcAccu_bf24_col_1,8'h0};
  assign io_res_1 = {tcAccu_bf24_col_2,8'h0};
  assign io_res_2 = {tcAccu_bf24_col_3,8'h0};
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
