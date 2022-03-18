// Generator : SpinalHDL v1.6.0    git head : 73c8d8e2b86b45646e9d0b2e729291f2b65e6be3
// Component : TensorCoreChainArray
// Git hash  : b7b0fe1342b1f7066115c6e00287afe9239c775b


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
  reg        [87:0]   _zz_colMem_0_port1;
  reg        [87:0]   _zz_colMem_0_port2;
  reg        [87:0]   _zz_colMem_1_port1;
  reg        [87:0]   _zz_colMem_1_port2;
  reg        [87:0]   _zz_colMem_2_port1;
  reg        [87:0]   _zz_colMem_2_port2;
  reg        [87:0]   _zz__zz_34_port1;
  reg        [87:0]   _zz__zz_34_port2;
  reg        [87:0]   _zz__zz_34_port3;
  reg        [87:0]   _zz__zz_41_port1;
  reg        [87:0]   _zz__zz_41_port2;
  reg        [87:0]   _zz__zz_41_port3;
  reg        [87:0]   _zz__zz_48_port1;
  reg        [87:0]   _zz__zz_48_port2;
  reg        [87:0]   _zz__zz_48_port3;
  reg        [87:0]   _zz__zz_55_port1;
  reg        [87:0]   _zz__zz_55_port2;
  reg        [87:0]   _zz__zz_55_port3;
  reg        [87:0]   _zz__zz_62_port1;
  reg        [87:0]   _zz__zz_62_port2;
  reg        [87:0]   _zz__zz_62_port3;
  reg        [87:0]   _zz__zz_69_port1;
  reg        [87:0]   _zz__zz_69_port2;
  reg        [87:0]   _zz__zz_69_port3;
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
  wire       [4:0]    _zz_rowBufferRdCounter_valueNext;
  wire       [0:0]    _zz_rowBufferRdCounter_valueNext_1;
  wire       [4:0]    _zz_colBufferRdCounter_valueNext;
  wire       [0:0]    _zz_colBufferRdCounter_valueNext_1;
  wire       [4:0]    _zz__zz_12;
  wire       [0:0]    _zz__zz_12_1;
  wire       [6:0]    _zz_colMem_0_port;
  wire       [87:0]   _zz_colMem_0_port_1;
  wire       [4:0]    _zz__zz_18;
  wire       [0:0]    _zz__zz_18_1;
  wire       [6:0]    _zz_colMem_1_port;
  wire       [87:0]   _zz_colMem_1_port_1;
  wire       [4:0]    _zz__zz_24;
  wire       [0:0]    _zz__zz_24_1;
  wire       [6:0]    _zz_colMem_2_port;
  wire       [87:0]   _zz_colMem_2_port_1;
  wire       [4:0]    _zz__zz_30;
  wire       [0:0]    _zz__zz_30_1;
  wire       [6:0]    _zz__zz_34_port;
  wire       [87:0]   _zz__zz_34_port_1;
  wire       [4:0]    _zz__zz_37;
  wire       [0:0]    _zz__zz_37_1;
  wire       [6:0]    _zz__zz_41_port;
  wire       [87:0]   _zz__zz_41_port_1;
  wire       [4:0]    _zz__zz_44;
  wire       [0:0]    _zz__zz_44_1;
  wire       [6:0]    _zz__zz_48_port;
  wire       [87:0]   _zz__zz_48_port_1;
  wire       [4:0]    _zz__zz_51;
  wire       [0:0]    _zz__zz_51_1;
  wire       [6:0]    _zz__zz_55_port;
  wire       [87:0]   _zz__zz_55_port_1;
  wire       [4:0]    _zz__zz_58;
  wire       [0:0]    _zz__zz_58_1;
  wire       [6:0]    _zz__zz_62_port;
  wire       [87:0]   _zz__zz_62_port_1;
  wire       [4:0]    _zz__zz_65;
  wire       [0:0]    _zz__zz_65_1;
  wire       [6:0]    _zz__zz_69_port;
  wire       [87:0]   _zz__zz_69_port_1;
  wire                _zz__zz_34_port_2;
  wire                _zz__zz_io_dataIn_0_1;
  wire                _zz__zz_41_port_2;
  wire                _zz__zz_io_dataIn_1_1;
  wire                _zz__zz_48_port_2;
  wire                _zz__zz_io_dataIn_2_1;
  wire                _zz_colMem_0_port_2;
  wire                _zz__zz_io_loadCascadeIn_1;
  wire                _zz__zz_34_port_3;
  wire                _zz__zz_io_dataIn_0_3;
  wire                _zz__zz_41_port_3;
  wire                _zz__zz_io_dataIn_1_3;
  wire                _zz__zz_48_port_3;
  wire                _zz__zz_io_dataIn_2_3;
  wire                _zz_colMem_1_port_2;
  wire                _zz__zz_io_loadCascadeIn_3;
  wire                _zz__zz_34_port_4;
  wire                _zz__zz_io_dataIn_0_5;
  wire                _zz__zz_41_port_4;
  wire                _zz__zz_io_dataIn_1_5;
  wire                _zz__zz_48_port_4;
  wire                _zz__zz_io_dataIn_2_5;
  wire                _zz_colMem_2_port_2;
  wire                _zz__zz_io_loadCascadeIn_5;
  wire                _zz__zz_55_port_2;
  wire                _zz__zz_io_dataIn_0_7;
  wire                _zz__zz_62_port_2;
  wire                _zz__zz_io_dataIn_1_7;
  wire                _zz__zz_69_port_2;
  wire                _zz__zz_io_dataIn_2_7;
  wire                _zz_colMem_0_port_3;
  wire                _zz__zz_io_loadCascadeIn_7;
  wire                _zz__zz_55_port_3;
  wire                _zz__zz_io_dataIn_0_9;
  wire                _zz__zz_62_port_3;
  wire                _zz__zz_io_dataIn_1_9;
  wire                _zz__zz_69_port_3;
  wire                _zz__zz_io_dataIn_2_9;
  wire                _zz_colMem_1_port_3;
  wire                _zz__zz_io_loadCascadeIn_9;
  wire                _zz__zz_55_port_4;
  wire                _zz__zz_io_dataIn_0_11;
  wire                _zz__zz_62_port_4;
  wire                _zz__zz_io_dataIn_1_11;
  wire                _zz__zz_69_port_4;
  wire                _zz__zz_io_dataIn_2_11;
  wire                _zz_colMem_2_port_3;
  wire                _zz__zz_io_loadCascadeIn_11;
  wire       [7:0]    _zz_ctrlStateMachine_loadIterCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_loadIterCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_computeIterCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_computeIterCounter_valueNext_1;
  wire       [7:0]    _zz_ctrlStateMachine_resValidCounter_valueNext;
  wire       [0:0]    _zz_ctrlStateMachine_resValidCounter_valueNext_1;
  reg                 _zz_1;
  reg                 _zz_2;
  reg                 _zz_3;
  reg                 _zz_4;
  reg                 _zz_5;
  reg                 _zz_6;
  reg                 _zz_7;
  reg                 _zz_8;
  reg                 _zz_9;
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
  reg                 _zz_10;
  reg                 _zz_11;
  reg        [4:0]    _zz_12;
  reg        [4:0]    _zz_13;
  wire                _zz_14;
  wire                _zz_15;
  reg                 _zz_16;
  reg                 _zz_17;
  reg        [4:0]    _zz_18;
  reg        [4:0]    _zz_19;
  wire                _zz_20;
  wire                _zz_21;
  reg                 _zz_22;
  reg                 _zz_23;
  reg        [4:0]    _zz_24;
  reg        [4:0]    _zz_25;
  wire                _zz_26;
  wire                _zz_27;
  reg                 _zz_28;
  reg                 _zz_29;
  reg        [4:0]    _zz_30;
  reg        [4:0]    _zz_31;
  wire                _zz_32;
  wire                _zz_33;
  reg                 _zz_35;
  reg                 _zz_36;
  reg        [4:0]    _zz_37;
  reg        [4:0]    _zz_38;
  wire                _zz_39;
  wire                _zz_40;
  reg                 _zz_42;
  reg                 _zz_43;
  reg        [4:0]    _zz_44;
  reg        [4:0]    _zz_45;
  wire                _zz_46;
  wire                _zz_47;
  reg                 _zz_49;
  reg                 _zz_50;
  reg        [4:0]    _zz_51;
  reg        [4:0]    _zz_52;
  wire                _zz_53;
  wire                _zz_54;
  reg                 _zz_56;
  reg                 _zz_57;
  reg        [4:0]    _zz_58;
  reg        [4:0]    _zz_59;
  wire                _zz_60;
  wire                _zz_61;
  reg                 _zz_63;
  reg                 _zz_64;
  reg        [4:0]    _zz_65;
  reg        [4:0]    _zz_66;
  wire                _zz_67;
  wire                _zz_68;
  wire       [6:0]    _zz_io_dataIn_0;
  wire       [87:0]   _zz_io_dataIn_0_1;
  wire       [6:0]    _zz_io_dataIn_1;
  wire       [87:0]   _zz_io_dataIn_1_1;
  wire       [6:0]    _zz_io_dataIn_2;
  wire       [87:0]   _zz_io_dataIn_2_1;
  wire       [6:0]    _zz_io_loadCascadeIn;
  wire       [87:0]   _zz_io_loadCascadeIn_1;
  wire       [6:0]    _zz_io_dataIn_0_2;
  wire       [87:0]   _zz_io_dataIn_0_3;
  wire       [6:0]    _zz_io_dataIn_1_2;
  wire       [87:0]   _zz_io_dataIn_1_3;
  wire       [6:0]    _zz_io_dataIn_2_2;
  wire       [87:0]   _zz_io_dataIn_2_3;
  wire       [6:0]    _zz_io_loadCascadeIn_2;
  wire       [87:0]   _zz_io_loadCascadeIn_3;
  wire       [6:0]    _zz_io_dataIn_0_4;
  wire       [87:0]   _zz_io_dataIn_0_5;
  wire       [6:0]    _zz_io_dataIn_1_4;
  wire       [87:0]   _zz_io_dataIn_1_5;
  wire       [6:0]    _zz_io_dataIn_2_4;
  wire       [87:0]   _zz_io_dataIn_2_5;
  wire       [6:0]    _zz_io_loadCascadeIn_4;
  wire       [87:0]   _zz_io_loadCascadeIn_5;
  wire       [6:0]    _zz_io_dataIn_0_6;
  wire       [87:0]   _zz_io_dataIn_0_7;
  wire       [6:0]    _zz_io_dataIn_1_6;
  wire       [87:0]   _zz_io_dataIn_1_7;
  wire       [6:0]    _zz_io_dataIn_2_6;
  wire       [87:0]   _zz_io_dataIn_2_7;
  wire       [6:0]    _zz_io_loadCascadeIn_6;
  wire       [87:0]   _zz_io_loadCascadeIn_7;
  wire       [6:0]    _zz_io_dataIn_0_8;
  wire       [87:0]   _zz_io_dataIn_0_9;
  wire       [6:0]    _zz_io_dataIn_1_8;
  wire       [87:0]   _zz_io_dataIn_1_9;
  wire       [6:0]    _zz_io_dataIn_2_8;
  wire       [87:0]   _zz_io_dataIn_2_9;
  wire       [6:0]    _zz_io_loadCascadeIn_8;
  wire       [87:0]   _zz_io_loadCascadeIn_9;
  wire       [6:0]    _zz_io_dataIn_0_10;
  wire       [87:0]   _zz_io_dataIn_0_11;
  wire       [6:0]    _zz_io_dataIn_1_10;
  wire       [87:0]   _zz_io_dataIn_1_11;
  wire       [6:0]    _zz_io_dataIn_2_10;
  wire       [87:0]   _zz_io_dataIn_2_11;
  wire       [6:0]    _zz_io_loadCascadeIn_10;
  wire       [87:0]   _zz_io_loadCascadeIn_11;
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
  wire                when_TensorCoreChainArray_l146;
  wire                when_TensorCoreChainArray_l156;
  wire                when_StateMachine_l230;
  wire                when_StateMachine_l230_1;
  wire                when_StateMachine_l230_2;
  `ifndef SYNTHESIS
  reg [207:0] ctrlStateMachine_stateReg_string;
  reg [207:0] ctrlStateMachine_stateNext_string;
  `endif

  reg [87:0] colMem_0 [0:127];
  reg [87:0] colMem_1 [0:127];
  reg [87:0] colMem_2 [0:127];
  reg [87:0] _zz_34 [0:127];
  reg [87:0] _zz_41 [0:127];
  reg [87:0] _zz_48 [0:127];
  reg [87:0] _zz_55 [0:127];
  reg [87:0] _zz_62 [0:127];
  reg [87:0] _zz_69 [0:127];

  assign _zz_rowBufferRdCounter_valueNext_1 = rowBufferRdCounter_willIncrement;
  assign _zz_rowBufferRdCounter_valueNext = {4'd0, _zz_rowBufferRdCounter_valueNext_1};
  assign _zz_colBufferRdCounter_valueNext_1 = colBufferRdCounter_willIncrement;
  assign _zz_colBufferRdCounter_valueNext = {4'd0, _zz_colBufferRdCounter_valueNext_1};
  assign _zz__zz_12_1 = _zz_10;
  assign _zz__zz_12 = {4'd0, _zz__zz_12_1};
  assign _zz_colMem_0_port = {2'd0, _zz_13};
  assign _zz__zz_18_1 = _zz_16;
  assign _zz__zz_18 = {4'd0, _zz__zz_18_1};
  assign _zz_colMem_1_port = {2'd0, _zz_19};
  assign _zz__zz_24_1 = _zz_22;
  assign _zz__zz_24 = {4'd0, _zz__zz_24_1};
  assign _zz_colMem_2_port = {2'd0, _zz_25};
  assign _zz__zz_30_1 = _zz_28;
  assign _zz__zz_30 = {4'd0, _zz__zz_30_1};
  assign _zz__zz_34_port = {2'd0, _zz_31};
  assign _zz__zz_37_1 = _zz_35;
  assign _zz__zz_37 = {4'd0, _zz__zz_37_1};
  assign _zz__zz_41_port = {2'd0, _zz_38};
  assign _zz__zz_44_1 = _zz_42;
  assign _zz__zz_44 = {4'd0, _zz__zz_44_1};
  assign _zz__zz_48_port = {2'd0, _zz_45};
  assign _zz__zz_51_1 = _zz_49;
  assign _zz__zz_51 = {4'd0, _zz__zz_51_1};
  assign _zz__zz_55_port = {2'd0, _zz_52};
  assign _zz__zz_58_1 = _zz_56;
  assign _zz__zz_58 = {4'd0, _zz__zz_58_1};
  assign _zz__zz_62_port = {2'd0, _zz_59};
  assign _zz__zz_65_1 = _zz_63;
  assign _zz__zz_65 = {4'd0, _zz__zz_65_1};
  assign _zz__zz_69_port = {2'd0, _zz_66};
  assign _zz_ctrlStateMachine_loadIterCounter_valueNext_1 = ctrlStateMachine_loadIterCounter_willIncrement;
  assign _zz_ctrlStateMachine_loadIterCounter_valueNext = {7'd0, _zz_ctrlStateMachine_loadIterCounter_valueNext_1};
  assign _zz_ctrlStateMachine_computeIterCounter_valueNext_1 = ctrlStateMachine_computeIterCounter_willIncrement;
  assign _zz_ctrlStateMachine_computeIterCounter_valueNext = {7'd0, _zz_ctrlStateMachine_computeIterCounter_valueNext_1};
  assign _zz_ctrlStateMachine_resValidCounter_valueNext_1 = ctrlStateMachine_resValidCounter_willIncrement;
  assign _zz_ctrlStateMachine_resValidCounter_valueNext = {7'd0, _zz_ctrlStateMachine_resValidCounter_valueNext_1};
  assign _zz_colMem_0_port_1 = colConverters_0_io_dataOut_payload;
  assign _zz__zz_io_loadCascadeIn_1 = 1'b1;
  assign _zz__zz_io_loadCascadeIn_7 = 1'b1;
  assign _zz_colMem_1_port_1 = colConverters_1_io_dataOut_payload;
  assign _zz__zz_io_loadCascadeIn_3 = 1'b1;
  assign _zz__zz_io_loadCascadeIn_9 = 1'b1;
  assign _zz_colMem_2_port_1 = colConverters_2_io_dataOut_payload;
  assign _zz__zz_io_loadCascadeIn_5 = 1'b1;
  assign _zz__zz_io_loadCascadeIn_11 = 1'b1;
  assign _zz__zz_34_port_1 = fixedBfpConverter_9_io_dataOut_payload;
  assign _zz__zz_io_dataIn_0_1 = 1'b1;
  assign _zz__zz_io_dataIn_0_3 = 1'b1;
  assign _zz__zz_io_dataIn_0_5 = 1'b1;
  assign _zz__zz_41_port_1 = fixedBfpConverter_10_io_dataOut_payload;
  assign _zz__zz_io_dataIn_1_1 = 1'b1;
  assign _zz__zz_io_dataIn_1_3 = 1'b1;
  assign _zz__zz_io_dataIn_1_5 = 1'b1;
  assign _zz__zz_48_port_1 = fixedBfpConverter_11_io_dataOut_payload;
  assign _zz__zz_io_dataIn_2_1 = 1'b1;
  assign _zz__zz_io_dataIn_2_3 = 1'b1;
  assign _zz__zz_io_dataIn_2_5 = 1'b1;
  assign _zz__zz_55_port_1 = fixedBfpConverter_12_io_dataOut_payload;
  assign _zz__zz_io_dataIn_0_7 = 1'b1;
  assign _zz__zz_io_dataIn_0_9 = 1'b1;
  assign _zz__zz_io_dataIn_0_11 = 1'b1;
  assign _zz__zz_62_port_1 = fixedBfpConverter_13_io_dataOut_payload;
  assign _zz__zz_io_dataIn_1_7 = 1'b1;
  assign _zz__zz_io_dataIn_1_9 = 1'b1;
  assign _zz__zz_io_dataIn_1_11 = 1'b1;
  assign _zz__zz_69_port_1 = fixedBfpConverter_14_io_dataOut_payload;
  assign _zz__zz_io_dataIn_2_7 = 1'b1;
  assign _zz__zz_io_dataIn_2_9 = 1'b1;
  assign _zz__zz_io_dataIn_2_11 = 1'b1;
  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel_colMem_0.bin",colMem_0);
  end
  always @(posedge clk) begin
    if(_zz_9) begin
      colMem_0[_zz_colMem_0_port] <= _zz_colMem_0_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_1) begin
      _zz_colMem_0_port1 <= colMem_0[_zz_io_loadCascadeIn];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_7) begin
      _zz_colMem_0_port2 <= colMem_0[_zz_io_loadCascadeIn_6];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel_colMem_1.bin",colMem_1);
  end
  always @(posedge clk) begin
    if(_zz_8) begin
      colMem_1[_zz_colMem_1_port] <= _zz_colMem_1_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_3) begin
      _zz_colMem_1_port1 <= colMem_1[_zz_io_loadCascadeIn_2];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_9) begin
      _zz_colMem_1_port2 <= colMem_1[_zz_io_loadCascadeIn_8];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel_colMem_2.bin",colMem_2);
  end
  always @(posedge clk) begin
    if(_zz_7) begin
      colMem_2[_zz_colMem_2_port] <= _zz_colMem_2_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_5) begin
      _zz_colMem_2_port1 <= colMem_2[_zz_io_loadCascadeIn_4];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_loadCascadeIn_11) begin
      _zz_colMem_2_port2 <= colMem_2[_zz_io_loadCascadeIn_10];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel__zz_34.bin",_zz_34);
  end
  always @(posedge clk) begin
    if(_zz_6) begin
      _zz_34[_zz__zz_34_port] <= _zz__zz_34_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_1) begin
      _zz__zz_34_port1 <= _zz_34[_zz_io_dataIn_0];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_3) begin
      _zz__zz_34_port2 <= _zz_34[_zz_io_dataIn_0_2];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_5) begin
      _zz__zz_34_port3 <= _zz_34[_zz_io_dataIn_0_4];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel__zz_41.bin",_zz_41);
  end
  always @(posedge clk) begin
    if(_zz_5) begin
      _zz_41[_zz__zz_41_port] <= _zz__zz_41_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_1_1) begin
      _zz__zz_41_port1 <= _zz_41[_zz_io_dataIn_1];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_1_3) begin
      _zz__zz_41_port2 <= _zz_41[_zz_io_dataIn_1_2];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_1_5) begin
      _zz__zz_41_port3 <= _zz_41[_zz_io_dataIn_1_4];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel__zz_48.bin",_zz_48);
  end
  always @(posedge clk) begin
    if(_zz_4) begin
      _zz_48[_zz__zz_48_port] <= _zz__zz_48_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_2_1) begin
      _zz__zz_48_port1 <= _zz_48[_zz_io_dataIn_2];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_2_3) begin
      _zz__zz_48_port2 <= _zz_48[_zz_io_dataIn_2_2];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_2_5) begin
      _zz__zz_48_port3 <= _zz_48[_zz_io_dataIn_2_4];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel__zz_55.bin",_zz_55);
  end
  always @(posedge clk) begin
    if(_zz_3) begin
      _zz_55[_zz__zz_55_port] <= _zz__zz_55_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_7) begin
      _zz__zz_55_port1 <= _zz_55[_zz_io_dataIn_0_6];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_9) begin
      _zz__zz_55_port2 <= _zz_55[_zz_io_dataIn_0_8];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_0_11) begin
      _zz__zz_55_port3 <= _zz_55[_zz_io_dataIn_0_10];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel__zz_62.bin",_zz_62);
  end
  always @(posedge clk) begin
    if(_zz_2) begin
      _zz_62[_zz__zz_62_port] <= _zz__zz_62_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_1_7) begin
      _zz__zz_62_port1 <= _zz_62[_zz_io_dataIn_1_6];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_1_9) begin
      _zz__zz_62_port2 <= _zz_62[_zz_io_dataIn_1_8];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_1_11) begin
      _zz__zz_62_port3 <= _zz_62[_zz_io_dataIn_1_10];
    end
  end

  initial begin
    $readmemb("TensorCoreChainArray.v_toplevel__zz_69.bin",_zz_69);
  end
  always @(posedge clk) begin
    if(_zz_1) begin
      _zz_69[_zz__zz_69_port] <= _zz__zz_69_port_1;
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_2_7) begin
      _zz__zz_69_port1 <= _zz_69[_zz_io_dataIn_2_6];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_2_9) begin
      _zz__zz_69_port2 <= _zz_69[_zz_io_dataIn_2_8];
    end
  end

  always @(posedge clk) begin
    if(_zz__zz_io_dataIn_2_11) begin
      _zz__zz_69_port3 <= _zz_69[_zz_io_dataIn_2_10];
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
    if(fixedBfpConverter_14_io_dataOut_valid) begin
      _zz_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(fixedBfpConverter_13_io_dataOut_valid) begin
      _zz_2 = 1'b1;
    end
  end

  always @(*) begin
    _zz_3 = 1'b0;
    if(fixedBfpConverter_12_io_dataOut_valid) begin
      _zz_3 = 1'b1;
    end
  end

  always @(*) begin
    _zz_4 = 1'b0;
    if(fixedBfpConverter_11_io_dataOut_valid) begin
      _zz_4 = 1'b1;
    end
  end

  always @(*) begin
    _zz_5 = 1'b0;
    if(fixedBfpConverter_10_io_dataOut_valid) begin
      _zz_5 = 1'b1;
    end
  end

  always @(*) begin
    _zz_6 = 1'b0;
    if(fixedBfpConverter_9_io_dataOut_valid) begin
      _zz_6 = 1'b1;
    end
  end

  always @(*) begin
    _zz_7 = 1'b0;
    if(colConverters_2_io_dataOut_valid) begin
      _zz_7 = 1'b1;
    end
  end

  always @(*) begin
    _zz_8 = 1'b0;
    if(colConverters_1_io_dataOut_valid) begin
      _zz_8 = 1'b1;
    end
  end

  always @(*) begin
    _zz_9 = 1'b0;
    if(colConverters_0_io_dataOut_valid) begin
      _zz_9 = 1'b1;
    end
  end

  always @(*) begin
    rowBufferRdCounter_willIncrement = 1'b0;
    case(ctrlStateMachine_stateReg)
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sIdle : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sPreLoad : begin
      end
      `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_sCompute : begin
        if(when_TensorCoreChainArray_l146) begin
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
        if(!when_TensorCoreChainArray_l146) begin
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
        if(when_TensorCoreChainArray_l156) begin
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
        if(!when_TensorCoreChainArray_l156) begin
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
    _zz_10 = 1'b0;
    if(colConverters_0_io_dataOut_valid) begin
      _zz_10 = 1'b1;
    end
  end

  always @(*) begin
    _zz_11 = 1'b0;
    if(!colConverters_0_io_dataOut_valid) begin
      _zz_11 = 1'b1;
    end
  end

  assign _zz_14 = (_zz_13 == 5'h1a);
  assign _zz_15 = (_zz_14 && _zz_10);
  always @(*) begin
    if(_zz_15) begin
      _zz_12 = 5'h0;
    end else begin
      _zz_12 = (_zz_13 + _zz__zz_12);
    end
    if(_zz_11) begin
      _zz_12 = 5'h0;
    end
  end

  always @(*) begin
    _zz_16 = 1'b0;
    if(colConverters_1_io_dataOut_valid) begin
      _zz_16 = 1'b1;
    end
  end

  always @(*) begin
    _zz_17 = 1'b0;
    if(!colConverters_1_io_dataOut_valid) begin
      _zz_17 = 1'b1;
    end
  end

  assign _zz_20 = (_zz_19 == 5'h1a);
  assign _zz_21 = (_zz_20 && _zz_16);
  always @(*) begin
    if(_zz_21) begin
      _zz_18 = 5'h0;
    end else begin
      _zz_18 = (_zz_19 + _zz__zz_18);
    end
    if(_zz_17) begin
      _zz_18 = 5'h0;
    end
  end

  always @(*) begin
    _zz_22 = 1'b0;
    if(colConverters_2_io_dataOut_valid) begin
      _zz_22 = 1'b1;
    end
  end

  always @(*) begin
    _zz_23 = 1'b0;
    if(!colConverters_2_io_dataOut_valid) begin
      _zz_23 = 1'b1;
    end
  end

  assign _zz_26 = (_zz_25 == 5'h1a);
  assign _zz_27 = (_zz_26 && _zz_22);
  always @(*) begin
    if(_zz_27) begin
      _zz_24 = 5'h0;
    end else begin
      _zz_24 = (_zz_25 + _zz__zz_24);
    end
    if(_zz_23) begin
      _zz_24 = 5'h0;
    end
  end

  always @(*) begin
    _zz_28 = 1'b0;
    if(fixedBfpConverter_9_io_dataOut_valid) begin
      _zz_28 = 1'b1;
    end
  end

  always @(*) begin
    _zz_29 = 1'b0;
    if(!fixedBfpConverter_9_io_dataOut_valid) begin
      _zz_29 = 1'b1;
    end
  end

  assign _zz_32 = (_zz_31 == 5'h1a);
  assign _zz_33 = (_zz_32 && _zz_28);
  always @(*) begin
    if(_zz_33) begin
      _zz_30 = 5'h0;
    end else begin
      _zz_30 = (_zz_31 + _zz__zz_30);
    end
    if(_zz_29) begin
      _zz_30 = 5'h0;
    end
  end

  always @(*) begin
    _zz_35 = 1'b0;
    if(fixedBfpConverter_10_io_dataOut_valid) begin
      _zz_35 = 1'b1;
    end
  end

  always @(*) begin
    _zz_36 = 1'b0;
    if(!fixedBfpConverter_10_io_dataOut_valid) begin
      _zz_36 = 1'b1;
    end
  end

  assign _zz_39 = (_zz_38 == 5'h1a);
  assign _zz_40 = (_zz_39 && _zz_35);
  always @(*) begin
    if(_zz_40) begin
      _zz_37 = 5'h0;
    end else begin
      _zz_37 = (_zz_38 + _zz__zz_37);
    end
    if(_zz_36) begin
      _zz_37 = 5'h0;
    end
  end

  always @(*) begin
    _zz_42 = 1'b0;
    if(fixedBfpConverter_11_io_dataOut_valid) begin
      _zz_42 = 1'b1;
    end
  end

  always @(*) begin
    _zz_43 = 1'b0;
    if(!fixedBfpConverter_11_io_dataOut_valid) begin
      _zz_43 = 1'b1;
    end
  end

  assign _zz_46 = (_zz_45 == 5'h1a);
  assign _zz_47 = (_zz_46 && _zz_42);
  always @(*) begin
    if(_zz_47) begin
      _zz_44 = 5'h0;
    end else begin
      _zz_44 = (_zz_45 + _zz__zz_44);
    end
    if(_zz_43) begin
      _zz_44 = 5'h0;
    end
  end

  always @(*) begin
    _zz_49 = 1'b0;
    if(fixedBfpConverter_12_io_dataOut_valid) begin
      _zz_49 = 1'b1;
    end
  end

  always @(*) begin
    _zz_50 = 1'b0;
    if(!fixedBfpConverter_12_io_dataOut_valid) begin
      _zz_50 = 1'b1;
    end
  end

  assign _zz_53 = (_zz_52 == 5'h1a);
  assign _zz_54 = (_zz_53 && _zz_49);
  always @(*) begin
    if(_zz_54) begin
      _zz_51 = 5'h0;
    end else begin
      _zz_51 = (_zz_52 + _zz__zz_51);
    end
    if(_zz_50) begin
      _zz_51 = 5'h0;
    end
  end

  always @(*) begin
    _zz_56 = 1'b0;
    if(fixedBfpConverter_13_io_dataOut_valid) begin
      _zz_56 = 1'b1;
    end
  end

  always @(*) begin
    _zz_57 = 1'b0;
    if(!fixedBfpConverter_13_io_dataOut_valid) begin
      _zz_57 = 1'b1;
    end
  end

  assign _zz_60 = (_zz_59 == 5'h1a);
  assign _zz_61 = (_zz_60 && _zz_56);
  always @(*) begin
    if(_zz_61) begin
      _zz_58 = 5'h0;
    end else begin
      _zz_58 = (_zz_59 + _zz__zz_58);
    end
    if(_zz_57) begin
      _zz_58 = 5'h0;
    end
  end

  always @(*) begin
    _zz_63 = 1'b0;
    if(fixedBfpConverter_14_io_dataOut_valid) begin
      _zz_63 = 1'b1;
    end
  end

  always @(*) begin
    _zz_64 = 1'b0;
    if(!fixedBfpConverter_14_io_dataOut_valid) begin
      _zz_64 = 1'b1;
    end
  end

  assign _zz_67 = (_zz_66 == 5'h1a);
  assign _zz_68 = (_zz_67 && _zz_63);
  always @(*) begin
    if(_zz_68) begin
      _zz_65 = 5'h0;
    end else begin
      _zz_65 = (_zz_66 + _zz__zz_65);
    end
    if(_zz_64) begin
      _zz_65 = 5'h0;
    end
  end

  assign _zz_io_dataIn_0 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_1 = _zz__zz_34_port1;
  assign _zz_io_dataIn_1 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_1_1 = _zz__zz_41_port1;
  assign _zz_io_dataIn_2 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_2_1 = _zz__zz_48_port1;
  assign _zz_io_loadCascadeIn = {2'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_1 = _zz_colMem_0_port1;
  assign tensorCoreChain_6_io_dataIn_0 = (tensorDataValid ? _zz_io_dataIn_0_1[87 : 8] : 80'h0);
  assign tensorCoreChain_6_io_expIn_0 = (tensorDataValid ? _zz_io_dataIn_0_1[7 : 0] : 8'h0);
  assign tensorCoreChain_6_io_dataIn_1 = (tensorDataValid ? _zz_io_dataIn_1_1[87 : 8] : 80'h0);
  assign tensorCoreChain_6_io_expIn_1 = (tensorDataValid ? _zz_io_dataIn_1_1[7 : 0] : 8'h0);
  assign tensorCoreChain_6_io_dataIn_2 = (tensorDataValid ? _zz_io_dataIn_2_1[87 : 8] : 80'h0);
  assign tensorCoreChain_6_io_expIn_2 = (tensorDataValid ? _zz_io_dataIn_2_1[7 : 0] : 8'h0);
  assign tensorCoreChain_6_io_loadCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_1[87 : 8] : 80'h0);
  assign tensorCoreChain_6_io_expCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_1[7 : 0] : 8'h0);
  assign io_res_payload_0_0 = {tensorCoreChain_6_io_res_2,{tensorCoreChain_6_io_res_1,tensorCoreChain_6_io_res_0}};
  assign _zz_io_dataIn_0_2 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_3 = _zz__zz_34_port2;
  assign _zz_io_dataIn_1_2 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_1_3 = _zz__zz_41_port2;
  assign _zz_io_dataIn_2_2 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_2_3 = _zz__zz_48_port2;
  assign _zz_io_loadCascadeIn_2 = {2'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_3 = _zz_colMem_1_port1;
  assign tensorCoreChain_7_io_dataIn_0 = (tensorDataValid ? _zz_io_dataIn_0_3[87 : 8] : 80'h0);
  assign tensorCoreChain_7_io_expIn_0 = (tensorDataValid ? _zz_io_dataIn_0_3[7 : 0] : 8'h0);
  assign tensorCoreChain_7_io_dataIn_1 = (tensorDataValid ? _zz_io_dataIn_1_3[87 : 8] : 80'h0);
  assign tensorCoreChain_7_io_expIn_1 = (tensorDataValid ? _zz_io_dataIn_1_3[7 : 0] : 8'h0);
  assign tensorCoreChain_7_io_dataIn_2 = (tensorDataValid ? _zz_io_dataIn_2_3[87 : 8] : 80'h0);
  assign tensorCoreChain_7_io_expIn_2 = (tensorDataValid ? _zz_io_dataIn_2_3[7 : 0] : 8'h0);
  assign tensorCoreChain_7_io_loadCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_3[87 : 8] : 80'h0);
  assign tensorCoreChain_7_io_expCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_3[7 : 0] : 8'h0);
  assign io_res_payload_0_1 = {tensorCoreChain_7_io_res_2,{tensorCoreChain_7_io_res_1,tensorCoreChain_7_io_res_0}};
  assign _zz_io_dataIn_0_4 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_5 = _zz__zz_34_port3;
  assign _zz_io_dataIn_1_4 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_1_5 = _zz__zz_41_port3;
  assign _zz_io_dataIn_2_4 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_2_5 = _zz__zz_48_port3;
  assign _zz_io_loadCascadeIn_4 = {2'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_5 = _zz_colMem_2_port1;
  assign tensorCoreChain_8_io_dataIn_0 = (tensorDataValid ? _zz_io_dataIn_0_5[87 : 8] : 80'h0);
  assign tensorCoreChain_8_io_expIn_0 = (tensorDataValid ? _zz_io_dataIn_0_5[7 : 0] : 8'h0);
  assign tensorCoreChain_8_io_dataIn_1 = (tensorDataValid ? _zz_io_dataIn_1_5[87 : 8] : 80'h0);
  assign tensorCoreChain_8_io_expIn_1 = (tensorDataValid ? _zz_io_dataIn_1_5[7 : 0] : 8'h0);
  assign tensorCoreChain_8_io_dataIn_2 = (tensorDataValid ? _zz_io_dataIn_2_5[87 : 8] : 80'h0);
  assign tensorCoreChain_8_io_expIn_2 = (tensorDataValid ? _zz_io_dataIn_2_5[7 : 0] : 8'h0);
  assign tensorCoreChain_8_io_loadCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_5[87 : 8] : 80'h0);
  assign tensorCoreChain_8_io_expCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_5[7 : 0] : 8'h0);
  assign io_res_payload_0_2 = {tensorCoreChain_8_io_res_2,{tensorCoreChain_8_io_res_1,tensorCoreChain_8_io_res_0}};
  assign _zz_io_dataIn_0_6 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_7 = _zz__zz_55_port1;
  assign _zz_io_dataIn_1_6 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_1_7 = _zz__zz_62_port1;
  assign _zz_io_dataIn_2_6 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_2_7 = _zz__zz_69_port1;
  assign _zz_io_loadCascadeIn_6 = {2'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_7 = _zz_colMem_0_port2;
  assign tensorCoreChain_9_io_dataIn_0 = (tensorDataValid ? _zz_io_dataIn_0_7[87 : 8] : 80'h0);
  assign tensorCoreChain_9_io_expIn_0 = (tensorDataValid ? _zz_io_dataIn_0_7[7 : 0] : 8'h0);
  assign tensorCoreChain_9_io_dataIn_1 = (tensorDataValid ? _zz_io_dataIn_1_7[87 : 8] : 80'h0);
  assign tensorCoreChain_9_io_expIn_1 = (tensorDataValid ? _zz_io_dataIn_1_7[7 : 0] : 8'h0);
  assign tensorCoreChain_9_io_dataIn_2 = (tensorDataValid ? _zz_io_dataIn_2_7[87 : 8] : 80'h0);
  assign tensorCoreChain_9_io_expIn_2 = (tensorDataValid ? _zz_io_dataIn_2_7[7 : 0] : 8'h0);
  assign tensorCoreChain_9_io_loadCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_7[87 : 8] : 80'h0);
  assign tensorCoreChain_9_io_expCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_7[7 : 0] : 8'h0);
  assign io_res_payload_1_0 = {tensorCoreChain_9_io_res_2,{tensorCoreChain_9_io_res_1,tensorCoreChain_9_io_res_0}};
  assign _zz_io_dataIn_0_8 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_9 = _zz__zz_55_port2;
  assign _zz_io_dataIn_1_8 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_1_9 = _zz__zz_62_port2;
  assign _zz_io_dataIn_2_8 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_2_9 = _zz__zz_69_port2;
  assign _zz_io_loadCascadeIn_8 = {2'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_9 = _zz_colMem_1_port2;
  assign tensorCoreChain_10_io_dataIn_0 = (tensorDataValid ? _zz_io_dataIn_0_9[87 : 8] : 80'h0);
  assign tensorCoreChain_10_io_expIn_0 = (tensorDataValid ? _zz_io_dataIn_0_9[7 : 0] : 8'h0);
  assign tensorCoreChain_10_io_dataIn_1 = (tensorDataValid ? _zz_io_dataIn_1_9[87 : 8] : 80'h0);
  assign tensorCoreChain_10_io_expIn_1 = (tensorDataValid ? _zz_io_dataIn_1_9[7 : 0] : 8'h0);
  assign tensorCoreChain_10_io_dataIn_2 = (tensorDataValid ? _zz_io_dataIn_2_9[87 : 8] : 80'h0);
  assign tensorCoreChain_10_io_expIn_2 = (tensorDataValid ? _zz_io_dataIn_2_9[7 : 0] : 8'h0);
  assign tensorCoreChain_10_io_loadCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_9[87 : 8] : 80'h0);
  assign tensorCoreChain_10_io_expCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_9[7 : 0] : 8'h0);
  assign io_res_payload_1_1 = {tensorCoreChain_10_io_res_2,{tensorCoreChain_10_io_res_1,tensorCoreChain_10_io_res_0}};
  assign _zz_io_dataIn_0_10 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_0_11 = _zz__zz_55_port3;
  assign _zz_io_dataIn_1_10 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_1_11 = _zz__zz_62_port3;
  assign _zz_io_dataIn_2_10 = {2'd0, rowBufferRdCounter_value};
  assign _zz_io_dataIn_2_11 = _zz__zz_69_port3;
  assign _zz_io_loadCascadeIn_10 = {2'd0, colBufferRdCounter_value};
  assign _zz_io_loadCascadeIn_11 = _zz_colMem_2_port2;
  assign tensorCoreChain_11_io_dataIn_0 = (tensorDataValid ? _zz_io_dataIn_0_11[87 : 8] : 80'h0);
  assign tensorCoreChain_11_io_expIn_0 = (tensorDataValid ? _zz_io_dataIn_0_11[7 : 0] : 8'h0);
  assign tensorCoreChain_11_io_dataIn_1 = (tensorDataValid ? _zz_io_dataIn_1_11[87 : 8] : 80'h0);
  assign tensorCoreChain_11_io_expIn_1 = (tensorDataValid ? _zz_io_dataIn_1_11[7 : 0] : 8'h0);
  assign tensorCoreChain_11_io_dataIn_2 = (tensorDataValid ? _zz_io_dataIn_2_11[87 : 8] : 80'h0);
  assign tensorCoreChain_11_io_expIn_2 = (tensorDataValid ? _zz_io_dataIn_2_11[7 : 0] : 8'h0);
  assign tensorCoreChain_11_io_loadCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_11[87 : 8] : 80'h0);
  assign tensorCoreChain_11_io_expCascadeIn = (tensorLoadValid ? _zz_io_loadCascadeIn_11[7 : 0] : 8'h0);
  assign io_res_payload_1_2 = {tensorCoreChain_11_io_res_2,{tensorCoreChain_11_io_res_1,tensorCoreChain_11_io_res_0}};
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

  assign ctrlStateMachine_resValidCounter_overflowVal = (computeItersReg - 8'h01);
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

  assign when_TensorCoreChainArray_l146 = (ctrlStateMachine_dataInFinish == 1'b0);
  assign when_TensorCoreChainArray_l156 = (ctrlStateMachine_loadFinish == 1'b0);
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
      _zz_13 <= 5'h0;
      _zz_19 <= 5'h0;
      _zz_25 <= 5'h0;
      _zz_31 <= 5'h0;
      _zz_38 <= 5'h0;
      _zz_45 <= 5'h0;
      _zz_52 <= 5'h0;
      _zz_59 <= 5'h0;
      _zz_66 <= 5'h0;
      ctrlStateMachine_loadFinish <= 1'b0;
      ctrlStateMachine_dataInFinish <= 1'b0;
      ctrlStateMachine_loadIterCounter_value <= 8'h0;
      ctrlStateMachine_computeIterCounter_value <= 8'h0;
      ctrlStateMachine_resValidCounter_value <= 8'h0;
      ctrlStateMachine_stateReg <= `ctrlStateMachine_enumDefinition_binary_sequential_ctrlStateMachine_BOOT;
    end else begin
      rowBufferRdCounter_value <= rowBufferRdCounter_valueNext;
      colBufferRdCounter_value <= colBufferRdCounter_valueNext;
      _zz_13 <= _zz_12;
      _zz_19 <= _zz_18;
      _zz_25 <= _zz_24;
      _zz_31 <= _zz_30;
      _zz_38 <= _zz_37;
      _zz_45 <= _zz_44;
      _zz_52 <= _zz_51;
      _zz_59 <= _zz_58;
      _zz_66 <= _zz_65;
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
          if(!when_TensorCoreChainArray_l146) begin
            tensorDataValid <= 1'b0;
          end
          if(rowBufferRdCounter_willOverflow) begin
            ctrlStateMachine_dataInFinish <= 1'b1;
          end
          if(!when_TensorCoreChainArray_l156) begin
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
  wire       [9:0]    _zz_resMants_0_1;
  wire       [9:0]    _zz_resMants_0_2;
  wire       [8:0]    _zz_resMants_0_3;
  wire       [9:0]    _zz_resMants_0_4;
  wire       [7:0]    _zz__zz_resMants_1;
  wire       [9:0]    _zz_resMants_1_1;
  wire       [9:0]    _zz_resMants_1_2;
  wire       [8:0]    _zz_resMants_1_3;
  wire       [9:0]    _zz_resMants_1_4;
  wire       [7:0]    _zz__zz_resMants_2;
  wire       [9:0]    _zz_resMants_2_1;
  wire       [9:0]    _zz_resMants_2_2;
  wire       [8:0]    _zz_resMants_2_3;
  wire       [9:0]    _zz_resMants_2_4;
  wire       [7:0]    _zz__zz_resMants_3;
  wire       [9:0]    _zz_resMants_3_1;
  wire       [9:0]    _zz_resMants_3_2;
  wire       [8:0]    _zz_resMants_3_3;
  wire       [9:0]    _zz_resMants_3_4;
  wire       [7:0]    _zz__zz_resMants_4;
  wire       [9:0]    _zz_resMants_4_1;
  wire       [9:0]    _zz_resMants_4_2;
  wire       [8:0]    _zz_resMants_4_3;
  wire       [9:0]    _zz_resMants_4_4;
  wire       [7:0]    _zz__zz_resMants_5;
  wire       [9:0]    _zz_resMants_5_1;
  wire       [9:0]    _zz_resMants_5_2;
  wire       [8:0]    _zz_resMants_5_3;
  wire       [9:0]    _zz_resMants_5_4;
  wire       [7:0]    _zz__zz_resMants_6;
  wire       [9:0]    _zz_resMants_6_1;
  wire       [9:0]    _zz_resMants_6_2;
  wire       [8:0]    _zz_resMants_6_3;
  wire       [9:0]    _zz_resMants_6_4;
  wire       [7:0]    _zz__zz_resMants_7;
  wire       [9:0]    _zz_resMants_7_1;
  wire       [9:0]    _zz_resMants_7_2;
  wire       [8:0]    _zz_resMants_7_3;
  wire       [9:0]    _zz_resMants_7_4;
  wire       [7:0]    _zz__zz_resMants_8;
  wire       [9:0]    _zz_resMants_8_1;
  wire       [9:0]    _zz_resMants_8_2;
  wire       [8:0]    _zz_resMants_8_3;
  wire       [9:0]    _zz_resMants_8_4;
  wire       [7:0]    _zz__zz_resMants_9;
  wire       [9:0]    _zz_resMants_9_1;
  wire       [9:0]    _zz_resMants_9_2;
  wire       [8:0]    _zz_resMants_9_3;
  wire       [9:0]    _zz_resMants_9_4;
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
  wire       [8:0]    _zz_resMants_0;
  wire       [8:0]    _zz_resMants_1;
  wire       [8:0]    _zz_resMants_2;
  wire       [8:0]    _zz_resMants_3;
  wire       [8:0]    _zz_resMants_4;
  wire       [8:0]    _zz_resMants_5;
  wire       [8:0]    _zz_resMants_6;
  wire       [8:0]    _zz_resMants_7;
  wire       [8:0]    _zz_resMants_8;
  wire       [8:0]    _zz_resMants_9;
  reg                 io_dataIn_valid_delay_1;
  reg                 io_dataIn_valid_delay_2;
  reg                 io_dataIn_valid_delay_3;
  reg                 io_dataIn_valid_delay_4;
  reg                 io_dataIn_valid_delay_5;

  assign _zz__zz_resMants_0 = (largestExp - delayedData_0_exp);
  assign _zz_resMants_0_1 = ({1'b1,(~ _zz_resMants_0)} + _zz_resMants_0_2);
  assign _zz_resMants_0_3 = 9'h001;
  assign _zz_resMants_0_2 = {1'd0, _zz_resMants_0_3};
  assign _zz_resMants_0_4 = {1'b0,_zz_resMants_0};
  assign _zz__zz_resMants_1 = (largestExp - delayedData_1_exp);
  assign _zz_resMants_1_1 = ({1'b1,(~ _zz_resMants_1)} + _zz_resMants_1_2);
  assign _zz_resMants_1_3 = 9'h001;
  assign _zz_resMants_1_2 = {1'd0, _zz_resMants_1_3};
  assign _zz_resMants_1_4 = {1'b0,_zz_resMants_1};
  assign _zz__zz_resMants_2 = (largestExp - delayedData_2_exp);
  assign _zz_resMants_2_1 = ({1'b1,(~ _zz_resMants_2)} + _zz_resMants_2_2);
  assign _zz_resMants_2_3 = 9'h001;
  assign _zz_resMants_2_2 = {1'd0, _zz_resMants_2_3};
  assign _zz_resMants_2_4 = {1'b0,_zz_resMants_2};
  assign _zz__zz_resMants_3 = (largestExp - delayedData_3_exp);
  assign _zz_resMants_3_1 = ({1'b1,(~ _zz_resMants_3)} + _zz_resMants_3_2);
  assign _zz_resMants_3_3 = 9'h001;
  assign _zz_resMants_3_2 = {1'd0, _zz_resMants_3_3};
  assign _zz_resMants_3_4 = {1'b0,_zz_resMants_3};
  assign _zz__zz_resMants_4 = (largestExp - delayedData_4_exp);
  assign _zz_resMants_4_1 = ({1'b1,(~ _zz_resMants_4)} + _zz_resMants_4_2);
  assign _zz_resMants_4_3 = 9'h001;
  assign _zz_resMants_4_2 = {1'd0, _zz_resMants_4_3};
  assign _zz_resMants_4_4 = {1'b0,_zz_resMants_4};
  assign _zz__zz_resMants_5 = (largestExp - delayedData_5_exp);
  assign _zz_resMants_5_1 = ({1'b1,(~ _zz_resMants_5)} + _zz_resMants_5_2);
  assign _zz_resMants_5_3 = 9'h001;
  assign _zz_resMants_5_2 = {1'd0, _zz_resMants_5_3};
  assign _zz_resMants_5_4 = {1'b0,_zz_resMants_5};
  assign _zz__zz_resMants_6 = (largestExp - delayedData_6_exp);
  assign _zz_resMants_6_1 = ({1'b1,(~ _zz_resMants_6)} + _zz_resMants_6_2);
  assign _zz_resMants_6_3 = 9'h001;
  assign _zz_resMants_6_2 = {1'd0, _zz_resMants_6_3};
  assign _zz_resMants_6_4 = {1'b0,_zz_resMants_6};
  assign _zz__zz_resMants_7 = (largestExp - delayedData_7_exp);
  assign _zz_resMants_7_1 = ({1'b1,(~ _zz_resMants_7)} + _zz_resMants_7_2);
  assign _zz_resMants_7_3 = 9'h001;
  assign _zz_resMants_7_2 = {1'd0, _zz_resMants_7_3};
  assign _zz_resMants_7_4 = {1'b0,_zz_resMants_7};
  assign _zz__zz_resMants_8 = (largestExp - delayedData_8_exp);
  assign _zz_resMants_8_1 = ({1'b1,(~ _zz_resMants_8)} + _zz_resMants_8_2);
  assign _zz_resMants_8_3 = 9'h001;
  assign _zz_resMants_8_2 = {1'd0, _zz_resMants_8_3};
  assign _zz_resMants_8_4 = {1'b0,_zz_resMants_8};
  assign _zz__zz_resMants_9 = (largestExp - delayedData_9_exp);
  assign _zz_resMants_9_1 = ({1'b1,(~ _zz_resMants_9)} + _zz_resMants_9_2);
  assign _zz_resMants_9_3 = 9'h001;
  assign _zz_resMants_9_2 = {1'd0, _zz_resMants_9_3};
  assign _zz_resMants_9_4 = {1'b0,_zz_resMants_9};
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
  assign _zz_resMants_0 = ({1'b1,delayedData_0_mantissa[22 : 15]} >>> _zz__zz_resMants_0);
  assign _zz_resMants_1 = ({1'b1,delayedData_1_mantissa[22 : 15]} >>> _zz__zz_resMants_1);
  assign _zz_resMants_2 = ({1'b1,delayedData_2_mantissa[22 : 15]} >>> _zz__zz_resMants_2);
  assign _zz_resMants_3 = ({1'b1,delayedData_3_mantissa[22 : 15]} >>> _zz__zz_resMants_3);
  assign _zz_resMants_4 = ({1'b1,delayedData_4_mantissa[22 : 15]} >>> _zz__zz_resMants_4);
  assign _zz_resMants_5 = ({1'b1,delayedData_5_mantissa[22 : 15]} >>> _zz__zz_resMants_5);
  assign _zz_resMants_6 = ({1'b1,delayedData_6_mantissa[22 : 15]} >>> _zz__zz_resMants_6);
  assign _zz_resMants_7 = ({1'b1,delayedData_7_mantissa[22 : 15]} >>> _zz__zz_resMants_7);
  assign _zz_resMants_8 = ({1'b1,delayedData_8_mantissa[22 : 15]} >>> _zz__zz_resMants_8);
  assign _zz_resMants_9 = ({1'b1,delayedData_9_mantissa[22 : 15]} >>> _zz__zz_resMants_9);
  assign io_dataOut_payload = {{resMants_9,{resMants_8,{resMants_7,{resMants_6,{resMants_5,{resMants_4,{resMants_3,{resMants_2,{_zz_io_dataOut_payload,_zz_io_dataOut_payload_1}}}}}}}}},resExp};
  assign io_dataOut_valid = io_dataIn_valid_delay_5;
  always @(posedge clk) begin
    _zz_exceptionalCompRes <= ((dataIn_9_exp <= dataIn_8_exp) ? dataIn_8_exp : dataIn_9_exp);
    _zz_exceptionalCompRes_1 <= _zz_exceptionalCompRes;
    io_dataIn_valid_delay_1 <= io_dataIn_valid;
    io_dataIn_valid_delay_2 <= io_dataIn_valid_delay_1;
    io_dataIn_valid_delay_3 <= io_dataIn_valid_delay_2;
    io_dataIn_valid_delay_4 <= io_dataIn_valid_delay_3;
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
      io_dataIn_valid_delay_5 <= 1'b0;
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
      if(delayedData_0_signBit) begin
        resMants_0 <= _zz_resMants_0_1[9 : 2];
      end else begin
        resMants_0 <= _zz_resMants_0_4[9 : 2];
      end
      if(delayedData_1_signBit) begin
        resMants_1 <= _zz_resMants_1_1[9 : 2];
      end else begin
        resMants_1 <= _zz_resMants_1_4[9 : 2];
      end
      if(delayedData_2_signBit) begin
        resMants_2 <= _zz_resMants_2_1[9 : 2];
      end else begin
        resMants_2 <= _zz_resMants_2_4[9 : 2];
      end
      if(delayedData_3_signBit) begin
        resMants_3 <= _zz_resMants_3_1[9 : 2];
      end else begin
        resMants_3 <= _zz_resMants_3_4[9 : 2];
      end
      if(delayedData_4_signBit) begin
        resMants_4 <= _zz_resMants_4_1[9 : 2];
      end else begin
        resMants_4 <= _zz_resMants_4_4[9 : 2];
      end
      if(delayedData_5_signBit) begin
        resMants_5 <= _zz_resMants_5_1[9 : 2];
      end else begin
        resMants_5 <= _zz_resMants_5_4[9 : 2];
      end
      if(delayedData_6_signBit) begin
        resMants_6 <= _zz_resMants_6_1[9 : 2];
      end else begin
        resMants_6 <= _zz_resMants_6_4[9 : 2];
      end
      if(delayedData_7_signBit) begin
        resMants_7 <= _zz_resMants_7_1[9 : 2];
      end else begin
        resMants_7 <= _zz_resMants_7_4[9 : 2];
      end
      if(delayedData_8_signBit) begin
        resMants_8 <= _zz_resMants_8_1[9 : 2];
      end else begin
        resMants_8 <= _zz_resMants_8_4[9 : 2];
      end
      if(delayedData_9_signBit) begin
        resMants_9 <= _zz_resMants_9_1[9 : 2];
      end else begin
        resMants_9 <= _zz_resMants_9_4[9 : 2];
      end
      resExp <= (largestExp - 8'h06);
      io_dataIn_valid_delay_5 <= io_dataIn_valid_delay_4;
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
