// Generator : SpinalHDL v1.7.3a    git head : 04162b8322332003bd011fabf5de3e7522c45630
// Component : TensorCoreChainRow_2
// Git hash  : 8dd3b16f8433a31143e533c705fd002baa7cec1c

`timescale 1ns/1ps 
module TensorCoreChainRow_2 (
  input               io_matBLoad_0_valid,
  output              io_matBLoad_0_ready,
  input      [319:0]  io_matBLoad_0_payload,
  input               io_matBLoad_1_valid,
  output              io_matBLoad_1_ready,
  input      [319:0]  io_matBLoad_1_payload,
  input               io_matBLoad_2_valid,
  output              io_matBLoad_2_ready,
  input      [319:0]  io_matBLoad_2_payload,
  input               io_matBLoad_3_valid,
  output              io_matBLoad_3_ready,
  input      [319:0]  io_matBLoad_3_payload,
  input               io_matBLoad_4_valid,
  output              io_matBLoad_4_ready,
  input      [319:0]  io_matBLoad_4_payload,
  input               io_matBLoad_5_valid,
  output              io_matBLoad_5_ready,
  input      [319:0]  io_matBLoad_5_payload,
  input      [79:0]   io_cascadeDataIn_0,
  input      [79:0]   io_cascadeDataIn_1,
  input      [79:0]   io_cascadeDataIn_2,
  input      [79:0]   io_cascadeDataIn_3,
  input      [79:0]   io_cascadeDataIn_4,
  input      [79:0]   io_cascadeDataIn_5,
  input      [79:0]   io_cascadeDataIn_6,
  input      [79:0]   io_cascadeDataIn_7,
  input      [79:0]   io_cascadeDataIn_8,
  input      [79:0]   io_cascadeDataIn_9,
  input      [79:0]   io_cascadeDataIn_10,
  input      [79:0]   io_cascadeDataIn_11,
  input      [79:0]   io_cascadeDataIn_12,
  input      [79:0]   io_cascadeDataIn_13,
  input      [79:0]   io_cascadeDataIn_14,
  input      [79:0]   io_cascadeDataIn_15,
  input      [7:0]    io_cascadeExpIn_0,
  input      [7:0]    io_cascadeExpIn_1,
  input      [7:0]    io_cascadeExpIn_2,
  input      [7:0]    io_cascadeExpIn_3,
  input      [7:0]    io_cascadeExpIn_4,
  input      [7:0]    io_cascadeExpIn_5,
  input      [7:0]    io_cascadeExpIn_6,
  input      [7:0]    io_cascadeExpIn_7,
  input      [7:0]    io_cascadeExpIn_8,
  input      [7:0]    io_cascadeExpIn_9,
  input      [7:0]    io_cascadeExpIn_10,
  input      [7:0]    io_cascadeExpIn_11,
  input      [7:0]    io_cascadeExpIn_12,
  input      [7:0]    io_cascadeExpIn_13,
  input      [7:0]    io_cascadeExpIn_14,
  input      [7:0]    io_cascadeExpIn_15,
  input               io_tensorLoadValid_0,
  input               io_tensorLoadValid_1,
  input               io_tensorLoadValid_2,
  input               io_tensorLoadValid_3,
  input               io_tensorLoadValid_4,
  input               io_tensorLoadValid_5,
  input               io_tensorLoadValid_6,
  input               io_tensorLoadValid_7,
  input               io_tensorLoadValid_8,
  input               io_tensorLoadValid_9,
  input               io_tensorLoadValid_10,
  input               io_tensorLoadValid_11,
  input               io_tensorLoadValid_12,
  input               io_tensorLoadValid_13,
  input               io_tensorLoadValid_14,
  input               io_tensorLoadValid_15,
  input               io_calEn,
  output              io_loadRdy_0,
  output              io_loadRdy_1,
  output              io_loadRdy_2,
  output              io_loadRdy_3,
  output              io_loadRdy_4,
  output              io_loadRdy_5,
  output              io_loadRdy_6,
  output              io_loadRdy_7,
  output              io_loadRdy_8,
  output              io_loadRdy_9,
  output              io_loadRdy_10,
  output              io_loadRdy_11,
  output              io_loadRdy_12,
  output              io_loadRdy_13,
  output              io_loadRdy_14,
  output              io_loadRdy_15,
  output              io_dataInIterReady_0,
  output              io_dataInIterReady_1,
  output              io_dataInIterReady_2,
  output              io_dataInIterReady_3,
  output              io_dataInIterReady_4,
  output              io_dataInIterReady_5,
  output              io_dataInIterReady_6,
  output              io_dataInIterReady_7,
  output              io_dataInIterReady_8,
  output              io_dataInIterReady_9,
  output              io_dataInIterReady_10,
  output              io_dataInIterReady_11,
  output              io_dataInIterReady_12,
  output              io_dataInIterReady_13,
  output              io_dataInIterReady_14,
  output              io_dataInIterReady_15,
  output              io_resOutValid_0,
  output              io_resOutValid_1,
  output              io_resOutValid_2,
  output              io_resOutValid_3,
  output              io_resOutValid_4,
  output              io_resOutValid_5,
  output              io_resOutValid_6,
  output              io_resOutValid_7,
  output              io_resOutValid_8,
  output              io_resOutValid_9,
  output              io_resOutValid_10,
  output              io_resOutValid_11,
  output              io_resOutValid_12,
  output              io_resOutValid_13,
  output              io_resOutValid_14,
  output              io_resOutValid_15,
  input      [15:0]   io_configPorts_matAColSubGrpLen,
  input      [15:0]   io_configPorts_matBColsPerTccRow,
  input      [15:0]   io_configPorts_tccRowBufferCnterRange,
  input      [15:0]   io_configPorts_tccColBufferCnterRange,
  output              io_res_0_valid,
  output     [71:0]   io_res_0_payload,
  output              io_res_1_valid,
  output     [71:0]   io_res_1_payload,
  output              io_res_2_valid,
  output     [71:0]   io_res_2_payload,
  output              io_res_3_valid,
  output     [71:0]   io_res_3_payload,
  output              io_res_4_valid,
  output     [71:0]   io_res_4_payload,
  output              io_res_5_valid,
  output     [71:0]   io_res_5_payload,
  output              io_res_6_valid,
  output     [71:0]   io_res_6_payload,
  output              io_res_7_valid,
  output     [71:0]   io_res_7_payload,
  output              io_res_8_valid,
  output     [71:0]   io_res_8_payload,
  output              io_res_9_valid,
  output     [71:0]   io_res_9_payload,
  output              io_res_10_valid,
  output     [71:0]   io_res_10_payload,
  output              io_res_11_valid,
  output     [71:0]   io_res_11_payload,
  output              io_res_12_valid,
  output     [71:0]   io_res_12_payload,
  output              io_res_13_valid,
  output     [71:0]   io_res_13_payload,
  output              io_res_14_valid,
  output     [71:0]   io_res_14_payload,
  output              io_res_15_valid,
  output     [71:0]   io_res_15_payload,
  input               clk,
  input               clrn
);
  localparam rowCtrlFsm_enumDef_2_BOOT = 3'd0;
  localparam rowCtrlFsm_enumDef_2_sIdle = 3'd1;
  localparam rowCtrlFsm_enumDef_2_sPreLoad = 3'd2;
  localparam rowCtrlFsm_enumDef_2_sCompute = 3'd3;
  localparam rowCtrlFsm_enumDef_2_sWriteRes = 3'd4;

  reg                 rowMem_2_0_wren;
  wire       [6:0]    rowMem_2_0_rdaddress;
  wire       [6:0]    rowMem_2_0_wraddress;
  reg                 rowMem_2_1_wren;
  wire       [6:0]    rowMem_2_1_rdaddress;
  wire       [6:0]    rowMem_2_1_wraddress;
  reg                 rowMem_2_2_wren;
  wire       [6:0]    rowMem_2_2_rdaddress;
  wire       [6:0]    rowMem_2_2_wraddress;
  reg                 rowMem_2_3_wren;
  wire       [6:0]    rowMem_2_3_rdaddress;
  wire       [6:0]    rowMem_2_3_wraddress;
  reg                 rowMem_2_4_wren;
  wire       [6:0]    rowMem_2_4_rdaddress;
  wire       [6:0]    rowMem_2_4_wraddress;
  reg                 rowMem_2_5_wren;
  wire       [6:0]    rowMem_2_5_rdaddress;
  wire       [6:0]    rowMem_2_5_wraddress;
  wire                u_tc_core_r_2_c_0_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_0_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_0_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_0_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_0_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_0_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_1_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_1_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_1_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_1_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_1_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_1_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_2_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_2_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_2_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_2_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_2_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_2_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_3_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_3_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_3_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_3_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_3_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_3_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_4_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_4_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_4_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_4_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_4_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_4_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_5_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_5_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_5_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_5_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_5_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_5_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_6_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_6_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_6_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_6_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_6_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_6_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_7_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_7_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_7_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_7_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_7_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_7_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_8_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_8_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_8_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_8_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_8_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_8_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_9_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_9_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_9_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_9_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_9_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_9_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_10_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_10_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_10_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_10_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_10_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_10_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_11_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_11_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_11_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_11_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_11_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_11_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_12_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_12_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_12_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_12_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_12_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_12_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_13_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_13_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_13_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_13_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_13_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_13_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_14_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_14_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_14_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_14_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_14_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_14_io_dataIn_5_valid;
  wire                u_tc_core_r_2_c_15_io_dataIn_0_valid;
  wire                u_tc_core_r_2_c_15_io_dataIn_1_valid;
  wire                u_tc_core_r_2_c_15_io_dataIn_2_valid;
  wire                u_tc_core_r_2_c_15_io_dataIn_3_valid;
  wire                u_tc_core_r_2_c_15_io_dataIn_4_valid;
  wire                u_tc_core_r_2_c_15_io_dataIn_5_valid;
  wire       [87:0]   rowMem_2_0_q;
  wire       [87:0]   rowMem_2_1_q;
  wire       [87:0]   rowMem_2_2_q;
  wire       [87:0]   rowMem_2_3_q;
  wire       [87:0]   rowMem_2_4_q;
  wire       [87:0]   rowMem_2_5_q;
  wire                fixedBfpConverter_106_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_106_io_dataOut_payload;
  wire                fixedBfpConverter_107_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_107_io_dataOut_payload;
  wire                fixedBfpConverter_108_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_108_io_dataOut_payload;
  wire                fixedBfpConverter_109_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_109_io_dataOut_payload;
  wire                fixedBfpConverter_110_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_110_io_dataOut_payload;
  wire                fixedBfpConverter_111_io_dataOut_valid;
  wire       [87:0]   fixedBfpConverter_111_io_dataOut_payload;
  wire                u_tc_core_r_2_c_0_io_dataIterReady;
  wire                u_tc_core_r_2_c_0_io_loadReady;
  wire                u_tc_core_r_2_c_0_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_0_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_0_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_0_io_res_payload_2;
  wire                u_tc_core_r_2_c_0_io_outValid;
  wire                u_tc_core_r_2_c_1_io_dataIterReady;
  wire                u_tc_core_r_2_c_1_io_loadReady;
  wire                u_tc_core_r_2_c_1_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_1_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_1_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_1_io_res_payload_2;
  wire                u_tc_core_r_2_c_1_io_outValid;
  wire                u_tc_core_r_2_c_2_io_dataIterReady;
  wire                u_tc_core_r_2_c_2_io_loadReady;
  wire                u_tc_core_r_2_c_2_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_2_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_2_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_2_io_res_payload_2;
  wire                u_tc_core_r_2_c_2_io_outValid;
  wire                u_tc_core_r_2_c_3_io_dataIterReady;
  wire                u_tc_core_r_2_c_3_io_loadReady;
  wire                u_tc_core_r_2_c_3_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_3_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_3_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_3_io_res_payload_2;
  wire                u_tc_core_r_2_c_3_io_outValid;
  wire                u_tc_core_r_2_c_4_io_dataIterReady;
  wire                u_tc_core_r_2_c_4_io_loadReady;
  wire                u_tc_core_r_2_c_4_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_4_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_4_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_4_io_res_payload_2;
  wire                u_tc_core_r_2_c_4_io_outValid;
  wire                u_tc_core_r_2_c_5_io_dataIterReady;
  wire                u_tc_core_r_2_c_5_io_loadReady;
  wire                u_tc_core_r_2_c_5_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_5_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_5_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_5_io_res_payload_2;
  wire                u_tc_core_r_2_c_5_io_outValid;
  wire                u_tc_core_r_2_c_6_io_dataIterReady;
  wire                u_tc_core_r_2_c_6_io_loadReady;
  wire                u_tc_core_r_2_c_6_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_6_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_6_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_6_io_res_payload_2;
  wire                u_tc_core_r_2_c_6_io_outValid;
  wire                u_tc_core_r_2_c_7_io_dataIterReady;
  wire                u_tc_core_r_2_c_7_io_loadReady;
  wire                u_tc_core_r_2_c_7_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_7_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_7_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_7_io_res_payload_2;
  wire                u_tc_core_r_2_c_7_io_outValid;
  wire                u_tc_core_r_2_c_8_io_dataIterReady;
  wire                u_tc_core_r_2_c_8_io_loadReady;
  wire                u_tc_core_r_2_c_8_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_8_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_8_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_8_io_res_payload_2;
  wire                u_tc_core_r_2_c_8_io_outValid;
  wire                u_tc_core_r_2_c_9_io_dataIterReady;
  wire                u_tc_core_r_2_c_9_io_loadReady;
  wire                u_tc_core_r_2_c_9_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_9_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_9_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_9_io_res_payload_2;
  wire                u_tc_core_r_2_c_9_io_outValid;
  wire                u_tc_core_r_2_c_10_io_dataIterReady;
  wire                u_tc_core_r_2_c_10_io_loadReady;
  wire                u_tc_core_r_2_c_10_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_10_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_10_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_10_io_res_payload_2;
  wire                u_tc_core_r_2_c_10_io_outValid;
  wire                u_tc_core_r_2_c_11_io_dataIterReady;
  wire                u_tc_core_r_2_c_11_io_loadReady;
  wire                u_tc_core_r_2_c_11_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_11_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_11_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_11_io_res_payload_2;
  wire                u_tc_core_r_2_c_11_io_outValid;
  wire                u_tc_core_r_2_c_12_io_dataIterReady;
  wire                u_tc_core_r_2_c_12_io_loadReady;
  wire                u_tc_core_r_2_c_12_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_12_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_12_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_12_io_res_payload_2;
  wire                u_tc_core_r_2_c_12_io_outValid;
  wire                u_tc_core_r_2_c_13_io_dataIterReady;
  wire                u_tc_core_r_2_c_13_io_loadReady;
  wire                u_tc_core_r_2_c_13_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_13_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_13_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_13_io_res_payload_2;
  wire                u_tc_core_r_2_c_13_io_outValid;
  wire                u_tc_core_r_2_c_14_io_dataIterReady;
  wire                u_tc_core_r_2_c_14_io_loadReady;
  wire                u_tc_core_r_2_c_14_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_14_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_14_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_14_io_res_payload_2;
  wire                u_tc_core_r_2_c_14_io_outValid;
  wire                u_tc_core_r_2_c_15_io_dataIterReady;
  wire                u_tc_core_r_2_c_15_io_loadReady;
  wire                u_tc_core_r_2_c_15_io_res_valid;
  wire       [23:0]   u_tc_core_r_2_c_15_io_res_payload_0;
  wire       [23:0]   u_tc_core_r_2_c_15_io_res_payload_1;
  wire       [23:0]   u_tc_core_r_2_c_15_io_res_payload_2;
  wire                u_tc_core_r_2_c_15_io_outValid;
  wire       [15:0]   _zz_rowBufferRdCounter_valueNext;
  wire       [0:0]    _zz_rowBufferRdCounter_valueNext_1;
  wire       [15:0]   _zz_rowBufferRdCounter_overflowVal;
  wire       [15:0]   _zz_rowMemWrCounter_2_0_valueNext;
  wire       [0:0]    _zz_rowMemWrCounter_2_0_valueNext_1;
  wire       [15:0]   _zz_rowMemWrCounter_2_1_valueNext;
  wire       [0:0]    _zz_rowMemWrCounter_2_1_valueNext_1;
  wire       [15:0]   _zz_rowMemWrCounter_2_2_valueNext;
  wire       [0:0]    _zz_rowMemWrCounter_2_2_valueNext_1;
  wire       [15:0]   _zz_rowMemWrCounter_2_3_valueNext;
  wire       [0:0]    _zz_rowMemWrCounter_2_3_valueNext_1;
  wire       [15:0]   _zz_rowMemWrCounter_2_4_valueNext;
  wire       [0:0]    _zz_rowMemWrCounter_2_4_valueNext_1;
  wire       [15:0]   _zz_rowMemWrCounter_2_5_valueNext;
  wire       [0:0]    _zz_rowMemWrCounter_2_5_valueNext_1;
  wire       [15:0]   _zz_row_computeIterCounter_2_valueNext;
  wire       [0:0]    _zz_row_computeIterCounter_2_valueNext_1;
  wire       [15:0]   _zz_row_computeIterCounter_2_overflowVal;
  wire       [15:0]   _zz_row_resValidCounter_2_valueNext;
  wire       [0:0]    _zz_row_resValidCounter_2_valueNext_1;
  wire       [15:0]   _zz_row_resValidCounter_2_overflowVal;
  wire       [15:0]   rowBufferRdCounter_overflowVal;
  reg                 rowBufferRdCounter_willIncrement;
  reg                 rowBufferRdCounter_willClear;
  reg        [15:0]   rowBufferRdCounter_valueNext;
  reg        [15:0]   rowBufferRdCounter_value;
  wire                rowBufferRdCounter_willOverflowIfInc;
  wire                rowBufferRdCounter_willOverflow;
  reg                 tensorDataValid;
  wire       [15:0]   rowMemWrCounter_2_0_overflowVal;
  reg                 rowMemWrCounter_2_0_willIncrement;
  reg                 rowMemWrCounter_2_0_willClear;
  reg        [15:0]   rowMemWrCounter_2_0_valueNext;
  reg        [15:0]   rowMemWrCounter_2_0_value;
  wire                rowMemWrCounter_2_0_willOverflowIfInc;
  wire                rowMemWrCounter_2_0_willOverflow;
  reg        [15:0]   _zz_rdaddress;
  reg        [15:0]   _zz_rdaddress_1;
  wire       [15:0]   rowMemWrCounter_2_1_overflowVal;
  reg                 rowMemWrCounter_2_1_willIncrement;
  reg                 rowMemWrCounter_2_1_willClear;
  reg        [15:0]   rowMemWrCounter_2_1_valueNext;
  reg        [15:0]   rowMemWrCounter_2_1_value;
  wire                rowMemWrCounter_2_1_willOverflowIfInc;
  wire                rowMemWrCounter_2_1_willOverflow;
  reg        [15:0]   _zz_rdaddress_2;
  reg        [15:0]   _zz_rdaddress_3;
  wire       [15:0]   rowMemWrCounter_2_2_overflowVal;
  reg                 rowMemWrCounter_2_2_willIncrement;
  reg                 rowMemWrCounter_2_2_willClear;
  reg        [15:0]   rowMemWrCounter_2_2_valueNext;
  reg        [15:0]   rowMemWrCounter_2_2_value;
  wire                rowMemWrCounter_2_2_willOverflowIfInc;
  wire                rowMemWrCounter_2_2_willOverflow;
  reg        [15:0]   _zz_rdaddress_4;
  reg        [15:0]   _zz_rdaddress_5;
  wire       [15:0]   rowMemWrCounter_2_3_overflowVal;
  reg                 rowMemWrCounter_2_3_willIncrement;
  reg                 rowMemWrCounter_2_3_willClear;
  reg        [15:0]   rowMemWrCounter_2_3_valueNext;
  reg        [15:0]   rowMemWrCounter_2_3_value;
  wire                rowMemWrCounter_2_3_willOverflowIfInc;
  wire                rowMemWrCounter_2_3_willOverflow;
  reg        [15:0]   _zz_rdaddress_6;
  reg        [15:0]   _zz_rdaddress_7;
  wire       [15:0]   rowMemWrCounter_2_4_overflowVal;
  reg                 rowMemWrCounter_2_4_willIncrement;
  reg                 rowMemWrCounter_2_4_willClear;
  reg        [15:0]   rowMemWrCounter_2_4_valueNext;
  reg        [15:0]   rowMemWrCounter_2_4_value;
  wire                rowMemWrCounter_2_4_willOverflowIfInc;
  wire                rowMemWrCounter_2_4_willOverflow;
  reg        [15:0]   _zz_rdaddress_8;
  reg        [15:0]   _zz_rdaddress_9;
  wire       [15:0]   rowMemWrCounter_2_5_overflowVal;
  reg                 rowMemWrCounter_2_5_willIncrement;
  reg                 rowMemWrCounter_2_5_willClear;
  reg        [15:0]   rowMemWrCounter_2_5_valueNext;
  reg        [15:0]   rowMemWrCounter_2_5_value;
  wire                rowMemWrCounter_2_5_willOverflowIfInc;
  wire                rowMemWrCounter_2_5_willOverflow;
  reg        [15:0]   _zz_rdaddress_10;
  reg        [15:0]   _zz_rdaddress_11;
  wire       [87:0]   _zz_io_dataIn_0_payload;
  wire       [87:0]   _zz_io_dataIn_1_payload;
  wire       [87:0]   _zz_io_dataIn_2_payload;
  wire       [87:0]   _zz_io_dataIn_3_payload;
  wire       [87:0]   _zz_io_dataIn_4_payload;
  wire       [87:0]   _zz_io_dataIn_5_payload;
  reg        [79:0]   _zz_io_dataIn_0_payload_1;
  reg        [79:0]   _zz_io_dataIn_0_payload_2;
  reg        [79:0]   _zz_io_dataIn_0_payload_3;
  reg        [79:0]   _zz_io_dataIn_0_payload_4;
  reg        [7:0]    _zz_io_expIn_0;
  reg        [7:0]    _zz_io_expIn_0_1;
  reg        [7:0]    _zz_io_expIn_0_2;
  reg        [7:0]    _zz_io_expIn_0_3;
  reg        [79:0]   _zz_io_dataIn_1_payload_1;
  reg        [79:0]   _zz_io_dataIn_1_payload_2;
  reg        [79:0]   _zz_io_dataIn_1_payload_3;
  reg        [79:0]   _zz_io_dataIn_1_payload_4;
  reg        [7:0]    _zz_io_expIn_1;
  reg        [7:0]    _zz_io_expIn_1_1;
  reg        [7:0]    _zz_io_expIn_1_2;
  reg        [7:0]    _zz_io_expIn_1_3;
  reg        [79:0]   _zz_io_dataIn_2_payload_1;
  reg        [79:0]   _zz_io_dataIn_2_payload_2;
  reg        [79:0]   _zz_io_dataIn_2_payload_3;
  reg        [79:0]   _zz_io_dataIn_2_payload_4;
  reg        [7:0]    _zz_io_expIn_2;
  reg        [7:0]    _zz_io_expIn_2_1;
  reg        [7:0]    _zz_io_expIn_2_2;
  reg        [7:0]    _zz_io_expIn_2_3;
  reg        [79:0]   _zz_io_dataIn_3_payload_1;
  reg        [79:0]   _zz_io_dataIn_3_payload_2;
  reg        [79:0]   _zz_io_dataIn_3_payload_3;
  reg        [79:0]   _zz_io_dataIn_3_payload_4;
  reg        [7:0]    _zz_io_expIn_3;
  reg        [7:0]    _zz_io_expIn_3_1;
  reg        [7:0]    _zz_io_expIn_3_2;
  reg        [7:0]    _zz_io_expIn_3_3;
  reg        [79:0]   _zz_io_dataIn_4_payload_1;
  reg        [79:0]   _zz_io_dataIn_4_payload_2;
  reg        [79:0]   _zz_io_dataIn_4_payload_3;
  reg        [79:0]   _zz_io_dataIn_4_payload_4;
  reg        [7:0]    _zz_io_expIn_4;
  reg        [7:0]    _zz_io_expIn_4_1;
  reg        [7:0]    _zz_io_expIn_4_2;
  reg        [7:0]    _zz_io_expIn_4_3;
  reg        [79:0]   _zz_io_dataIn_5_payload_1;
  reg        [79:0]   _zz_io_dataIn_5_payload_2;
  reg        [79:0]   _zz_io_dataIn_5_payload_3;
  reg        [79:0]   _zz_io_dataIn_5_payload_4;
  reg        [7:0]    _zz_io_expIn_5;
  reg        [7:0]    _zz_io_expIn_5_1;
  reg        [7:0]    _zz_io_expIn_5_2;
  reg        [7:0]    _zz_io_expIn_5_3;
  reg                 io_tensorLoadValid_0_delay_1;
  reg                 io_tensorLoadValid_0_delay_2;
  reg                 io_tensorLoadValid_0_delay_3;
  reg                 io_tensorLoadValid_0_delay_4;
  reg                 io_tensorLoadValid_0_delay_5;
  reg                 io_tensorLoadValid_0_delay_6;
  reg                 io_tensorLoadValid_0_delay_7;
  reg                 tensorDataValid_delay_1;
  reg                 tensorDataValid_delay_2;
  reg                 tensorDataValid_delay_3;
  reg                 tensorDataValid_delay_4;
  reg                 tensorDataValid_delay_5;
  reg                 tensorDataValid_delay_6;
  reg                 tensorDataValid_delay_7;
  wire       [87:0]   _zz_io_dataIn_0_payload_5;
  wire       [87:0]   _zz_io_dataIn_1_payload_5;
  wire       [87:0]   _zz_io_dataIn_2_payload_5;
  wire       [87:0]   _zz_io_dataIn_3_payload_5;
  wire       [87:0]   _zz_io_dataIn_4_payload_5;
  wire       [87:0]   _zz_io_dataIn_5_payload_5;
  reg        [79:0]   _zz_io_dataIn_0_payload_6;
  reg        [79:0]   _zz_io_dataIn_0_payload_7;
  reg        [79:0]   _zz_io_dataIn_0_payload_8;
  reg        [79:0]   _zz_io_dataIn_0_payload_9;
  reg        [7:0]    _zz_io_expIn_0_4;
  reg        [7:0]    _zz_io_expIn_0_5;
  reg        [7:0]    _zz_io_expIn_0_6;
  reg        [7:0]    _zz_io_expIn_0_7;
  reg        [79:0]   _zz_io_dataIn_1_payload_6;
  reg        [79:0]   _zz_io_dataIn_1_payload_7;
  reg        [79:0]   _zz_io_dataIn_1_payload_8;
  reg        [79:0]   _zz_io_dataIn_1_payload_9;
  reg        [7:0]    _zz_io_expIn_1_4;
  reg        [7:0]    _zz_io_expIn_1_5;
  reg        [7:0]    _zz_io_expIn_1_6;
  reg        [7:0]    _zz_io_expIn_1_7;
  reg        [79:0]   _zz_io_dataIn_2_payload_6;
  reg        [79:0]   _zz_io_dataIn_2_payload_7;
  reg        [79:0]   _zz_io_dataIn_2_payload_8;
  reg        [79:0]   _zz_io_dataIn_2_payload_9;
  reg        [7:0]    _zz_io_expIn_2_4;
  reg        [7:0]    _zz_io_expIn_2_5;
  reg        [7:0]    _zz_io_expIn_2_6;
  reg        [7:0]    _zz_io_expIn_2_7;
  reg        [79:0]   _zz_io_dataIn_3_payload_6;
  reg        [79:0]   _zz_io_dataIn_3_payload_7;
  reg        [79:0]   _zz_io_dataIn_3_payload_8;
  reg        [79:0]   _zz_io_dataIn_3_payload_9;
  reg        [7:0]    _zz_io_expIn_3_4;
  reg        [7:0]    _zz_io_expIn_3_5;
  reg        [7:0]    _zz_io_expIn_3_6;
  reg        [7:0]    _zz_io_expIn_3_7;
  reg        [79:0]   _zz_io_dataIn_4_payload_6;
  reg        [79:0]   _zz_io_dataIn_4_payload_7;
  reg        [79:0]   _zz_io_dataIn_4_payload_8;
  reg        [79:0]   _zz_io_dataIn_4_payload_9;
  reg        [7:0]    _zz_io_expIn_4_4;
  reg        [7:0]    _zz_io_expIn_4_5;
  reg        [7:0]    _zz_io_expIn_4_6;
  reg        [7:0]    _zz_io_expIn_4_7;
  reg        [79:0]   _zz_io_dataIn_5_payload_6;
  reg        [79:0]   _zz_io_dataIn_5_payload_7;
  reg        [79:0]   _zz_io_dataIn_5_payload_8;
  reg        [79:0]   _zz_io_dataIn_5_payload_9;
  reg        [7:0]    _zz_io_expIn_5_4;
  reg        [7:0]    _zz_io_expIn_5_5;
  reg        [7:0]    _zz_io_expIn_5_6;
  reg        [7:0]    _zz_io_expIn_5_7;
  reg                 io_tensorLoadValid_1_delay_1;
  reg                 io_tensorLoadValid_1_delay_2;
  reg                 io_tensorLoadValid_1_delay_3;
  reg                 io_tensorLoadValid_1_delay_4;
  reg                 io_tensorLoadValid_1_delay_5;
  reg                 io_tensorLoadValid_1_delay_6;
  reg                 io_tensorLoadValid_1_delay_7;
  reg                 tensorDataValid_delay_1_1;
  reg                 tensorDataValid_delay_2_1;
  reg                 tensorDataValid_delay_3_1;
  reg                 tensorDataValid_delay_4_1;
  reg                 tensorDataValid_delay_5_1;
  reg                 tensorDataValid_delay_6_1;
  reg                 tensorDataValid_delay_7_1;
  wire       [87:0]   _zz_io_dataIn_0_payload_10;
  wire       [87:0]   _zz_io_dataIn_1_payload_10;
  wire       [87:0]   _zz_io_dataIn_2_payload_10;
  wire       [87:0]   _zz_io_dataIn_3_payload_10;
  wire       [87:0]   _zz_io_dataIn_4_payload_10;
  wire       [87:0]   _zz_io_dataIn_5_payload_10;
  reg        [79:0]   _zz_io_dataIn_0_payload_11;
  reg        [79:0]   _zz_io_dataIn_0_payload_12;
  reg        [79:0]   _zz_io_dataIn_0_payload_13;
  reg        [79:0]   _zz_io_dataIn_0_payload_14;
  reg        [7:0]    _zz_io_expIn_0_8;
  reg        [7:0]    _zz_io_expIn_0_9;
  reg        [7:0]    _zz_io_expIn_0_10;
  reg        [7:0]    _zz_io_expIn_0_11;
  reg        [79:0]   _zz_io_dataIn_1_payload_11;
  reg        [79:0]   _zz_io_dataIn_1_payload_12;
  reg        [79:0]   _zz_io_dataIn_1_payload_13;
  reg        [79:0]   _zz_io_dataIn_1_payload_14;
  reg        [7:0]    _zz_io_expIn_1_8;
  reg        [7:0]    _zz_io_expIn_1_9;
  reg        [7:0]    _zz_io_expIn_1_10;
  reg        [7:0]    _zz_io_expIn_1_11;
  reg        [79:0]   _zz_io_dataIn_2_payload_11;
  reg        [79:0]   _zz_io_dataIn_2_payload_12;
  reg        [79:0]   _zz_io_dataIn_2_payload_13;
  reg        [79:0]   _zz_io_dataIn_2_payload_14;
  reg        [7:0]    _zz_io_expIn_2_8;
  reg        [7:0]    _zz_io_expIn_2_9;
  reg        [7:0]    _zz_io_expIn_2_10;
  reg        [7:0]    _zz_io_expIn_2_11;
  reg        [79:0]   _zz_io_dataIn_3_payload_11;
  reg        [79:0]   _zz_io_dataIn_3_payload_12;
  reg        [79:0]   _zz_io_dataIn_3_payload_13;
  reg        [79:0]   _zz_io_dataIn_3_payload_14;
  reg        [7:0]    _zz_io_expIn_3_8;
  reg        [7:0]    _zz_io_expIn_3_9;
  reg        [7:0]    _zz_io_expIn_3_10;
  reg        [7:0]    _zz_io_expIn_3_11;
  reg        [79:0]   _zz_io_dataIn_4_payload_11;
  reg        [79:0]   _zz_io_dataIn_4_payload_12;
  reg        [79:0]   _zz_io_dataIn_4_payload_13;
  reg        [79:0]   _zz_io_dataIn_4_payload_14;
  reg        [7:0]    _zz_io_expIn_4_8;
  reg        [7:0]    _zz_io_expIn_4_9;
  reg        [7:0]    _zz_io_expIn_4_10;
  reg        [7:0]    _zz_io_expIn_4_11;
  reg        [79:0]   _zz_io_dataIn_5_payload_11;
  reg        [79:0]   _zz_io_dataIn_5_payload_12;
  reg        [79:0]   _zz_io_dataIn_5_payload_13;
  reg        [79:0]   _zz_io_dataIn_5_payload_14;
  reg        [7:0]    _zz_io_expIn_5_8;
  reg        [7:0]    _zz_io_expIn_5_9;
  reg        [7:0]    _zz_io_expIn_5_10;
  reg        [7:0]    _zz_io_expIn_5_11;
  reg                 io_tensorLoadValid_2_delay_1;
  reg                 io_tensorLoadValid_2_delay_2;
  reg                 io_tensorLoadValid_2_delay_3;
  reg                 io_tensorLoadValid_2_delay_4;
  reg                 io_tensorLoadValid_2_delay_5;
  reg                 io_tensorLoadValid_2_delay_6;
  reg                 io_tensorLoadValid_2_delay_7;
  reg                 tensorDataValid_delay_1_2;
  reg                 tensorDataValid_delay_2_2;
  reg                 tensorDataValid_delay_3_2;
  reg                 tensorDataValid_delay_4_2;
  reg                 tensorDataValid_delay_5_2;
  reg                 tensorDataValid_delay_6_2;
  reg                 tensorDataValid_delay_7_2;
  wire       [87:0]   _zz_io_dataIn_0_payload_15;
  wire       [87:0]   _zz_io_dataIn_1_payload_15;
  wire       [87:0]   _zz_io_dataIn_2_payload_15;
  wire       [87:0]   _zz_io_dataIn_3_payload_15;
  wire       [87:0]   _zz_io_dataIn_4_payload_15;
  wire       [87:0]   _zz_io_dataIn_5_payload_15;
  reg        [79:0]   _zz_io_dataIn_0_payload_16;
  reg        [79:0]   _zz_io_dataIn_0_payload_17;
  reg        [79:0]   _zz_io_dataIn_0_payload_18;
  reg        [79:0]   _zz_io_dataIn_0_payload_19;
  reg        [7:0]    _zz_io_expIn_0_12;
  reg        [7:0]    _zz_io_expIn_0_13;
  reg        [7:0]    _zz_io_expIn_0_14;
  reg        [7:0]    _zz_io_expIn_0_15;
  reg        [79:0]   _zz_io_dataIn_1_payload_16;
  reg        [79:0]   _zz_io_dataIn_1_payload_17;
  reg        [79:0]   _zz_io_dataIn_1_payload_18;
  reg        [79:0]   _zz_io_dataIn_1_payload_19;
  reg        [7:0]    _zz_io_expIn_1_12;
  reg        [7:0]    _zz_io_expIn_1_13;
  reg        [7:0]    _zz_io_expIn_1_14;
  reg        [7:0]    _zz_io_expIn_1_15;
  reg        [79:0]   _zz_io_dataIn_2_payload_16;
  reg        [79:0]   _zz_io_dataIn_2_payload_17;
  reg        [79:0]   _zz_io_dataIn_2_payload_18;
  reg        [79:0]   _zz_io_dataIn_2_payload_19;
  reg        [7:0]    _zz_io_expIn_2_12;
  reg        [7:0]    _zz_io_expIn_2_13;
  reg        [7:0]    _zz_io_expIn_2_14;
  reg        [7:0]    _zz_io_expIn_2_15;
  reg        [79:0]   _zz_io_dataIn_3_payload_16;
  reg        [79:0]   _zz_io_dataIn_3_payload_17;
  reg        [79:0]   _zz_io_dataIn_3_payload_18;
  reg        [79:0]   _zz_io_dataIn_3_payload_19;
  reg        [7:0]    _zz_io_expIn_3_12;
  reg        [7:0]    _zz_io_expIn_3_13;
  reg        [7:0]    _zz_io_expIn_3_14;
  reg        [7:0]    _zz_io_expIn_3_15;
  reg        [79:0]   _zz_io_dataIn_4_payload_16;
  reg        [79:0]   _zz_io_dataIn_4_payload_17;
  reg        [79:0]   _zz_io_dataIn_4_payload_18;
  reg        [79:0]   _zz_io_dataIn_4_payload_19;
  reg        [7:0]    _zz_io_expIn_4_12;
  reg        [7:0]    _zz_io_expIn_4_13;
  reg        [7:0]    _zz_io_expIn_4_14;
  reg        [7:0]    _zz_io_expIn_4_15;
  reg        [79:0]   _zz_io_dataIn_5_payload_16;
  reg        [79:0]   _zz_io_dataIn_5_payload_17;
  reg        [79:0]   _zz_io_dataIn_5_payload_18;
  reg        [79:0]   _zz_io_dataIn_5_payload_19;
  reg        [7:0]    _zz_io_expIn_5_12;
  reg        [7:0]    _zz_io_expIn_5_13;
  reg        [7:0]    _zz_io_expIn_5_14;
  reg        [7:0]    _zz_io_expIn_5_15;
  reg                 io_tensorLoadValid_3_delay_1;
  reg                 io_tensorLoadValid_3_delay_2;
  reg                 io_tensorLoadValid_3_delay_3;
  reg                 io_tensorLoadValid_3_delay_4;
  reg                 io_tensorLoadValid_3_delay_5;
  reg                 io_tensorLoadValid_3_delay_6;
  reg                 io_tensorLoadValid_3_delay_7;
  reg                 tensorDataValid_delay_1_3;
  reg                 tensorDataValid_delay_2_3;
  reg                 tensorDataValid_delay_3_3;
  reg                 tensorDataValid_delay_4_3;
  reg                 tensorDataValid_delay_5_3;
  reg                 tensorDataValid_delay_6_3;
  reg                 tensorDataValid_delay_7_3;
  wire       [87:0]   _zz_io_dataIn_0_payload_20;
  wire       [87:0]   _zz_io_dataIn_1_payload_20;
  wire       [87:0]   _zz_io_dataIn_2_payload_20;
  wire       [87:0]   _zz_io_dataIn_3_payload_20;
  wire       [87:0]   _zz_io_dataIn_4_payload_20;
  wire       [87:0]   _zz_io_dataIn_5_payload_20;
  reg        [79:0]   _zz_io_dataIn_0_payload_21;
  reg        [79:0]   _zz_io_dataIn_0_payload_22;
  reg        [79:0]   _zz_io_dataIn_0_payload_23;
  reg        [79:0]   _zz_io_dataIn_0_payload_24;
  reg        [7:0]    _zz_io_expIn_0_16;
  reg        [7:0]    _zz_io_expIn_0_17;
  reg        [7:0]    _zz_io_expIn_0_18;
  reg        [7:0]    _zz_io_expIn_0_19;
  reg        [79:0]   _zz_io_dataIn_1_payload_21;
  reg        [79:0]   _zz_io_dataIn_1_payload_22;
  reg        [79:0]   _zz_io_dataIn_1_payload_23;
  reg        [79:0]   _zz_io_dataIn_1_payload_24;
  reg        [7:0]    _zz_io_expIn_1_16;
  reg        [7:0]    _zz_io_expIn_1_17;
  reg        [7:0]    _zz_io_expIn_1_18;
  reg        [7:0]    _zz_io_expIn_1_19;
  reg        [79:0]   _zz_io_dataIn_2_payload_21;
  reg        [79:0]   _zz_io_dataIn_2_payload_22;
  reg        [79:0]   _zz_io_dataIn_2_payload_23;
  reg        [79:0]   _zz_io_dataIn_2_payload_24;
  reg        [7:0]    _zz_io_expIn_2_16;
  reg        [7:0]    _zz_io_expIn_2_17;
  reg        [7:0]    _zz_io_expIn_2_18;
  reg        [7:0]    _zz_io_expIn_2_19;
  reg        [79:0]   _zz_io_dataIn_3_payload_21;
  reg        [79:0]   _zz_io_dataIn_3_payload_22;
  reg        [79:0]   _zz_io_dataIn_3_payload_23;
  reg        [79:0]   _zz_io_dataIn_3_payload_24;
  reg        [7:0]    _zz_io_expIn_3_16;
  reg        [7:0]    _zz_io_expIn_3_17;
  reg        [7:0]    _zz_io_expIn_3_18;
  reg        [7:0]    _zz_io_expIn_3_19;
  reg        [79:0]   _zz_io_dataIn_4_payload_21;
  reg        [79:0]   _zz_io_dataIn_4_payload_22;
  reg        [79:0]   _zz_io_dataIn_4_payload_23;
  reg        [79:0]   _zz_io_dataIn_4_payload_24;
  reg        [7:0]    _zz_io_expIn_4_16;
  reg        [7:0]    _zz_io_expIn_4_17;
  reg        [7:0]    _zz_io_expIn_4_18;
  reg        [7:0]    _zz_io_expIn_4_19;
  reg        [79:0]   _zz_io_dataIn_5_payload_21;
  reg        [79:0]   _zz_io_dataIn_5_payload_22;
  reg        [79:0]   _zz_io_dataIn_5_payload_23;
  reg        [79:0]   _zz_io_dataIn_5_payload_24;
  reg        [7:0]    _zz_io_expIn_5_16;
  reg        [7:0]    _zz_io_expIn_5_17;
  reg        [7:0]    _zz_io_expIn_5_18;
  reg        [7:0]    _zz_io_expIn_5_19;
  reg                 io_tensorLoadValid_4_delay_1;
  reg                 io_tensorLoadValid_4_delay_2;
  reg                 io_tensorLoadValid_4_delay_3;
  reg                 io_tensorLoadValid_4_delay_4;
  reg                 io_tensorLoadValid_4_delay_5;
  reg                 io_tensorLoadValid_4_delay_6;
  reg                 io_tensorLoadValid_4_delay_7;
  reg                 tensorDataValid_delay_1_4;
  reg                 tensorDataValid_delay_2_4;
  reg                 tensorDataValid_delay_3_4;
  reg                 tensorDataValid_delay_4_4;
  reg                 tensorDataValid_delay_5_4;
  reg                 tensorDataValid_delay_6_4;
  reg                 tensorDataValid_delay_7_4;
  wire       [87:0]   _zz_io_dataIn_0_payload_25;
  wire       [87:0]   _zz_io_dataIn_1_payload_25;
  wire       [87:0]   _zz_io_dataIn_2_payload_25;
  wire       [87:0]   _zz_io_dataIn_3_payload_25;
  wire       [87:0]   _zz_io_dataIn_4_payload_25;
  wire       [87:0]   _zz_io_dataIn_5_payload_25;
  reg        [79:0]   _zz_io_dataIn_0_payload_26;
  reg        [79:0]   _zz_io_dataIn_0_payload_27;
  reg        [79:0]   _zz_io_dataIn_0_payload_28;
  reg        [79:0]   _zz_io_dataIn_0_payload_29;
  reg        [7:0]    _zz_io_expIn_0_20;
  reg        [7:0]    _zz_io_expIn_0_21;
  reg        [7:0]    _zz_io_expIn_0_22;
  reg        [7:0]    _zz_io_expIn_0_23;
  reg        [79:0]   _zz_io_dataIn_1_payload_26;
  reg        [79:0]   _zz_io_dataIn_1_payload_27;
  reg        [79:0]   _zz_io_dataIn_1_payload_28;
  reg        [79:0]   _zz_io_dataIn_1_payload_29;
  reg        [7:0]    _zz_io_expIn_1_20;
  reg        [7:0]    _zz_io_expIn_1_21;
  reg        [7:0]    _zz_io_expIn_1_22;
  reg        [7:0]    _zz_io_expIn_1_23;
  reg        [79:0]   _zz_io_dataIn_2_payload_26;
  reg        [79:0]   _zz_io_dataIn_2_payload_27;
  reg        [79:0]   _zz_io_dataIn_2_payload_28;
  reg        [79:0]   _zz_io_dataIn_2_payload_29;
  reg        [7:0]    _zz_io_expIn_2_20;
  reg        [7:0]    _zz_io_expIn_2_21;
  reg        [7:0]    _zz_io_expIn_2_22;
  reg        [7:0]    _zz_io_expIn_2_23;
  reg        [79:0]   _zz_io_dataIn_3_payload_26;
  reg        [79:0]   _zz_io_dataIn_3_payload_27;
  reg        [79:0]   _zz_io_dataIn_3_payload_28;
  reg        [79:0]   _zz_io_dataIn_3_payload_29;
  reg        [7:0]    _zz_io_expIn_3_20;
  reg        [7:0]    _zz_io_expIn_3_21;
  reg        [7:0]    _zz_io_expIn_3_22;
  reg        [7:0]    _zz_io_expIn_3_23;
  reg        [79:0]   _zz_io_dataIn_4_payload_26;
  reg        [79:0]   _zz_io_dataIn_4_payload_27;
  reg        [79:0]   _zz_io_dataIn_4_payload_28;
  reg        [79:0]   _zz_io_dataIn_4_payload_29;
  reg        [7:0]    _zz_io_expIn_4_20;
  reg        [7:0]    _zz_io_expIn_4_21;
  reg        [7:0]    _zz_io_expIn_4_22;
  reg        [7:0]    _zz_io_expIn_4_23;
  reg        [79:0]   _zz_io_dataIn_5_payload_26;
  reg        [79:0]   _zz_io_dataIn_5_payload_27;
  reg        [79:0]   _zz_io_dataIn_5_payload_28;
  reg        [79:0]   _zz_io_dataIn_5_payload_29;
  reg        [7:0]    _zz_io_expIn_5_20;
  reg        [7:0]    _zz_io_expIn_5_21;
  reg        [7:0]    _zz_io_expIn_5_22;
  reg        [7:0]    _zz_io_expIn_5_23;
  reg                 io_tensorLoadValid_5_delay_1;
  reg                 io_tensorLoadValid_5_delay_2;
  reg                 io_tensorLoadValid_5_delay_3;
  reg                 io_tensorLoadValid_5_delay_4;
  reg                 io_tensorLoadValid_5_delay_5;
  reg                 io_tensorLoadValid_5_delay_6;
  reg                 io_tensorLoadValid_5_delay_7;
  reg                 tensorDataValid_delay_1_5;
  reg                 tensorDataValid_delay_2_5;
  reg                 tensorDataValid_delay_3_5;
  reg                 tensorDataValid_delay_4_5;
  reg                 tensorDataValid_delay_5_5;
  reg                 tensorDataValid_delay_6_5;
  reg                 tensorDataValid_delay_7_5;
  wire       [87:0]   _zz_io_dataIn_0_payload_30;
  wire       [87:0]   _zz_io_dataIn_1_payload_30;
  wire       [87:0]   _zz_io_dataIn_2_payload_30;
  wire       [87:0]   _zz_io_dataIn_3_payload_30;
  wire       [87:0]   _zz_io_dataIn_4_payload_30;
  wire       [87:0]   _zz_io_dataIn_5_payload_30;
  reg        [79:0]   _zz_io_dataIn_0_payload_31;
  reg        [79:0]   _zz_io_dataIn_0_payload_32;
  reg        [79:0]   _zz_io_dataIn_0_payload_33;
  reg        [79:0]   _zz_io_dataIn_0_payload_34;
  reg        [7:0]    _zz_io_expIn_0_24;
  reg        [7:0]    _zz_io_expIn_0_25;
  reg        [7:0]    _zz_io_expIn_0_26;
  reg        [7:0]    _zz_io_expIn_0_27;
  reg        [79:0]   _zz_io_dataIn_1_payload_31;
  reg        [79:0]   _zz_io_dataIn_1_payload_32;
  reg        [79:0]   _zz_io_dataIn_1_payload_33;
  reg        [79:0]   _zz_io_dataIn_1_payload_34;
  reg        [7:0]    _zz_io_expIn_1_24;
  reg        [7:0]    _zz_io_expIn_1_25;
  reg        [7:0]    _zz_io_expIn_1_26;
  reg        [7:0]    _zz_io_expIn_1_27;
  reg        [79:0]   _zz_io_dataIn_2_payload_31;
  reg        [79:0]   _zz_io_dataIn_2_payload_32;
  reg        [79:0]   _zz_io_dataIn_2_payload_33;
  reg        [79:0]   _zz_io_dataIn_2_payload_34;
  reg        [7:0]    _zz_io_expIn_2_24;
  reg        [7:0]    _zz_io_expIn_2_25;
  reg        [7:0]    _zz_io_expIn_2_26;
  reg        [7:0]    _zz_io_expIn_2_27;
  reg        [79:0]   _zz_io_dataIn_3_payload_31;
  reg        [79:0]   _zz_io_dataIn_3_payload_32;
  reg        [79:0]   _zz_io_dataIn_3_payload_33;
  reg        [79:0]   _zz_io_dataIn_3_payload_34;
  reg        [7:0]    _zz_io_expIn_3_24;
  reg        [7:0]    _zz_io_expIn_3_25;
  reg        [7:0]    _zz_io_expIn_3_26;
  reg        [7:0]    _zz_io_expIn_3_27;
  reg        [79:0]   _zz_io_dataIn_4_payload_31;
  reg        [79:0]   _zz_io_dataIn_4_payload_32;
  reg        [79:0]   _zz_io_dataIn_4_payload_33;
  reg        [79:0]   _zz_io_dataIn_4_payload_34;
  reg        [7:0]    _zz_io_expIn_4_24;
  reg        [7:0]    _zz_io_expIn_4_25;
  reg        [7:0]    _zz_io_expIn_4_26;
  reg        [7:0]    _zz_io_expIn_4_27;
  reg        [79:0]   _zz_io_dataIn_5_payload_31;
  reg        [79:0]   _zz_io_dataIn_5_payload_32;
  reg        [79:0]   _zz_io_dataIn_5_payload_33;
  reg        [79:0]   _zz_io_dataIn_5_payload_34;
  reg        [7:0]    _zz_io_expIn_5_24;
  reg        [7:0]    _zz_io_expIn_5_25;
  reg        [7:0]    _zz_io_expIn_5_26;
  reg        [7:0]    _zz_io_expIn_5_27;
  reg                 io_tensorLoadValid_6_delay_1;
  reg                 io_tensorLoadValid_6_delay_2;
  reg                 io_tensorLoadValid_6_delay_3;
  reg                 io_tensorLoadValid_6_delay_4;
  reg                 io_tensorLoadValid_6_delay_5;
  reg                 io_tensorLoadValid_6_delay_6;
  reg                 io_tensorLoadValid_6_delay_7;
  reg                 tensorDataValid_delay_1_6;
  reg                 tensorDataValid_delay_2_6;
  reg                 tensorDataValid_delay_3_6;
  reg                 tensorDataValid_delay_4_6;
  reg                 tensorDataValid_delay_5_6;
  reg                 tensorDataValid_delay_6_6;
  reg                 tensorDataValid_delay_7_6;
  wire       [87:0]   _zz_io_dataIn_0_payload_35;
  wire       [87:0]   _zz_io_dataIn_1_payload_35;
  wire       [87:0]   _zz_io_dataIn_2_payload_35;
  wire       [87:0]   _zz_io_dataIn_3_payload_35;
  wire       [87:0]   _zz_io_dataIn_4_payload_35;
  wire       [87:0]   _zz_io_dataIn_5_payload_35;
  reg        [79:0]   _zz_io_dataIn_0_payload_36;
  reg        [79:0]   _zz_io_dataIn_0_payload_37;
  reg        [79:0]   _zz_io_dataIn_0_payload_38;
  reg        [79:0]   _zz_io_dataIn_0_payload_39;
  reg        [7:0]    _zz_io_expIn_0_28;
  reg        [7:0]    _zz_io_expIn_0_29;
  reg        [7:0]    _zz_io_expIn_0_30;
  reg        [7:0]    _zz_io_expIn_0_31;
  reg        [79:0]   _zz_io_dataIn_1_payload_36;
  reg        [79:0]   _zz_io_dataIn_1_payload_37;
  reg        [79:0]   _zz_io_dataIn_1_payload_38;
  reg        [79:0]   _zz_io_dataIn_1_payload_39;
  reg        [7:0]    _zz_io_expIn_1_28;
  reg        [7:0]    _zz_io_expIn_1_29;
  reg        [7:0]    _zz_io_expIn_1_30;
  reg        [7:0]    _zz_io_expIn_1_31;
  reg        [79:0]   _zz_io_dataIn_2_payload_36;
  reg        [79:0]   _zz_io_dataIn_2_payload_37;
  reg        [79:0]   _zz_io_dataIn_2_payload_38;
  reg        [79:0]   _zz_io_dataIn_2_payload_39;
  reg        [7:0]    _zz_io_expIn_2_28;
  reg        [7:0]    _zz_io_expIn_2_29;
  reg        [7:0]    _zz_io_expIn_2_30;
  reg        [7:0]    _zz_io_expIn_2_31;
  reg        [79:0]   _zz_io_dataIn_3_payload_36;
  reg        [79:0]   _zz_io_dataIn_3_payload_37;
  reg        [79:0]   _zz_io_dataIn_3_payload_38;
  reg        [79:0]   _zz_io_dataIn_3_payload_39;
  reg        [7:0]    _zz_io_expIn_3_28;
  reg        [7:0]    _zz_io_expIn_3_29;
  reg        [7:0]    _zz_io_expIn_3_30;
  reg        [7:0]    _zz_io_expIn_3_31;
  reg        [79:0]   _zz_io_dataIn_4_payload_36;
  reg        [79:0]   _zz_io_dataIn_4_payload_37;
  reg        [79:0]   _zz_io_dataIn_4_payload_38;
  reg        [79:0]   _zz_io_dataIn_4_payload_39;
  reg        [7:0]    _zz_io_expIn_4_28;
  reg        [7:0]    _zz_io_expIn_4_29;
  reg        [7:0]    _zz_io_expIn_4_30;
  reg        [7:0]    _zz_io_expIn_4_31;
  reg        [79:0]   _zz_io_dataIn_5_payload_36;
  reg        [79:0]   _zz_io_dataIn_5_payload_37;
  reg        [79:0]   _zz_io_dataIn_5_payload_38;
  reg        [79:0]   _zz_io_dataIn_5_payload_39;
  reg        [7:0]    _zz_io_expIn_5_28;
  reg        [7:0]    _zz_io_expIn_5_29;
  reg        [7:0]    _zz_io_expIn_5_30;
  reg        [7:0]    _zz_io_expIn_5_31;
  reg                 io_tensorLoadValid_7_delay_1;
  reg                 io_tensorLoadValid_7_delay_2;
  reg                 io_tensorLoadValid_7_delay_3;
  reg                 io_tensorLoadValid_7_delay_4;
  reg                 io_tensorLoadValid_7_delay_5;
  reg                 io_tensorLoadValid_7_delay_6;
  reg                 io_tensorLoadValid_7_delay_7;
  reg                 tensorDataValid_delay_1_7;
  reg                 tensorDataValid_delay_2_7;
  reg                 tensorDataValid_delay_3_7;
  reg                 tensorDataValid_delay_4_7;
  reg                 tensorDataValid_delay_5_7;
  reg                 tensorDataValid_delay_6_7;
  reg                 tensorDataValid_delay_7_7;
  wire       [87:0]   _zz_io_dataIn_0_payload_40;
  wire       [87:0]   _zz_io_dataIn_1_payload_40;
  wire       [87:0]   _zz_io_dataIn_2_payload_40;
  wire       [87:0]   _zz_io_dataIn_3_payload_40;
  wire       [87:0]   _zz_io_dataIn_4_payload_40;
  wire       [87:0]   _zz_io_dataIn_5_payload_40;
  reg        [79:0]   _zz_io_dataIn_0_payload_41;
  reg        [79:0]   _zz_io_dataIn_0_payload_42;
  reg        [79:0]   _zz_io_dataIn_0_payload_43;
  reg        [79:0]   _zz_io_dataIn_0_payload_44;
  reg        [7:0]    _zz_io_expIn_0_32;
  reg        [7:0]    _zz_io_expIn_0_33;
  reg        [7:0]    _zz_io_expIn_0_34;
  reg        [7:0]    _zz_io_expIn_0_35;
  reg        [79:0]   _zz_io_dataIn_1_payload_41;
  reg        [79:0]   _zz_io_dataIn_1_payload_42;
  reg        [79:0]   _zz_io_dataIn_1_payload_43;
  reg        [79:0]   _zz_io_dataIn_1_payload_44;
  reg        [7:0]    _zz_io_expIn_1_32;
  reg        [7:0]    _zz_io_expIn_1_33;
  reg        [7:0]    _zz_io_expIn_1_34;
  reg        [7:0]    _zz_io_expIn_1_35;
  reg        [79:0]   _zz_io_dataIn_2_payload_41;
  reg        [79:0]   _zz_io_dataIn_2_payload_42;
  reg        [79:0]   _zz_io_dataIn_2_payload_43;
  reg        [79:0]   _zz_io_dataIn_2_payload_44;
  reg        [7:0]    _zz_io_expIn_2_32;
  reg        [7:0]    _zz_io_expIn_2_33;
  reg        [7:0]    _zz_io_expIn_2_34;
  reg        [7:0]    _zz_io_expIn_2_35;
  reg        [79:0]   _zz_io_dataIn_3_payload_41;
  reg        [79:0]   _zz_io_dataIn_3_payload_42;
  reg        [79:0]   _zz_io_dataIn_3_payload_43;
  reg        [79:0]   _zz_io_dataIn_3_payload_44;
  reg        [7:0]    _zz_io_expIn_3_32;
  reg        [7:0]    _zz_io_expIn_3_33;
  reg        [7:0]    _zz_io_expIn_3_34;
  reg        [7:0]    _zz_io_expIn_3_35;
  reg        [79:0]   _zz_io_dataIn_4_payload_41;
  reg        [79:0]   _zz_io_dataIn_4_payload_42;
  reg        [79:0]   _zz_io_dataIn_4_payload_43;
  reg        [79:0]   _zz_io_dataIn_4_payload_44;
  reg        [7:0]    _zz_io_expIn_4_32;
  reg        [7:0]    _zz_io_expIn_4_33;
  reg        [7:0]    _zz_io_expIn_4_34;
  reg        [7:0]    _zz_io_expIn_4_35;
  reg        [79:0]   _zz_io_dataIn_5_payload_41;
  reg        [79:0]   _zz_io_dataIn_5_payload_42;
  reg        [79:0]   _zz_io_dataIn_5_payload_43;
  reg        [79:0]   _zz_io_dataIn_5_payload_44;
  reg        [7:0]    _zz_io_expIn_5_32;
  reg        [7:0]    _zz_io_expIn_5_33;
  reg        [7:0]    _zz_io_expIn_5_34;
  reg        [7:0]    _zz_io_expIn_5_35;
  reg                 io_tensorLoadValid_8_delay_1;
  reg                 io_tensorLoadValid_8_delay_2;
  reg                 io_tensorLoadValid_8_delay_3;
  reg                 io_tensorLoadValid_8_delay_4;
  reg                 io_tensorLoadValid_8_delay_5;
  reg                 io_tensorLoadValid_8_delay_6;
  reg                 io_tensorLoadValid_8_delay_7;
  reg                 tensorDataValid_delay_1_8;
  reg                 tensorDataValid_delay_2_8;
  reg                 tensorDataValid_delay_3_8;
  reg                 tensorDataValid_delay_4_8;
  reg                 tensorDataValid_delay_5_8;
  reg                 tensorDataValid_delay_6_8;
  reg                 tensorDataValid_delay_7_8;
  wire       [87:0]   _zz_io_dataIn_0_payload_45;
  wire       [87:0]   _zz_io_dataIn_1_payload_45;
  wire       [87:0]   _zz_io_dataIn_2_payload_45;
  wire       [87:0]   _zz_io_dataIn_3_payload_45;
  wire       [87:0]   _zz_io_dataIn_4_payload_45;
  wire       [87:0]   _zz_io_dataIn_5_payload_45;
  reg        [79:0]   _zz_io_dataIn_0_payload_46;
  reg        [79:0]   _zz_io_dataIn_0_payload_47;
  reg        [79:0]   _zz_io_dataIn_0_payload_48;
  reg        [79:0]   _zz_io_dataIn_0_payload_49;
  reg        [7:0]    _zz_io_expIn_0_36;
  reg        [7:0]    _zz_io_expIn_0_37;
  reg        [7:0]    _zz_io_expIn_0_38;
  reg        [7:0]    _zz_io_expIn_0_39;
  reg        [79:0]   _zz_io_dataIn_1_payload_46;
  reg        [79:0]   _zz_io_dataIn_1_payload_47;
  reg        [79:0]   _zz_io_dataIn_1_payload_48;
  reg        [79:0]   _zz_io_dataIn_1_payload_49;
  reg        [7:0]    _zz_io_expIn_1_36;
  reg        [7:0]    _zz_io_expIn_1_37;
  reg        [7:0]    _zz_io_expIn_1_38;
  reg        [7:0]    _zz_io_expIn_1_39;
  reg        [79:0]   _zz_io_dataIn_2_payload_46;
  reg        [79:0]   _zz_io_dataIn_2_payload_47;
  reg        [79:0]   _zz_io_dataIn_2_payload_48;
  reg        [79:0]   _zz_io_dataIn_2_payload_49;
  reg        [7:0]    _zz_io_expIn_2_36;
  reg        [7:0]    _zz_io_expIn_2_37;
  reg        [7:0]    _zz_io_expIn_2_38;
  reg        [7:0]    _zz_io_expIn_2_39;
  reg        [79:0]   _zz_io_dataIn_3_payload_46;
  reg        [79:0]   _zz_io_dataIn_3_payload_47;
  reg        [79:0]   _zz_io_dataIn_3_payload_48;
  reg        [79:0]   _zz_io_dataIn_3_payload_49;
  reg        [7:0]    _zz_io_expIn_3_36;
  reg        [7:0]    _zz_io_expIn_3_37;
  reg        [7:0]    _zz_io_expIn_3_38;
  reg        [7:0]    _zz_io_expIn_3_39;
  reg        [79:0]   _zz_io_dataIn_4_payload_46;
  reg        [79:0]   _zz_io_dataIn_4_payload_47;
  reg        [79:0]   _zz_io_dataIn_4_payload_48;
  reg        [79:0]   _zz_io_dataIn_4_payload_49;
  reg        [7:0]    _zz_io_expIn_4_36;
  reg        [7:0]    _zz_io_expIn_4_37;
  reg        [7:0]    _zz_io_expIn_4_38;
  reg        [7:0]    _zz_io_expIn_4_39;
  reg        [79:0]   _zz_io_dataIn_5_payload_46;
  reg        [79:0]   _zz_io_dataIn_5_payload_47;
  reg        [79:0]   _zz_io_dataIn_5_payload_48;
  reg        [79:0]   _zz_io_dataIn_5_payload_49;
  reg        [7:0]    _zz_io_expIn_5_36;
  reg        [7:0]    _zz_io_expIn_5_37;
  reg        [7:0]    _zz_io_expIn_5_38;
  reg        [7:0]    _zz_io_expIn_5_39;
  reg                 io_tensorLoadValid_9_delay_1;
  reg                 io_tensorLoadValid_9_delay_2;
  reg                 io_tensorLoadValid_9_delay_3;
  reg                 io_tensorLoadValid_9_delay_4;
  reg                 io_tensorLoadValid_9_delay_5;
  reg                 io_tensorLoadValid_9_delay_6;
  reg                 io_tensorLoadValid_9_delay_7;
  reg                 tensorDataValid_delay_1_9;
  reg                 tensorDataValid_delay_2_9;
  reg                 tensorDataValid_delay_3_9;
  reg                 tensorDataValid_delay_4_9;
  reg                 tensorDataValid_delay_5_9;
  reg                 tensorDataValid_delay_6_9;
  reg                 tensorDataValid_delay_7_9;
  wire       [87:0]   _zz_io_dataIn_0_payload_50;
  wire       [87:0]   _zz_io_dataIn_1_payload_50;
  wire       [87:0]   _zz_io_dataIn_2_payload_50;
  wire       [87:0]   _zz_io_dataIn_3_payload_50;
  wire       [87:0]   _zz_io_dataIn_4_payload_50;
  wire       [87:0]   _zz_io_dataIn_5_payload_50;
  reg        [79:0]   _zz_io_dataIn_0_payload_51;
  reg        [79:0]   _zz_io_dataIn_0_payload_52;
  reg        [79:0]   _zz_io_dataIn_0_payload_53;
  reg        [79:0]   _zz_io_dataIn_0_payload_54;
  reg        [7:0]    _zz_io_expIn_0_40;
  reg        [7:0]    _zz_io_expIn_0_41;
  reg        [7:0]    _zz_io_expIn_0_42;
  reg        [7:0]    _zz_io_expIn_0_43;
  reg        [79:0]   _zz_io_dataIn_1_payload_51;
  reg        [79:0]   _zz_io_dataIn_1_payload_52;
  reg        [79:0]   _zz_io_dataIn_1_payload_53;
  reg        [79:0]   _zz_io_dataIn_1_payload_54;
  reg        [7:0]    _zz_io_expIn_1_40;
  reg        [7:0]    _zz_io_expIn_1_41;
  reg        [7:0]    _zz_io_expIn_1_42;
  reg        [7:0]    _zz_io_expIn_1_43;
  reg        [79:0]   _zz_io_dataIn_2_payload_51;
  reg        [79:0]   _zz_io_dataIn_2_payload_52;
  reg        [79:0]   _zz_io_dataIn_2_payload_53;
  reg        [79:0]   _zz_io_dataIn_2_payload_54;
  reg        [7:0]    _zz_io_expIn_2_40;
  reg        [7:0]    _zz_io_expIn_2_41;
  reg        [7:0]    _zz_io_expIn_2_42;
  reg        [7:0]    _zz_io_expIn_2_43;
  reg        [79:0]   _zz_io_dataIn_3_payload_51;
  reg        [79:0]   _zz_io_dataIn_3_payload_52;
  reg        [79:0]   _zz_io_dataIn_3_payload_53;
  reg        [79:0]   _zz_io_dataIn_3_payload_54;
  reg        [7:0]    _zz_io_expIn_3_40;
  reg        [7:0]    _zz_io_expIn_3_41;
  reg        [7:0]    _zz_io_expIn_3_42;
  reg        [7:0]    _zz_io_expIn_3_43;
  reg        [79:0]   _zz_io_dataIn_4_payload_51;
  reg        [79:0]   _zz_io_dataIn_4_payload_52;
  reg        [79:0]   _zz_io_dataIn_4_payload_53;
  reg        [79:0]   _zz_io_dataIn_4_payload_54;
  reg        [7:0]    _zz_io_expIn_4_40;
  reg        [7:0]    _zz_io_expIn_4_41;
  reg        [7:0]    _zz_io_expIn_4_42;
  reg        [7:0]    _zz_io_expIn_4_43;
  reg        [79:0]   _zz_io_dataIn_5_payload_51;
  reg        [79:0]   _zz_io_dataIn_5_payload_52;
  reg        [79:0]   _zz_io_dataIn_5_payload_53;
  reg        [79:0]   _zz_io_dataIn_5_payload_54;
  reg        [7:0]    _zz_io_expIn_5_40;
  reg        [7:0]    _zz_io_expIn_5_41;
  reg        [7:0]    _zz_io_expIn_5_42;
  reg        [7:0]    _zz_io_expIn_5_43;
  reg                 io_tensorLoadValid_10_delay_1;
  reg                 io_tensorLoadValid_10_delay_2;
  reg                 io_tensorLoadValid_10_delay_3;
  reg                 io_tensorLoadValid_10_delay_4;
  reg                 io_tensorLoadValid_10_delay_5;
  reg                 io_tensorLoadValid_10_delay_6;
  reg                 io_tensorLoadValid_10_delay_7;
  reg                 tensorDataValid_delay_1_10;
  reg                 tensorDataValid_delay_2_10;
  reg                 tensorDataValid_delay_3_10;
  reg                 tensorDataValid_delay_4_10;
  reg                 tensorDataValid_delay_5_10;
  reg                 tensorDataValid_delay_6_10;
  reg                 tensorDataValid_delay_7_10;
  wire       [87:0]   _zz_io_dataIn_0_payload_55;
  wire       [87:0]   _zz_io_dataIn_1_payload_55;
  wire       [87:0]   _zz_io_dataIn_2_payload_55;
  wire       [87:0]   _zz_io_dataIn_3_payload_55;
  wire       [87:0]   _zz_io_dataIn_4_payload_55;
  wire       [87:0]   _zz_io_dataIn_5_payload_55;
  reg        [79:0]   _zz_io_dataIn_0_payload_56;
  reg        [79:0]   _zz_io_dataIn_0_payload_57;
  reg        [79:0]   _zz_io_dataIn_0_payload_58;
  reg        [79:0]   _zz_io_dataIn_0_payload_59;
  reg        [7:0]    _zz_io_expIn_0_44;
  reg        [7:0]    _zz_io_expIn_0_45;
  reg        [7:0]    _zz_io_expIn_0_46;
  reg        [7:0]    _zz_io_expIn_0_47;
  reg        [79:0]   _zz_io_dataIn_1_payload_56;
  reg        [79:0]   _zz_io_dataIn_1_payload_57;
  reg        [79:0]   _zz_io_dataIn_1_payload_58;
  reg        [79:0]   _zz_io_dataIn_1_payload_59;
  reg        [7:0]    _zz_io_expIn_1_44;
  reg        [7:0]    _zz_io_expIn_1_45;
  reg        [7:0]    _zz_io_expIn_1_46;
  reg        [7:0]    _zz_io_expIn_1_47;
  reg        [79:0]   _zz_io_dataIn_2_payload_56;
  reg        [79:0]   _zz_io_dataIn_2_payload_57;
  reg        [79:0]   _zz_io_dataIn_2_payload_58;
  reg        [79:0]   _zz_io_dataIn_2_payload_59;
  reg        [7:0]    _zz_io_expIn_2_44;
  reg        [7:0]    _zz_io_expIn_2_45;
  reg        [7:0]    _zz_io_expIn_2_46;
  reg        [7:0]    _zz_io_expIn_2_47;
  reg        [79:0]   _zz_io_dataIn_3_payload_56;
  reg        [79:0]   _zz_io_dataIn_3_payload_57;
  reg        [79:0]   _zz_io_dataIn_3_payload_58;
  reg        [79:0]   _zz_io_dataIn_3_payload_59;
  reg        [7:0]    _zz_io_expIn_3_44;
  reg        [7:0]    _zz_io_expIn_3_45;
  reg        [7:0]    _zz_io_expIn_3_46;
  reg        [7:0]    _zz_io_expIn_3_47;
  reg        [79:0]   _zz_io_dataIn_4_payload_56;
  reg        [79:0]   _zz_io_dataIn_4_payload_57;
  reg        [79:0]   _zz_io_dataIn_4_payload_58;
  reg        [79:0]   _zz_io_dataIn_4_payload_59;
  reg        [7:0]    _zz_io_expIn_4_44;
  reg        [7:0]    _zz_io_expIn_4_45;
  reg        [7:0]    _zz_io_expIn_4_46;
  reg        [7:0]    _zz_io_expIn_4_47;
  reg        [79:0]   _zz_io_dataIn_5_payload_56;
  reg        [79:0]   _zz_io_dataIn_5_payload_57;
  reg        [79:0]   _zz_io_dataIn_5_payload_58;
  reg        [79:0]   _zz_io_dataIn_5_payload_59;
  reg        [7:0]    _zz_io_expIn_5_44;
  reg        [7:0]    _zz_io_expIn_5_45;
  reg        [7:0]    _zz_io_expIn_5_46;
  reg        [7:0]    _zz_io_expIn_5_47;
  reg                 io_tensorLoadValid_11_delay_1;
  reg                 io_tensorLoadValid_11_delay_2;
  reg                 io_tensorLoadValid_11_delay_3;
  reg                 io_tensorLoadValid_11_delay_4;
  reg                 io_tensorLoadValid_11_delay_5;
  reg                 io_tensorLoadValid_11_delay_6;
  reg                 io_tensorLoadValid_11_delay_7;
  reg                 tensorDataValid_delay_1_11;
  reg                 tensorDataValid_delay_2_11;
  reg                 tensorDataValid_delay_3_11;
  reg                 tensorDataValid_delay_4_11;
  reg                 tensorDataValid_delay_5_11;
  reg                 tensorDataValid_delay_6_11;
  reg                 tensorDataValid_delay_7_11;
  wire       [87:0]   _zz_io_dataIn_0_payload_60;
  wire       [87:0]   _zz_io_dataIn_1_payload_60;
  wire       [87:0]   _zz_io_dataIn_2_payload_60;
  wire       [87:0]   _zz_io_dataIn_3_payload_60;
  wire       [87:0]   _zz_io_dataIn_4_payload_60;
  wire       [87:0]   _zz_io_dataIn_5_payload_60;
  reg        [79:0]   _zz_io_dataIn_0_payload_61;
  reg        [79:0]   _zz_io_dataIn_0_payload_62;
  reg        [79:0]   _zz_io_dataIn_0_payload_63;
  reg        [79:0]   _zz_io_dataIn_0_payload_64;
  reg        [7:0]    _zz_io_expIn_0_48;
  reg        [7:0]    _zz_io_expIn_0_49;
  reg        [7:0]    _zz_io_expIn_0_50;
  reg        [7:0]    _zz_io_expIn_0_51;
  reg        [79:0]   _zz_io_dataIn_1_payload_61;
  reg        [79:0]   _zz_io_dataIn_1_payload_62;
  reg        [79:0]   _zz_io_dataIn_1_payload_63;
  reg        [79:0]   _zz_io_dataIn_1_payload_64;
  reg        [7:0]    _zz_io_expIn_1_48;
  reg        [7:0]    _zz_io_expIn_1_49;
  reg        [7:0]    _zz_io_expIn_1_50;
  reg        [7:0]    _zz_io_expIn_1_51;
  reg        [79:0]   _zz_io_dataIn_2_payload_61;
  reg        [79:0]   _zz_io_dataIn_2_payload_62;
  reg        [79:0]   _zz_io_dataIn_2_payload_63;
  reg        [79:0]   _zz_io_dataIn_2_payload_64;
  reg        [7:0]    _zz_io_expIn_2_48;
  reg        [7:0]    _zz_io_expIn_2_49;
  reg        [7:0]    _zz_io_expIn_2_50;
  reg        [7:0]    _zz_io_expIn_2_51;
  reg        [79:0]   _zz_io_dataIn_3_payload_61;
  reg        [79:0]   _zz_io_dataIn_3_payload_62;
  reg        [79:0]   _zz_io_dataIn_3_payload_63;
  reg        [79:0]   _zz_io_dataIn_3_payload_64;
  reg        [7:0]    _zz_io_expIn_3_48;
  reg        [7:0]    _zz_io_expIn_3_49;
  reg        [7:0]    _zz_io_expIn_3_50;
  reg        [7:0]    _zz_io_expIn_3_51;
  reg        [79:0]   _zz_io_dataIn_4_payload_61;
  reg        [79:0]   _zz_io_dataIn_4_payload_62;
  reg        [79:0]   _zz_io_dataIn_4_payload_63;
  reg        [79:0]   _zz_io_dataIn_4_payload_64;
  reg        [7:0]    _zz_io_expIn_4_48;
  reg        [7:0]    _zz_io_expIn_4_49;
  reg        [7:0]    _zz_io_expIn_4_50;
  reg        [7:0]    _zz_io_expIn_4_51;
  reg        [79:0]   _zz_io_dataIn_5_payload_61;
  reg        [79:0]   _zz_io_dataIn_5_payload_62;
  reg        [79:0]   _zz_io_dataIn_5_payload_63;
  reg        [79:0]   _zz_io_dataIn_5_payload_64;
  reg        [7:0]    _zz_io_expIn_5_48;
  reg        [7:0]    _zz_io_expIn_5_49;
  reg        [7:0]    _zz_io_expIn_5_50;
  reg        [7:0]    _zz_io_expIn_5_51;
  reg                 io_tensorLoadValid_12_delay_1;
  reg                 io_tensorLoadValid_12_delay_2;
  reg                 io_tensorLoadValid_12_delay_3;
  reg                 io_tensorLoadValid_12_delay_4;
  reg                 io_tensorLoadValid_12_delay_5;
  reg                 io_tensorLoadValid_12_delay_6;
  reg                 io_tensorLoadValid_12_delay_7;
  reg                 tensorDataValid_delay_1_12;
  reg                 tensorDataValid_delay_2_12;
  reg                 tensorDataValid_delay_3_12;
  reg                 tensorDataValid_delay_4_12;
  reg                 tensorDataValid_delay_5_12;
  reg                 tensorDataValid_delay_6_12;
  reg                 tensorDataValid_delay_7_12;
  wire       [87:0]   _zz_io_dataIn_0_payload_65;
  wire       [87:0]   _zz_io_dataIn_1_payload_65;
  wire       [87:0]   _zz_io_dataIn_2_payload_65;
  wire       [87:0]   _zz_io_dataIn_3_payload_65;
  wire       [87:0]   _zz_io_dataIn_4_payload_65;
  wire       [87:0]   _zz_io_dataIn_5_payload_65;
  reg        [79:0]   _zz_io_dataIn_0_payload_66;
  reg        [79:0]   _zz_io_dataIn_0_payload_67;
  reg        [79:0]   _zz_io_dataIn_0_payload_68;
  reg        [79:0]   _zz_io_dataIn_0_payload_69;
  reg        [7:0]    _zz_io_expIn_0_52;
  reg        [7:0]    _zz_io_expIn_0_53;
  reg        [7:0]    _zz_io_expIn_0_54;
  reg        [7:0]    _zz_io_expIn_0_55;
  reg        [79:0]   _zz_io_dataIn_1_payload_66;
  reg        [79:0]   _zz_io_dataIn_1_payload_67;
  reg        [79:0]   _zz_io_dataIn_1_payload_68;
  reg        [79:0]   _zz_io_dataIn_1_payload_69;
  reg        [7:0]    _zz_io_expIn_1_52;
  reg        [7:0]    _zz_io_expIn_1_53;
  reg        [7:0]    _zz_io_expIn_1_54;
  reg        [7:0]    _zz_io_expIn_1_55;
  reg        [79:0]   _zz_io_dataIn_2_payload_66;
  reg        [79:0]   _zz_io_dataIn_2_payload_67;
  reg        [79:0]   _zz_io_dataIn_2_payload_68;
  reg        [79:0]   _zz_io_dataIn_2_payload_69;
  reg        [7:0]    _zz_io_expIn_2_52;
  reg        [7:0]    _zz_io_expIn_2_53;
  reg        [7:0]    _zz_io_expIn_2_54;
  reg        [7:0]    _zz_io_expIn_2_55;
  reg        [79:0]   _zz_io_dataIn_3_payload_66;
  reg        [79:0]   _zz_io_dataIn_3_payload_67;
  reg        [79:0]   _zz_io_dataIn_3_payload_68;
  reg        [79:0]   _zz_io_dataIn_3_payload_69;
  reg        [7:0]    _zz_io_expIn_3_52;
  reg        [7:0]    _zz_io_expIn_3_53;
  reg        [7:0]    _zz_io_expIn_3_54;
  reg        [7:0]    _zz_io_expIn_3_55;
  reg        [79:0]   _zz_io_dataIn_4_payload_66;
  reg        [79:0]   _zz_io_dataIn_4_payload_67;
  reg        [79:0]   _zz_io_dataIn_4_payload_68;
  reg        [79:0]   _zz_io_dataIn_4_payload_69;
  reg        [7:0]    _zz_io_expIn_4_52;
  reg        [7:0]    _zz_io_expIn_4_53;
  reg        [7:0]    _zz_io_expIn_4_54;
  reg        [7:0]    _zz_io_expIn_4_55;
  reg        [79:0]   _zz_io_dataIn_5_payload_66;
  reg        [79:0]   _zz_io_dataIn_5_payload_67;
  reg        [79:0]   _zz_io_dataIn_5_payload_68;
  reg        [79:0]   _zz_io_dataIn_5_payload_69;
  reg        [7:0]    _zz_io_expIn_5_52;
  reg        [7:0]    _zz_io_expIn_5_53;
  reg        [7:0]    _zz_io_expIn_5_54;
  reg        [7:0]    _zz_io_expIn_5_55;
  reg                 io_tensorLoadValid_13_delay_1;
  reg                 io_tensorLoadValid_13_delay_2;
  reg                 io_tensorLoadValid_13_delay_3;
  reg                 io_tensorLoadValid_13_delay_4;
  reg                 io_tensorLoadValid_13_delay_5;
  reg                 io_tensorLoadValid_13_delay_6;
  reg                 io_tensorLoadValid_13_delay_7;
  reg                 tensorDataValid_delay_1_13;
  reg                 tensorDataValid_delay_2_13;
  reg                 tensorDataValid_delay_3_13;
  reg                 tensorDataValid_delay_4_13;
  reg                 tensorDataValid_delay_5_13;
  reg                 tensorDataValid_delay_6_13;
  reg                 tensorDataValid_delay_7_13;
  wire       [87:0]   _zz_io_dataIn_0_payload_70;
  wire       [87:0]   _zz_io_dataIn_1_payload_70;
  wire       [87:0]   _zz_io_dataIn_2_payload_70;
  wire       [87:0]   _zz_io_dataIn_3_payload_70;
  wire       [87:0]   _zz_io_dataIn_4_payload_70;
  wire       [87:0]   _zz_io_dataIn_5_payload_70;
  reg        [79:0]   _zz_io_dataIn_0_payload_71;
  reg        [79:0]   _zz_io_dataIn_0_payload_72;
  reg        [79:0]   _zz_io_dataIn_0_payload_73;
  reg        [79:0]   _zz_io_dataIn_0_payload_74;
  reg        [7:0]    _zz_io_expIn_0_56;
  reg        [7:0]    _zz_io_expIn_0_57;
  reg        [7:0]    _zz_io_expIn_0_58;
  reg        [7:0]    _zz_io_expIn_0_59;
  reg        [79:0]   _zz_io_dataIn_1_payload_71;
  reg        [79:0]   _zz_io_dataIn_1_payload_72;
  reg        [79:0]   _zz_io_dataIn_1_payload_73;
  reg        [79:0]   _zz_io_dataIn_1_payload_74;
  reg        [7:0]    _zz_io_expIn_1_56;
  reg        [7:0]    _zz_io_expIn_1_57;
  reg        [7:0]    _zz_io_expIn_1_58;
  reg        [7:0]    _zz_io_expIn_1_59;
  reg        [79:0]   _zz_io_dataIn_2_payload_71;
  reg        [79:0]   _zz_io_dataIn_2_payload_72;
  reg        [79:0]   _zz_io_dataIn_2_payload_73;
  reg        [79:0]   _zz_io_dataIn_2_payload_74;
  reg        [7:0]    _zz_io_expIn_2_56;
  reg        [7:0]    _zz_io_expIn_2_57;
  reg        [7:0]    _zz_io_expIn_2_58;
  reg        [7:0]    _zz_io_expIn_2_59;
  reg        [79:0]   _zz_io_dataIn_3_payload_71;
  reg        [79:0]   _zz_io_dataIn_3_payload_72;
  reg        [79:0]   _zz_io_dataIn_3_payload_73;
  reg        [79:0]   _zz_io_dataIn_3_payload_74;
  reg        [7:0]    _zz_io_expIn_3_56;
  reg        [7:0]    _zz_io_expIn_3_57;
  reg        [7:0]    _zz_io_expIn_3_58;
  reg        [7:0]    _zz_io_expIn_3_59;
  reg        [79:0]   _zz_io_dataIn_4_payload_71;
  reg        [79:0]   _zz_io_dataIn_4_payload_72;
  reg        [79:0]   _zz_io_dataIn_4_payload_73;
  reg        [79:0]   _zz_io_dataIn_4_payload_74;
  reg        [7:0]    _zz_io_expIn_4_56;
  reg        [7:0]    _zz_io_expIn_4_57;
  reg        [7:0]    _zz_io_expIn_4_58;
  reg        [7:0]    _zz_io_expIn_4_59;
  reg        [79:0]   _zz_io_dataIn_5_payload_71;
  reg        [79:0]   _zz_io_dataIn_5_payload_72;
  reg        [79:0]   _zz_io_dataIn_5_payload_73;
  reg        [79:0]   _zz_io_dataIn_5_payload_74;
  reg        [7:0]    _zz_io_expIn_5_56;
  reg        [7:0]    _zz_io_expIn_5_57;
  reg        [7:0]    _zz_io_expIn_5_58;
  reg        [7:0]    _zz_io_expIn_5_59;
  reg                 io_tensorLoadValid_14_delay_1;
  reg                 io_tensorLoadValid_14_delay_2;
  reg                 io_tensorLoadValid_14_delay_3;
  reg                 io_tensorLoadValid_14_delay_4;
  reg                 io_tensorLoadValid_14_delay_5;
  reg                 io_tensorLoadValid_14_delay_6;
  reg                 io_tensorLoadValid_14_delay_7;
  reg                 tensorDataValid_delay_1_14;
  reg                 tensorDataValid_delay_2_14;
  reg                 tensorDataValid_delay_3_14;
  reg                 tensorDataValid_delay_4_14;
  reg                 tensorDataValid_delay_5_14;
  reg                 tensorDataValid_delay_6_14;
  reg                 tensorDataValid_delay_7_14;
  wire       [87:0]   _zz_io_dataIn_0_payload_75;
  wire       [87:0]   _zz_io_dataIn_1_payload_75;
  wire       [87:0]   _zz_io_dataIn_2_payload_75;
  wire       [87:0]   _zz_io_dataIn_3_payload_75;
  wire       [87:0]   _zz_io_dataIn_4_payload_75;
  wire       [87:0]   _zz_io_dataIn_5_payload_75;
  reg        [79:0]   _zz_io_dataIn_0_payload_76;
  reg        [79:0]   _zz_io_dataIn_0_payload_77;
  reg        [79:0]   _zz_io_dataIn_0_payload_78;
  reg        [79:0]   _zz_io_dataIn_0_payload_79;
  reg        [7:0]    _zz_io_expIn_0_60;
  reg        [7:0]    _zz_io_expIn_0_61;
  reg        [7:0]    _zz_io_expIn_0_62;
  reg        [7:0]    _zz_io_expIn_0_63;
  reg        [79:0]   _zz_io_dataIn_1_payload_76;
  reg        [79:0]   _zz_io_dataIn_1_payload_77;
  reg        [79:0]   _zz_io_dataIn_1_payload_78;
  reg        [79:0]   _zz_io_dataIn_1_payload_79;
  reg        [7:0]    _zz_io_expIn_1_60;
  reg        [7:0]    _zz_io_expIn_1_61;
  reg        [7:0]    _zz_io_expIn_1_62;
  reg        [7:0]    _zz_io_expIn_1_63;
  reg        [79:0]   _zz_io_dataIn_2_payload_76;
  reg        [79:0]   _zz_io_dataIn_2_payload_77;
  reg        [79:0]   _zz_io_dataIn_2_payload_78;
  reg        [79:0]   _zz_io_dataIn_2_payload_79;
  reg        [7:0]    _zz_io_expIn_2_60;
  reg        [7:0]    _zz_io_expIn_2_61;
  reg        [7:0]    _zz_io_expIn_2_62;
  reg        [7:0]    _zz_io_expIn_2_63;
  reg        [79:0]   _zz_io_dataIn_3_payload_76;
  reg        [79:0]   _zz_io_dataIn_3_payload_77;
  reg        [79:0]   _zz_io_dataIn_3_payload_78;
  reg        [79:0]   _zz_io_dataIn_3_payload_79;
  reg        [7:0]    _zz_io_expIn_3_60;
  reg        [7:0]    _zz_io_expIn_3_61;
  reg        [7:0]    _zz_io_expIn_3_62;
  reg        [7:0]    _zz_io_expIn_3_63;
  reg        [79:0]   _zz_io_dataIn_4_payload_76;
  reg        [79:0]   _zz_io_dataIn_4_payload_77;
  reg        [79:0]   _zz_io_dataIn_4_payload_78;
  reg        [79:0]   _zz_io_dataIn_4_payload_79;
  reg        [7:0]    _zz_io_expIn_4_60;
  reg        [7:0]    _zz_io_expIn_4_61;
  reg        [7:0]    _zz_io_expIn_4_62;
  reg        [7:0]    _zz_io_expIn_4_63;
  reg        [79:0]   _zz_io_dataIn_5_payload_76;
  reg        [79:0]   _zz_io_dataIn_5_payload_77;
  reg        [79:0]   _zz_io_dataIn_5_payload_78;
  reg        [79:0]   _zz_io_dataIn_5_payload_79;
  reg        [7:0]    _zz_io_expIn_5_60;
  reg        [7:0]    _zz_io_expIn_5_61;
  reg        [7:0]    _zz_io_expIn_5_62;
  reg        [7:0]    _zz_io_expIn_5_63;
  reg                 io_tensorLoadValid_15_delay_1;
  reg                 io_tensorLoadValid_15_delay_2;
  reg                 io_tensorLoadValid_15_delay_3;
  reg                 io_tensorLoadValid_15_delay_4;
  reg                 io_tensorLoadValid_15_delay_5;
  reg                 io_tensorLoadValid_15_delay_6;
  reg                 io_tensorLoadValid_15_delay_7;
  reg                 tensorDataValid_delay_1_15;
  reg                 tensorDataValid_delay_2_15;
  reg                 tensorDataValid_delay_3_15;
  reg                 tensorDataValid_delay_4_15;
  reg                 tensorDataValid_delay_5_15;
  reg                 tensorDataValid_delay_6_15;
  reg                 tensorDataValid_delay_7_15;
  wire                rowCtrlFsm_wantExit;
  reg                 rowCtrlFsm_wantStart;
  wire                rowCtrlFsm_wantKill;
  wire                row_loadRdy_2;
  wire                row_dataInIterReady_2;
  wire                row_resOutValid_2;
  reg                 rowCtrlFsm_dataInFinish;
  wire       [15:0]   row_computeIterCounter_2_overflowVal;
  reg                 row_computeIterCounter_2_willIncrement;
  reg                 row_computeIterCounter_2_willClear;
  reg        [15:0]   row_computeIterCounter_2_valueNext;
  reg        [15:0]   row_computeIterCounter_2_value;
  wire                row_computeIterCounter_2_willOverflowIfInc;
  wire                row_computeIterCounter_2_willOverflow;
  wire       [15:0]   row_resValidCounter_2_overflowVal;
  reg                 row_resValidCounter_2_willIncrement;
  reg                 row_resValidCounter_2_willClear;
  reg        [15:0]   row_resValidCounter_2_valueNext;
  reg        [15:0]   row_resValidCounter_2_value;
  wire                row_resValidCounter_2_willOverflowIfInc;
  wire                row_resValidCounter_2_willOverflow;
  reg        [2:0]    rowCtrlFsm_stateReg;
  reg        [2:0]    rowCtrlFsm_stateNext;
  wire                when_TensorCoreChainArray_l166;
  reg                 row_computeIterCounter_2_willOverflow_delay_1;
  reg                 row_resValidCounter_2_willOverflow_delay_1;
  wire                when_StateMachine_l250;

  assign _zz_rowBufferRdCounter_valueNext_1 = rowBufferRdCounter_willIncrement;
  assign _zz_rowBufferRdCounter_valueNext = {15'd0, _zz_rowBufferRdCounter_valueNext_1};
  assign _zz_rowBufferRdCounter_overflowVal = (io_configPorts_tccRowBufferCnterRange + 16'h000a);
  assign _zz_rowMemWrCounter_2_0_valueNext_1 = rowMemWrCounter_2_0_willIncrement;
  assign _zz_rowMemWrCounter_2_0_valueNext = {15'd0, _zz_rowMemWrCounter_2_0_valueNext_1};
  assign _zz_rowMemWrCounter_2_1_valueNext_1 = rowMemWrCounter_2_1_willIncrement;
  assign _zz_rowMemWrCounter_2_1_valueNext = {15'd0, _zz_rowMemWrCounter_2_1_valueNext_1};
  assign _zz_rowMemWrCounter_2_2_valueNext_1 = rowMemWrCounter_2_2_willIncrement;
  assign _zz_rowMemWrCounter_2_2_valueNext = {15'd0, _zz_rowMemWrCounter_2_2_valueNext_1};
  assign _zz_rowMemWrCounter_2_3_valueNext_1 = rowMemWrCounter_2_3_willIncrement;
  assign _zz_rowMemWrCounter_2_3_valueNext = {15'd0, _zz_rowMemWrCounter_2_3_valueNext_1};
  assign _zz_rowMemWrCounter_2_4_valueNext_1 = rowMemWrCounter_2_4_willIncrement;
  assign _zz_rowMemWrCounter_2_4_valueNext = {15'd0, _zz_rowMemWrCounter_2_4_valueNext_1};
  assign _zz_rowMemWrCounter_2_5_valueNext_1 = rowMemWrCounter_2_5_willIncrement;
  assign _zz_rowMemWrCounter_2_5_valueNext = {15'd0, _zz_rowMemWrCounter_2_5_valueNext_1};
  assign _zz_row_computeIterCounter_2_valueNext_1 = row_computeIterCounter_2_willIncrement;
  assign _zz_row_computeIterCounter_2_valueNext = {15'd0, _zz_row_computeIterCounter_2_valueNext_1};
  assign _zz_row_computeIterCounter_2_overflowVal = (io_configPorts_matAColSubGrpLen - 16'h0001);
  assign _zz_row_resValidCounter_2_valueNext_1 = row_resValidCounter_2_willIncrement;
  assign _zz_row_resValidCounter_2_valueNext = {15'd0, _zz_row_resValidCounter_2_valueNext_1};
  assign _zz_row_resValidCounter_2_overflowVal = (io_configPorts_matAColSubGrpLen - 16'h0001);
  in_buffer rowMem_2_0 (
    .clock     (clk                                           ), //i
    .wren      (rowMem_2_0_wren                               ), //i
    .rdaddress (rowMem_2_0_rdaddress[6:0]                     ), //i
    .wraddress (rowMem_2_0_wraddress[6:0]                     ), //i
    .data      (fixedBfpConverter_106_io_dataOut_payload[87:0]), //i
    .q         (rowMem_2_0_q[87:0]                            )  //o
  );
  in_buffer rowMem_2_1 (
    .clock     (clk                                           ), //i
    .wren      (rowMem_2_1_wren                               ), //i
    .rdaddress (rowMem_2_1_rdaddress[6:0]                     ), //i
    .wraddress (rowMem_2_1_wraddress[6:0]                     ), //i
    .data      (fixedBfpConverter_107_io_dataOut_payload[87:0]), //i
    .q         (rowMem_2_1_q[87:0]                            )  //o
  );
  in_buffer rowMem_2_2 (
    .clock     (clk                                           ), //i
    .wren      (rowMem_2_2_wren                               ), //i
    .rdaddress (rowMem_2_2_rdaddress[6:0]                     ), //i
    .wraddress (rowMem_2_2_wraddress[6:0]                     ), //i
    .data      (fixedBfpConverter_108_io_dataOut_payload[87:0]), //i
    .q         (rowMem_2_2_q[87:0]                            )  //o
  );
  in_buffer rowMem_2_3 (
    .clock     (clk                                           ), //i
    .wren      (rowMem_2_3_wren                               ), //i
    .rdaddress (rowMem_2_3_rdaddress[6:0]                     ), //i
    .wraddress (rowMem_2_3_wraddress[6:0]                     ), //i
    .data      (fixedBfpConverter_109_io_dataOut_payload[87:0]), //i
    .q         (rowMem_2_3_q[87:0]                            )  //o
  );
  in_buffer rowMem_2_4 (
    .clock     (clk                                           ), //i
    .wren      (rowMem_2_4_wren                               ), //i
    .rdaddress (rowMem_2_4_rdaddress[6:0]                     ), //i
    .wraddress (rowMem_2_4_wraddress[6:0]                     ), //i
    .data      (fixedBfpConverter_110_io_dataOut_payload[87:0]), //i
    .q         (rowMem_2_4_q[87:0]                            )  //o
  );
  in_buffer rowMem_2_5 (
    .clock     (clk                                           ), //i
    .wren      (rowMem_2_5_wren                               ), //i
    .rdaddress (rowMem_2_5_rdaddress[6:0]                     ), //i
    .wraddress (rowMem_2_5_wraddress[6:0]                     ), //i
    .data      (fixedBfpConverter_111_io_dataOut_payload[87:0]), //i
    .q         (rowMem_2_5_q[87:0]                            )  //o
  );
  FixedBfpConverter fixedBfpConverter_106 (
    .io_dataIn_valid    (io_matBLoad_0_valid                           ), //i
    .io_dataIn_payload  (io_matBLoad_0_payload[319:0]                  ), //i
    .io_dataOut_valid   (fixedBfpConverter_106_io_dataOut_valid        ), //o
    .io_dataOut_payload (fixedBfpConverter_106_io_dataOut_payload[87:0]), //o
    .clk                (clk                                           ), //i
    .clrn               (clrn                                          )  //i
  );
  FixedBfpConverter fixedBfpConverter_107 (
    .io_dataIn_valid    (io_matBLoad_1_valid                           ), //i
    .io_dataIn_payload  (io_matBLoad_1_payload[319:0]                  ), //i
    .io_dataOut_valid   (fixedBfpConverter_107_io_dataOut_valid        ), //o
    .io_dataOut_payload (fixedBfpConverter_107_io_dataOut_payload[87:0]), //o
    .clk                (clk                                           ), //i
    .clrn               (clrn                                          )  //i
  );
  FixedBfpConverter fixedBfpConverter_108 (
    .io_dataIn_valid    (io_matBLoad_2_valid                           ), //i
    .io_dataIn_payload  (io_matBLoad_2_payload[319:0]                  ), //i
    .io_dataOut_valid   (fixedBfpConverter_108_io_dataOut_valid        ), //o
    .io_dataOut_payload (fixedBfpConverter_108_io_dataOut_payload[87:0]), //o
    .clk                (clk                                           ), //i
    .clrn               (clrn                                          )  //i
  );
  FixedBfpConverter fixedBfpConverter_109 (
    .io_dataIn_valid    (io_matBLoad_3_valid                           ), //i
    .io_dataIn_payload  (io_matBLoad_3_payload[319:0]                  ), //i
    .io_dataOut_valid   (fixedBfpConverter_109_io_dataOut_valid        ), //o
    .io_dataOut_payload (fixedBfpConverter_109_io_dataOut_payload[87:0]), //o
    .clk                (clk                                           ), //i
    .clrn               (clrn                                          )  //i
  );
  FixedBfpConverter fixedBfpConverter_110 (
    .io_dataIn_valid    (io_matBLoad_4_valid                           ), //i
    .io_dataIn_payload  (io_matBLoad_4_payload[319:0]                  ), //i
    .io_dataOut_valid   (fixedBfpConverter_110_io_dataOut_valid        ), //o
    .io_dataOut_payload (fixedBfpConverter_110_io_dataOut_payload[87:0]), //o
    .clk                (clk                                           ), //i
    .clrn               (clrn                                          )  //i
  );
  FixedBfpConverter fixedBfpConverter_111 (
    .io_dataIn_valid    (io_matBLoad_5_valid                           ), //i
    .io_dataIn_payload  (io_matBLoad_5_payload[319:0]                  ), //i
    .io_dataOut_valid   (fixedBfpConverter_111_io_dataOut_valid        ), //o
    .io_dataOut_payload (fixedBfpConverter_111_io_dataOut_payload[87:0]), //o
    .clk                (clk                                           ), //i
    .clrn               (clrn                                          )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_0 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_0_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_4[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_0_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_4[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_0_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_4[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_0_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_4[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_0_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_4[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_0_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_4[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_0[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_3[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_3[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_3[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_3[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_3[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_3[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_0[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7                 ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_0_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_0_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_0_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_0_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_0_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_0_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_0_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_0_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_1 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_1_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_9[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_1_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_9[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_1_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_9[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_1_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_9[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_1_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_9[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_1_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_9[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_1[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_7[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_7[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_7[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_7[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_7[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_7[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_1[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_1               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_1_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_1_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_1_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_1_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_1_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_1_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_1_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_1_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_2 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_2_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_14[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_2_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_14[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_2_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_14[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_2_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_14[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_2_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_14[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_2_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_14[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_2[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_11[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_11[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_11[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_11[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_11[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_11[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_2[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_2               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_2_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_2_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_2_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_2_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_2_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_2_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_2_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_2_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_3 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_3_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_19[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_3_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_19[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_3_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_19[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_3_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_19[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_3_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_19[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_3_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_19[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_3[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_15[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_15[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_15[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_15[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_15[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_15[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_3[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_3               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_3_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_3_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_3_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_3_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_3_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_3_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_3_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_3_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_4 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_4_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_24[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_4_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_24[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_4_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_24[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_4_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_24[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_4_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_24[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_4_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_24[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_4[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_19[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_19[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_19[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_19[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_19[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_19[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_4[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_4               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_4_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_4_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_4_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_4_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_4_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_4_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_4_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_4_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_5 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_5_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_29[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_5_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_29[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_5_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_29[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_5_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_29[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_5_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_29[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_5_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_29[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_5[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_23[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_23[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_23[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_23[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_23[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_23[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_5[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_5               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_5_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_5_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_5_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_5_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_5_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_5_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_5_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_5_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_6 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_6_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_34[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_6_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_34[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_6_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_34[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_6_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_34[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_6_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_34[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_6_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_34[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_6[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_27[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_27[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_27[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_27[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_27[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_27[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_6[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_6               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_6_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_6_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_6_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_6_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_6_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_6_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_6_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_6_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_7 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_7_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_39[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_7_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_39[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_7_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_39[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_7_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_39[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_7_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_39[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_7_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_39[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_7[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_31[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_31[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_31[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_31[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_31[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_31[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_7[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_7               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_7_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_7_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_7_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_7_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_7_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_7_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_7_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_7_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_8 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_8_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_44[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_8_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_44[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_8_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_44[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_8_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_44[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_8_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_44[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_8_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_44[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_8[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_35[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_35[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_35[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_35[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_35[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_35[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_8[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_8               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_8_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_8_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_8_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_8_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_8_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_8_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_8_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_8_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_9 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_9_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_49[79:0]        ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_9_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_49[79:0]        ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_9_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_49[79:0]        ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_9_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_49[79:0]        ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_9_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_49[79:0]        ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_9_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_49[79:0]        ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_9[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_39[7:0]                  ), //i
    .io_expIn_1          (_zz_io_expIn_1_39[7:0]                  ), //i
    .io_expIn_2          (_zz_io_expIn_2_39[7:0]                  ), //i
    .io_expIn_3          (_zz_io_expIn_3_39[7:0]                  ), //i
    .io_expIn_4          (_zz_io_expIn_4_39[7:0]                  ), //i
    .io_expIn_5          (_zz_io_expIn_5_39[7:0]                  ), //i
    .io_expCascadeIn     (io_cascadeExpIn_9[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_9               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_9_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_9_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_9_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_9_io_res_valid          ), //o
    .io_res_ready        (1'b1                                    ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_9_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_9_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_9_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]  ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]   ), //i
    .io_outValid         (u_tc_core_r_2_c_9_io_outValid           ), //o
    .clk                 (clk                                     ), //i
    .clrn                (clrn                                    )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_10 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_10_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_54[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_10_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_54[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_10_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_54[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_10_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_54[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_10_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_54[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_10_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_54[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_10[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_43[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_43[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_43[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_43[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_43[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_43[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_10[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_10               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_10_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_10_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_10_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_10_io_res_valid          ), //o
    .io_res_ready        (1'b1                                     ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_10_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_10_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_10_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]   ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]    ), //i
    .io_outValid         (u_tc_core_r_2_c_10_io_outValid           ), //o
    .clk                 (clk                                      ), //i
    .clrn                (clrn                                     )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_11 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_11_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_59[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_11_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_59[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_11_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_59[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_11_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_59[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_11_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_59[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_11_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_59[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_11[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_47[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_47[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_47[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_47[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_47[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_47[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_11[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_11               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_11_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_11_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_11_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_11_io_res_valid          ), //o
    .io_res_ready        (1'b1                                     ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_11_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_11_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_11_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]   ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]    ), //i
    .io_outValid         (u_tc_core_r_2_c_11_io_outValid           ), //o
    .clk                 (clk                                      ), //i
    .clrn                (clrn                                     )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_12 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_12_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_64[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_12_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_64[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_12_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_64[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_12_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_64[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_12_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_64[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_12_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_64[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_12[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_51[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_51[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_51[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_51[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_51[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_51[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_12[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_12               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_12_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_12_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_12_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_12_io_res_valid          ), //o
    .io_res_ready        (1'b1                                     ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_12_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_12_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_12_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]   ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]    ), //i
    .io_outValid         (u_tc_core_r_2_c_12_io_outValid           ), //o
    .clk                 (clk                                      ), //i
    .clrn                (clrn                                     )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_13 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_13_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_69[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_13_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_69[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_13_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_69[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_13_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_69[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_13_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_69[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_13_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_69[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_13[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_55[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_55[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_55[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_55[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_55[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_55[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_13[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_13               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_13_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_13_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_13_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_13_io_res_valid          ), //o
    .io_res_ready        (1'b1                                     ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_13_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_13_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_13_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]   ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]    ), //i
    .io_outValid         (u_tc_core_r_2_c_13_io_outValid           ), //o
    .clk                 (clk                                      ), //i
    .clrn                (clrn                                     )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_14 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_14_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_74[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_14_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_74[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_14_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_74[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_14_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_74[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_14_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_74[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_14_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_74[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_14[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_59[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_59[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_59[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_59[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_59[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_59[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_14[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_14               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_14_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_14_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_14_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_14_io_res_valid          ), //o
    .io_res_ready        (1'b1                                     ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_14_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_14_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_14_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]   ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]    ), //i
    .io_outValid         (u_tc_core_r_2_c_14_io_outValid           ), //o
    .clk                 (clk                                      ), //i
    .clrn                (clrn                                     )  //i
  );
  TensorCoreChainBf12 u_tc_core_r_2_c_15 (
    .io_dataIn_0_valid   (u_tc_core_r_2_c_15_io_dataIn_0_valid     ), //i
    .io_dataIn_0_payload (_zz_io_dataIn_0_payload_79[79:0]         ), //i
    .io_dataIn_1_valid   (u_tc_core_r_2_c_15_io_dataIn_1_valid     ), //i
    .io_dataIn_1_payload (_zz_io_dataIn_1_payload_79[79:0]         ), //i
    .io_dataIn_2_valid   (u_tc_core_r_2_c_15_io_dataIn_2_valid     ), //i
    .io_dataIn_2_payload (_zz_io_dataIn_2_payload_79[79:0]         ), //i
    .io_dataIn_3_valid   (u_tc_core_r_2_c_15_io_dataIn_3_valid     ), //i
    .io_dataIn_3_payload (_zz_io_dataIn_3_payload_79[79:0]         ), //i
    .io_dataIn_4_valid   (u_tc_core_r_2_c_15_io_dataIn_4_valid     ), //i
    .io_dataIn_4_payload (_zz_io_dataIn_4_payload_79[79:0]         ), //i
    .io_dataIn_5_valid   (u_tc_core_r_2_c_15_io_dataIn_5_valid     ), //i
    .io_dataIn_5_payload (_zz_io_dataIn_5_payload_79[79:0]         ), //i
    .io_loadCascadeIn    (io_cascadeDataIn_15[79:0]                ), //i
    .io_expIn_0          (_zz_io_expIn_0_63[7:0]                   ), //i
    .io_expIn_1          (_zz_io_expIn_1_63[7:0]                   ), //i
    .io_expIn_2          (_zz_io_expIn_2_63[7:0]                   ), //i
    .io_expIn_3          (_zz_io_expIn_3_63[7:0]                   ), //i
    .io_expIn_4          (_zz_io_expIn_4_63[7:0]                   ), //i
    .io_expIn_5          (_zz_io_expIn_5_63[7:0]                   ), //i
    .io_expCascadeIn     (io_cascadeExpIn_15[7:0]                  ), //i
    .io_dataValid        (tensorDataValid_delay_7_15               ), //i
    .io_dataIterReady    (u_tc_core_r_2_c_15_io_dataIterReady      ), //o
    .io_loadValid        (io_tensorLoadValid_15_delay_7            ), //i
    .io_loadReady        (u_tc_core_r_2_c_15_io_loadReady          ), //o
    .io_res_valid        (u_tc_core_r_2_c_15_io_res_valid          ), //o
    .io_res_ready        (1'b1                                     ), //i
    .io_res_payload_0    (u_tc_core_r_2_c_15_io_res_payload_0[23:0]), //o
    .io_res_payload_1    (u_tc_core_r_2_c_15_io_res_payload_1[23:0]), //o
    .io_res_payload_2    (u_tc_core_r_2_c_15_io_res_payload_2[23:0]), //o
    .io_inputIters       (io_configPorts_matBColsPerTccRow[15:0]   ), //i
    .io_matAColSubGrpLen (io_configPorts_matAColSubGrpLen[15:0]    ), //i
    .io_outValid         (u_tc_core_r_2_c_15_io_outValid           ), //o
    .clk                 (clk                                      ), //i
    .clrn                (clrn                                     )  //i
  );
  always @(*) begin
    rowBufferRdCounter_willIncrement = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
        if(when_TensorCoreChainArray_l166) begin
          rowBufferRdCounter_willIncrement = 1'b1;
        end
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
      end
      default : begin
      end
    endcase
    if(when_StateMachine_l250) begin
      rowBufferRdCounter_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowBufferRdCounter_willClear = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
        rowBufferRdCounter_willClear = 1'b1;
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
        if(!when_TensorCoreChainArray_l166) begin
          rowBufferRdCounter_willClear = 1'b1;
        end
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
      end
      default : begin
      end
    endcase
  end

  assign rowBufferRdCounter_willOverflowIfInc = (rowBufferRdCounter_overflowVal <= rowBufferRdCounter_value);
  assign rowBufferRdCounter_willOverflow = (rowBufferRdCounter_willOverflowIfInc && rowBufferRdCounter_willIncrement);
  always @(*) begin
    if(rowBufferRdCounter_willOverflow) begin
      rowBufferRdCounter_valueNext = 16'h0;
    end else begin
      rowBufferRdCounter_valueNext = (rowBufferRdCounter_value + _zz_rowBufferRdCounter_valueNext);
    end
    if(rowBufferRdCounter_willClear) begin
      rowBufferRdCounter_valueNext = 16'h0;
    end
  end

  assign rowBufferRdCounter_overflowVal = (_zz_rowBufferRdCounter_overflowVal - 16'h0001);
  always @(*) begin
    rowMemWrCounter_2_0_willIncrement = 1'b0;
    if(fixedBfpConverter_106_io_dataOut_valid) begin
      rowMemWrCounter_2_0_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_0_willClear = 1'b0;
    if(!fixedBfpConverter_106_io_dataOut_valid) begin
      rowMemWrCounter_2_0_willClear = 1'b1;
    end
  end

  assign rowMemWrCounter_2_0_willOverflowIfInc = (rowMemWrCounter_2_0_overflowVal <= rowMemWrCounter_2_0_value);
  assign rowMemWrCounter_2_0_willOverflow = (rowMemWrCounter_2_0_willOverflowIfInc && rowMemWrCounter_2_0_willIncrement);
  always @(*) begin
    if(rowMemWrCounter_2_0_willOverflow) begin
      rowMemWrCounter_2_0_valueNext = 16'h0;
    end else begin
      rowMemWrCounter_2_0_valueNext = (rowMemWrCounter_2_0_value + _zz_rowMemWrCounter_2_0_valueNext);
    end
    if(rowMemWrCounter_2_0_willClear) begin
      rowMemWrCounter_2_0_valueNext = 16'h0;
    end
  end

  assign rowMemWrCounter_2_0_overflowVal = (io_configPorts_tccRowBufferCnterRange - 16'h0001);
  assign io_matBLoad_0_ready = 1'b1;
  assign rowMem_2_0_wraddress = rowMemWrCounter_2_0_value[6:0];
  assign rowMem_2_0_rdaddress = _zz_rdaddress_1[6:0];
  always @(*) begin
    if(fixedBfpConverter_106_io_dataOut_valid) begin
      rowMem_2_0_wren = 1'b1;
    end else begin
      rowMem_2_0_wren = 1'b0;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_1_willIncrement = 1'b0;
    if(fixedBfpConverter_107_io_dataOut_valid) begin
      rowMemWrCounter_2_1_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_1_willClear = 1'b0;
    if(!fixedBfpConverter_107_io_dataOut_valid) begin
      rowMemWrCounter_2_1_willClear = 1'b1;
    end
  end

  assign rowMemWrCounter_2_1_willOverflowIfInc = (rowMemWrCounter_2_1_overflowVal <= rowMemWrCounter_2_1_value);
  assign rowMemWrCounter_2_1_willOverflow = (rowMemWrCounter_2_1_willOverflowIfInc && rowMemWrCounter_2_1_willIncrement);
  always @(*) begin
    if(rowMemWrCounter_2_1_willOverflow) begin
      rowMemWrCounter_2_1_valueNext = 16'h0;
    end else begin
      rowMemWrCounter_2_1_valueNext = (rowMemWrCounter_2_1_value + _zz_rowMemWrCounter_2_1_valueNext);
    end
    if(rowMemWrCounter_2_1_willClear) begin
      rowMemWrCounter_2_1_valueNext = 16'h0;
    end
  end

  assign rowMemWrCounter_2_1_overflowVal = (io_configPorts_tccRowBufferCnterRange - 16'h0001);
  assign io_matBLoad_1_ready = 1'b1;
  assign rowMem_2_1_wraddress = rowMemWrCounter_2_1_value[6:0];
  assign rowMem_2_1_rdaddress = _zz_rdaddress_3[6:0];
  always @(*) begin
    if(fixedBfpConverter_107_io_dataOut_valid) begin
      rowMem_2_1_wren = 1'b1;
    end else begin
      rowMem_2_1_wren = 1'b0;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_2_willIncrement = 1'b0;
    if(fixedBfpConverter_108_io_dataOut_valid) begin
      rowMemWrCounter_2_2_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_2_willClear = 1'b0;
    if(!fixedBfpConverter_108_io_dataOut_valid) begin
      rowMemWrCounter_2_2_willClear = 1'b1;
    end
  end

  assign rowMemWrCounter_2_2_willOverflowIfInc = (rowMemWrCounter_2_2_overflowVal <= rowMemWrCounter_2_2_value);
  assign rowMemWrCounter_2_2_willOverflow = (rowMemWrCounter_2_2_willOverflowIfInc && rowMemWrCounter_2_2_willIncrement);
  always @(*) begin
    if(rowMemWrCounter_2_2_willOverflow) begin
      rowMemWrCounter_2_2_valueNext = 16'h0;
    end else begin
      rowMemWrCounter_2_2_valueNext = (rowMemWrCounter_2_2_value + _zz_rowMemWrCounter_2_2_valueNext);
    end
    if(rowMemWrCounter_2_2_willClear) begin
      rowMemWrCounter_2_2_valueNext = 16'h0;
    end
  end

  assign rowMemWrCounter_2_2_overflowVal = (io_configPorts_tccRowBufferCnterRange - 16'h0001);
  assign io_matBLoad_2_ready = 1'b1;
  assign rowMem_2_2_wraddress = rowMemWrCounter_2_2_value[6:0];
  assign rowMem_2_2_rdaddress = _zz_rdaddress_5[6:0];
  always @(*) begin
    if(fixedBfpConverter_108_io_dataOut_valid) begin
      rowMem_2_2_wren = 1'b1;
    end else begin
      rowMem_2_2_wren = 1'b0;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_3_willIncrement = 1'b0;
    if(fixedBfpConverter_109_io_dataOut_valid) begin
      rowMemWrCounter_2_3_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_3_willClear = 1'b0;
    if(!fixedBfpConverter_109_io_dataOut_valid) begin
      rowMemWrCounter_2_3_willClear = 1'b1;
    end
  end

  assign rowMemWrCounter_2_3_willOverflowIfInc = (rowMemWrCounter_2_3_overflowVal <= rowMemWrCounter_2_3_value);
  assign rowMemWrCounter_2_3_willOverflow = (rowMemWrCounter_2_3_willOverflowIfInc && rowMemWrCounter_2_3_willIncrement);
  always @(*) begin
    if(rowMemWrCounter_2_3_willOverflow) begin
      rowMemWrCounter_2_3_valueNext = 16'h0;
    end else begin
      rowMemWrCounter_2_3_valueNext = (rowMemWrCounter_2_3_value + _zz_rowMemWrCounter_2_3_valueNext);
    end
    if(rowMemWrCounter_2_3_willClear) begin
      rowMemWrCounter_2_3_valueNext = 16'h0;
    end
  end

  assign rowMemWrCounter_2_3_overflowVal = (io_configPorts_tccRowBufferCnterRange - 16'h0001);
  assign io_matBLoad_3_ready = 1'b1;
  assign rowMem_2_3_wraddress = rowMemWrCounter_2_3_value[6:0];
  assign rowMem_2_3_rdaddress = _zz_rdaddress_7[6:0];
  always @(*) begin
    if(fixedBfpConverter_109_io_dataOut_valid) begin
      rowMem_2_3_wren = 1'b1;
    end else begin
      rowMem_2_3_wren = 1'b0;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_4_willIncrement = 1'b0;
    if(fixedBfpConverter_110_io_dataOut_valid) begin
      rowMemWrCounter_2_4_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_4_willClear = 1'b0;
    if(!fixedBfpConverter_110_io_dataOut_valid) begin
      rowMemWrCounter_2_4_willClear = 1'b1;
    end
  end

  assign rowMemWrCounter_2_4_willOverflowIfInc = (rowMemWrCounter_2_4_overflowVal <= rowMemWrCounter_2_4_value);
  assign rowMemWrCounter_2_4_willOverflow = (rowMemWrCounter_2_4_willOverflowIfInc && rowMemWrCounter_2_4_willIncrement);
  always @(*) begin
    if(rowMemWrCounter_2_4_willOverflow) begin
      rowMemWrCounter_2_4_valueNext = 16'h0;
    end else begin
      rowMemWrCounter_2_4_valueNext = (rowMemWrCounter_2_4_value + _zz_rowMemWrCounter_2_4_valueNext);
    end
    if(rowMemWrCounter_2_4_willClear) begin
      rowMemWrCounter_2_4_valueNext = 16'h0;
    end
  end

  assign rowMemWrCounter_2_4_overflowVal = (io_configPorts_tccRowBufferCnterRange - 16'h0001);
  assign io_matBLoad_4_ready = 1'b1;
  assign rowMem_2_4_wraddress = rowMemWrCounter_2_4_value[6:0];
  assign rowMem_2_4_rdaddress = _zz_rdaddress_9[6:0];
  always @(*) begin
    if(fixedBfpConverter_110_io_dataOut_valid) begin
      rowMem_2_4_wren = 1'b1;
    end else begin
      rowMem_2_4_wren = 1'b0;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_5_willIncrement = 1'b0;
    if(fixedBfpConverter_111_io_dataOut_valid) begin
      rowMemWrCounter_2_5_willIncrement = 1'b1;
    end
  end

  always @(*) begin
    rowMemWrCounter_2_5_willClear = 1'b0;
    if(!fixedBfpConverter_111_io_dataOut_valid) begin
      rowMemWrCounter_2_5_willClear = 1'b1;
    end
  end

  assign rowMemWrCounter_2_5_willOverflowIfInc = (rowMemWrCounter_2_5_overflowVal <= rowMemWrCounter_2_5_value);
  assign rowMemWrCounter_2_5_willOverflow = (rowMemWrCounter_2_5_willOverflowIfInc && rowMemWrCounter_2_5_willIncrement);
  always @(*) begin
    if(rowMemWrCounter_2_5_willOverflow) begin
      rowMemWrCounter_2_5_valueNext = 16'h0;
    end else begin
      rowMemWrCounter_2_5_valueNext = (rowMemWrCounter_2_5_value + _zz_rowMemWrCounter_2_5_valueNext);
    end
    if(rowMemWrCounter_2_5_willClear) begin
      rowMemWrCounter_2_5_valueNext = 16'h0;
    end
  end

  assign rowMemWrCounter_2_5_overflowVal = (io_configPorts_tccRowBufferCnterRange - 16'h0001);
  assign io_matBLoad_5_ready = 1'b1;
  assign rowMem_2_5_wraddress = rowMemWrCounter_2_5_value[6:0];
  assign rowMem_2_5_rdaddress = _zz_rdaddress_11[6:0];
  always @(*) begin
    if(fixedBfpConverter_111_io_dataOut_valid) begin
      rowMem_2_5_wren = 1'b1;
    end else begin
      rowMem_2_5_wren = 1'b0;
    end
  end

  assign _zz_io_dataIn_0_payload = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload = rowMem_2_5_q;
  assign u_tc_core_r_2_c_0_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_0_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_0_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_0_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_0_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_0_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_0_payload = {u_tc_core_r_2_c_0_io_res_payload_2,{u_tc_core_r_2_c_0_io_res_payload_1,u_tc_core_r_2_c_0_io_res_payload_0}};
  assign io_res_0_valid = u_tc_core_r_2_c_0_io_res_valid;
  assign io_loadRdy_0 = u_tc_core_r_2_c_0_io_loadReady;
  assign io_dataInIterReady_0 = u_tc_core_r_2_c_0_io_dataIterReady;
  assign io_resOutValid_0 = u_tc_core_r_2_c_0_io_outValid;
  assign _zz_io_dataIn_0_payload_5 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_5 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_5 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_5 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_5 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_5 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_1_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_1_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_1_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_1_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_1_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_1_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_1_payload = {u_tc_core_r_2_c_1_io_res_payload_2,{u_tc_core_r_2_c_1_io_res_payload_1,u_tc_core_r_2_c_1_io_res_payload_0}};
  assign io_res_1_valid = u_tc_core_r_2_c_1_io_res_valid;
  assign io_loadRdy_1 = u_tc_core_r_2_c_1_io_loadReady;
  assign io_dataInIterReady_1 = u_tc_core_r_2_c_1_io_dataIterReady;
  assign io_resOutValid_1 = u_tc_core_r_2_c_1_io_outValid;
  assign _zz_io_dataIn_0_payload_10 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_10 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_10 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_10 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_10 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_10 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_2_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_2_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_2_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_2_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_2_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_2_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_2_payload = {u_tc_core_r_2_c_2_io_res_payload_2,{u_tc_core_r_2_c_2_io_res_payload_1,u_tc_core_r_2_c_2_io_res_payload_0}};
  assign io_res_2_valid = u_tc_core_r_2_c_2_io_res_valid;
  assign io_loadRdy_2 = u_tc_core_r_2_c_2_io_loadReady;
  assign io_dataInIterReady_2 = u_tc_core_r_2_c_2_io_dataIterReady;
  assign io_resOutValid_2 = u_tc_core_r_2_c_2_io_outValid;
  assign _zz_io_dataIn_0_payload_15 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_15 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_15 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_15 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_15 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_15 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_3_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_3_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_3_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_3_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_3_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_3_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_3_payload = {u_tc_core_r_2_c_3_io_res_payload_2,{u_tc_core_r_2_c_3_io_res_payload_1,u_tc_core_r_2_c_3_io_res_payload_0}};
  assign io_res_3_valid = u_tc_core_r_2_c_3_io_res_valid;
  assign io_loadRdy_3 = u_tc_core_r_2_c_3_io_loadReady;
  assign io_dataInIterReady_3 = u_tc_core_r_2_c_3_io_dataIterReady;
  assign io_resOutValid_3 = u_tc_core_r_2_c_3_io_outValid;
  assign _zz_io_dataIn_0_payload_20 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_20 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_20 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_20 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_20 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_20 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_4_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_4_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_4_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_4_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_4_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_4_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_4_payload = {u_tc_core_r_2_c_4_io_res_payload_2,{u_tc_core_r_2_c_4_io_res_payload_1,u_tc_core_r_2_c_4_io_res_payload_0}};
  assign io_res_4_valid = u_tc_core_r_2_c_4_io_res_valid;
  assign io_loadRdy_4 = u_tc_core_r_2_c_4_io_loadReady;
  assign io_dataInIterReady_4 = u_tc_core_r_2_c_4_io_dataIterReady;
  assign io_resOutValid_4 = u_tc_core_r_2_c_4_io_outValid;
  assign _zz_io_dataIn_0_payload_25 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_25 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_25 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_25 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_25 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_25 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_5_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_5_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_5_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_5_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_5_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_5_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_5_payload = {u_tc_core_r_2_c_5_io_res_payload_2,{u_tc_core_r_2_c_5_io_res_payload_1,u_tc_core_r_2_c_5_io_res_payload_0}};
  assign io_res_5_valid = u_tc_core_r_2_c_5_io_res_valid;
  assign io_loadRdy_5 = u_tc_core_r_2_c_5_io_loadReady;
  assign io_dataInIterReady_5 = u_tc_core_r_2_c_5_io_dataIterReady;
  assign io_resOutValid_5 = u_tc_core_r_2_c_5_io_outValid;
  assign _zz_io_dataIn_0_payload_30 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_30 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_30 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_30 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_30 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_30 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_6_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_6_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_6_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_6_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_6_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_6_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_6_payload = {u_tc_core_r_2_c_6_io_res_payload_2,{u_tc_core_r_2_c_6_io_res_payload_1,u_tc_core_r_2_c_6_io_res_payload_0}};
  assign io_res_6_valid = u_tc_core_r_2_c_6_io_res_valid;
  assign io_loadRdy_6 = u_tc_core_r_2_c_6_io_loadReady;
  assign io_dataInIterReady_6 = u_tc_core_r_2_c_6_io_dataIterReady;
  assign io_resOutValid_6 = u_tc_core_r_2_c_6_io_outValid;
  assign _zz_io_dataIn_0_payload_35 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_35 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_35 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_35 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_35 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_35 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_7_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_7_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_7_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_7_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_7_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_7_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_7_payload = {u_tc_core_r_2_c_7_io_res_payload_2,{u_tc_core_r_2_c_7_io_res_payload_1,u_tc_core_r_2_c_7_io_res_payload_0}};
  assign io_res_7_valid = u_tc_core_r_2_c_7_io_res_valid;
  assign io_loadRdy_7 = u_tc_core_r_2_c_7_io_loadReady;
  assign io_dataInIterReady_7 = u_tc_core_r_2_c_7_io_dataIterReady;
  assign io_resOutValid_7 = u_tc_core_r_2_c_7_io_outValid;
  assign _zz_io_dataIn_0_payload_40 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_40 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_40 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_40 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_40 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_40 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_8_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_8_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_8_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_8_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_8_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_8_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_8_payload = {u_tc_core_r_2_c_8_io_res_payload_2,{u_tc_core_r_2_c_8_io_res_payload_1,u_tc_core_r_2_c_8_io_res_payload_0}};
  assign io_res_8_valid = u_tc_core_r_2_c_8_io_res_valid;
  assign io_loadRdy_8 = u_tc_core_r_2_c_8_io_loadReady;
  assign io_dataInIterReady_8 = u_tc_core_r_2_c_8_io_dataIterReady;
  assign io_resOutValid_8 = u_tc_core_r_2_c_8_io_outValid;
  assign _zz_io_dataIn_0_payload_45 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_45 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_45 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_45 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_45 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_45 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_9_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_9_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_9_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_9_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_9_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_9_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_9_payload = {u_tc_core_r_2_c_9_io_res_payload_2,{u_tc_core_r_2_c_9_io_res_payload_1,u_tc_core_r_2_c_9_io_res_payload_0}};
  assign io_res_9_valid = u_tc_core_r_2_c_9_io_res_valid;
  assign io_loadRdy_9 = u_tc_core_r_2_c_9_io_loadReady;
  assign io_dataInIterReady_9 = u_tc_core_r_2_c_9_io_dataIterReady;
  assign io_resOutValid_9 = u_tc_core_r_2_c_9_io_outValid;
  assign _zz_io_dataIn_0_payload_50 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_50 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_50 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_50 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_50 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_50 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_10_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_10_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_10_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_10_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_10_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_10_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_10_payload = {u_tc_core_r_2_c_10_io_res_payload_2,{u_tc_core_r_2_c_10_io_res_payload_1,u_tc_core_r_2_c_10_io_res_payload_0}};
  assign io_res_10_valid = u_tc_core_r_2_c_10_io_res_valid;
  assign io_loadRdy_10 = u_tc_core_r_2_c_10_io_loadReady;
  assign io_dataInIterReady_10 = u_tc_core_r_2_c_10_io_dataIterReady;
  assign io_resOutValid_10 = u_tc_core_r_2_c_10_io_outValid;
  assign _zz_io_dataIn_0_payload_55 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_55 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_55 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_55 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_55 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_55 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_11_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_11_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_11_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_11_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_11_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_11_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_11_payload = {u_tc_core_r_2_c_11_io_res_payload_2,{u_tc_core_r_2_c_11_io_res_payload_1,u_tc_core_r_2_c_11_io_res_payload_0}};
  assign io_res_11_valid = u_tc_core_r_2_c_11_io_res_valid;
  assign io_loadRdy_11 = u_tc_core_r_2_c_11_io_loadReady;
  assign io_dataInIterReady_11 = u_tc_core_r_2_c_11_io_dataIterReady;
  assign io_resOutValid_11 = u_tc_core_r_2_c_11_io_outValid;
  assign _zz_io_dataIn_0_payload_60 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_60 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_60 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_60 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_60 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_60 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_12_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_12_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_12_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_12_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_12_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_12_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_12_payload = {u_tc_core_r_2_c_12_io_res_payload_2,{u_tc_core_r_2_c_12_io_res_payload_1,u_tc_core_r_2_c_12_io_res_payload_0}};
  assign io_res_12_valid = u_tc_core_r_2_c_12_io_res_valid;
  assign io_loadRdy_12 = u_tc_core_r_2_c_12_io_loadReady;
  assign io_dataInIterReady_12 = u_tc_core_r_2_c_12_io_dataIterReady;
  assign io_resOutValid_12 = u_tc_core_r_2_c_12_io_outValid;
  assign _zz_io_dataIn_0_payload_65 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_65 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_65 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_65 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_65 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_65 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_13_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_13_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_13_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_13_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_13_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_13_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_13_payload = {u_tc_core_r_2_c_13_io_res_payload_2,{u_tc_core_r_2_c_13_io_res_payload_1,u_tc_core_r_2_c_13_io_res_payload_0}};
  assign io_res_13_valid = u_tc_core_r_2_c_13_io_res_valid;
  assign io_loadRdy_13 = u_tc_core_r_2_c_13_io_loadReady;
  assign io_dataInIterReady_13 = u_tc_core_r_2_c_13_io_dataIterReady;
  assign io_resOutValid_13 = u_tc_core_r_2_c_13_io_outValid;
  assign _zz_io_dataIn_0_payload_70 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_70 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_70 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_70 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_70 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_70 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_14_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_14_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_14_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_14_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_14_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_14_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_14_payload = {u_tc_core_r_2_c_14_io_res_payload_2,{u_tc_core_r_2_c_14_io_res_payload_1,u_tc_core_r_2_c_14_io_res_payload_0}};
  assign io_res_14_valid = u_tc_core_r_2_c_14_io_res_valid;
  assign io_loadRdy_14 = u_tc_core_r_2_c_14_io_loadReady;
  assign io_dataInIterReady_14 = u_tc_core_r_2_c_14_io_dataIterReady;
  assign io_resOutValid_14 = u_tc_core_r_2_c_14_io_outValid;
  assign _zz_io_dataIn_0_payload_75 = rowMem_2_0_q;
  assign _zz_io_dataIn_1_payload_75 = rowMem_2_1_q;
  assign _zz_io_dataIn_2_payload_75 = rowMem_2_2_q;
  assign _zz_io_dataIn_3_payload_75 = rowMem_2_3_q;
  assign _zz_io_dataIn_4_payload_75 = rowMem_2_4_q;
  assign _zz_io_dataIn_5_payload_75 = rowMem_2_5_q;
  assign u_tc_core_r_2_c_15_io_dataIn_0_valid = ((_zz_rdaddress_1 < io_configPorts_tccRowBufferCnterRange) && (16'h0 <= _zz_rdaddress_1));
  assign u_tc_core_r_2_c_15_io_dataIn_1_valid = ((_zz_rdaddress_3 < io_configPorts_tccRowBufferCnterRange) && (16'h0002 <= _zz_rdaddress_3));
  assign u_tc_core_r_2_c_15_io_dataIn_2_valid = ((_zz_rdaddress_5 < io_configPorts_tccRowBufferCnterRange) && (16'h0004 <= _zz_rdaddress_5));
  assign u_tc_core_r_2_c_15_io_dataIn_3_valid = ((_zz_rdaddress_7 < io_configPorts_tccRowBufferCnterRange) && (16'h0006 <= _zz_rdaddress_7));
  assign u_tc_core_r_2_c_15_io_dataIn_4_valid = ((_zz_rdaddress_9 < io_configPorts_tccRowBufferCnterRange) && (16'h0008 <= _zz_rdaddress_9));
  assign u_tc_core_r_2_c_15_io_dataIn_5_valid = ((_zz_rdaddress_11 < io_configPorts_tccRowBufferCnterRange) && (16'h000a <= _zz_rdaddress_11));
  assign io_res_15_payload = {u_tc_core_r_2_c_15_io_res_payload_2,{u_tc_core_r_2_c_15_io_res_payload_1,u_tc_core_r_2_c_15_io_res_payload_0}};
  assign io_res_15_valid = u_tc_core_r_2_c_15_io_res_valid;
  assign io_loadRdy_15 = u_tc_core_r_2_c_15_io_loadReady;
  assign io_dataInIterReady_15 = u_tc_core_r_2_c_15_io_dataIterReady;
  assign io_resOutValid_15 = u_tc_core_r_2_c_15_io_outValid;
  assign rowCtrlFsm_wantExit = 1'b0;
  always @(*) begin
    rowCtrlFsm_wantStart = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
      end
      default : begin
        rowCtrlFsm_wantStart = 1'b1;
      end
    endcase
  end

  assign rowCtrlFsm_wantKill = 1'b0;
  assign row_loadRdy_2 = u_tc_core_r_2_c_0_io_loadReady;
  assign row_dataInIterReady_2 = u_tc_core_r_2_c_0_io_dataIterReady;
  assign row_resOutValid_2 = u_tc_core_r_2_c_0_io_outValid;
  always @(*) begin
    row_computeIterCounter_2_willIncrement = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
        if(row_dataInIterReady_2) begin
          row_computeIterCounter_2_willIncrement = 1'b1;
        end
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    row_computeIterCounter_2_willClear = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
        row_computeIterCounter_2_willClear = 1'b1;
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
      end
      default : begin
      end
    endcase
  end

  assign row_computeIterCounter_2_willOverflowIfInc = (row_computeIterCounter_2_overflowVal <= row_computeIterCounter_2_value);
  assign row_computeIterCounter_2_willOverflow = (row_computeIterCounter_2_willOverflowIfInc && row_computeIterCounter_2_willIncrement);
  always @(*) begin
    if(row_computeIterCounter_2_willOverflow) begin
      row_computeIterCounter_2_valueNext = 16'h0;
    end else begin
      row_computeIterCounter_2_valueNext = (row_computeIterCounter_2_value + _zz_row_computeIterCounter_2_valueNext);
    end
    if(row_computeIterCounter_2_willClear) begin
      row_computeIterCounter_2_valueNext = 16'h0;
    end
  end

  assign row_computeIterCounter_2_overflowVal = (_zz_row_computeIterCounter_2_overflowVal - 16'h0001);
  always @(*) begin
    row_resValidCounter_2_willIncrement = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
        if(row_resOutValid_2) begin
          row_resValidCounter_2_willIncrement = 1'b1;
        end
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    row_resValidCounter_2_willClear = 1'b0;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
        row_resValidCounter_2_willClear = 1'b1;
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
      end
      default : begin
      end
    endcase
  end

  assign row_resValidCounter_2_willOverflowIfInc = (row_resValidCounter_2_overflowVal <= row_resValidCounter_2_value);
  assign row_resValidCounter_2_willOverflow = (row_resValidCounter_2_willOverflowIfInc && row_resValidCounter_2_willIncrement);
  always @(*) begin
    if(row_resValidCounter_2_willOverflow) begin
      row_resValidCounter_2_valueNext = 16'h0;
    end else begin
      row_resValidCounter_2_valueNext = (row_resValidCounter_2_value + _zz_row_resValidCounter_2_valueNext);
    end
    if(row_resValidCounter_2_willClear) begin
      row_resValidCounter_2_valueNext = 16'h0;
    end
  end

  assign row_resValidCounter_2_overflowVal = (_zz_row_resValidCounter_2_overflowVal - 16'h0001);
  always @(*) begin
    rowCtrlFsm_stateNext = rowCtrlFsm_stateReg;
    case(rowCtrlFsm_stateReg)
      rowCtrlFsm_enumDef_2_sIdle : begin
        if(io_calEn) begin
          rowCtrlFsm_stateNext = rowCtrlFsm_enumDef_2_sPreLoad;
        end
      end
      rowCtrlFsm_enumDef_2_sPreLoad : begin
        if(row_loadRdy_2) begin
          rowCtrlFsm_stateNext = rowCtrlFsm_enumDef_2_sCompute;
        end
      end
      rowCtrlFsm_enumDef_2_sCompute : begin
        if(row_computeIterCounter_2_willOverflow_delay_1) begin
          rowCtrlFsm_stateNext = rowCtrlFsm_enumDef_2_sWriteRes;
        end
      end
      rowCtrlFsm_enumDef_2_sWriteRes : begin
        if(row_resValidCounter_2_willOverflow_delay_1) begin
          rowCtrlFsm_stateNext = rowCtrlFsm_enumDef_2_sIdle;
        end
      end
      default : begin
      end
    endcase
    if(rowCtrlFsm_wantStart) begin
      rowCtrlFsm_stateNext = rowCtrlFsm_enumDef_2_sIdle;
    end
    if(rowCtrlFsm_wantKill) begin
      rowCtrlFsm_stateNext = rowCtrlFsm_enumDef_2_BOOT;
    end
  end

  assign when_TensorCoreChainArray_l166 = (rowCtrlFsm_dataInFinish == 1'b0);
  assign when_StateMachine_l250 = ((! (rowCtrlFsm_stateReg == rowCtrlFsm_enumDef_2_sCompute)) && (rowCtrlFsm_stateNext == rowCtrlFsm_enumDef_2_sCompute));
  always @(posedge clk) begin
    if(!clrn) begin
      rowBufferRdCounter_value <= 16'h0;
      tensorDataValid <= 1'b0;
      rowMemWrCounter_2_0_value <= 16'h0;
      rowMemWrCounter_2_1_value <= 16'h0;
      rowMemWrCounter_2_2_value <= 16'h0;
      rowMemWrCounter_2_3_value <= 16'h0;
      rowMemWrCounter_2_4_value <= 16'h0;
      rowMemWrCounter_2_5_value <= 16'h0;
      _zz_io_dataIn_0_payload_1 <= 80'h0;
      _zz_io_dataIn_0_payload_2 <= 80'h0;
      _zz_io_dataIn_0_payload_3 <= 80'h0;
      _zz_io_dataIn_0_payload_4 <= 80'h0;
      _zz_io_expIn_0 <= 8'h0;
      _zz_io_expIn_0_1 <= 8'h0;
      _zz_io_expIn_0_2 <= 8'h0;
      _zz_io_expIn_0_3 <= 8'h0;
      _zz_io_dataIn_1_payload_1 <= 80'h0;
      _zz_io_dataIn_1_payload_2 <= 80'h0;
      _zz_io_dataIn_1_payload_3 <= 80'h0;
      _zz_io_dataIn_1_payload_4 <= 80'h0;
      _zz_io_expIn_1 <= 8'h0;
      _zz_io_expIn_1_1 <= 8'h0;
      _zz_io_expIn_1_2 <= 8'h0;
      _zz_io_expIn_1_3 <= 8'h0;
      _zz_io_dataIn_2_payload_1 <= 80'h0;
      _zz_io_dataIn_2_payload_2 <= 80'h0;
      _zz_io_dataIn_2_payload_3 <= 80'h0;
      _zz_io_dataIn_2_payload_4 <= 80'h0;
      _zz_io_expIn_2 <= 8'h0;
      _zz_io_expIn_2_1 <= 8'h0;
      _zz_io_expIn_2_2 <= 8'h0;
      _zz_io_expIn_2_3 <= 8'h0;
      _zz_io_dataIn_3_payload_1 <= 80'h0;
      _zz_io_dataIn_3_payload_2 <= 80'h0;
      _zz_io_dataIn_3_payload_3 <= 80'h0;
      _zz_io_dataIn_3_payload_4 <= 80'h0;
      _zz_io_expIn_3 <= 8'h0;
      _zz_io_expIn_3_1 <= 8'h0;
      _zz_io_expIn_3_2 <= 8'h0;
      _zz_io_expIn_3_3 <= 8'h0;
      _zz_io_dataIn_4_payload_1 <= 80'h0;
      _zz_io_dataIn_4_payload_2 <= 80'h0;
      _zz_io_dataIn_4_payload_3 <= 80'h0;
      _zz_io_dataIn_4_payload_4 <= 80'h0;
      _zz_io_expIn_4 <= 8'h0;
      _zz_io_expIn_4_1 <= 8'h0;
      _zz_io_expIn_4_2 <= 8'h0;
      _zz_io_expIn_4_3 <= 8'h0;
      _zz_io_dataIn_5_payload_1 <= 80'h0;
      _zz_io_dataIn_5_payload_2 <= 80'h0;
      _zz_io_dataIn_5_payload_3 <= 80'h0;
      _zz_io_dataIn_5_payload_4 <= 80'h0;
      _zz_io_expIn_5 <= 8'h0;
      _zz_io_expIn_5_1 <= 8'h0;
      _zz_io_expIn_5_2 <= 8'h0;
      _zz_io_expIn_5_3 <= 8'h0;
      io_tensorLoadValid_0_delay_1 <= 1'b0;
      io_tensorLoadValid_0_delay_2 <= 1'b0;
      io_tensorLoadValid_0_delay_3 <= 1'b0;
      io_tensorLoadValid_0_delay_4 <= 1'b0;
      io_tensorLoadValid_0_delay_5 <= 1'b0;
      io_tensorLoadValid_0_delay_6 <= 1'b0;
      io_tensorLoadValid_0_delay_7 <= 1'b0;
      tensorDataValid_delay_1 <= 1'b0;
      tensorDataValid_delay_2 <= 1'b0;
      tensorDataValid_delay_3 <= 1'b0;
      tensorDataValid_delay_4 <= 1'b0;
      tensorDataValid_delay_5 <= 1'b0;
      tensorDataValid_delay_6 <= 1'b0;
      tensorDataValid_delay_7 <= 1'b0;
      _zz_io_dataIn_0_payload_6 <= 80'h0;
      _zz_io_dataIn_0_payload_7 <= 80'h0;
      _zz_io_dataIn_0_payload_8 <= 80'h0;
      _zz_io_dataIn_0_payload_9 <= 80'h0;
      _zz_io_expIn_0_4 <= 8'h0;
      _zz_io_expIn_0_5 <= 8'h0;
      _zz_io_expIn_0_6 <= 8'h0;
      _zz_io_expIn_0_7 <= 8'h0;
      _zz_io_dataIn_1_payload_6 <= 80'h0;
      _zz_io_dataIn_1_payload_7 <= 80'h0;
      _zz_io_dataIn_1_payload_8 <= 80'h0;
      _zz_io_dataIn_1_payload_9 <= 80'h0;
      _zz_io_expIn_1_4 <= 8'h0;
      _zz_io_expIn_1_5 <= 8'h0;
      _zz_io_expIn_1_6 <= 8'h0;
      _zz_io_expIn_1_7 <= 8'h0;
      _zz_io_dataIn_2_payload_6 <= 80'h0;
      _zz_io_dataIn_2_payload_7 <= 80'h0;
      _zz_io_dataIn_2_payload_8 <= 80'h0;
      _zz_io_dataIn_2_payload_9 <= 80'h0;
      _zz_io_expIn_2_4 <= 8'h0;
      _zz_io_expIn_2_5 <= 8'h0;
      _zz_io_expIn_2_6 <= 8'h0;
      _zz_io_expIn_2_7 <= 8'h0;
      _zz_io_dataIn_3_payload_6 <= 80'h0;
      _zz_io_dataIn_3_payload_7 <= 80'h0;
      _zz_io_dataIn_3_payload_8 <= 80'h0;
      _zz_io_dataIn_3_payload_9 <= 80'h0;
      _zz_io_expIn_3_4 <= 8'h0;
      _zz_io_expIn_3_5 <= 8'h0;
      _zz_io_expIn_3_6 <= 8'h0;
      _zz_io_expIn_3_7 <= 8'h0;
      _zz_io_dataIn_4_payload_6 <= 80'h0;
      _zz_io_dataIn_4_payload_7 <= 80'h0;
      _zz_io_dataIn_4_payload_8 <= 80'h0;
      _zz_io_dataIn_4_payload_9 <= 80'h0;
      _zz_io_expIn_4_4 <= 8'h0;
      _zz_io_expIn_4_5 <= 8'h0;
      _zz_io_expIn_4_6 <= 8'h0;
      _zz_io_expIn_4_7 <= 8'h0;
      _zz_io_dataIn_5_payload_6 <= 80'h0;
      _zz_io_dataIn_5_payload_7 <= 80'h0;
      _zz_io_dataIn_5_payload_8 <= 80'h0;
      _zz_io_dataIn_5_payload_9 <= 80'h0;
      _zz_io_expIn_5_4 <= 8'h0;
      _zz_io_expIn_5_5 <= 8'h0;
      _zz_io_expIn_5_6 <= 8'h0;
      _zz_io_expIn_5_7 <= 8'h0;
      io_tensorLoadValid_1_delay_1 <= 1'b0;
      io_tensorLoadValid_1_delay_2 <= 1'b0;
      io_tensorLoadValid_1_delay_3 <= 1'b0;
      io_tensorLoadValid_1_delay_4 <= 1'b0;
      io_tensorLoadValid_1_delay_5 <= 1'b0;
      io_tensorLoadValid_1_delay_6 <= 1'b0;
      io_tensorLoadValid_1_delay_7 <= 1'b0;
      tensorDataValid_delay_1_1 <= 1'b0;
      tensorDataValid_delay_2_1 <= 1'b0;
      tensorDataValid_delay_3_1 <= 1'b0;
      tensorDataValid_delay_4_1 <= 1'b0;
      tensorDataValid_delay_5_1 <= 1'b0;
      tensorDataValid_delay_6_1 <= 1'b0;
      tensorDataValid_delay_7_1 <= 1'b0;
      _zz_io_dataIn_0_payload_11 <= 80'h0;
      _zz_io_dataIn_0_payload_12 <= 80'h0;
      _zz_io_dataIn_0_payload_13 <= 80'h0;
      _zz_io_dataIn_0_payload_14 <= 80'h0;
      _zz_io_expIn_0_8 <= 8'h0;
      _zz_io_expIn_0_9 <= 8'h0;
      _zz_io_expIn_0_10 <= 8'h0;
      _zz_io_expIn_0_11 <= 8'h0;
      _zz_io_dataIn_1_payload_11 <= 80'h0;
      _zz_io_dataIn_1_payload_12 <= 80'h0;
      _zz_io_dataIn_1_payload_13 <= 80'h0;
      _zz_io_dataIn_1_payload_14 <= 80'h0;
      _zz_io_expIn_1_8 <= 8'h0;
      _zz_io_expIn_1_9 <= 8'h0;
      _zz_io_expIn_1_10 <= 8'h0;
      _zz_io_expIn_1_11 <= 8'h0;
      _zz_io_dataIn_2_payload_11 <= 80'h0;
      _zz_io_dataIn_2_payload_12 <= 80'h0;
      _zz_io_dataIn_2_payload_13 <= 80'h0;
      _zz_io_dataIn_2_payload_14 <= 80'h0;
      _zz_io_expIn_2_8 <= 8'h0;
      _zz_io_expIn_2_9 <= 8'h0;
      _zz_io_expIn_2_10 <= 8'h0;
      _zz_io_expIn_2_11 <= 8'h0;
      _zz_io_dataIn_3_payload_11 <= 80'h0;
      _zz_io_dataIn_3_payload_12 <= 80'h0;
      _zz_io_dataIn_3_payload_13 <= 80'h0;
      _zz_io_dataIn_3_payload_14 <= 80'h0;
      _zz_io_expIn_3_8 <= 8'h0;
      _zz_io_expIn_3_9 <= 8'h0;
      _zz_io_expIn_3_10 <= 8'h0;
      _zz_io_expIn_3_11 <= 8'h0;
      _zz_io_dataIn_4_payload_11 <= 80'h0;
      _zz_io_dataIn_4_payload_12 <= 80'h0;
      _zz_io_dataIn_4_payload_13 <= 80'h0;
      _zz_io_dataIn_4_payload_14 <= 80'h0;
      _zz_io_expIn_4_8 <= 8'h0;
      _zz_io_expIn_4_9 <= 8'h0;
      _zz_io_expIn_4_10 <= 8'h0;
      _zz_io_expIn_4_11 <= 8'h0;
      _zz_io_dataIn_5_payload_11 <= 80'h0;
      _zz_io_dataIn_5_payload_12 <= 80'h0;
      _zz_io_dataIn_5_payload_13 <= 80'h0;
      _zz_io_dataIn_5_payload_14 <= 80'h0;
      _zz_io_expIn_5_8 <= 8'h0;
      _zz_io_expIn_5_9 <= 8'h0;
      _zz_io_expIn_5_10 <= 8'h0;
      _zz_io_expIn_5_11 <= 8'h0;
      io_tensorLoadValid_2_delay_1 <= 1'b0;
      io_tensorLoadValid_2_delay_2 <= 1'b0;
      io_tensorLoadValid_2_delay_3 <= 1'b0;
      io_tensorLoadValid_2_delay_4 <= 1'b0;
      io_tensorLoadValid_2_delay_5 <= 1'b0;
      io_tensorLoadValid_2_delay_6 <= 1'b0;
      io_tensorLoadValid_2_delay_7 <= 1'b0;
      tensorDataValid_delay_1_2 <= 1'b0;
      tensorDataValid_delay_2_2 <= 1'b0;
      tensorDataValid_delay_3_2 <= 1'b0;
      tensorDataValid_delay_4_2 <= 1'b0;
      tensorDataValid_delay_5_2 <= 1'b0;
      tensorDataValid_delay_6_2 <= 1'b0;
      tensorDataValid_delay_7_2 <= 1'b0;
      _zz_io_dataIn_0_payload_16 <= 80'h0;
      _zz_io_dataIn_0_payload_17 <= 80'h0;
      _zz_io_dataIn_0_payload_18 <= 80'h0;
      _zz_io_dataIn_0_payload_19 <= 80'h0;
      _zz_io_expIn_0_12 <= 8'h0;
      _zz_io_expIn_0_13 <= 8'h0;
      _zz_io_expIn_0_14 <= 8'h0;
      _zz_io_expIn_0_15 <= 8'h0;
      _zz_io_dataIn_1_payload_16 <= 80'h0;
      _zz_io_dataIn_1_payload_17 <= 80'h0;
      _zz_io_dataIn_1_payload_18 <= 80'h0;
      _zz_io_dataIn_1_payload_19 <= 80'h0;
      _zz_io_expIn_1_12 <= 8'h0;
      _zz_io_expIn_1_13 <= 8'h0;
      _zz_io_expIn_1_14 <= 8'h0;
      _zz_io_expIn_1_15 <= 8'h0;
      _zz_io_dataIn_2_payload_16 <= 80'h0;
      _zz_io_dataIn_2_payload_17 <= 80'h0;
      _zz_io_dataIn_2_payload_18 <= 80'h0;
      _zz_io_dataIn_2_payload_19 <= 80'h0;
      _zz_io_expIn_2_12 <= 8'h0;
      _zz_io_expIn_2_13 <= 8'h0;
      _zz_io_expIn_2_14 <= 8'h0;
      _zz_io_expIn_2_15 <= 8'h0;
      _zz_io_dataIn_3_payload_16 <= 80'h0;
      _zz_io_dataIn_3_payload_17 <= 80'h0;
      _zz_io_dataIn_3_payload_18 <= 80'h0;
      _zz_io_dataIn_3_payload_19 <= 80'h0;
      _zz_io_expIn_3_12 <= 8'h0;
      _zz_io_expIn_3_13 <= 8'h0;
      _zz_io_expIn_3_14 <= 8'h0;
      _zz_io_expIn_3_15 <= 8'h0;
      _zz_io_dataIn_4_payload_16 <= 80'h0;
      _zz_io_dataIn_4_payload_17 <= 80'h0;
      _zz_io_dataIn_4_payload_18 <= 80'h0;
      _zz_io_dataIn_4_payload_19 <= 80'h0;
      _zz_io_expIn_4_12 <= 8'h0;
      _zz_io_expIn_4_13 <= 8'h0;
      _zz_io_expIn_4_14 <= 8'h0;
      _zz_io_expIn_4_15 <= 8'h0;
      _zz_io_dataIn_5_payload_16 <= 80'h0;
      _zz_io_dataIn_5_payload_17 <= 80'h0;
      _zz_io_dataIn_5_payload_18 <= 80'h0;
      _zz_io_dataIn_5_payload_19 <= 80'h0;
      _zz_io_expIn_5_12 <= 8'h0;
      _zz_io_expIn_5_13 <= 8'h0;
      _zz_io_expIn_5_14 <= 8'h0;
      _zz_io_expIn_5_15 <= 8'h0;
      io_tensorLoadValid_3_delay_1 <= 1'b0;
      io_tensorLoadValid_3_delay_2 <= 1'b0;
      io_tensorLoadValid_3_delay_3 <= 1'b0;
      io_tensorLoadValid_3_delay_4 <= 1'b0;
      io_tensorLoadValid_3_delay_5 <= 1'b0;
      io_tensorLoadValid_3_delay_6 <= 1'b0;
      io_tensorLoadValid_3_delay_7 <= 1'b0;
      tensorDataValid_delay_1_3 <= 1'b0;
      tensorDataValid_delay_2_3 <= 1'b0;
      tensorDataValid_delay_3_3 <= 1'b0;
      tensorDataValid_delay_4_3 <= 1'b0;
      tensorDataValid_delay_5_3 <= 1'b0;
      tensorDataValid_delay_6_3 <= 1'b0;
      tensorDataValid_delay_7_3 <= 1'b0;
      _zz_io_dataIn_0_payload_21 <= 80'h0;
      _zz_io_dataIn_0_payload_22 <= 80'h0;
      _zz_io_dataIn_0_payload_23 <= 80'h0;
      _zz_io_dataIn_0_payload_24 <= 80'h0;
      _zz_io_expIn_0_16 <= 8'h0;
      _zz_io_expIn_0_17 <= 8'h0;
      _zz_io_expIn_0_18 <= 8'h0;
      _zz_io_expIn_0_19 <= 8'h0;
      _zz_io_dataIn_1_payload_21 <= 80'h0;
      _zz_io_dataIn_1_payload_22 <= 80'h0;
      _zz_io_dataIn_1_payload_23 <= 80'h0;
      _zz_io_dataIn_1_payload_24 <= 80'h0;
      _zz_io_expIn_1_16 <= 8'h0;
      _zz_io_expIn_1_17 <= 8'h0;
      _zz_io_expIn_1_18 <= 8'h0;
      _zz_io_expIn_1_19 <= 8'h0;
      _zz_io_dataIn_2_payload_21 <= 80'h0;
      _zz_io_dataIn_2_payload_22 <= 80'h0;
      _zz_io_dataIn_2_payload_23 <= 80'h0;
      _zz_io_dataIn_2_payload_24 <= 80'h0;
      _zz_io_expIn_2_16 <= 8'h0;
      _zz_io_expIn_2_17 <= 8'h0;
      _zz_io_expIn_2_18 <= 8'h0;
      _zz_io_expIn_2_19 <= 8'h0;
      _zz_io_dataIn_3_payload_21 <= 80'h0;
      _zz_io_dataIn_3_payload_22 <= 80'h0;
      _zz_io_dataIn_3_payload_23 <= 80'h0;
      _zz_io_dataIn_3_payload_24 <= 80'h0;
      _zz_io_expIn_3_16 <= 8'h0;
      _zz_io_expIn_3_17 <= 8'h0;
      _zz_io_expIn_3_18 <= 8'h0;
      _zz_io_expIn_3_19 <= 8'h0;
      _zz_io_dataIn_4_payload_21 <= 80'h0;
      _zz_io_dataIn_4_payload_22 <= 80'h0;
      _zz_io_dataIn_4_payload_23 <= 80'h0;
      _zz_io_dataIn_4_payload_24 <= 80'h0;
      _zz_io_expIn_4_16 <= 8'h0;
      _zz_io_expIn_4_17 <= 8'h0;
      _zz_io_expIn_4_18 <= 8'h0;
      _zz_io_expIn_4_19 <= 8'h0;
      _zz_io_dataIn_5_payload_21 <= 80'h0;
      _zz_io_dataIn_5_payload_22 <= 80'h0;
      _zz_io_dataIn_5_payload_23 <= 80'h0;
      _zz_io_dataIn_5_payload_24 <= 80'h0;
      _zz_io_expIn_5_16 <= 8'h0;
      _zz_io_expIn_5_17 <= 8'h0;
      _zz_io_expIn_5_18 <= 8'h0;
      _zz_io_expIn_5_19 <= 8'h0;
      io_tensorLoadValid_4_delay_1 <= 1'b0;
      io_tensorLoadValid_4_delay_2 <= 1'b0;
      io_tensorLoadValid_4_delay_3 <= 1'b0;
      io_tensorLoadValid_4_delay_4 <= 1'b0;
      io_tensorLoadValid_4_delay_5 <= 1'b0;
      io_tensorLoadValid_4_delay_6 <= 1'b0;
      io_tensorLoadValid_4_delay_7 <= 1'b0;
      tensorDataValid_delay_1_4 <= 1'b0;
      tensorDataValid_delay_2_4 <= 1'b0;
      tensorDataValid_delay_3_4 <= 1'b0;
      tensorDataValid_delay_4_4 <= 1'b0;
      tensorDataValid_delay_5_4 <= 1'b0;
      tensorDataValid_delay_6_4 <= 1'b0;
      tensorDataValid_delay_7_4 <= 1'b0;
      _zz_io_dataIn_0_payload_26 <= 80'h0;
      _zz_io_dataIn_0_payload_27 <= 80'h0;
      _zz_io_dataIn_0_payload_28 <= 80'h0;
      _zz_io_dataIn_0_payload_29 <= 80'h0;
      _zz_io_expIn_0_20 <= 8'h0;
      _zz_io_expIn_0_21 <= 8'h0;
      _zz_io_expIn_0_22 <= 8'h0;
      _zz_io_expIn_0_23 <= 8'h0;
      _zz_io_dataIn_1_payload_26 <= 80'h0;
      _zz_io_dataIn_1_payload_27 <= 80'h0;
      _zz_io_dataIn_1_payload_28 <= 80'h0;
      _zz_io_dataIn_1_payload_29 <= 80'h0;
      _zz_io_expIn_1_20 <= 8'h0;
      _zz_io_expIn_1_21 <= 8'h0;
      _zz_io_expIn_1_22 <= 8'h0;
      _zz_io_expIn_1_23 <= 8'h0;
      _zz_io_dataIn_2_payload_26 <= 80'h0;
      _zz_io_dataIn_2_payload_27 <= 80'h0;
      _zz_io_dataIn_2_payload_28 <= 80'h0;
      _zz_io_dataIn_2_payload_29 <= 80'h0;
      _zz_io_expIn_2_20 <= 8'h0;
      _zz_io_expIn_2_21 <= 8'h0;
      _zz_io_expIn_2_22 <= 8'h0;
      _zz_io_expIn_2_23 <= 8'h0;
      _zz_io_dataIn_3_payload_26 <= 80'h0;
      _zz_io_dataIn_3_payload_27 <= 80'h0;
      _zz_io_dataIn_3_payload_28 <= 80'h0;
      _zz_io_dataIn_3_payload_29 <= 80'h0;
      _zz_io_expIn_3_20 <= 8'h0;
      _zz_io_expIn_3_21 <= 8'h0;
      _zz_io_expIn_3_22 <= 8'h0;
      _zz_io_expIn_3_23 <= 8'h0;
      _zz_io_dataIn_4_payload_26 <= 80'h0;
      _zz_io_dataIn_4_payload_27 <= 80'h0;
      _zz_io_dataIn_4_payload_28 <= 80'h0;
      _zz_io_dataIn_4_payload_29 <= 80'h0;
      _zz_io_expIn_4_20 <= 8'h0;
      _zz_io_expIn_4_21 <= 8'h0;
      _zz_io_expIn_4_22 <= 8'h0;
      _zz_io_expIn_4_23 <= 8'h0;
      _zz_io_dataIn_5_payload_26 <= 80'h0;
      _zz_io_dataIn_5_payload_27 <= 80'h0;
      _zz_io_dataIn_5_payload_28 <= 80'h0;
      _zz_io_dataIn_5_payload_29 <= 80'h0;
      _zz_io_expIn_5_20 <= 8'h0;
      _zz_io_expIn_5_21 <= 8'h0;
      _zz_io_expIn_5_22 <= 8'h0;
      _zz_io_expIn_5_23 <= 8'h0;
      io_tensorLoadValid_5_delay_1 <= 1'b0;
      io_tensorLoadValid_5_delay_2 <= 1'b0;
      io_tensorLoadValid_5_delay_3 <= 1'b0;
      io_tensorLoadValid_5_delay_4 <= 1'b0;
      io_tensorLoadValid_5_delay_5 <= 1'b0;
      io_tensorLoadValid_5_delay_6 <= 1'b0;
      io_tensorLoadValid_5_delay_7 <= 1'b0;
      tensorDataValid_delay_1_5 <= 1'b0;
      tensorDataValid_delay_2_5 <= 1'b0;
      tensorDataValid_delay_3_5 <= 1'b0;
      tensorDataValid_delay_4_5 <= 1'b0;
      tensorDataValid_delay_5_5 <= 1'b0;
      tensorDataValid_delay_6_5 <= 1'b0;
      tensorDataValid_delay_7_5 <= 1'b0;
      _zz_io_dataIn_0_payload_31 <= 80'h0;
      _zz_io_dataIn_0_payload_32 <= 80'h0;
      _zz_io_dataIn_0_payload_33 <= 80'h0;
      _zz_io_dataIn_0_payload_34 <= 80'h0;
      _zz_io_expIn_0_24 <= 8'h0;
      _zz_io_expIn_0_25 <= 8'h0;
      _zz_io_expIn_0_26 <= 8'h0;
      _zz_io_expIn_0_27 <= 8'h0;
      _zz_io_dataIn_1_payload_31 <= 80'h0;
      _zz_io_dataIn_1_payload_32 <= 80'h0;
      _zz_io_dataIn_1_payload_33 <= 80'h0;
      _zz_io_dataIn_1_payload_34 <= 80'h0;
      _zz_io_expIn_1_24 <= 8'h0;
      _zz_io_expIn_1_25 <= 8'h0;
      _zz_io_expIn_1_26 <= 8'h0;
      _zz_io_expIn_1_27 <= 8'h0;
      _zz_io_dataIn_2_payload_31 <= 80'h0;
      _zz_io_dataIn_2_payload_32 <= 80'h0;
      _zz_io_dataIn_2_payload_33 <= 80'h0;
      _zz_io_dataIn_2_payload_34 <= 80'h0;
      _zz_io_expIn_2_24 <= 8'h0;
      _zz_io_expIn_2_25 <= 8'h0;
      _zz_io_expIn_2_26 <= 8'h0;
      _zz_io_expIn_2_27 <= 8'h0;
      _zz_io_dataIn_3_payload_31 <= 80'h0;
      _zz_io_dataIn_3_payload_32 <= 80'h0;
      _zz_io_dataIn_3_payload_33 <= 80'h0;
      _zz_io_dataIn_3_payload_34 <= 80'h0;
      _zz_io_expIn_3_24 <= 8'h0;
      _zz_io_expIn_3_25 <= 8'h0;
      _zz_io_expIn_3_26 <= 8'h0;
      _zz_io_expIn_3_27 <= 8'h0;
      _zz_io_dataIn_4_payload_31 <= 80'h0;
      _zz_io_dataIn_4_payload_32 <= 80'h0;
      _zz_io_dataIn_4_payload_33 <= 80'h0;
      _zz_io_dataIn_4_payload_34 <= 80'h0;
      _zz_io_expIn_4_24 <= 8'h0;
      _zz_io_expIn_4_25 <= 8'h0;
      _zz_io_expIn_4_26 <= 8'h0;
      _zz_io_expIn_4_27 <= 8'h0;
      _zz_io_dataIn_5_payload_31 <= 80'h0;
      _zz_io_dataIn_5_payload_32 <= 80'h0;
      _zz_io_dataIn_5_payload_33 <= 80'h0;
      _zz_io_dataIn_5_payload_34 <= 80'h0;
      _zz_io_expIn_5_24 <= 8'h0;
      _zz_io_expIn_5_25 <= 8'h0;
      _zz_io_expIn_5_26 <= 8'h0;
      _zz_io_expIn_5_27 <= 8'h0;
      io_tensorLoadValid_6_delay_1 <= 1'b0;
      io_tensorLoadValid_6_delay_2 <= 1'b0;
      io_tensorLoadValid_6_delay_3 <= 1'b0;
      io_tensorLoadValid_6_delay_4 <= 1'b0;
      io_tensorLoadValid_6_delay_5 <= 1'b0;
      io_tensorLoadValid_6_delay_6 <= 1'b0;
      io_tensorLoadValid_6_delay_7 <= 1'b0;
      tensorDataValid_delay_1_6 <= 1'b0;
      tensorDataValid_delay_2_6 <= 1'b0;
      tensorDataValid_delay_3_6 <= 1'b0;
      tensorDataValid_delay_4_6 <= 1'b0;
      tensorDataValid_delay_5_6 <= 1'b0;
      tensorDataValid_delay_6_6 <= 1'b0;
      tensorDataValid_delay_7_6 <= 1'b0;
      _zz_io_dataIn_0_payload_36 <= 80'h0;
      _zz_io_dataIn_0_payload_37 <= 80'h0;
      _zz_io_dataIn_0_payload_38 <= 80'h0;
      _zz_io_dataIn_0_payload_39 <= 80'h0;
      _zz_io_expIn_0_28 <= 8'h0;
      _zz_io_expIn_0_29 <= 8'h0;
      _zz_io_expIn_0_30 <= 8'h0;
      _zz_io_expIn_0_31 <= 8'h0;
      _zz_io_dataIn_1_payload_36 <= 80'h0;
      _zz_io_dataIn_1_payload_37 <= 80'h0;
      _zz_io_dataIn_1_payload_38 <= 80'h0;
      _zz_io_dataIn_1_payload_39 <= 80'h0;
      _zz_io_expIn_1_28 <= 8'h0;
      _zz_io_expIn_1_29 <= 8'h0;
      _zz_io_expIn_1_30 <= 8'h0;
      _zz_io_expIn_1_31 <= 8'h0;
      _zz_io_dataIn_2_payload_36 <= 80'h0;
      _zz_io_dataIn_2_payload_37 <= 80'h0;
      _zz_io_dataIn_2_payload_38 <= 80'h0;
      _zz_io_dataIn_2_payload_39 <= 80'h0;
      _zz_io_expIn_2_28 <= 8'h0;
      _zz_io_expIn_2_29 <= 8'h0;
      _zz_io_expIn_2_30 <= 8'h0;
      _zz_io_expIn_2_31 <= 8'h0;
      _zz_io_dataIn_3_payload_36 <= 80'h0;
      _zz_io_dataIn_3_payload_37 <= 80'h0;
      _zz_io_dataIn_3_payload_38 <= 80'h0;
      _zz_io_dataIn_3_payload_39 <= 80'h0;
      _zz_io_expIn_3_28 <= 8'h0;
      _zz_io_expIn_3_29 <= 8'h0;
      _zz_io_expIn_3_30 <= 8'h0;
      _zz_io_expIn_3_31 <= 8'h0;
      _zz_io_dataIn_4_payload_36 <= 80'h0;
      _zz_io_dataIn_4_payload_37 <= 80'h0;
      _zz_io_dataIn_4_payload_38 <= 80'h0;
      _zz_io_dataIn_4_payload_39 <= 80'h0;
      _zz_io_expIn_4_28 <= 8'h0;
      _zz_io_expIn_4_29 <= 8'h0;
      _zz_io_expIn_4_30 <= 8'h0;
      _zz_io_expIn_4_31 <= 8'h0;
      _zz_io_dataIn_5_payload_36 <= 80'h0;
      _zz_io_dataIn_5_payload_37 <= 80'h0;
      _zz_io_dataIn_5_payload_38 <= 80'h0;
      _zz_io_dataIn_5_payload_39 <= 80'h0;
      _zz_io_expIn_5_28 <= 8'h0;
      _zz_io_expIn_5_29 <= 8'h0;
      _zz_io_expIn_5_30 <= 8'h0;
      _zz_io_expIn_5_31 <= 8'h0;
      io_tensorLoadValid_7_delay_1 <= 1'b0;
      io_tensorLoadValid_7_delay_2 <= 1'b0;
      io_tensorLoadValid_7_delay_3 <= 1'b0;
      io_tensorLoadValid_7_delay_4 <= 1'b0;
      io_tensorLoadValid_7_delay_5 <= 1'b0;
      io_tensorLoadValid_7_delay_6 <= 1'b0;
      io_tensorLoadValid_7_delay_7 <= 1'b0;
      tensorDataValid_delay_1_7 <= 1'b0;
      tensorDataValid_delay_2_7 <= 1'b0;
      tensorDataValid_delay_3_7 <= 1'b0;
      tensorDataValid_delay_4_7 <= 1'b0;
      tensorDataValid_delay_5_7 <= 1'b0;
      tensorDataValid_delay_6_7 <= 1'b0;
      tensorDataValid_delay_7_7 <= 1'b0;
      _zz_io_dataIn_0_payload_41 <= 80'h0;
      _zz_io_dataIn_0_payload_42 <= 80'h0;
      _zz_io_dataIn_0_payload_43 <= 80'h0;
      _zz_io_dataIn_0_payload_44 <= 80'h0;
      _zz_io_expIn_0_32 <= 8'h0;
      _zz_io_expIn_0_33 <= 8'h0;
      _zz_io_expIn_0_34 <= 8'h0;
      _zz_io_expIn_0_35 <= 8'h0;
      _zz_io_dataIn_1_payload_41 <= 80'h0;
      _zz_io_dataIn_1_payload_42 <= 80'h0;
      _zz_io_dataIn_1_payload_43 <= 80'h0;
      _zz_io_dataIn_1_payload_44 <= 80'h0;
      _zz_io_expIn_1_32 <= 8'h0;
      _zz_io_expIn_1_33 <= 8'h0;
      _zz_io_expIn_1_34 <= 8'h0;
      _zz_io_expIn_1_35 <= 8'h0;
      _zz_io_dataIn_2_payload_41 <= 80'h0;
      _zz_io_dataIn_2_payload_42 <= 80'h0;
      _zz_io_dataIn_2_payload_43 <= 80'h0;
      _zz_io_dataIn_2_payload_44 <= 80'h0;
      _zz_io_expIn_2_32 <= 8'h0;
      _zz_io_expIn_2_33 <= 8'h0;
      _zz_io_expIn_2_34 <= 8'h0;
      _zz_io_expIn_2_35 <= 8'h0;
      _zz_io_dataIn_3_payload_41 <= 80'h0;
      _zz_io_dataIn_3_payload_42 <= 80'h0;
      _zz_io_dataIn_3_payload_43 <= 80'h0;
      _zz_io_dataIn_3_payload_44 <= 80'h0;
      _zz_io_expIn_3_32 <= 8'h0;
      _zz_io_expIn_3_33 <= 8'h0;
      _zz_io_expIn_3_34 <= 8'h0;
      _zz_io_expIn_3_35 <= 8'h0;
      _zz_io_dataIn_4_payload_41 <= 80'h0;
      _zz_io_dataIn_4_payload_42 <= 80'h0;
      _zz_io_dataIn_4_payload_43 <= 80'h0;
      _zz_io_dataIn_4_payload_44 <= 80'h0;
      _zz_io_expIn_4_32 <= 8'h0;
      _zz_io_expIn_4_33 <= 8'h0;
      _zz_io_expIn_4_34 <= 8'h0;
      _zz_io_expIn_4_35 <= 8'h0;
      _zz_io_dataIn_5_payload_41 <= 80'h0;
      _zz_io_dataIn_5_payload_42 <= 80'h0;
      _zz_io_dataIn_5_payload_43 <= 80'h0;
      _zz_io_dataIn_5_payload_44 <= 80'h0;
      _zz_io_expIn_5_32 <= 8'h0;
      _zz_io_expIn_5_33 <= 8'h0;
      _zz_io_expIn_5_34 <= 8'h0;
      _zz_io_expIn_5_35 <= 8'h0;
      io_tensorLoadValid_8_delay_1 <= 1'b0;
      io_tensorLoadValid_8_delay_2 <= 1'b0;
      io_tensorLoadValid_8_delay_3 <= 1'b0;
      io_tensorLoadValid_8_delay_4 <= 1'b0;
      io_tensorLoadValid_8_delay_5 <= 1'b0;
      io_tensorLoadValid_8_delay_6 <= 1'b0;
      io_tensorLoadValid_8_delay_7 <= 1'b0;
      tensorDataValid_delay_1_8 <= 1'b0;
      tensorDataValid_delay_2_8 <= 1'b0;
      tensorDataValid_delay_3_8 <= 1'b0;
      tensorDataValid_delay_4_8 <= 1'b0;
      tensorDataValid_delay_5_8 <= 1'b0;
      tensorDataValid_delay_6_8 <= 1'b0;
      tensorDataValid_delay_7_8 <= 1'b0;
      _zz_io_dataIn_0_payload_46 <= 80'h0;
      _zz_io_dataIn_0_payload_47 <= 80'h0;
      _zz_io_dataIn_0_payload_48 <= 80'h0;
      _zz_io_dataIn_0_payload_49 <= 80'h0;
      _zz_io_expIn_0_36 <= 8'h0;
      _zz_io_expIn_0_37 <= 8'h0;
      _zz_io_expIn_0_38 <= 8'h0;
      _zz_io_expIn_0_39 <= 8'h0;
      _zz_io_dataIn_1_payload_46 <= 80'h0;
      _zz_io_dataIn_1_payload_47 <= 80'h0;
      _zz_io_dataIn_1_payload_48 <= 80'h0;
      _zz_io_dataIn_1_payload_49 <= 80'h0;
      _zz_io_expIn_1_36 <= 8'h0;
      _zz_io_expIn_1_37 <= 8'h0;
      _zz_io_expIn_1_38 <= 8'h0;
      _zz_io_expIn_1_39 <= 8'h0;
      _zz_io_dataIn_2_payload_46 <= 80'h0;
      _zz_io_dataIn_2_payload_47 <= 80'h0;
      _zz_io_dataIn_2_payload_48 <= 80'h0;
      _zz_io_dataIn_2_payload_49 <= 80'h0;
      _zz_io_expIn_2_36 <= 8'h0;
      _zz_io_expIn_2_37 <= 8'h0;
      _zz_io_expIn_2_38 <= 8'h0;
      _zz_io_expIn_2_39 <= 8'h0;
      _zz_io_dataIn_3_payload_46 <= 80'h0;
      _zz_io_dataIn_3_payload_47 <= 80'h0;
      _zz_io_dataIn_3_payload_48 <= 80'h0;
      _zz_io_dataIn_3_payload_49 <= 80'h0;
      _zz_io_expIn_3_36 <= 8'h0;
      _zz_io_expIn_3_37 <= 8'h0;
      _zz_io_expIn_3_38 <= 8'h0;
      _zz_io_expIn_3_39 <= 8'h0;
      _zz_io_dataIn_4_payload_46 <= 80'h0;
      _zz_io_dataIn_4_payload_47 <= 80'h0;
      _zz_io_dataIn_4_payload_48 <= 80'h0;
      _zz_io_dataIn_4_payload_49 <= 80'h0;
      _zz_io_expIn_4_36 <= 8'h0;
      _zz_io_expIn_4_37 <= 8'h0;
      _zz_io_expIn_4_38 <= 8'h0;
      _zz_io_expIn_4_39 <= 8'h0;
      _zz_io_dataIn_5_payload_46 <= 80'h0;
      _zz_io_dataIn_5_payload_47 <= 80'h0;
      _zz_io_dataIn_5_payload_48 <= 80'h0;
      _zz_io_dataIn_5_payload_49 <= 80'h0;
      _zz_io_expIn_5_36 <= 8'h0;
      _zz_io_expIn_5_37 <= 8'h0;
      _zz_io_expIn_5_38 <= 8'h0;
      _zz_io_expIn_5_39 <= 8'h0;
      io_tensorLoadValid_9_delay_1 <= 1'b0;
      io_tensorLoadValid_9_delay_2 <= 1'b0;
      io_tensorLoadValid_9_delay_3 <= 1'b0;
      io_tensorLoadValid_9_delay_4 <= 1'b0;
      io_tensorLoadValid_9_delay_5 <= 1'b0;
      io_tensorLoadValid_9_delay_6 <= 1'b0;
      io_tensorLoadValid_9_delay_7 <= 1'b0;
      tensorDataValid_delay_1_9 <= 1'b0;
      tensorDataValid_delay_2_9 <= 1'b0;
      tensorDataValid_delay_3_9 <= 1'b0;
      tensorDataValid_delay_4_9 <= 1'b0;
      tensorDataValid_delay_5_9 <= 1'b0;
      tensorDataValid_delay_6_9 <= 1'b0;
      tensorDataValid_delay_7_9 <= 1'b0;
      _zz_io_dataIn_0_payload_51 <= 80'h0;
      _zz_io_dataIn_0_payload_52 <= 80'h0;
      _zz_io_dataIn_0_payload_53 <= 80'h0;
      _zz_io_dataIn_0_payload_54 <= 80'h0;
      _zz_io_expIn_0_40 <= 8'h0;
      _zz_io_expIn_0_41 <= 8'h0;
      _zz_io_expIn_0_42 <= 8'h0;
      _zz_io_expIn_0_43 <= 8'h0;
      _zz_io_dataIn_1_payload_51 <= 80'h0;
      _zz_io_dataIn_1_payload_52 <= 80'h0;
      _zz_io_dataIn_1_payload_53 <= 80'h0;
      _zz_io_dataIn_1_payload_54 <= 80'h0;
      _zz_io_expIn_1_40 <= 8'h0;
      _zz_io_expIn_1_41 <= 8'h0;
      _zz_io_expIn_1_42 <= 8'h0;
      _zz_io_expIn_1_43 <= 8'h0;
      _zz_io_dataIn_2_payload_51 <= 80'h0;
      _zz_io_dataIn_2_payload_52 <= 80'h0;
      _zz_io_dataIn_2_payload_53 <= 80'h0;
      _zz_io_dataIn_2_payload_54 <= 80'h0;
      _zz_io_expIn_2_40 <= 8'h0;
      _zz_io_expIn_2_41 <= 8'h0;
      _zz_io_expIn_2_42 <= 8'h0;
      _zz_io_expIn_2_43 <= 8'h0;
      _zz_io_dataIn_3_payload_51 <= 80'h0;
      _zz_io_dataIn_3_payload_52 <= 80'h0;
      _zz_io_dataIn_3_payload_53 <= 80'h0;
      _zz_io_dataIn_3_payload_54 <= 80'h0;
      _zz_io_expIn_3_40 <= 8'h0;
      _zz_io_expIn_3_41 <= 8'h0;
      _zz_io_expIn_3_42 <= 8'h0;
      _zz_io_expIn_3_43 <= 8'h0;
      _zz_io_dataIn_4_payload_51 <= 80'h0;
      _zz_io_dataIn_4_payload_52 <= 80'h0;
      _zz_io_dataIn_4_payload_53 <= 80'h0;
      _zz_io_dataIn_4_payload_54 <= 80'h0;
      _zz_io_expIn_4_40 <= 8'h0;
      _zz_io_expIn_4_41 <= 8'h0;
      _zz_io_expIn_4_42 <= 8'h0;
      _zz_io_expIn_4_43 <= 8'h0;
      _zz_io_dataIn_5_payload_51 <= 80'h0;
      _zz_io_dataIn_5_payload_52 <= 80'h0;
      _zz_io_dataIn_5_payload_53 <= 80'h0;
      _zz_io_dataIn_5_payload_54 <= 80'h0;
      _zz_io_expIn_5_40 <= 8'h0;
      _zz_io_expIn_5_41 <= 8'h0;
      _zz_io_expIn_5_42 <= 8'h0;
      _zz_io_expIn_5_43 <= 8'h0;
      io_tensorLoadValid_10_delay_1 <= 1'b0;
      io_tensorLoadValid_10_delay_2 <= 1'b0;
      io_tensorLoadValid_10_delay_3 <= 1'b0;
      io_tensorLoadValid_10_delay_4 <= 1'b0;
      io_tensorLoadValid_10_delay_5 <= 1'b0;
      io_tensorLoadValid_10_delay_6 <= 1'b0;
      io_tensorLoadValid_10_delay_7 <= 1'b0;
      tensorDataValid_delay_1_10 <= 1'b0;
      tensorDataValid_delay_2_10 <= 1'b0;
      tensorDataValid_delay_3_10 <= 1'b0;
      tensorDataValid_delay_4_10 <= 1'b0;
      tensorDataValid_delay_5_10 <= 1'b0;
      tensorDataValid_delay_6_10 <= 1'b0;
      tensorDataValid_delay_7_10 <= 1'b0;
      _zz_io_dataIn_0_payload_56 <= 80'h0;
      _zz_io_dataIn_0_payload_57 <= 80'h0;
      _zz_io_dataIn_0_payload_58 <= 80'h0;
      _zz_io_dataIn_0_payload_59 <= 80'h0;
      _zz_io_expIn_0_44 <= 8'h0;
      _zz_io_expIn_0_45 <= 8'h0;
      _zz_io_expIn_0_46 <= 8'h0;
      _zz_io_expIn_0_47 <= 8'h0;
      _zz_io_dataIn_1_payload_56 <= 80'h0;
      _zz_io_dataIn_1_payload_57 <= 80'h0;
      _zz_io_dataIn_1_payload_58 <= 80'h0;
      _zz_io_dataIn_1_payload_59 <= 80'h0;
      _zz_io_expIn_1_44 <= 8'h0;
      _zz_io_expIn_1_45 <= 8'h0;
      _zz_io_expIn_1_46 <= 8'h0;
      _zz_io_expIn_1_47 <= 8'h0;
      _zz_io_dataIn_2_payload_56 <= 80'h0;
      _zz_io_dataIn_2_payload_57 <= 80'h0;
      _zz_io_dataIn_2_payload_58 <= 80'h0;
      _zz_io_dataIn_2_payload_59 <= 80'h0;
      _zz_io_expIn_2_44 <= 8'h0;
      _zz_io_expIn_2_45 <= 8'h0;
      _zz_io_expIn_2_46 <= 8'h0;
      _zz_io_expIn_2_47 <= 8'h0;
      _zz_io_dataIn_3_payload_56 <= 80'h0;
      _zz_io_dataIn_3_payload_57 <= 80'h0;
      _zz_io_dataIn_3_payload_58 <= 80'h0;
      _zz_io_dataIn_3_payload_59 <= 80'h0;
      _zz_io_expIn_3_44 <= 8'h0;
      _zz_io_expIn_3_45 <= 8'h0;
      _zz_io_expIn_3_46 <= 8'h0;
      _zz_io_expIn_3_47 <= 8'h0;
      _zz_io_dataIn_4_payload_56 <= 80'h0;
      _zz_io_dataIn_4_payload_57 <= 80'h0;
      _zz_io_dataIn_4_payload_58 <= 80'h0;
      _zz_io_dataIn_4_payload_59 <= 80'h0;
      _zz_io_expIn_4_44 <= 8'h0;
      _zz_io_expIn_4_45 <= 8'h0;
      _zz_io_expIn_4_46 <= 8'h0;
      _zz_io_expIn_4_47 <= 8'h0;
      _zz_io_dataIn_5_payload_56 <= 80'h0;
      _zz_io_dataIn_5_payload_57 <= 80'h0;
      _zz_io_dataIn_5_payload_58 <= 80'h0;
      _zz_io_dataIn_5_payload_59 <= 80'h0;
      _zz_io_expIn_5_44 <= 8'h0;
      _zz_io_expIn_5_45 <= 8'h0;
      _zz_io_expIn_5_46 <= 8'h0;
      _zz_io_expIn_5_47 <= 8'h0;
      io_tensorLoadValid_11_delay_1 <= 1'b0;
      io_tensorLoadValid_11_delay_2 <= 1'b0;
      io_tensorLoadValid_11_delay_3 <= 1'b0;
      io_tensorLoadValid_11_delay_4 <= 1'b0;
      io_tensorLoadValid_11_delay_5 <= 1'b0;
      io_tensorLoadValid_11_delay_6 <= 1'b0;
      io_tensorLoadValid_11_delay_7 <= 1'b0;
      tensorDataValid_delay_1_11 <= 1'b0;
      tensorDataValid_delay_2_11 <= 1'b0;
      tensorDataValid_delay_3_11 <= 1'b0;
      tensorDataValid_delay_4_11 <= 1'b0;
      tensorDataValid_delay_5_11 <= 1'b0;
      tensorDataValid_delay_6_11 <= 1'b0;
      tensorDataValid_delay_7_11 <= 1'b0;
      _zz_io_dataIn_0_payload_61 <= 80'h0;
      _zz_io_dataIn_0_payload_62 <= 80'h0;
      _zz_io_dataIn_0_payload_63 <= 80'h0;
      _zz_io_dataIn_0_payload_64 <= 80'h0;
      _zz_io_expIn_0_48 <= 8'h0;
      _zz_io_expIn_0_49 <= 8'h0;
      _zz_io_expIn_0_50 <= 8'h0;
      _zz_io_expIn_0_51 <= 8'h0;
      _zz_io_dataIn_1_payload_61 <= 80'h0;
      _zz_io_dataIn_1_payload_62 <= 80'h0;
      _zz_io_dataIn_1_payload_63 <= 80'h0;
      _zz_io_dataIn_1_payload_64 <= 80'h0;
      _zz_io_expIn_1_48 <= 8'h0;
      _zz_io_expIn_1_49 <= 8'h0;
      _zz_io_expIn_1_50 <= 8'h0;
      _zz_io_expIn_1_51 <= 8'h0;
      _zz_io_dataIn_2_payload_61 <= 80'h0;
      _zz_io_dataIn_2_payload_62 <= 80'h0;
      _zz_io_dataIn_2_payload_63 <= 80'h0;
      _zz_io_dataIn_2_payload_64 <= 80'h0;
      _zz_io_expIn_2_48 <= 8'h0;
      _zz_io_expIn_2_49 <= 8'h0;
      _zz_io_expIn_2_50 <= 8'h0;
      _zz_io_expIn_2_51 <= 8'h0;
      _zz_io_dataIn_3_payload_61 <= 80'h0;
      _zz_io_dataIn_3_payload_62 <= 80'h0;
      _zz_io_dataIn_3_payload_63 <= 80'h0;
      _zz_io_dataIn_3_payload_64 <= 80'h0;
      _zz_io_expIn_3_48 <= 8'h0;
      _zz_io_expIn_3_49 <= 8'h0;
      _zz_io_expIn_3_50 <= 8'h0;
      _zz_io_expIn_3_51 <= 8'h0;
      _zz_io_dataIn_4_payload_61 <= 80'h0;
      _zz_io_dataIn_4_payload_62 <= 80'h0;
      _zz_io_dataIn_4_payload_63 <= 80'h0;
      _zz_io_dataIn_4_payload_64 <= 80'h0;
      _zz_io_expIn_4_48 <= 8'h0;
      _zz_io_expIn_4_49 <= 8'h0;
      _zz_io_expIn_4_50 <= 8'h0;
      _zz_io_expIn_4_51 <= 8'h0;
      _zz_io_dataIn_5_payload_61 <= 80'h0;
      _zz_io_dataIn_5_payload_62 <= 80'h0;
      _zz_io_dataIn_5_payload_63 <= 80'h0;
      _zz_io_dataIn_5_payload_64 <= 80'h0;
      _zz_io_expIn_5_48 <= 8'h0;
      _zz_io_expIn_5_49 <= 8'h0;
      _zz_io_expIn_5_50 <= 8'h0;
      _zz_io_expIn_5_51 <= 8'h0;
      io_tensorLoadValid_12_delay_1 <= 1'b0;
      io_tensorLoadValid_12_delay_2 <= 1'b0;
      io_tensorLoadValid_12_delay_3 <= 1'b0;
      io_tensorLoadValid_12_delay_4 <= 1'b0;
      io_tensorLoadValid_12_delay_5 <= 1'b0;
      io_tensorLoadValid_12_delay_6 <= 1'b0;
      io_tensorLoadValid_12_delay_7 <= 1'b0;
      tensorDataValid_delay_1_12 <= 1'b0;
      tensorDataValid_delay_2_12 <= 1'b0;
      tensorDataValid_delay_3_12 <= 1'b0;
      tensorDataValid_delay_4_12 <= 1'b0;
      tensorDataValid_delay_5_12 <= 1'b0;
      tensorDataValid_delay_6_12 <= 1'b0;
      tensorDataValid_delay_7_12 <= 1'b0;
      _zz_io_dataIn_0_payload_66 <= 80'h0;
      _zz_io_dataIn_0_payload_67 <= 80'h0;
      _zz_io_dataIn_0_payload_68 <= 80'h0;
      _zz_io_dataIn_0_payload_69 <= 80'h0;
      _zz_io_expIn_0_52 <= 8'h0;
      _zz_io_expIn_0_53 <= 8'h0;
      _zz_io_expIn_0_54 <= 8'h0;
      _zz_io_expIn_0_55 <= 8'h0;
      _zz_io_dataIn_1_payload_66 <= 80'h0;
      _zz_io_dataIn_1_payload_67 <= 80'h0;
      _zz_io_dataIn_1_payload_68 <= 80'h0;
      _zz_io_dataIn_1_payload_69 <= 80'h0;
      _zz_io_expIn_1_52 <= 8'h0;
      _zz_io_expIn_1_53 <= 8'h0;
      _zz_io_expIn_1_54 <= 8'h0;
      _zz_io_expIn_1_55 <= 8'h0;
      _zz_io_dataIn_2_payload_66 <= 80'h0;
      _zz_io_dataIn_2_payload_67 <= 80'h0;
      _zz_io_dataIn_2_payload_68 <= 80'h0;
      _zz_io_dataIn_2_payload_69 <= 80'h0;
      _zz_io_expIn_2_52 <= 8'h0;
      _zz_io_expIn_2_53 <= 8'h0;
      _zz_io_expIn_2_54 <= 8'h0;
      _zz_io_expIn_2_55 <= 8'h0;
      _zz_io_dataIn_3_payload_66 <= 80'h0;
      _zz_io_dataIn_3_payload_67 <= 80'h0;
      _zz_io_dataIn_3_payload_68 <= 80'h0;
      _zz_io_dataIn_3_payload_69 <= 80'h0;
      _zz_io_expIn_3_52 <= 8'h0;
      _zz_io_expIn_3_53 <= 8'h0;
      _zz_io_expIn_3_54 <= 8'h0;
      _zz_io_expIn_3_55 <= 8'h0;
      _zz_io_dataIn_4_payload_66 <= 80'h0;
      _zz_io_dataIn_4_payload_67 <= 80'h0;
      _zz_io_dataIn_4_payload_68 <= 80'h0;
      _zz_io_dataIn_4_payload_69 <= 80'h0;
      _zz_io_expIn_4_52 <= 8'h0;
      _zz_io_expIn_4_53 <= 8'h0;
      _zz_io_expIn_4_54 <= 8'h0;
      _zz_io_expIn_4_55 <= 8'h0;
      _zz_io_dataIn_5_payload_66 <= 80'h0;
      _zz_io_dataIn_5_payload_67 <= 80'h0;
      _zz_io_dataIn_5_payload_68 <= 80'h0;
      _zz_io_dataIn_5_payload_69 <= 80'h0;
      _zz_io_expIn_5_52 <= 8'h0;
      _zz_io_expIn_5_53 <= 8'h0;
      _zz_io_expIn_5_54 <= 8'h0;
      _zz_io_expIn_5_55 <= 8'h0;
      io_tensorLoadValid_13_delay_1 <= 1'b0;
      io_tensorLoadValid_13_delay_2 <= 1'b0;
      io_tensorLoadValid_13_delay_3 <= 1'b0;
      io_tensorLoadValid_13_delay_4 <= 1'b0;
      io_tensorLoadValid_13_delay_5 <= 1'b0;
      io_tensorLoadValid_13_delay_6 <= 1'b0;
      io_tensorLoadValid_13_delay_7 <= 1'b0;
      tensorDataValid_delay_1_13 <= 1'b0;
      tensorDataValid_delay_2_13 <= 1'b0;
      tensorDataValid_delay_3_13 <= 1'b0;
      tensorDataValid_delay_4_13 <= 1'b0;
      tensorDataValid_delay_5_13 <= 1'b0;
      tensorDataValid_delay_6_13 <= 1'b0;
      tensorDataValid_delay_7_13 <= 1'b0;
      _zz_io_dataIn_0_payload_71 <= 80'h0;
      _zz_io_dataIn_0_payload_72 <= 80'h0;
      _zz_io_dataIn_0_payload_73 <= 80'h0;
      _zz_io_dataIn_0_payload_74 <= 80'h0;
      _zz_io_expIn_0_56 <= 8'h0;
      _zz_io_expIn_0_57 <= 8'h0;
      _zz_io_expIn_0_58 <= 8'h0;
      _zz_io_expIn_0_59 <= 8'h0;
      _zz_io_dataIn_1_payload_71 <= 80'h0;
      _zz_io_dataIn_1_payload_72 <= 80'h0;
      _zz_io_dataIn_1_payload_73 <= 80'h0;
      _zz_io_dataIn_1_payload_74 <= 80'h0;
      _zz_io_expIn_1_56 <= 8'h0;
      _zz_io_expIn_1_57 <= 8'h0;
      _zz_io_expIn_1_58 <= 8'h0;
      _zz_io_expIn_1_59 <= 8'h0;
      _zz_io_dataIn_2_payload_71 <= 80'h0;
      _zz_io_dataIn_2_payload_72 <= 80'h0;
      _zz_io_dataIn_2_payload_73 <= 80'h0;
      _zz_io_dataIn_2_payload_74 <= 80'h0;
      _zz_io_expIn_2_56 <= 8'h0;
      _zz_io_expIn_2_57 <= 8'h0;
      _zz_io_expIn_2_58 <= 8'h0;
      _zz_io_expIn_2_59 <= 8'h0;
      _zz_io_dataIn_3_payload_71 <= 80'h0;
      _zz_io_dataIn_3_payload_72 <= 80'h0;
      _zz_io_dataIn_3_payload_73 <= 80'h0;
      _zz_io_dataIn_3_payload_74 <= 80'h0;
      _zz_io_expIn_3_56 <= 8'h0;
      _zz_io_expIn_3_57 <= 8'h0;
      _zz_io_expIn_3_58 <= 8'h0;
      _zz_io_expIn_3_59 <= 8'h0;
      _zz_io_dataIn_4_payload_71 <= 80'h0;
      _zz_io_dataIn_4_payload_72 <= 80'h0;
      _zz_io_dataIn_4_payload_73 <= 80'h0;
      _zz_io_dataIn_4_payload_74 <= 80'h0;
      _zz_io_expIn_4_56 <= 8'h0;
      _zz_io_expIn_4_57 <= 8'h0;
      _zz_io_expIn_4_58 <= 8'h0;
      _zz_io_expIn_4_59 <= 8'h0;
      _zz_io_dataIn_5_payload_71 <= 80'h0;
      _zz_io_dataIn_5_payload_72 <= 80'h0;
      _zz_io_dataIn_5_payload_73 <= 80'h0;
      _zz_io_dataIn_5_payload_74 <= 80'h0;
      _zz_io_expIn_5_56 <= 8'h0;
      _zz_io_expIn_5_57 <= 8'h0;
      _zz_io_expIn_5_58 <= 8'h0;
      _zz_io_expIn_5_59 <= 8'h0;
      io_tensorLoadValid_14_delay_1 <= 1'b0;
      io_tensorLoadValid_14_delay_2 <= 1'b0;
      io_tensorLoadValid_14_delay_3 <= 1'b0;
      io_tensorLoadValid_14_delay_4 <= 1'b0;
      io_tensorLoadValid_14_delay_5 <= 1'b0;
      io_tensorLoadValid_14_delay_6 <= 1'b0;
      io_tensorLoadValid_14_delay_7 <= 1'b0;
      tensorDataValid_delay_1_14 <= 1'b0;
      tensorDataValid_delay_2_14 <= 1'b0;
      tensorDataValid_delay_3_14 <= 1'b0;
      tensorDataValid_delay_4_14 <= 1'b0;
      tensorDataValid_delay_5_14 <= 1'b0;
      tensorDataValid_delay_6_14 <= 1'b0;
      tensorDataValid_delay_7_14 <= 1'b0;
      _zz_io_dataIn_0_payload_76 <= 80'h0;
      _zz_io_dataIn_0_payload_77 <= 80'h0;
      _zz_io_dataIn_0_payload_78 <= 80'h0;
      _zz_io_dataIn_0_payload_79 <= 80'h0;
      _zz_io_expIn_0_60 <= 8'h0;
      _zz_io_expIn_0_61 <= 8'h0;
      _zz_io_expIn_0_62 <= 8'h0;
      _zz_io_expIn_0_63 <= 8'h0;
      _zz_io_dataIn_1_payload_76 <= 80'h0;
      _zz_io_dataIn_1_payload_77 <= 80'h0;
      _zz_io_dataIn_1_payload_78 <= 80'h0;
      _zz_io_dataIn_1_payload_79 <= 80'h0;
      _zz_io_expIn_1_60 <= 8'h0;
      _zz_io_expIn_1_61 <= 8'h0;
      _zz_io_expIn_1_62 <= 8'h0;
      _zz_io_expIn_1_63 <= 8'h0;
      _zz_io_dataIn_2_payload_76 <= 80'h0;
      _zz_io_dataIn_2_payload_77 <= 80'h0;
      _zz_io_dataIn_2_payload_78 <= 80'h0;
      _zz_io_dataIn_2_payload_79 <= 80'h0;
      _zz_io_expIn_2_60 <= 8'h0;
      _zz_io_expIn_2_61 <= 8'h0;
      _zz_io_expIn_2_62 <= 8'h0;
      _zz_io_expIn_2_63 <= 8'h0;
      _zz_io_dataIn_3_payload_76 <= 80'h0;
      _zz_io_dataIn_3_payload_77 <= 80'h0;
      _zz_io_dataIn_3_payload_78 <= 80'h0;
      _zz_io_dataIn_3_payload_79 <= 80'h0;
      _zz_io_expIn_3_60 <= 8'h0;
      _zz_io_expIn_3_61 <= 8'h0;
      _zz_io_expIn_3_62 <= 8'h0;
      _zz_io_expIn_3_63 <= 8'h0;
      _zz_io_dataIn_4_payload_76 <= 80'h0;
      _zz_io_dataIn_4_payload_77 <= 80'h0;
      _zz_io_dataIn_4_payload_78 <= 80'h0;
      _zz_io_dataIn_4_payload_79 <= 80'h0;
      _zz_io_expIn_4_60 <= 8'h0;
      _zz_io_expIn_4_61 <= 8'h0;
      _zz_io_expIn_4_62 <= 8'h0;
      _zz_io_expIn_4_63 <= 8'h0;
      _zz_io_dataIn_5_payload_76 <= 80'h0;
      _zz_io_dataIn_5_payload_77 <= 80'h0;
      _zz_io_dataIn_5_payload_78 <= 80'h0;
      _zz_io_dataIn_5_payload_79 <= 80'h0;
      _zz_io_expIn_5_60 <= 8'h0;
      _zz_io_expIn_5_61 <= 8'h0;
      _zz_io_expIn_5_62 <= 8'h0;
      _zz_io_expIn_5_63 <= 8'h0;
      io_tensorLoadValid_15_delay_1 <= 1'b0;
      io_tensorLoadValid_15_delay_2 <= 1'b0;
      io_tensorLoadValid_15_delay_3 <= 1'b0;
      io_tensorLoadValid_15_delay_4 <= 1'b0;
      io_tensorLoadValid_15_delay_5 <= 1'b0;
      io_tensorLoadValid_15_delay_6 <= 1'b0;
      io_tensorLoadValid_15_delay_7 <= 1'b0;
      tensorDataValid_delay_1_15 <= 1'b0;
      tensorDataValid_delay_2_15 <= 1'b0;
      tensorDataValid_delay_3_15 <= 1'b0;
      tensorDataValid_delay_4_15 <= 1'b0;
      tensorDataValid_delay_5_15 <= 1'b0;
      tensorDataValid_delay_6_15 <= 1'b0;
      tensorDataValid_delay_7_15 <= 1'b0;
      rowCtrlFsm_dataInFinish <= 1'b0;
      row_computeIterCounter_2_value <= 16'h0;
      row_resValidCounter_2_value <= 16'h0;
      rowCtrlFsm_stateReg <= rowCtrlFsm_enumDef_2_BOOT;
    end else begin
      rowBufferRdCounter_value <= rowBufferRdCounter_valueNext;
      rowMemWrCounter_2_0_value <= rowMemWrCounter_2_0_valueNext;
      rowMemWrCounter_2_1_value <= rowMemWrCounter_2_1_valueNext;
      rowMemWrCounter_2_2_value <= rowMemWrCounter_2_2_valueNext;
      rowMemWrCounter_2_3_value <= rowMemWrCounter_2_3_valueNext;
      rowMemWrCounter_2_4_value <= rowMemWrCounter_2_4_valueNext;
      rowMemWrCounter_2_5_value <= rowMemWrCounter_2_5_valueNext;
      _zz_io_dataIn_0_payload_1 <= _zz_io_dataIn_0_payload[87 : 8];
      _zz_io_dataIn_0_payload_2 <= _zz_io_dataIn_0_payload_1;
      _zz_io_dataIn_0_payload_3 <= _zz_io_dataIn_0_payload_2;
      _zz_io_dataIn_0_payload_4 <= _zz_io_dataIn_0_payload_3;
      _zz_io_expIn_0 <= _zz_io_dataIn_0_payload[7 : 0];
      _zz_io_expIn_0_1 <= _zz_io_expIn_0;
      _zz_io_expIn_0_2 <= _zz_io_expIn_0_1;
      _zz_io_expIn_0_3 <= _zz_io_expIn_0_2;
      _zz_io_dataIn_1_payload_1 <= _zz_io_dataIn_1_payload[87 : 8];
      _zz_io_dataIn_1_payload_2 <= _zz_io_dataIn_1_payload_1;
      _zz_io_dataIn_1_payload_3 <= _zz_io_dataIn_1_payload_2;
      _zz_io_dataIn_1_payload_4 <= _zz_io_dataIn_1_payload_3;
      _zz_io_expIn_1 <= _zz_io_dataIn_1_payload[7 : 0];
      _zz_io_expIn_1_1 <= _zz_io_expIn_1;
      _zz_io_expIn_1_2 <= _zz_io_expIn_1_1;
      _zz_io_expIn_1_3 <= _zz_io_expIn_1_2;
      _zz_io_dataIn_2_payload_1 <= _zz_io_dataIn_2_payload[87 : 8];
      _zz_io_dataIn_2_payload_2 <= _zz_io_dataIn_2_payload_1;
      _zz_io_dataIn_2_payload_3 <= _zz_io_dataIn_2_payload_2;
      _zz_io_dataIn_2_payload_4 <= _zz_io_dataIn_2_payload_3;
      _zz_io_expIn_2 <= _zz_io_dataIn_2_payload[7 : 0];
      _zz_io_expIn_2_1 <= _zz_io_expIn_2;
      _zz_io_expIn_2_2 <= _zz_io_expIn_2_1;
      _zz_io_expIn_2_3 <= _zz_io_expIn_2_2;
      _zz_io_dataIn_3_payload_1 <= _zz_io_dataIn_3_payload[87 : 8];
      _zz_io_dataIn_3_payload_2 <= _zz_io_dataIn_3_payload_1;
      _zz_io_dataIn_3_payload_3 <= _zz_io_dataIn_3_payload_2;
      _zz_io_dataIn_3_payload_4 <= _zz_io_dataIn_3_payload_3;
      _zz_io_expIn_3 <= _zz_io_dataIn_3_payload[7 : 0];
      _zz_io_expIn_3_1 <= _zz_io_expIn_3;
      _zz_io_expIn_3_2 <= _zz_io_expIn_3_1;
      _zz_io_expIn_3_3 <= _zz_io_expIn_3_2;
      _zz_io_dataIn_4_payload_1 <= _zz_io_dataIn_4_payload[87 : 8];
      _zz_io_dataIn_4_payload_2 <= _zz_io_dataIn_4_payload_1;
      _zz_io_dataIn_4_payload_3 <= _zz_io_dataIn_4_payload_2;
      _zz_io_dataIn_4_payload_4 <= _zz_io_dataIn_4_payload_3;
      _zz_io_expIn_4 <= _zz_io_dataIn_4_payload[7 : 0];
      _zz_io_expIn_4_1 <= _zz_io_expIn_4;
      _zz_io_expIn_4_2 <= _zz_io_expIn_4_1;
      _zz_io_expIn_4_3 <= _zz_io_expIn_4_2;
      _zz_io_dataIn_5_payload_1 <= _zz_io_dataIn_5_payload[87 : 8];
      _zz_io_dataIn_5_payload_2 <= _zz_io_dataIn_5_payload_1;
      _zz_io_dataIn_5_payload_3 <= _zz_io_dataIn_5_payload_2;
      _zz_io_dataIn_5_payload_4 <= _zz_io_dataIn_5_payload_3;
      _zz_io_expIn_5 <= _zz_io_dataIn_5_payload[7 : 0];
      _zz_io_expIn_5_1 <= _zz_io_expIn_5;
      _zz_io_expIn_5_2 <= _zz_io_expIn_5_1;
      _zz_io_expIn_5_3 <= _zz_io_expIn_5_2;
      io_tensorLoadValid_0_delay_1 <= io_tensorLoadValid_0;
      io_tensorLoadValid_0_delay_2 <= io_tensorLoadValid_0_delay_1;
      io_tensorLoadValid_0_delay_3 <= io_tensorLoadValid_0_delay_2;
      io_tensorLoadValid_0_delay_4 <= io_tensorLoadValid_0_delay_3;
      io_tensorLoadValid_0_delay_5 <= io_tensorLoadValid_0_delay_4;
      io_tensorLoadValid_0_delay_6 <= io_tensorLoadValid_0_delay_5;
      io_tensorLoadValid_0_delay_7 <= io_tensorLoadValid_0_delay_6;
      tensorDataValid_delay_1 <= tensorDataValid;
      tensorDataValid_delay_2 <= tensorDataValid_delay_1;
      tensorDataValid_delay_3 <= tensorDataValid_delay_2;
      tensorDataValid_delay_4 <= tensorDataValid_delay_3;
      tensorDataValid_delay_5 <= tensorDataValid_delay_4;
      tensorDataValid_delay_6 <= tensorDataValid_delay_5;
      tensorDataValid_delay_7 <= tensorDataValid_delay_6;
      _zz_io_dataIn_0_payload_6 <= _zz_io_dataIn_0_payload_5[87 : 8];
      _zz_io_dataIn_0_payload_7 <= _zz_io_dataIn_0_payload_6;
      _zz_io_dataIn_0_payload_8 <= _zz_io_dataIn_0_payload_7;
      _zz_io_dataIn_0_payload_9 <= _zz_io_dataIn_0_payload_8;
      _zz_io_expIn_0_4 <= _zz_io_dataIn_0_payload_5[7 : 0];
      _zz_io_expIn_0_5 <= _zz_io_expIn_0_4;
      _zz_io_expIn_0_6 <= _zz_io_expIn_0_5;
      _zz_io_expIn_0_7 <= _zz_io_expIn_0_6;
      _zz_io_dataIn_1_payload_6 <= _zz_io_dataIn_1_payload_5[87 : 8];
      _zz_io_dataIn_1_payload_7 <= _zz_io_dataIn_1_payload_6;
      _zz_io_dataIn_1_payload_8 <= _zz_io_dataIn_1_payload_7;
      _zz_io_dataIn_1_payload_9 <= _zz_io_dataIn_1_payload_8;
      _zz_io_expIn_1_4 <= _zz_io_dataIn_1_payload_5[7 : 0];
      _zz_io_expIn_1_5 <= _zz_io_expIn_1_4;
      _zz_io_expIn_1_6 <= _zz_io_expIn_1_5;
      _zz_io_expIn_1_7 <= _zz_io_expIn_1_6;
      _zz_io_dataIn_2_payload_6 <= _zz_io_dataIn_2_payload_5[87 : 8];
      _zz_io_dataIn_2_payload_7 <= _zz_io_dataIn_2_payload_6;
      _zz_io_dataIn_2_payload_8 <= _zz_io_dataIn_2_payload_7;
      _zz_io_dataIn_2_payload_9 <= _zz_io_dataIn_2_payload_8;
      _zz_io_expIn_2_4 <= _zz_io_dataIn_2_payload_5[7 : 0];
      _zz_io_expIn_2_5 <= _zz_io_expIn_2_4;
      _zz_io_expIn_2_6 <= _zz_io_expIn_2_5;
      _zz_io_expIn_2_7 <= _zz_io_expIn_2_6;
      _zz_io_dataIn_3_payload_6 <= _zz_io_dataIn_3_payload_5[87 : 8];
      _zz_io_dataIn_3_payload_7 <= _zz_io_dataIn_3_payload_6;
      _zz_io_dataIn_3_payload_8 <= _zz_io_dataIn_3_payload_7;
      _zz_io_dataIn_3_payload_9 <= _zz_io_dataIn_3_payload_8;
      _zz_io_expIn_3_4 <= _zz_io_dataIn_3_payload_5[7 : 0];
      _zz_io_expIn_3_5 <= _zz_io_expIn_3_4;
      _zz_io_expIn_3_6 <= _zz_io_expIn_3_5;
      _zz_io_expIn_3_7 <= _zz_io_expIn_3_6;
      _zz_io_dataIn_4_payload_6 <= _zz_io_dataIn_4_payload_5[87 : 8];
      _zz_io_dataIn_4_payload_7 <= _zz_io_dataIn_4_payload_6;
      _zz_io_dataIn_4_payload_8 <= _zz_io_dataIn_4_payload_7;
      _zz_io_dataIn_4_payload_9 <= _zz_io_dataIn_4_payload_8;
      _zz_io_expIn_4_4 <= _zz_io_dataIn_4_payload_5[7 : 0];
      _zz_io_expIn_4_5 <= _zz_io_expIn_4_4;
      _zz_io_expIn_4_6 <= _zz_io_expIn_4_5;
      _zz_io_expIn_4_7 <= _zz_io_expIn_4_6;
      _zz_io_dataIn_5_payload_6 <= _zz_io_dataIn_5_payload_5[87 : 8];
      _zz_io_dataIn_5_payload_7 <= _zz_io_dataIn_5_payload_6;
      _zz_io_dataIn_5_payload_8 <= _zz_io_dataIn_5_payload_7;
      _zz_io_dataIn_5_payload_9 <= _zz_io_dataIn_5_payload_8;
      _zz_io_expIn_5_4 <= _zz_io_dataIn_5_payload_5[7 : 0];
      _zz_io_expIn_5_5 <= _zz_io_expIn_5_4;
      _zz_io_expIn_5_6 <= _zz_io_expIn_5_5;
      _zz_io_expIn_5_7 <= _zz_io_expIn_5_6;
      io_tensorLoadValid_1_delay_1 <= io_tensorLoadValid_1;
      io_tensorLoadValid_1_delay_2 <= io_tensorLoadValid_1_delay_1;
      io_tensorLoadValid_1_delay_3 <= io_tensorLoadValid_1_delay_2;
      io_tensorLoadValid_1_delay_4 <= io_tensorLoadValid_1_delay_3;
      io_tensorLoadValid_1_delay_5 <= io_tensorLoadValid_1_delay_4;
      io_tensorLoadValid_1_delay_6 <= io_tensorLoadValid_1_delay_5;
      io_tensorLoadValid_1_delay_7 <= io_tensorLoadValid_1_delay_6;
      tensorDataValid_delay_1_1 <= tensorDataValid;
      tensorDataValid_delay_2_1 <= tensorDataValid_delay_1_1;
      tensorDataValid_delay_3_1 <= tensorDataValid_delay_2_1;
      tensorDataValid_delay_4_1 <= tensorDataValid_delay_3_1;
      tensorDataValid_delay_5_1 <= tensorDataValid_delay_4_1;
      tensorDataValid_delay_6_1 <= tensorDataValid_delay_5_1;
      tensorDataValid_delay_7_1 <= tensorDataValid_delay_6_1;
      _zz_io_dataIn_0_payload_11 <= _zz_io_dataIn_0_payload_10[87 : 8];
      _zz_io_dataIn_0_payload_12 <= _zz_io_dataIn_0_payload_11;
      _zz_io_dataIn_0_payload_13 <= _zz_io_dataIn_0_payload_12;
      _zz_io_dataIn_0_payload_14 <= _zz_io_dataIn_0_payload_13;
      _zz_io_expIn_0_8 <= _zz_io_dataIn_0_payload_10[7 : 0];
      _zz_io_expIn_0_9 <= _zz_io_expIn_0_8;
      _zz_io_expIn_0_10 <= _zz_io_expIn_0_9;
      _zz_io_expIn_0_11 <= _zz_io_expIn_0_10;
      _zz_io_dataIn_1_payload_11 <= _zz_io_dataIn_1_payload_10[87 : 8];
      _zz_io_dataIn_1_payload_12 <= _zz_io_dataIn_1_payload_11;
      _zz_io_dataIn_1_payload_13 <= _zz_io_dataIn_1_payload_12;
      _zz_io_dataIn_1_payload_14 <= _zz_io_dataIn_1_payload_13;
      _zz_io_expIn_1_8 <= _zz_io_dataIn_1_payload_10[7 : 0];
      _zz_io_expIn_1_9 <= _zz_io_expIn_1_8;
      _zz_io_expIn_1_10 <= _zz_io_expIn_1_9;
      _zz_io_expIn_1_11 <= _zz_io_expIn_1_10;
      _zz_io_dataIn_2_payload_11 <= _zz_io_dataIn_2_payload_10[87 : 8];
      _zz_io_dataIn_2_payload_12 <= _zz_io_dataIn_2_payload_11;
      _zz_io_dataIn_2_payload_13 <= _zz_io_dataIn_2_payload_12;
      _zz_io_dataIn_2_payload_14 <= _zz_io_dataIn_2_payload_13;
      _zz_io_expIn_2_8 <= _zz_io_dataIn_2_payload_10[7 : 0];
      _zz_io_expIn_2_9 <= _zz_io_expIn_2_8;
      _zz_io_expIn_2_10 <= _zz_io_expIn_2_9;
      _zz_io_expIn_2_11 <= _zz_io_expIn_2_10;
      _zz_io_dataIn_3_payload_11 <= _zz_io_dataIn_3_payload_10[87 : 8];
      _zz_io_dataIn_3_payload_12 <= _zz_io_dataIn_3_payload_11;
      _zz_io_dataIn_3_payload_13 <= _zz_io_dataIn_3_payload_12;
      _zz_io_dataIn_3_payload_14 <= _zz_io_dataIn_3_payload_13;
      _zz_io_expIn_3_8 <= _zz_io_dataIn_3_payload_10[7 : 0];
      _zz_io_expIn_3_9 <= _zz_io_expIn_3_8;
      _zz_io_expIn_3_10 <= _zz_io_expIn_3_9;
      _zz_io_expIn_3_11 <= _zz_io_expIn_3_10;
      _zz_io_dataIn_4_payload_11 <= _zz_io_dataIn_4_payload_10[87 : 8];
      _zz_io_dataIn_4_payload_12 <= _zz_io_dataIn_4_payload_11;
      _zz_io_dataIn_4_payload_13 <= _zz_io_dataIn_4_payload_12;
      _zz_io_dataIn_4_payload_14 <= _zz_io_dataIn_4_payload_13;
      _zz_io_expIn_4_8 <= _zz_io_dataIn_4_payload_10[7 : 0];
      _zz_io_expIn_4_9 <= _zz_io_expIn_4_8;
      _zz_io_expIn_4_10 <= _zz_io_expIn_4_9;
      _zz_io_expIn_4_11 <= _zz_io_expIn_4_10;
      _zz_io_dataIn_5_payload_11 <= _zz_io_dataIn_5_payload_10[87 : 8];
      _zz_io_dataIn_5_payload_12 <= _zz_io_dataIn_5_payload_11;
      _zz_io_dataIn_5_payload_13 <= _zz_io_dataIn_5_payload_12;
      _zz_io_dataIn_5_payload_14 <= _zz_io_dataIn_5_payload_13;
      _zz_io_expIn_5_8 <= _zz_io_dataIn_5_payload_10[7 : 0];
      _zz_io_expIn_5_9 <= _zz_io_expIn_5_8;
      _zz_io_expIn_5_10 <= _zz_io_expIn_5_9;
      _zz_io_expIn_5_11 <= _zz_io_expIn_5_10;
      io_tensorLoadValid_2_delay_1 <= io_tensorLoadValid_2;
      io_tensorLoadValid_2_delay_2 <= io_tensorLoadValid_2_delay_1;
      io_tensorLoadValid_2_delay_3 <= io_tensorLoadValid_2_delay_2;
      io_tensorLoadValid_2_delay_4 <= io_tensorLoadValid_2_delay_3;
      io_tensorLoadValid_2_delay_5 <= io_tensorLoadValid_2_delay_4;
      io_tensorLoadValid_2_delay_6 <= io_tensorLoadValid_2_delay_5;
      io_tensorLoadValid_2_delay_7 <= io_tensorLoadValid_2_delay_6;
      tensorDataValid_delay_1_2 <= tensorDataValid;
      tensorDataValid_delay_2_2 <= tensorDataValid_delay_1_2;
      tensorDataValid_delay_3_2 <= tensorDataValid_delay_2_2;
      tensorDataValid_delay_4_2 <= tensorDataValid_delay_3_2;
      tensorDataValid_delay_5_2 <= tensorDataValid_delay_4_2;
      tensorDataValid_delay_6_2 <= tensorDataValid_delay_5_2;
      tensorDataValid_delay_7_2 <= tensorDataValid_delay_6_2;
      _zz_io_dataIn_0_payload_16 <= _zz_io_dataIn_0_payload_15[87 : 8];
      _zz_io_dataIn_0_payload_17 <= _zz_io_dataIn_0_payload_16;
      _zz_io_dataIn_0_payload_18 <= _zz_io_dataIn_0_payload_17;
      _zz_io_dataIn_0_payload_19 <= _zz_io_dataIn_0_payload_18;
      _zz_io_expIn_0_12 <= _zz_io_dataIn_0_payload_15[7 : 0];
      _zz_io_expIn_0_13 <= _zz_io_expIn_0_12;
      _zz_io_expIn_0_14 <= _zz_io_expIn_0_13;
      _zz_io_expIn_0_15 <= _zz_io_expIn_0_14;
      _zz_io_dataIn_1_payload_16 <= _zz_io_dataIn_1_payload_15[87 : 8];
      _zz_io_dataIn_1_payload_17 <= _zz_io_dataIn_1_payload_16;
      _zz_io_dataIn_1_payload_18 <= _zz_io_dataIn_1_payload_17;
      _zz_io_dataIn_1_payload_19 <= _zz_io_dataIn_1_payload_18;
      _zz_io_expIn_1_12 <= _zz_io_dataIn_1_payload_15[7 : 0];
      _zz_io_expIn_1_13 <= _zz_io_expIn_1_12;
      _zz_io_expIn_1_14 <= _zz_io_expIn_1_13;
      _zz_io_expIn_1_15 <= _zz_io_expIn_1_14;
      _zz_io_dataIn_2_payload_16 <= _zz_io_dataIn_2_payload_15[87 : 8];
      _zz_io_dataIn_2_payload_17 <= _zz_io_dataIn_2_payload_16;
      _zz_io_dataIn_2_payload_18 <= _zz_io_dataIn_2_payload_17;
      _zz_io_dataIn_2_payload_19 <= _zz_io_dataIn_2_payload_18;
      _zz_io_expIn_2_12 <= _zz_io_dataIn_2_payload_15[7 : 0];
      _zz_io_expIn_2_13 <= _zz_io_expIn_2_12;
      _zz_io_expIn_2_14 <= _zz_io_expIn_2_13;
      _zz_io_expIn_2_15 <= _zz_io_expIn_2_14;
      _zz_io_dataIn_3_payload_16 <= _zz_io_dataIn_3_payload_15[87 : 8];
      _zz_io_dataIn_3_payload_17 <= _zz_io_dataIn_3_payload_16;
      _zz_io_dataIn_3_payload_18 <= _zz_io_dataIn_3_payload_17;
      _zz_io_dataIn_3_payload_19 <= _zz_io_dataIn_3_payload_18;
      _zz_io_expIn_3_12 <= _zz_io_dataIn_3_payload_15[7 : 0];
      _zz_io_expIn_3_13 <= _zz_io_expIn_3_12;
      _zz_io_expIn_3_14 <= _zz_io_expIn_3_13;
      _zz_io_expIn_3_15 <= _zz_io_expIn_3_14;
      _zz_io_dataIn_4_payload_16 <= _zz_io_dataIn_4_payload_15[87 : 8];
      _zz_io_dataIn_4_payload_17 <= _zz_io_dataIn_4_payload_16;
      _zz_io_dataIn_4_payload_18 <= _zz_io_dataIn_4_payload_17;
      _zz_io_dataIn_4_payload_19 <= _zz_io_dataIn_4_payload_18;
      _zz_io_expIn_4_12 <= _zz_io_dataIn_4_payload_15[7 : 0];
      _zz_io_expIn_4_13 <= _zz_io_expIn_4_12;
      _zz_io_expIn_4_14 <= _zz_io_expIn_4_13;
      _zz_io_expIn_4_15 <= _zz_io_expIn_4_14;
      _zz_io_dataIn_5_payload_16 <= _zz_io_dataIn_5_payload_15[87 : 8];
      _zz_io_dataIn_5_payload_17 <= _zz_io_dataIn_5_payload_16;
      _zz_io_dataIn_5_payload_18 <= _zz_io_dataIn_5_payload_17;
      _zz_io_dataIn_5_payload_19 <= _zz_io_dataIn_5_payload_18;
      _zz_io_expIn_5_12 <= _zz_io_dataIn_5_payload_15[7 : 0];
      _zz_io_expIn_5_13 <= _zz_io_expIn_5_12;
      _zz_io_expIn_5_14 <= _zz_io_expIn_5_13;
      _zz_io_expIn_5_15 <= _zz_io_expIn_5_14;
      io_tensorLoadValid_3_delay_1 <= io_tensorLoadValid_3;
      io_tensorLoadValid_3_delay_2 <= io_tensorLoadValid_3_delay_1;
      io_tensorLoadValid_3_delay_3 <= io_tensorLoadValid_3_delay_2;
      io_tensorLoadValid_3_delay_4 <= io_tensorLoadValid_3_delay_3;
      io_tensorLoadValid_3_delay_5 <= io_tensorLoadValid_3_delay_4;
      io_tensorLoadValid_3_delay_6 <= io_tensorLoadValid_3_delay_5;
      io_tensorLoadValid_3_delay_7 <= io_tensorLoadValid_3_delay_6;
      tensorDataValid_delay_1_3 <= tensorDataValid;
      tensorDataValid_delay_2_3 <= tensorDataValid_delay_1_3;
      tensorDataValid_delay_3_3 <= tensorDataValid_delay_2_3;
      tensorDataValid_delay_4_3 <= tensorDataValid_delay_3_3;
      tensorDataValid_delay_5_3 <= tensorDataValid_delay_4_3;
      tensorDataValid_delay_6_3 <= tensorDataValid_delay_5_3;
      tensorDataValid_delay_7_3 <= tensorDataValid_delay_6_3;
      _zz_io_dataIn_0_payload_21 <= _zz_io_dataIn_0_payload_20[87 : 8];
      _zz_io_dataIn_0_payload_22 <= _zz_io_dataIn_0_payload_21;
      _zz_io_dataIn_0_payload_23 <= _zz_io_dataIn_0_payload_22;
      _zz_io_dataIn_0_payload_24 <= _zz_io_dataIn_0_payload_23;
      _zz_io_expIn_0_16 <= _zz_io_dataIn_0_payload_20[7 : 0];
      _zz_io_expIn_0_17 <= _zz_io_expIn_0_16;
      _zz_io_expIn_0_18 <= _zz_io_expIn_0_17;
      _zz_io_expIn_0_19 <= _zz_io_expIn_0_18;
      _zz_io_dataIn_1_payload_21 <= _zz_io_dataIn_1_payload_20[87 : 8];
      _zz_io_dataIn_1_payload_22 <= _zz_io_dataIn_1_payload_21;
      _zz_io_dataIn_1_payload_23 <= _zz_io_dataIn_1_payload_22;
      _zz_io_dataIn_1_payload_24 <= _zz_io_dataIn_1_payload_23;
      _zz_io_expIn_1_16 <= _zz_io_dataIn_1_payload_20[7 : 0];
      _zz_io_expIn_1_17 <= _zz_io_expIn_1_16;
      _zz_io_expIn_1_18 <= _zz_io_expIn_1_17;
      _zz_io_expIn_1_19 <= _zz_io_expIn_1_18;
      _zz_io_dataIn_2_payload_21 <= _zz_io_dataIn_2_payload_20[87 : 8];
      _zz_io_dataIn_2_payload_22 <= _zz_io_dataIn_2_payload_21;
      _zz_io_dataIn_2_payload_23 <= _zz_io_dataIn_2_payload_22;
      _zz_io_dataIn_2_payload_24 <= _zz_io_dataIn_2_payload_23;
      _zz_io_expIn_2_16 <= _zz_io_dataIn_2_payload_20[7 : 0];
      _zz_io_expIn_2_17 <= _zz_io_expIn_2_16;
      _zz_io_expIn_2_18 <= _zz_io_expIn_2_17;
      _zz_io_expIn_2_19 <= _zz_io_expIn_2_18;
      _zz_io_dataIn_3_payload_21 <= _zz_io_dataIn_3_payload_20[87 : 8];
      _zz_io_dataIn_3_payload_22 <= _zz_io_dataIn_3_payload_21;
      _zz_io_dataIn_3_payload_23 <= _zz_io_dataIn_3_payload_22;
      _zz_io_dataIn_3_payload_24 <= _zz_io_dataIn_3_payload_23;
      _zz_io_expIn_3_16 <= _zz_io_dataIn_3_payload_20[7 : 0];
      _zz_io_expIn_3_17 <= _zz_io_expIn_3_16;
      _zz_io_expIn_3_18 <= _zz_io_expIn_3_17;
      _zz_io_expIn_3_19 <= _zz_io_expIn_3_18;
      _zz_io_dataIn_4_payload_21 <= _zz_io_dataIn_4_payload_20[87 : 8];
      _zz_io_dataIn_4_payload_22 <= _zz_io_dataIn_4_payload_21;
      _zz_io_dataIn_4_payload_23 <= _zz_io_dataIn_4_payload_22;
      _zz_io_dataIn_4_payload_24 <= _zz_io_dataIn_4_payload_23;
      _zz_io_expIn_4_16 <= _zz_io_dataIn_4_payload_20[7 : 0];
      _zz_io_expIn_4_17 <= _zz_io_expIn_4_16;
      _zz_io_expIn_4_18 <= _zz_io_expIn_4_17;
      _zz_io_expIn_4_19 <= _zz_io_expIn_4_18;
      _zz_io_dataIn_5_payload_21 <= _zz_io_dataIn_5_payload_20[87 : 8];
      _zz_io_dataIn_5_payload_22 <= _zz_io_dataIn_5_payload_21;
      _zz_io_dataIn_5_payload_23 <= _zz_io_dataIn_5_payload_22;
      _zz_io_dataIn_5_payload_24 <= _zz_io_dataIn_5_payload_23;
      _zz_io_expIn_5_16 <= _zz_io_dataIn_5_payload_20[7 : 0];
      _zz_io_expIn_5_17 <= _zz_io_expIn_5_16;
      _zz_io_expIn_5_18 <= _zz_io_expIn_5_17;
      _zz_io_expIn_5_19 <= _zz_io_expIn_5_18;
      io_tensorLoadValid_4_delay_1 <= io_tensorLoadValid_4;
      io_tensorLoadValid_4_delay_2 <= io_tensorLoadValid_4_delay_1;
      io_tensorLoadValid_4_delay_3 <= io_tensorLoadValid_4_delay_2;
      io_tensorLoadValid_4_delay_4 <= io_tensorLoadValid_4_delay_3;
      io_tensorLoadValid_4_delay_5 <= io_tensorLoadValid_4_delay_4;
      io_tensorLoadValid_4_delay_6 <= io_tensorLoadValid_4_delay_5;
      io_tensorLoadValid_4_delay_7 <= io_tensorLoadValid_4_delay_6;
      tensorDataValid_delay_1_4 <= tensorDataValid;
      tensorDataValid_delay_2_4 <= tensorDataValid_delay_1_4;
      tensorDataValid_delay_3_4 <= tensorDataValid_delay_2_4;
      tensorDataValid_delay_4_4 <= tensorDataValid_delay_3_4;
      tensorDataValid_delay_5_4 <= tensorDataValid_delay_4_4;
      tensorDataValid_delay_6_4 <= tensorDataValid_delay_5_4;
      tensorDataValid_delay_7_4 <= tensorDataValid_delay_6_4;
      _zz_io_dataIn_0_payload_26 <= _zz_io_dataIn_0_payload_25[87 : 8];
      _zz_io_dataIn_0_payload_27 <= _zz_io_dataIn_0_payload_26;
      _zz_io_dataIn_0_payload_28 <= _zz_io_dataIn_0_payload_27;
      _zz_io_dataIn_0_payload_29 <= _zz_io_dataIn_0_payload_28;
      _zz_io_expIn_0_20 <= _zz_io_dataIn_0_payload_25[7 : 0];
      _zz_io_expIn_0_21 <= _zz_io_expIn_0_20;
      _zz_io_expIn_0_22 <= _zz_io_expIn_0_21;
      _zz_io_expIn_0_23 <= _zz_io_expIn_0_22;
      _zz_io_dataIn_1_payload_26 <= _zz_io_dataIn_1_payload_25[87 : 8];
      _zz_io_dataIn_1_payload_27 <= _zz_io_dataIn_1_payload_26;
      _zz_io_dataIn_1_payload_28 <= _zz_io_dataIn_1_payload_27;
      _zz_io_dataIn_1_payload_29 <= _zz_io_dataIn_1_payload_28;
      _zz_io_expIn_1_20 <= _zz_io_dataIn_1_payload_25[7 : 0];
      _zz_io_expIn_1_21 <= _zz_io_expIn_1_20;
      _zz_io_expIn_1_22 <= _zz_io_expIn_1_21;
      _zz_io_expIn_1_23 <= _zz_io_expIn_1_22;
      _zz_io_dataIn_2_payload_26 <= _zz_io_dataIn_2_payload_25[87 : 8];
      _zz_io_dataIn_2_payload_27 <= _zz_io_dataIn_2_payload_26;
      _zz_io_dataIn_2_payload_28 <= _zz_io_dataIn_2_payload_27;
      _zz_io_dataIn_2_payload_29 <= _zz_io_dataIn_2_payload_28;
      _zz_io_expIn_2_20 <= _zz_io_dataIn_2_payload_25[7 : 0];
      _zz_io_expIn_2_21 <= _zz_io_expIn_2_20;
      _zz_io_expIn_2_22 <= _zz_io_expIn_2_21;
      _zz_io_expIn_2_23 <= _zz_io_expIn_2_22;
      _zz_io_dataIn_3_payload_26 <= _zz_io_dataIn_3_payload_25[87 : 8];
      _zz_io_dataIn_3_payload_27 <= _zz_io_dataIn_3_payload_26;
      _zz_io_dataIn_3_payload_28 <= _zz_io_dataIn_3_payload_27;
      _zz_io_dataIn_3_payload_29 <= _zz_io_dataIn_3_payload_28;
      _zz_io_expIn_3_20 <= _zz_io_dataIn_3_payload_25[7 : 0];
      _zz_io_expIn_3_21 <= _zz_io_expIn_3_20;
      _zz_io_expIn_3_22 <= _zz_io_expIn_3_21;
      _zz_io_expIn_3_23 <= _zz_io_expIn_3_22;
      _zz_io_dataIn_4_payload_26 <= _zz_io_dataIn_4_payload_25[87 : 8];
      _zz_io_dataIn_4_payload_27 <= _zz_io_dataIn_4_payload_26;
      _zz_io_dataIn_4_payload_28 <= _zz_io_dataIn_4_payload_27;
      _zz_io_dataIn_4_payload_29 <= _zz_io_dataIn_4_payload_28;
      _zz_io_expIn_4_20 <= _zz_io_dataIn_4_payload_25[7 : 0];
      _zz_io_expIn_4_21 <= _zz_io_expIn_4_20;
      _zz_io_expIn_4_22 <= _zz_io_expIn_4_21;
      _zz_io_expIn_4_23 <= _zz_io_expIn_4_22;
      _zz_io_dataIn_5_payload_26 <= _zz_io_dataIn_5_payload_25[87 : 8];
      _zz_io_dataIn_5_payload_27 <= _zz_io_dataIn_5_payload_26;
      _zz_io_dataIn_5_payload_28 <= _zz_io_dataIn_5_payload_27;
      _zz_io_dataIn_5_payload_29 <= _zz_io_dataIn_5_payload_28;
      _zz_io_expIn_5_20 <= _zz_io_dataIn_5_payload_25[7 : 0];
      _zz_io_expIn_5_21 <= _zz_io_expIn_5_20;
      _zz_io_expIn_5_22 <= _zz_io_expIn_5_21;
      _zz_io_expIn_5_23 <= _zz_io_expIn_5_22;
      io_tensorLoadValid_5_delay_1 <= io_tensorLoadValid_5;
      io_tensorLoadValid_5_delay_2 <= io_tensorLoadValid_5_delay_1;
      io_tensorLoadValid_5_delay_3 <= io_tensorLoadValid_5_delay_2;
      io_tensorLoadValid_5_delay_4 <= io_tensorLoadValid_5_delay_3;
      io_tensorLoadValid_5_delay_5 <= io_tensorLoadValid_5_delay_4;
      io_tensorLoadValid_5_delay_6 <= io_tensorLoadValid_5_delay_5;
      io_tensorLoadValid_5_delay_7 <= io_tensorLoadValid_5_delay_6;
      tensorDataValid_delay_1_5 <= tensorDataValid;
      tensorDataValid_delay_2_5 <= tensorDataValid_delay_1_5;
      tensorDataValid_delay_3_5 <= tensorDataValid_delay_2_5;
      tensorDataValid_delay_4_5 <= tensorDataValid_delay_3_5;
      tensorDataValid_delay_5_5 <= tensorDataValid_delay_4_5;
      tensorDataValid_delay_6_5 <= tensorDataValid_delay_5_5;
      tensorDataValid_delay_7_5 <= tensorDataValid_delay_6_5;
      _zz_io_dataIn_0_payload_31 <= _zz_io_dataIn_0_payload_30[87 : 8];
      _zz_io_dataIn_0_payload_32 <= _zz_io_dataIn_0_payload_31;
      _zz_io_dataIn_0_payload_33 <= _zz_io_dataIn_0_payload_32;
      _zz_io_dataIn_0_payload_34 <= _zz_io_dataIn_0_payload_33;
      _zz_io_expIn_0_24 <= _zz_io_dataIn_0_payload_30[7 : 0];
      _zz_io_expIn_0_25 <= _zz_io_expIn_0_24;
      _zz_io_expIn_0_26 <= _zz_io_expIn_0_25;
      _zz_io_expIn_0_27 <= _zz_io_expIn_0_26;
      _zz_io_dataIn_1_payload_31 <= _zz_io_dataIn_1_payload_30[87 : 8];
      _zz_io_dataIn_1_payload_32 <= _zz_io_dataIn_1_payload_31;
      _zz_io_dataIn_1_payload_33 <= _zz_io_dataIn_1_payload_32;
      _zz_io_dataIn_1_payload_34 <= _zz_io_dataIn_1_payload_33;
      _zz_io_expIn_1_24 <= _zz_io_dataIn_1_payload_30[7 : 0];
      _zz_io_expIn_1_25 <= _zz_io_expIn_1_24;
      _zz_io_expIn_1_26 <= _zz_io_expIn_1_25;
      _zz_io_expIn_1_27 <= _zz_io_expIn_1_26;
      _zz_io_dataIn_2_payload_31 <= _zz_io_dataIn_2_payload_30[87 : 8];
      _zz_io_dataIn_2_payload_32 <= _zz_io_dataIn_2_payload_31;
      _zz_io_dataIn_2_payload_33 <= _zz_io_dataIn_2_payload_32;
      _zz_io_dataIn_2_payload_34 <= _zz_io_dataIn_2_payload_33;
      _zz_io_expIn_2_24 <= _zz_io_dataIn_2_payload_30[7 : 0];
      _zz_io_expIn_2_25 <= _zz_io_expIn_2_24;
      _zz_io_expIn_2_26 <= _zz_io_expIn_2_25;
      _zz_io_expIn_2_27 <= _zz_io_expIn_2_26;
      _zz_io_dataIn_3_payload_31 <= _zz_io_dataIn_3_payload_30[87 : 8];
      _zz_io_dataIn_3_payload_32 <= _zz_io_dataIn_3_payload_31;
      _zz_io_dataIn_3_payload_33 <= _zz_io_dataIn_3_payload_32;
      _zz_io_dataIn_3_payload_34 <= _zz_io_dataIn_3_payload_33;
      _zz_io_expIn_3_24 <= _zz_io_dataIn_3_payload_30[7 : 0];
      _zz_io_expIn_3_25 <= _zz_io_expIn_3_24;
      _zz_io_expIn_3_26 <= _zz_io_expIn_3_25;
      _zz_io_expIn_3_27 <= _zz_io_expIn_3_26;
      _zz_io_dataIn_4_payload_31 <= _zz_io_dataIn_4_payload_30[87 : 8];
      _zz_io_dataIn_4_payload_32 <= _zz_io_dataIn_4_payload_31;
      _zz_io_dataIn_4_payload_33 <= _zz_io_dataIn_4_payload_32;
      _zz_io_dataIn_4_payload_34 <= _zz_io_dataIn_4_payload_33;
      _zz_io_expIn_4_24 <= _zz_io_dataIn_4_payload_30[7 : 0];
      _zz_io_expIn_4_25 <= _zz_io_expIn_4_24;
      _zz_io_expIn_4_26 <= _zz_io_expIn_4_25;
      _zz_io_expIn_4_27 <= _zz_io_expIn_4_26;
      _zz_io_dataIn_5_payload_31 <= _zz_io_dataIn_5_payload_30[87 : 8];
      _zz_io_dataIn_5_payload_32 <= _zz_io_dataIn_5_payload_31;
      _zz_io_dataIn_5_payload_33 <= _zz_io_dataIn_5_payload_32;
      _zz_io_dataIn_5_payload_34 <= _zz_io_dataIn_5_payload_33;
      _zz_io_expIn_5_24 <= _zz_io_dataIn_5_payload_30[7 : 0];
      _zz_io_expIn_5_25 <= _zz_io_expIn_5_24;
      _zz_io_expIn_5_26 <= _zz_io_expIn_5_25;
      _zz_io_expIn_5_27 <= _zz_io_expIn_5_26;
      io_tensorLoadValid_6_delay_1 <= io_tensorLoadValid_6;
      io_tensorLoadValid_6_delay_2 <= io_tensorLoadValid_6_delay_1;
      io_tensorLoadValid_6_delay_3 <= io_tensorLoadValid_6_delay_2;
      io_tensorLoadValid_6_delay_4 <= io_tensorLoadValid_6_delay_3;
      io_tensorLoadValid_6_delay_5 <= io_tensorLoadValid_6_delay_4;
      io_tensorLoadValid_6_delay_6 <= io_tensorLoadValid_6_delay_5;
      io_tensorLoadValid_6_delay_7 <= io_tensorLoadValid_6_delay_6;
      tensorDataValid_delay_1_6 <= tensorDataValid;
      tensorDataValid_delay_2_6 <= tensorDataValid_delay_1_6;
      tensorDataValid_delay_3_6 <= tensorDataValid_delay_2_6;
      tensorDataValid_delay_4_6 <= tensorDataValid_delay_3_6;
      tensorDataValid_delay_5_6 <= tensorDataValid_delay_4_6;
      tensorDataValid_delay_6_6 <= tensorDataValid_delay_5_6;
      tensorDataValid_delay_7_6 <= tensorDataValid_delay_6_6;
      _zz_io_dataIn_0_payload_36 <= _zz_io_dataIn_0_payload_35[87 : 8];
      _zz_io_dataIn_0_payload_37 <= _zz_io_dataIn_0_payload_36;
      _zz_io_dataIn_0_payload_38 <= _zz_io_dataIn_0_payload_37;
      _zz_io_dataIn_0_payload_39 <= _zz_io_dataIn_0_payload_38;
      _zz_io_expIn_0_28 <= _zz_io_dataIn_0_payload_35[7 : 0];
      _zz_io_expIn_0_29 <= _zz_io_expIn_0_28;
      _zz_io_expIn_0_30 <= _zz_io_expIn_0_29;
      _zz_io_expIn_0_31 <= _zz_io_expIn_0_30;
      _zz_io_dataIn_1_payload_36 <= _zz_io_dataIn_1_payload_35[87 : 8];
      _zz_io_dataIn_1_payload_37 <= _zz_io_dataIn_1_payload_36;
      _zz_io_dataIn_1_payload_38 <= _zz_io_dataIn_1_payload_37;
      _zz_io_dataIn_1_payload_39 <= _zz_io_dataIn_1_payload_38;
      _zz_io_expIn_1_28 <= _zz_io_dataIn_1_payload_35[7 : 0];
      _zz_io_expIn_1_29 <= _zz_io_expIn_1_28;
      _zz_io_expIn_1_30 <= _zz_io_expIn_1_29;
      _zz_io_expIn_1_31 <= _zz_io_expIn_1_30;
      _zz_io_dataIn_2_payload_36 <= _zz_io_dataIn_2_payload_35[87 : 8];
      _zz_io_dataIn_2_payload_37 <= _zz_io_dataIn_2_payload_36;
      _zz_io_dataIn_2_payload_38 <= _zz_io_dataIn_2_payload_37;
      _zz_io_dataIn_2_payload_39 <= _zz_io_dataIn_2_payload_38;
      _zz_io_expIn_2_28 <= _zz_io_dataIn_2_payload_35[7 : 0];
      _zz_io_expIn_2_29 <= _zz_io_expIn_2_28;
      _zz_io_expIn_2_30 <= _zz_io_expIn_2_29;
      _zz_io_expIn_2_31 <= _zz_io_expIn_2_30;
      _zz_io_dataIn_3_payload_36 <= _zz_io_dataIn_3_payload_35[87 : 8];
      _zz_io_dataIn_3_payload_37 <= _zz_io_dataIn_3_payload_36;
      _zz_io_dataIn_3_payload_38 <= _zz_io_dataIn_3_payload_37;
      _zz_io_dataIn_3_payload_39 <= _zz_io_dataIn_3_payload_38;
      _zz_io_expIn_3_28 <= _zz_io_dataIn_3_payload_35[7 : 0];
      _zz_io_expIn_3_29 <= _zz_io_expIn_3_28;
      _zz_io_expIn_3_30 <= _zz_io_expIn_3_29;
      _zz_io_expIn_3_31 <= _zz_io_expIn_3_30;
      _zz_io_dataIn_4_payload_36 <= _zz_io_dataIn_4_payload_35[87 : 8];
      _zz_io_dataIn_4_payload_37 <= _zz_io_dataIn_4_payload_36;
      _zz_io_dataIn_4_payload_38 <= _zz_io_dataIn_4_payload_37;
      _zz_io_dataIn_4_payload_39 <= _zz_io_dataIn_4_payload_38;
      _zz_io_expIn_4_28 <= _zz_io_dataIn_4_payload_35[7 : 0];
      _zz_io_expIn_4_29 <= _zz_io_expIn_4_28;
      _zz_io_expIn_4_30 <= _zz_io_expIn_4_29;
      _zz_io_expIn_4_31 <= _zz_io_expIn_4_30;
      _zz_io_dataIn_5_payload_36 <= _zz_io_dataIn_5_payload_35[87 : 8];
      _zz_io_dataIn_5_payload_37 <= _zz_io_dataIn_5_payload_36;
      _zz_io_dataIn_5_payload_38 <= _zz_io_dataIn_5_payload_37;
      _zz_io_dataIn_5_payload_39 <= _zz_io_dataIn_5_payload_38;
      _zz_io_expIn_5_28 <= _zz_io_dataIn_5_payload_35[7 : 0];
      _zz_io_expIn_5_29 <= _zz_io_expIn_5_28;
      _zz_io_expIn_5_30 <= _zz_io_expIn_5_29;
      _zz_io_expIn_5_31 <= _zz_io_expIn_5_30;
      io_tensorLoadValid_7_delay_1 <= io_tensorLoadValid_7;
      io_tensorLoadValid_7_delay_2 <= io_tensorLoadValid_7_delay_1;
      io_tensorLoadValid_7_delay_3 <= io_tensorLoadValid_7_delay_2;
      io_tensorLoadValid_7_delay_4 <= io_tensorLoadValid_7_delay_3;
      io_tensorLoadValid_7_delay_5 <= io_tensorLoadValid_7_delay_4;
      io_tensorLoadValid_7_delay_6 <= io_tensorLoadValid_7_delay_5;
      io_tensorLoadValid_7_delay_7 <= io_tensorLoadValid_7_delay_6;
      tensorDataValid_delay_1_7 <= tensorDataValid;
      tensorDataValid_delay_2_7 <= tensorDataValid_delay_1_7;
      tensorDataValid_delay_3_7 <= tensorDataValid_delay_2_7;
      tensorDataValid_delay_4_7 <= tensorDataValid_delay_3_7;
      tensorDataValid_delay_5_7 <= tensorDataValid_delay_4_7;
      tensorDataValid_delay_6_7 <= tensorDataValid_delay_5_7;
      tensorDataValid_delay_7_7 <= tensorDataValid_delay_6_7;
      _zz_io_dataIn_0_payload_41 <= _zz_io_dataIn_0_payload_40[87 : 8];
      _zz_io_dataIn_0_payload_42 <= _zz_io_dataIn_0_payload_41;
      _zz_io_dataIn_0_payload_43 <= _zz_io_dataIn_0_payload_42;
      _zz_io_dataIn_0_payload_44 <= _zz_io_dataIn_0_payload_43;
      _zz_io_expIn_0_32 <= _zz_io_dataIn_0_payload_40[7 : 0];
      _zz_io_expIn_0_33 <= _zz_io_expIn_0_32;
      _zz_io_expIn_0_34 <= _zz_io_expIn_0_33;
      _zz_io_expIn_0_35 <= _zz_io_expIn_0_34;
      _zz_io_dataIn_1_payload_41 <= _zz_io_dataIn_1_payload_40[87 : 8];
      _zz_io_dataIn_1_payload_42 <= _zz_io_dataIn_1_payload_41;
      _zz_io_dataIn_1_payload_43 <= _zz_io_dataIn_1_payload_42;
      _zz_io_dataIn_1_payload_44 <= _zz_io_dataIn_1_payload_43;
      _zz_io_expIn_1_32 <= _zz_io_dataIn_1_payload_40[7 : 0];
      _zz_io_expIn_1_33 <= _zz_io_expIn_1_32;
      _zz_io_expIn_1_34 <= _zz_io_expIn_1_33;
      _zz_io_expIn_1_35 <= _zz_io_expIn_1_34;
      _zz_io_dataIn_2_payload_41 <= _zz_io_dataIn_2_payload_40[87 : 8];
      _zz_io_dataIn_2_payload_42 <= _zz_io_dataIn_2_payload_41;
      _zz_io_dataIn_2_payload_43 <= _zz_io_dataIn_2_payload_42;
      _zz_io_dataIn_2_payload_44 <= _zz_io_dataIn_2_payload_43;
      _zz_io_expIn_2_32 <= _zz_io_dataIn_2_payload_40[7 : 0];
      _zz_io_expIn_2_33 <= _zz_io_expIn_2_32;
      _zz_io_expIn_2_34 <= _zz_io_expIn_2_33;
      _zz_io_expIn_2_35 <= _zz_io_expIn_2_34;
      _zz_io_dataIn_3_payload_41 <= _zz_io_dataIn_3_payload_40[87 : 8];
      _zz_io_dataIn_3_payload_42 <= _zz_io_dataIn_3_payload_41;
      _zz_io_dataIn_3_payload_43 <= _zz_io_dataIn_3_payload_42;
      _zz_io_dataIn_3_payload_44 <= _zz_io_dataIn_3_payload_43;
      _zz_io_expIn_3_32 <= _zz_io_dataIn_3_payload_40[7 : 0];
      _zz_io_expIn_3_33 <= _zz_io_expIn_3_32;
      _zz_io_expIn_3_34 <= _zz_io_expIn_3_33;
      _zz_io_expIn_3_35 <= _zz_io_expIn_3_34;
      _zz_io_dataIn_4_payload_41 <= _zz_io_dataIn_4_payload_40[87 : 8];
      _zz_io_dataIn_4_payload_42 <= _zz_io_dataIn_4_payload_41;
      _zz_io_dataIn_4_payload_43 <= _zz_io_dataIn_4_payload_42;
      _zz_io_dataIn_4_payload_44 <= _zz_io_dataIn_4_payload_43;
      _zz_io_expIn_4_32 <= _zz_io_dataIn_4_payload_40[7 : 0];
      _zz_io_expIn_4_33 <= _zz_io_expIn_4_32;
      _zz_io_expIn_4_34 <= _zz_io_expIn_4_33;
      _zz_io_expIn_4_35 <= _zz_io_expIn_4_34;
      _zz_io_dataIn_5_payload_41 <= _zz_io_dataIn_5_payload_40[87 : 8];
      _zz_io_dataIn_5_payload_42 <= _zz_io_dataIn_5_payload_41;
      _zz_io_dataIn_5_payload_43 <= _zz_io_dataIn_5_payload_42;
      _zz_io_dataIn_5_payload_44 <= _zz_io_dataIn_5_payload_43;
      _zz_io_expIn_5_32 <= _zz_io_dataIn_5_payload_40[7 : 0];
      _zz_io_expIn_5_33 <= _zz_io_expIn_5_32;
      _zz_io_expIn_5_34 <= _zz_io_expIn_5_33;
      _zz_io_expIn_5_35 <= _zz_io_expIn_5_34;
      io_tensorLoadValid_8_delay_1 <= io_tensorLoadValid_8;
      io_tensorLoadValid_8_delay_2 <= io_tensorLoadValid_8_delay_1;
      io_tensorLoadValid_8_delay_3 <= io_tensorLoadValid_8_delay_2;
      io_tensorLoadValid_8_delay_4 <= io_tensorLoadValid_8_delay_3;
      io_tensorLoadValid_8_delay_5 <= io_tensorLoadValid_8_delay_4;
      io_tensorLoadValid_8_delay_6 <= io_tensorLoadValid_8_delay_5;
      io_tensorLoadValid_8_delay_7 <= io_tensorLoadValid_8_delay_6;
      tensorDataValid_delay_1_8 <= tensorDataValid;
      tensorDataValid_delay_2_8 <= tensorDataValid_delay_1_8;
      tensorDataValid_delay_3_8 <= tensorDataValid_delay_2_8;
      tensorDataValid_delay_4_8 <= tensorDataValid_delay_3_8;
      tensorDataValid_delay_5_8 <= tensorDataValid_delay_4_8;
      tensorDataValid_delay_6_8 <= tensorDataValid_delay_5_8;
      tensorDataValid_delay_7_8 <= tensorDataValid_delay_6_8;
      _zz_io_dataIn_0_payload_46 <= _zz_io_dataIn_0_payload_45[87 : 8];
      _zz_io_dataIn_0_payload_47 <= _zz_io_dataIn_0_payload_46;
      _zz_io_dataIn_0_payload_48 <= _zz_io_dataIn_0_payload_47;
      _zz_io_dataIn_0_payload_49 <= _zz_io_dataIn_0_payload_48;
      _zz_io_expIn_0_36 <= _zz_io_dataIn_0_payload_45[7 : 0];
      _zz_io_expIn_0_37 <= _zz_io_expIn_0_36;
      _zz_io_expIn_0_38 <= _zz_io_expIn_0_37;
      _zz_io_expIn_0_39 <= _zz_io_expIn_0_38;
      _zz_io_dataIn_1_payload_46 <= _zz_io_dataIn_1_payload_45[87 : 8];
      _zz_io_dataIn_1_payload_47 <= _zz_io_dataIn_1_payload_46;
      _zz_io_dataIn_1_payload_48 <= _zz_io_dataIn_1_payload_47;
      _zz_io_dataIn_1_payload_49 <= _zz_io_dataIn_1_payload_48;
      _zz_io_expIn_1_36 <= _zz_io_dataIn_1_payload_45[7 : 0];
      _zz_io_expIn_1_37 <= _zz_io_expIn_1_36;
      _zz_io_expIn_1_38 <= _zz_io_expIn_1_37;
      _zz_io_expIn_1_39 <= _zz_io_expIn_1_38;
      _zz_io_dataIn_2_payload_46 <= _zz_io_dataIn_2_payload_45[87 : 8];
      _zz_io_dataIn_2_payload_47 <= _zz_io_dataIn_2_payload_46;
      _zz_io_dataIn_2_payload_48 <= _zz_io_dataIn_2_payload_47;
      _zz_io_dataIn_2_payload_49 <= _zz_io_dataIn_2_payload_48;
      _zz_io_expIn_2_36 <= _zz_io_dataIn_2_payload_45[7 : 0];
      _zz_io_expIn_2_37 <= _zz_io_expIn_2_36;
      _zz_io_expIn_2_38 <= _zz_io_expIn_2_37;
      _zz_io_expIn_2_39 <= _zz_io_expIn_2_38;
      _zz_io_dataIn_3_payload_46 <= _zz_io_dataIn_3_payload_45[87 : 8];
      _zz_io_dataIn_3_payload_47 <= _zz_io_dataIn_3_payload_46;
      _zz_io_dataIn_3_payload_48 <= _zz_io_dataIn_3_payload_47;
      _zz_io_dataIn_3_payload_49 <= _zz_io_dataIn_3_payload_48;
      _zz_io_expIn_3_36 <= _zz_io_dataIn_3_payload_45[7 : 0];
      _zz_io_expIn_3_37 <= _zz_io_expIn_3_36;
      _zz_io_expIn_3_38 <= _zz_io_expIn_3_37;
      _zz_io_expIn_3_39 <= _zz_io_expIn_3_38;
      _zz_io_dataIn_4_payload_46 <= _zz_io_dataIn_4_payload_45[87 : 8];
      _zz_io_dataIn_4_payload_47 <= _zz_io_dataIn_4_payload_46;
      _zz_io_dataIn_4_payload_48 <= _zz_io_dataIn_4_payload_47;
      _zz_io_dataIn_4_payload_49 <= _zz_io_dataIn_4_payload_48;
      _zz_io_expIn_4_36 <= _zz_io_dataIn_4_payload_45[7 : 0];
      _zz_io_expIn_4_37 <= _zz_io_expIn_4_36;
      _zz_io_expIn_4_38 <= _zz_io_expIn_4_37;
      _zz_io_expIn_4_39 <= _zz_io_expIn_4_38;
      _zz_io_dataIn_5_payload_46 <= _zz_io_dataIn_5_payload_45[87 : 8];
      _zz_io_dataIn_5_payload_47 <= _zz_io_dataIn_5_payload_46;
      _zz_io_dataIn_5_payload_48 <= _zz_io_dataIn_5_payload_47;
      _zz_io_dataIn_5_payload_49 <= _zz_io_dataIn_5_payload_48;
      _zz_io_expIn_5_36 <= _zz_io_dataIn_5_payload_45[7 : 0];
      _zz_io_expIn_5_37 <= _zz_io_expIn_5_36;
      _zz_io_expIn_5_38 <= _zz_io_expIn_5_37;
      _zz_io_expIn_5_39 <= _zz_io_expIn_5_38;
      io_tensorLoadValid_9_delay_1 <= io_tensorLoadValid_9;
      io_tensorLoadValid_9_delay_2 <= io_tensorLoadValid_9_delay_1;
      io_tensorLoadValid_9_delay_3 <= io_tensorLoadValid_9_delay_2;
      io_tensorLoadValid_9_delay_4 <= io_tensorLoadValid_9_delay_3;
      io_tensorLoadValid_9_delay_5 <= io_tensorLoadValid_9_delay_4;
      io_tensorLoadValid_9_delay_6 <= io_tensorLoadValid_9_delay_5;
      io_tensorLoadValid_9_delay_7 <= io_tensorLoadValid_9_delay_6;
      tensorDataValid_delay_1_9 <= tensorDataValid;
      tensorDataValid_delay_2_9 <= tensorDataValid_delay_1_9;
      tensorDataValid_delay_3_9 <= tensorDataValid_delay_2_9;
      tensorDataValid_delay_4_9 <= tensorDataValid_delay_3_9;
      tensorDataValid_delay_5_9 <= tensorDataValid_delay_4_9;
      tensorDataValid_delay_6_9 <= tensorDataValid_delay_5_9;
      tensorDataValid_delay_7_9 <= tensorDataValid_delay_6_9;
      _zz_io_dataIn_0_payload_51 <= _zz_io_dataIn_0_payload_50[87 : 8];
      _zz_io_dataIn_0_payload_52 <= _zz_io_dataIn_0_payload_51;
      _zz_io_dataIn_0_payload_53 <= _zz_io_dataIn_0_payload_52;
      _zz_io_dataIn_0_payload_54 <= _zz_io_dataIn_0_payload_53;
      _zz_io_expIn_0_40 <= _zz_io_dataIn_0_payload_50[7 : 0];
      _zz_io_expIn_0_41 <= _zz_io_expIn_0_40;
      _zz_io_expIn_0_42 <= _zz_io_expIn_0_41;
      _zz_io_expIn_0_43 <= _zz_io_expIn_0_42;
      _zz_io_dataIn_1_payload_51 <= _zz_io_dataIn_1_payload_50[87 : 8];
      _zz_io_dataIn_1_payload_52 <= _zz_io_dataIn_1_payload_51;
      _zz_io_dataIn_1_payload_53 <= _zz_io_dataIn_1_payload_52;
      _zz_io_dataIn_1_payload_54 <= _zz_io_dataIn_1_payload_53;
      _zz_io_expIn_1_40 <= _zz_io_dataIn_1_payload_50[7 : 0];
      _zz_io_expIn_1_41 <= _zz_io_expIn_1_40;
      _zz_io_expIn_1_42 <= _zz_io_expIn_1_41;
      _zz_io_expIn_1_43 <= _zz_io_expIn_1_42;
      _zz_io_dataIn_2_payload_51 <= _zz_io_dataIn_2_payload_50[87 : 8];
      _zz_io_dataIn_2_payload_52 <= _zz_io_dataIn_2_payload_51;
      _zz_io_dataIn_2_payload_53 <= _zz_io_dataIn_2_payload_52;
      _zz_io_dataIn_2_payload_54 <= _zz_io_dataIn_2_payload_53;
      _zz_io_expIn_2_40 <= _zz_io_dataIn_2_payload_50[7 : 0];
      _zz_io_expIn_2_41 <= _zz_io_expIn_2_40;
      _zz_io_expIn_2_42 <= _zz_io_expIn_2_41;
      _zz_io_expIn_2_43 <= _zz_io_expIn_2_42;
      _zz_io_dataIn_3_payload_51 <= _zz_io_dataIn_3_payload_50[87 : 8];
      _zz_io_dataIn_3_payload_52 <= _zz_io_dataIn_3_payload_51;
      _zz_io_dataIn_3_payload_53 <= _zz_io_dataIn_3_payload_52;
      _zz_io_dataIn_3_payload_54 <= _zz_io_dataIn_3_payload_53;
      _zz_io_expIn_3_40 <= _zz_io_dataIn_3_payload_50[7 : 0];
      _zz_io_expIn_3_41 <= _zz_io_expIn_3_40;
      _zz_io_expIn_3_42 <= _zz_io_expIn_3_41;
      _zz_io_expIn_3_43 <= _zz_io_expIn_3_42;
      _zz_io_dataIn_4_payload_51 <= _zz_io_dataIn_4_payload_50[87 : 8];
      _zz_io_dataIn_4_payload_52 <= _zz_io_dataIn_4_payload_51;
      _zz_io_dataIn_4_payload_53 <= _zz_io_dataIn_4_payload_52;
      _zz_io_dataIn_4_payload_54 <= _zz_io_dataIn_4_payload_53;
      _zz_io_expIn_4_40 <= _zz_io_dataIn_4_payload_50[7 : 0];
      _zz_io_expIn_4_41 <= _zz_io_expIn_4_40;
      _zz_io_expIn_4_42 <= _zz_io_expIn_4_41;
      _zz_io_expIn_4_43 <= _zz_io_expIn_4_42;
      _zz_io_dataIn_5_payload_51 <= _zz_io_dataIn_5_payload_50[87 : 8];
      _zz_io_dataIn_5_payload_52 <= _zz_io_dataIn_5_payload_51;
      _zz_io_dataIn_5_payload_53 <= _zz_io_dataIn_5_payload_52;
      _zz_io_dataIn_5_payload_54 <= _zz_io_dataIn_5_payload_53;
      _zz_io_expIn_5_40 <= _zz_io_dataIn_5_payload_50[7 : 0];
      _zz_io_expIn_5_41 <= _zz_io_expIn_5_40;
      _zz_io_expIn_5_42 <= _zz_io_expIn_5_41;
      _zz_io_expIn_5_43 <= _zz_io_expIn_5_42;
      io_tensorLoadValid_10_delay_1 <= io_tensorLoadValid_10;
      io_tensorLoadValid_10_delay_2 <= io_tensorLoadValid_10_delay_1;
      io_tensorLoadValid_10_delay_3 <= io_tensorLoadValid_10_delay_2;
      io_tensorLoadValid_10_delay_4 <= io_tensorLoadValid_10_delay_3;
      io_tensorLoadValid_10_delay_5 <= io_tensorLoadValid_10_delay_4;
      io_tensorLoadValid_10_delay_6 <= io_tensorLoadValid_10_delay_5;
      io_tensorLoadValid_10_delay_7 <= io_tensorLoadValid_10_delay_6;
      tensorDataValid_delay_1_10 <= tensorDataValid;
      tensorDataValid_delay_2_10 <= tensorDataValid_delay_1_10;
      tensorDataValid_delay_3_10 <= tensorDataValid_delay_2_10;
      tensorDataValid_delay_4_10 <= tensorDataValid_delay_3_10;
      tensorDataValid_delay_5_10 <= tensorDataValid_delay_4_10;
      tensorDataValid_delay_6_10 <= tensorDataValid_delay_5_10;
      tensorDataValid_delay_7_10 <= tensorDataValid_delay_6_10;
      _zz_io_dataIn_0_payload_56 <= _zz_io_dataIn_0_payload_55[87 : 8];
      _zz_io_dataIn_0_payload_57 <= _zz_io_dataIn_0_payload_56;
      _zz_io_dataIn_0_payload_58 <= _zz_io_dataIn_0_payload_57;
      _zz_io_dataIn_0_payload_59 <= _zz_io_dataIn_0_payload_58;
      _zz_io_expIn_0_44 <= _zz_io_dataIn_0_payload_55[7 : 0];
      _zz_io_expIn_0_45 <= _zz_io_expIn_0_44;
      _zz_io_expIn_0_46 <= _zz_io_expIn_0_45;
      _zz_io_expIn_0_47 <= _zz_io_expIn_0_46;
      _zz_io_dataIn_1_payload_56 <= _zz_io_dataIn_1_payload_55[87 : 8];
      _zz_io_dataIn_1_payload_57 <= _zz_io_dataIn_1_payload_56;
      _zz_io_dataIn_1_payload_58 <= _zz_io_dataIn_1_payload_57;
      _zz_io_dataIn_1_payload_59 <= _zz_io_dataIn_1_payload_58;
      _zz_io_expIn_1_44 <= _zz_io_dataIn_1_payload_55[7 : 0];
      _zz_io_expIn_1_45 <= _zz_io_expIn_1_44;
      _zz_io_expIn_1_46 <= _zz_io_expIn_1_45;
      _zz_io_expIn_1_47 <= _zz_io_expIn_1_46;
      _zz_io_dataIn_2_payload_56 <= _zz_io_dataIn_2_payload_55[87 : 8];
      _zz_io_dataIn_2_payload_57 <= _zz_io_dataIn_2_payload_56;
      _zz_io_dataIn_2_payload_58 <= _zz_io_dataIn_2_payload_57;
      _zz_io_dataIn_2_payload_59 <= _zz_io_dataIn_2_payload_58;
      _zz_io_expIn_2_44 <= _zz_io_dataIn_2_payload_55[7 : 0];
      _zz_io_expIn_2_45 <= _zz_io_expIn_2_44;
      _zz_io_expIn_2_46 <= _zz_io_expIn_2_45;
      _zz_io_expIn_2_47 <= _zz_io_expIn_2_46;
      _zz_io_dataIn_3_payload_56 <= _zz_io_dataIn_3_payload_55[87 : 8];
      _zz_io_dataIn_3_payload_57 <= _zz_io_dataIn_3_payload_56;
      _zz_io_dataIn_3_payload_58 <= _zz_io_dataIn_3_payload_57;
      _zz_io_dataIn_3_payload_59 <= _zz_io_dataIn_3_payload_58;
      _zz_io_expIn_3_44 <= _zz_io_dataIn_3_payload_55[7 : 0];
      _zz_io_expIn_3_45 <= _zz_io_expIn_3_44;
      _zz_io_expIn_3_46 <= _zz_io_expIn_3_45;
      _zz_io_expIn_3_47 <= _zz_io_expIn_3_46;
      _zz_io_dataIn_4_payload_56 <= _zz_io_dataIn_4_payload_55[87 : 8];
      _zz_io_dataIn_4_payload_57 <= _zz_io_dataIn_4_payload_56;
      _zz_io_dataIn_4_payload_58 <= _zz_io_dataIn_4_payload_57;
      _zz_io_dataIn_4_payload_59 <= _zz_io_dataIn_4_payload_58;
      _zz_io_expIn_4_44 <= _zz_io_dataIn_4_payload_55[7 : 0];
      _zz_io_expIn_4_45 <= _zz_io_expIn_4_44;
      _zz_io_expIn_4_46 <= _zz_io_expIn_4_45;
      _zz_io_expIn_4_47 <= _zz_io_expIn_4_46;
      _zz_io_dataIn_5_payload_56 <= _zz_io_dataIn_5_payload_55[87 : 8];
      _zz_io_dataIn_5_payload_57 <= _zz_io_dataIn_5_payload_56;
      _zz_io_dataIn_5_payload_58 <= _zz_io_dataIn_5_payload_57;
      _zz_io_dataIn_5_payload_59 <= _zz_io_dataIn_5_payload_58;
      _zz_io_expIn_5_44 <= _zz_io_dataIn_5_payload_55[7 : 0];
      _zz_io_expIn_5_45 <= _zz_io_expIn_5_44;
      _zz_io_expIn_5_46 <= _zz_io_expIn_5_45;
      _zz_io_expIn_5_47 <= _zz_io_expIn_5_46;
      io_tensorLoadValid_11_delay_1 <= io_tensorLoadValid_11;
      io_tensorLoadValid_11_delay_2 <= io_tensorLoadValid_11_delay_1;
      io_tensorLoadValid_11_delay_3 <= io_tensorLoadValid_11_delay_2;
      io_tensorLoadValid_11_delay_4 <= io_tensorLoadValid_11_delay_3;
      io_tensorLoadValid_11_delay_5 <= io_tensorLoadValid_11_delay_4;
      io_tensorLoadValid_11_delay_6 <= io_tensorLoadValid_11_delay_5;
      io_tensorLoadValid_11_delay_7 <= io_tensorLoadValid_11_delay_6;
      tensorDataValid_delay_1_11 <= tensorDataValid;
      tensorDataValid_delay_2_11 <= tensorDataValid_delay_1_11;
      tensorDataValid_delay_3_11 <= tensorDataValid_delay_2_11;
      tensorDataValid_delay_4_11 <= tensorDataValid_delay_3_11;
      tensorDataValid_delay_5_11 <= tensorDataValid_delay_4_11;
      tensorDataValid_delay_6_11 <= tensorDataValid_delay_5_11;
      tensorDataValid_delay_7_11 <= tensorDataValid_delay_6_11;
      _zz_io_dataIn_0_payload_61 <= _zz_io_dataIn_0_payload_60[87 : 8];
      _zz_io_dataIn_0_payload_62 <= _zz_io_dataIn_0_payload_61;
      _zz_io_dataIn_0_payload_63 <= _zz_io_dataIn_0_payload_62;
      _zz_io_dataIn_0_payload_64 <= _zz_io_dataIn_0_payload_63;
      _zz_io_expIn_0_48 <= _zz_io_dataIn_0_payload_60[7 : 0];
      _zz_io_expIn_0_49 <= _zz_io_expIn_0_48;
      _zz_io_expIn_0_50 <= _zz_io_expIn_0_49;
      _zz_io_expIn_0_51 <= _zz_io_expIn_0_50;
      _zz_io_dataIn_1_payload_61 <= _zz_io_dataIn_1_payload_60[87 : 8];
      _zz_io_dataIn_1_payload_62 <= _zz_io_dataIn_1_payload_61;
      _zz_io_dataIn_1_payload_63 <= _zz_io_dataIn_1_payload_62;
      _zz_io_dataIn_1_payload_64 <= _zz_io_dataIn_1_payload_63;
      _zz_io_expIn_1_48 <= _zz_io_dataIn_1_payload_60[7 : 0];
      _zz_io_expIn_1_49 <= _zz_io_expIn_1_48;
      _zz_io_expIn_1_50 <= _zz_io_expIn_1_49;
      _zz_io_expIn_1_51 <= _zz_io_expIn_1_50;
      _zz_io_dataIn_2_payload_61 <= _zz_io_dataIn_2_payload_60[87 : 8];
      _zz_io_dataIn_2_payload_62 <= _zz_io_dataIn_2_payload_61;
      _zz_io_dataIn_2_payload_63 <= _zz_io_dataIn_2_payload_62;
      _zz_io_dataIn_2_payload_64 <= _zz_io_dataIn_2_payload_63;
      _zz_io_expIn_2_48 <= _zz_io_dataIn_2_payload_60[7 : 0];
      _zz_io_expIn_2_49 <= _zz_io_expIn_2_48;
      _zz_io_expIn_2_50 <= _zz_io_expIn_2_49;
      _zz_io_expIn_2_51 <= _zz_io_expIn_2_50;
      _zz_io_dataIn_3_payload_61 <= _zz_io_dataIn_3_payload_60[87 : 8];
      _zz_io_dataIn_3_payload_62 <= _zz_io_dataIn_3_payload_61;
      _zz_io_dataIn_3_payload_63 <= _zz_io_dataIn_3_payload_62;
      _zz_io_dataIn_3_payload_64 <= _zz_io_dataIn_3_payload_63;
      _zz_io_expIn_3_48 <= _zz_io_dataIn_3_payload_60[7 : 0];
      _zz_io_expIn_3_49 <= _zz_io_expIn_3_48;
      _zz_io_expIn_3_50 <= _zz_io_expIn_3_49;
      _zz_io_expIn_3_51 <= _zz_io_expIn_3_50;
      _zz_io_dataIn_4_payload_61 <= _zz_io_dataIn_4_payload_60[87 : 8];
      _zz_io_dataIn_4_payload_62 <= _zz_io_dataIn_4_payload_61;
      _zz_io_dataIn_4_payload_63 <= _zz_io_dataIn_4_payload_62;
      _zz_io_dataIn_4_payload_64 <= _zz_io_dataIn_4_payload_63;
      _zz_io_expIn_4_48 <= _zz_io_dataIn_4_payload_60[7 : 0];
      _zz_io_expIn_4_49 <= _zz_io_expIn_4_48;
      _zz_io_expIn_4_50 <= _zz_io_expIn_4_49;
      _zz_io_expIn_4_51 <= _zz_io_expIn_4_50;
      _zz_io_dataIn_5_payload_61 <= _zz_io_dataIn_5_payload_60[87 : 8];
      _zz_io_dataIn_5_payload_62 <= _zz_io_dataIn_5_payload_61;
      _zz_io_dataIn_5_payload_63 <= _zz_io_dataIn_5_payload_62;
      _zz_io_dataIn_5_payload_64 <= _zz_io_dataIn_5_payload_63;
      _zz_io_expIn_5_48 <= _zz_io_dataIn_5_payload_60[7 : 0];
      _zz_io_expIn_5_49 <= _zz_io_expIn_5_48;
      _zz_io_expIn_5_50 <= _zz_io_expIn_5_49;
      _zz_io_expIn_5_51 <= _zz_io_expIn_5_50;
      io_tensorLoadValid_12_delay_1 <= io_tensorLoadValid_12;
      io_tensorLoadValid_12_delay_2 <= io_tensorLoadValid_12_delay_1;
      io_tensorLoadValid_12_delay_3 <= io_tensorLoadValid_12_delay_2;
      io_tensorLoadValid_12_delay_4 <= io_tensorLoadValid_12_delay_3;
      io_tensorLoadValid_12_delay_5 <= io_tensorLoadValid_12_delay_4;
      io_tensorLoadValid_12_delay_6 <= io_tensorLoadValid_12_delay_5;
      io_tensorLoadValid_12_delay_7 <= io_tensorLoadValid_12_delay_6;
      tensorDataValid_delay_1_12 <= tensorDataValid;
      tensorDataValid_delay_2_12 <= tensorDataValid_delay_1_12;
      tensorDataValid_delay_3_12 <= tensorDataValid_delay_2_12;
      tensorDataValid_delay_4_12 <= tensorDataValid_delay_3_12;
      tensorDataValid_delay_5_12 <= tensorDataValid_delay_4_12;
      tensorDataValid_delay_6_12 <= tensorDataValid_delay_5_12;
      tensorDataValid_delay_7_12 <= tensorDataValid_delay_6_12;
      _zz_io_dataIn_0_payload_66 <= _zz_io_dataIn_0_payload_65[87 : 8];
      _zz_io_dataIn_0_payload_67 <= _zz_io_dataIn_0_payload_66;
      _zz_io_dataIn_0_payload_68 <= _zz_io_dataIn_0_payload_67;
      _zz_io_dataIn_0_payload_69 <= _zz_io_dataIn_0_payload_68;
      _zz_io_expIn_0_52 <= _zz_io_dataIn_0_payload_65[7 : 0];
      _zz_io_expIn_0_53 <= _zz_io_expIn_0_52;
      _zz_io_expIn_0_54 <= _zz_io_expIn_0_53;
      _zz_io_expIn_0_55 <= _zz_io_expIn_0_54;
      _zz_io_dataIn_1_payload_66 <= _zz_io_dataIn_1_payload_65[87 : 8];
      _zz_io_dataIn_1_payload_67 <= _zz_io_dataIn_1_payload_66;
      _zz_io_dataIn_1_payload_68 <= _zz_io_dataIn_1_payload_67;
      _zz_io_dataIn_1_payload_69 <= _zz_io_dataIn_1_payload_68;
      _zz_io_expIn_1_52 <= _zz_io_dataIn_1_payload_65[7 : 0];
      _zz_io_expIn_1_53 <= _zz_io_expIn_1_52;
      _zz_io_expIn_1_54 <= _zz_io_expIn_1_53;
      _zz_io_expIn_1_55 <= _zz_io_expIn_1_54;
      _zz_io_dataIn_2_payload_66 <= _zz_io_dataIn_2_payload_65[87 : 8];
      _zz_io_dataIn_2_payload_67 <= _zz_io_dataIn_2_payload_66;
      _zz_io_dataIn_2_payload_68 <= _zz_io_dataIn_2_payload_67;
      _zz_io_dataIn_2_payload_69 <= _zz_io_dataIn_2_payload_68;
      _zz_io_expIn_2_52 <= _zz_io_dataIn_2_payload_65[7 : 0];
      _zz_io_expIn_2_53 <= _zz_io_expIn_2_52;
      _zz_io_expIn_2_54 <= _zz_io_expIn_2_53;
      _zz_io_expIn_2_55 <= _zz_io_expIn_2_54;
      _zz_io_dataIn_3_payload_66 <= _zz_io_dataIn_3_payload_65[87 : 8];
      _zz_io_dataIn_3_payload_67 <= _zz_io_dataIn_3_payload_66;
      _zz_io_dataIn_3_payload_68 <= _zz_io_dataIn_3_payload_67;
      _zz_io_dataIn_3_payload_69 <= _zz_io_dataIn_3_payload_68;
      _zz_io_expIn_3_52 <= _zz_io_dataIn_3_payload_65[7 : 0];
      _zz_io_expIn_3_53 <= _zz_io_expIn_3_52;
      _zz_io_expIn_3_54 <= _zz_io_expIn_3_53;
      _zz_io_expIn_3_55 <= _zz_io_expIn_3_54;
      _zz_io_dataIn_4_payload_66 <= _zz_io_dataIn_4_payload_65[87 : 8];
      _zz_io_dataIn_4_payload_67 <= _zz_io_dataIn_4_payload_66;
      _zz_io_dataIn_4_payload_68 <= _zz_io_dataIn_4_payload_67;
      _zz_io_dataIn_4_payload_69 <= _zz_io_dataIn_4_payload_68;
      _zz_io_expIn_4_52 <= _zz_io_dataIn_4_payload_65[7 : 0];
      _zz_io_expIn_4_53 <= _zz_io_expIn_4_52;
      _zz_io_expIn_4_54 <= _zz_io_expIn_4_53;
      _zz_io_expIn_4_55 <= _zz_io_expIn_4_54;
      _zz_io_dataIn_5_payload_66 <= _zz_io_dataIn_5_payload_65[87 : 8];
      _zz_io_dataIn_5_payload_67 <= _zz_io_dataIn_5_payload_66;
      _zz_io_dataIn_5_payload_68 <= _zz_io_dataIn_5_payload_67;
      _zz_io_dataIn_5_payload_69 <= _zz_io_dataIn_5_payload_68;
      _zz_io_expIn_5_52 <= _zz_io_dataIn_5_payload_65[7 : 0];
      _zz_io_expIn_5_53 <= _zz_io_expIn_5_52;
      _zz_io_expIn_5_54 <= _zz_io_expIn_5_53;
      _zz_io_expIn_5_55 <= _zz_io_expIn_5_54;
      io_tensorLoadValid_13_delay_1 <= io_tensorLoadValid_13;
      io_tensorLoadValid_13_delay_2 <= io_tensorLoadValid_13_delay_1;
      io_tensorLoadValid_13_delay_3 <= io_tensorLoadValid_13_delay_2;
      io_tensorLoadValid_13_delay_4 <= io_tensorLoadValid_13_delay_3;
      io_tensorLoadValid_13_delay_5 <= io_tensorLoadValid_13_delay_4;
      io_tensorLoadValid_13_delay_6 <= io_tensorLoadValid_13_delay_5;
      io_tensorLoadValid_13_delay_7 <= io_tensorLoadValid_13_delay_6;
      tensorDataValid_delay_1_13 <= tensorDataValid;
      tensorDataValid_delay_2_13 <= tensorDataValid_delay_1_13;
      tensorDataValid_delay_3_13 <= tensorDataValid_delay_2_13;
      tensorDataValid_delay_4_13 <= tensorDataValid_delay_3_13;
      tensorDataValid_delay_5_13 <= tensorDataValid_delay_4_13;
      tensorDataValid_delay_6_13 <= tensorDataValid_delay_5_13;
      tensorDataValid_delay_7_13 <= tensorDataValid_delay_6_13;
      _zz_io_dataIn_0_payload_71 <= _zz_io_dataIn_0_payload_70[87 : 8];
      _zz_io_dataIn_0_payload_72 <= _zz_io_dataIn_0_payload_71;
      _zz_io_dataIn_0_payload_73 <= _zz_io_dataIn_0_payload_72;
      _zz_io_dataIn_0_payload_74 <= _zz_io_dataIn_0_payload_73;
      _zz_io_expIn_0_56 <= _zz_io_dataIn_0_payload_70[7 : 0];
      _zz_io_expIn_0_57 <= _zz_io_expIn_0_56;
      _zz_io_expIn_0_58 <= _zz_io_expIn_0_57;
      _zz_io_expIn_0_59 <= _zz_io_expIn_0_58;
      _zz_io_dataIn_1_payload_71 <= _zz_io_dataIn_1_payload_70[87 : 8];
      _zz_io_dataIn_1_payload_72 <= _zz_io_dataIn_1_payload_71;
      _zz_io_dataIn_1_payload_73 <= _zz_io_dataIn_1_payload_72;
      _zz_io_dataIn_1_payload_74 <= _zz_io_dataIn_1_payload_73;
      _zz_io_expIn_1_56 <= _zz_io_dataIn_1_payload_70[7 : 0];
      _zz_io_expIn_1_57 <= _zz_io_expIn_1_56;
      _zz_io_expIn_1_58 <= _zz_io_expIn_1_57;
      _zz_io_expIn_1_59 <= _zz_io_expIn_1_58;
      _zz_io_dataIn_2_payload_71 <= _zz_io_dataIn_2_payload_70[87 : 8];
      _zz_io_dataIn_2_payload_72 <= _zz_io_dataIn_2_payload_71;
      _zz_io_dataIn_2_payload_73 <= _zz_io_dataIn_2_payload_72;
      _zz_io_dataIn_2_payload_74 <= _zz_io_dataIn_2_payload_73;
      _zz_io_expIn_2_56 <= _zz_io_dataIn_2_payload_70[7 : 0];
      _zz_io_expIn_2_57 <= _zz_io_expIn_2_56;
      _zz_io_expIn_2_58 <= _zz_io_expIn_2_57;
      _zz_io_expIn_2_59 <= _zz_io_expIn_2_58;
      _zz_io_dataIn_3_payload_71 <= _zz_io_dataIn_3_payload_70[87 : 8];
      _zz_io_dataIn_3_payload_72 <= _zz_io_dataIn_3_payload_71;
      _zz_io_dataIn_3_payload_73 <= _zz_io_dataIn_3_payload_72;
      _zz_io_dataIn_3_payload_74 <= _zz_io_dataIn_3_payload_73;
      _zz_io_expIn_3_56 <= _zz_io_dataIn_3_payload_70[7 : 0];
      _zz_io_expIn_3_57 <= _zz_io_expIn_3_56;
      _zz_io_expIn_3_58 <= _zz_io_expIn_3_57;
      _zz_io_expIn_3_59 <= _zz_io_expIn_3_58;
      _zz_io_dataIn_4_payload_71 <= _zz_io_dataIn_4_payload_70[87 : 8];
      _zz_io_dataIn_4_payload_72 <= _zz_io_dataIn_4_payload_71;
      _zz_io_dataIn_4_payload_73 <= _zz_io_dataIn_4_payload_72;
      _zz_io_dataIn_4_payload_74 <= _zz_io_dataIn_4_payload_73;
      _zz_io_expIn_4_56 <= _zz_io_dataIn_4_payload_70[7 : 0];
      _zz_io_expIn_4_57 <= _zz_io_expIn_4_56;
      _zz_io_expIn_4_58 <= _zz_io_expIn_4_57;
      _zz_io_expIn_4_59 <= _zz_io_expIn_4_58;
      _zz_io_dataIn_5_payload_71 <= _zz_io_dataIn_5_payload_70[87 : 8];
      _zz_io_dataIn_5_payload_72 <= _zz_io_dataIn_5_payload_71;
      _zz_io_dataIn_5_payload_73 <= _zz_io_dataIn_5_payload_72;
      _zz_io_dataIn_5_payload_74 <= _zz_io_dataIn_5_payload_73;
      _zz_io_expIn_5_56 <= _zz_io_dataIn_5_payload_70[7 : 0];
      _zz_io_expIn_5_57 <= _zz_io_expIn_5_56;
      _zz_io_expIn_5_58 <= _zz_io_expIn_5_57;
      _zz_io_expIn_5_59 <= _zz_io_expIn_5_58;
      io_tensorLoadValid_14_delay_1 <= io_tensorLoadValid_14;
      io_tensorLoadValid_14_delay_2 <= io_tensorLoadValid_14_delay_1;
      io_tensorLoadValid_14_delay_3 <= io_tensorLoadValid_14_delay_2;
      io_tensorLoadValid_14_delay_4 <= io_tensorLoadValid_14_delay_3;
      io_tensorLoadValid_14_delay_5 <= io_tensorLoadValid_14_delay_4;
      io_tensorLoadValid_14_delay_6 <= io_tensorLoadValid_14_delay_5;
      io_tensorLoadValid_14_delay_7 <= io_tensorLoadValid_14_delay_6;
      tensorDataValid_delay_1_14 <= tensorDataValid;
      tensorDataValid_delay_2_14 <= tensorDataValid_delay_1_14;
      tensorDataValid_delay_3_14 <= tensorDataValid_delay_2_14;
      tensorDataValid_delay_4_14 <= tensorDataValid_delay_3_14;
      tensorDataValid_delay_5_14 <= tensorDataValid_delay_4_14;
      tensorDataValid_delay_6_14 <= tensorDataValid_delay_5_14;
      tensorDataValid_delay_7_14 <= tensorDataValid_delay_6_14;
      _zz_io_dataIn_0_payload_76 <= _zz_io_dataIn_0_payload_75[87 : 8];
      _zz_io_dataIn_0_payload_77 <= _zz_io_dataIn_0_payload_76;
      _zz_io_dataIn_0_payload_78 <= _zz_io_dataIn_0_payload_77;
      _zz_io_dataIn_0_payload_79 <= _zz_io_dataIn_0_payload_78;
      _zz_io_expIn_0_60 <= _zz_io_dataIn_0_payload_75[7 : 0];
      _zz_io_expIn_0_61 <= _zz_io_expIn_0_60;
      _zz_io_expIn_0_62 <= _zz_io_expIn_0_61;
      _zz_io_expIn_0_63 <= _zz_io_expIn_0_62;
      _zz_io_dataIn_1_payload_76 <= _zz_io_dataIn_1_payload_75[87 : 8];
      _zz_io_dataIn_1_payload_77 <= _zz_io_dataIn_1_payload_76;
      _zz_io_dataIn_1_payload_78 <= _zz_io_dataIn_1_payload_77;
      _zz_io_dataIn_1_payload_79 <= _zz_io_dataIn_1_payload_78;
      _zz_io_expIn_1_60 <= _zz_io_dataIn_1_payload_75[7 : 0];
      _zz_io_expIn_1_61 <= _zz_io_expIn_1_60;
      _zz_io_expIn_1_62 <= _zz_io_expIn_1_61;
      _zz_io_expIn_1_63 <= _zz_io_expIn_1_62;
      _zz_io_dataIn_2_payload_76 <= _zz_io_dataIn_2_payload_75[87 : 8];
      _zz_io_dataIn_2_payload_77 <= _zz_io_dataIn_2_payload_76;
      _zz_io_dataIn_2_payload_78 <= _zz_io_dataIn_2_payload_77;
      _zz_io_dataIn_2_payload_79 <= _zz_io_dataIn_2_payload_78;
      _zz_io_expIn_2_60 <= _zz_io_dataIn_2_payload_75[7 : 0];
      _zz_io_expIn_2_61 <= _zz_io_expIn_2_60;
      _zz_io_expIn_2_62 <= _zz_io_expIn_2_61;
      _zz_io_expIn_2_63 <= _zz_io_expIn_2_62;
      _zz_io_dataIn_3_payload_76 <= _zz_io_dataIn_3_payload_75[87 : 8];
      _zz_io_dataIn_3_payload_77 <= _zz_io_dataIn_3_payload_76;
      _zz_io_dataIn_3_payload_78 <= _zz_io_dataIn_3_payload_77;
      _zz_io_dataIn_3_payload_79 <= _zz_io_dataIn_3_payload_78;
      _zz_io_expIn_3_60 <= _zz_io_dataIn_3_payload_75[7 : 0];
      _zz_io_expIn_3_61 <= _zz_io_expIn_3_60;
      _zz_io_expIn_3_62 <= _zz_io_expIn_3_61;
      _zz_io_expIn_3_63 <= _zz_io_expIn_3_62;
      _zz_io_dataIn_4_payload_76 <= _zz_io_dataIn_4_payload_75[87 : 8];
      _zz_io_dataIn_4_payload_77 <= _zz_io_dataIn_4_payload_76;
      _zz_io_dataIn_4_payload_78 <= _zz_io_dataIn_4_payload_77;
      _zz_io_dataIn_4_payload_79 <= _zz_io_dataIn_4_payload_78;
      _zz_io_expIn_4_60 <= _zz_io_dataIn_4_payload_75[7 : 0];
      _zz_io_expIn_4_61 <= _zz_io_expIn_4_60;
      _zz_io_expIn_4_62 <= _zz_io_expIn_4_61;
      _zz_io_expIn_4_63 <= _zz_io_expIn_4_62;
      _zz_io_dataIn_5_payload_76 <= _zz_io_dataIn_5_payload_75[87 : 8];
      _zz_io_dataIn_5_payload_77 <= _zz_io_dataIn_5_payload_76;
      _zz_io_dataIn_5_payload_78 <= _zz_io_dataIn_5_payload_77;
      _zz_io_dataIn_5_payload_79 <= _zz_io_dataIn_5_payload_78;
      _zz_io_expIn_5_60 <= _zz_io_dataIn_5_payload_75[7 : 0];
      _zz_io_expIn_5_61 <= _zz_io_expIn_5_60;
      _zz_io_expIn_5_62 <= _zz_io_expIn_5_61;
      _zz_io_expIn_5_63 <= _zz_io_expIn_5_62;
      io_tensorLoadValid_15_delay_1 <= io_tensorLoadValid_15;
      io_tensorLoadValid_15_delay_2 <= io_tensorLoadValid_15_delay_1;
      io_tensorLoadValid_15_delay_3 <= io_tensorLoadValid_15_delay_2;
      io_tensorLoadValid_15_delay_4 <= io_tensorLoadValid_15_delay_3;
      io_tensorLoadValid_15_delay_5 <= io_tensorLoadValid_15_delay_4;
      io_tensorLoadValid_15_delay_6 <= io_tensorLoadValid_15_delay_5;
      io_tensorLoadValid_15_delay_7 <= io_tensorLoadValid_15_delay_6;
      tensorDataValid_delay_1_15 <= tensorDataValid;
      tensorDataValid_delay_2_15 <= tensorDataValid_delay_1_15;
      tensorDataValid_delay_3_15 <= tensorDataValid_delay_2_15;
      tensorDataValid_delay_4_15 <= tensorDataValid_delay_3_15;
      tensorDataValid_delay_5_15 <= tensorDataValid_delay_4_15;
      tensorDataValid_delay_6_15 <= tensorDataValid_delay_5_15;
      tensorDataValid_delay_7_15 <= tensorDataValid_delay_6_15;
      row_computeIterCounter_2_value <= row_computeIterCounter_2_valueNext;
      row_resValidCounter_2_value <= row_resValidCounter_2_valueNext;
      rowCtrlFsm_stateReg <= rowCtrlFsm_stateNext;
      case(rowCtrlFsm_stateReg)
        rowCtrlFsm_enumDef_2_sIdle : begin
          tensorDataValid <= 1'b0;
          rowCtrlFsm_dataInFinish <= 1'b0;
        end
        rowCtrlFsm_enumDef_2_sPreLoad : begin
        end
        rowCtrlFsm_enumDef_2_sCompute : begin
          if(!when_TensorCoreChainArray_l166) begin
            tensorDataValid <= 1'b0;
          end
          if(rowBufferRdCounter_willOverflow) begin
            rowCtrlFsm_dataInFinish <= 1'b1;
          end
        end
        rowCtrlFsm_enumDef_2_sWriteRes : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l250) begin
        tensorDataValid <= 1'b1;
      end
    end
  end

  always @(posedge clk) begin
    _zz_rdaddress <= (rowBufferRdCounter_value - 16'h0);
    _zz_rdaddress_1 <= _zz_rdaddress;
    _zz_rdaddress_2 <= (rowBufferRdCounter_value - 16'h0002);
    _zz_rdaddress_3 <= _zz_rdaddress_2;
    _zz_rdaddress_4 <= (rowBufferRdCounter_value - 16'h0004);
    _zz_rdaddress_5 <= _zz_rdaddress_4;
    _zz_rdaddress_6 <= (rowBufferRdCounter_value - 16'h0006);
    _zz_rdaddress_7 <= _zz_rdaddress_6;
    _zz_rdaddress_8 <= (rowBufferRdCounter_value - 16'h0008);
    _zz_rdaddress_9 <= _zz_rdaddress_8;
    _zz_rdaddress_10 <= (rowBufferRdCounter_value - 16'h000a);
    _zz_rdaddress_11 <= _zz_rdaddress_10;
  end

  always @(posedge clk) begin
    if(!clrn) begin
      row_computeIterCounter_2_willOverflow_delay_1 <= 1'b0;
    end else begin
      row_computeIterCounter_2_willOverflow_delay_1 <= row_computeIterCounter_2_willOverflow;
    end
  end

  always @(posedge clk) begin
    if(!clrn) begin
      row_resValidCounter_2_willOverflow_delay_1 <= 1'b0;
    end else begin
      row_resValidCounter_2_willOverflow_delay_1 <= row_resValidCounter_2_willOverflow;
    end
  end


endmodule
