// Generator : SpinalHDL v1.10.1    git head : 2527c7c6b0fb0f95e5e1a5722a0be732b364ce43
// Component : tensor_core_array_wrapper
// Git hash  : a8561e868ead1ba45c504d2e34b6133ebfdc8d95

`timescale 1ns/1ps 
module tensor_core_array_wrapper (
  input  wire [7:0]    start,
  input  wire [7:0]    iter,
  input  wire [15:0]   in_buffer_id,
  input  wire [31:0]   rd_addr,
  input  wire [31:0]   wr_addr,
  input  wire [31:0]   load_start,
  input  wire          hbm_0_ready,
  input  wire          hbm_1_ready,
  input  wire          hbm_2_ready,
  input  wire          hbm_3_ready,
  input  wire          hbm_4_ready,
  input  wire          hbm_5_ready,
  input  wire          hbm_6_ready,
  input  wire [31:0]   idx_rd_addr,
  output wire [10:0]   idx_res,
  output wire          start_tcarray_in_0,
  output wire          select_tcarray_in_0,
  input  wire [255:0]  data_tcarray_in_0,
  output wire [31:0]   addr_tcarray_in_0,
  input  wire          almost_empty_tcarray_in_0,
  input  wire          port_error_tcarray_in_0,
  output wire          start_tcarray_in_1,
  output wire          select_tcarray_in_1,
  input  wire [255:0]  data_tcarray_in_1,
  output wire [31:0]   addr_tcarray_in_1,
  input  wire          almost_empty_tcarray_in_1,
  input  wire          port_error_tcarray_in_1,
  output wire          start_tcarray_in_2,
  output wire          select_tcarray_in_2,
  input  wire [255:0]  data_tcarray_in_2,
  output wire [31:0]   addr_tcarray_in_2,
  input  wire          almost_empty_tcarray_in_2,
  input  wire          port_error_tcarray_in_2,
  output wire          start_tcarray_in_3,
  output wire          select_tcarray_in_3,
  input  wire [255:0]  data_tcarray_in_3,
  output wire [31:0]   addr_tcarray_in_3,
  input  wire          almost_empty_tcarray_in_3,
  input  wire          port_error_tcarray_in_3,
  output wire          start_tcarray_in_4,
  output wire          select_tcarray_in_4,
  input  wire [255:0]  data_tcarray_in_4,
  output wire [31:0]   addr_tcarray_in_4,
  input  wire          almost_empty_tcarray_in_4,
  input  wire          port_error_tcarray_in_4,
  output wire          start_tcarray_out_0,
  output wire          select_tcarray_out_0,
  output wire [255:0]  data_tcarray_out_0,
  output wire [31:0]   addr_tcarray_out_0,
  input  wire          almost_full_tcarray_out_0,
  input  wire          port_error_tcarray_out_0,
  output wire          start_tcarray_out_1,
  output wire          select_tcarray_out_1,
  output wire [255:0]  data_tcarray_out_1,
  output wire [31:0]   addr_tcarray_out_1,
  input  wire          almost_full_tcarray_out_1,
  input  wire          port_error_tcarray_out_1,
  input  wire          clk,
  input  wire          clrn
);
  localparam rdFsm_enumDef_BOOT = 2'd0;
  localparam rdFsm_enumDef_sIdle = 2'd1;
  localparam rdFsm_enumDef_sWait = 2'd2;
  localparam rdFsm_enumDef_sSend = 2'd3;

  wire                tcArray_io_calEn;
  wire       [15:0]   tcArray_io_configPorts_matAColSubGrpLen;
  wire       [15:0]   tcArray_io_configPorts_matBColsPerTccRow;
  wire       [15:0]   tcArray_io_configPorts_tccRowBufferCnterRange;
  wire       [15:0]   tcArray_io_configPorts_tccColBufferCnterRange;
  wire       [10:0]   idxGenerator_io_seqIn_0;
  wire       [10:0]   idxGenerator_io_seqIn_1;
  wire       [10:0]   idxGenerator_io_seqIn_2;
  wire       [10:0]   idxGenerator_io_seqIn_3;
  wire       [10:0]   idxGenerator_io_seqIn_4;
  wire       [10:0]   idxGenerator_io_seqIn_5;
  wire       [10:0]   idxGenerator_io_seqIn_6;
  wire       [10:0]   idxGenerator_io_seqIn_7;
  wire       [10:0]   idxGenerator_io_seqIn_8;
  wire       [10:0]   idxGenerator_io_seqIn_9;
  wire       [10:0]   idxGenerator_io_seqIn_10;
  wire       [10:0]   idxGenerator_io_seqIn_11;
  wire                dataInColShiftRegs_io_dataOut_0_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_0_payload;
  wire                dataInColShiftRegs_io_dataOut_1_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_1_payload;
  wire                dataInColShiftRegs_io_dataOut_2_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_2_payload;
  wire                dataInColShiftRegs_io_dataOut_3_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_3_payload;
  wire                dataInColShiftRegs_io_dataOut_4_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_4_payload;
  wire                dataInColShiftRegs_io_dataOut_5_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_5_payload;
  wire                dataInColShiftRegs_io_dataOut_6_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_6_payload;
  wire                dataInColShiftRegs_io_dataOut_7_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_7_payload;
  wire                dataInColShiftRegs_io_dataOut_8_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_8_payload;
  wire                dataInColShiftRegs_io_dataOut_9_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_9_payload;
  wire                dataInColShiftRegs_io_dataOut_10_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_10_payload;
  wire                dataInColShiftRegs_io_dataOut_11_valid;
  wire       [319:0]  dataInColShiftRegs_io_dataOut_11_payload;
  wire                dataInRowShiftRegs_io_dataOut_0_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_0_payload;
  wire                dataInRowShiftRegs_io_dataOut_1_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_1_payload;
  wire                dataInRowShiftRegs_io_dataOut_2_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_2_payload;
  wire                dataInRowShiftRegs_io_dataOut_3_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_3_payload;
  wire                dataInRowShiftRegs_io_dataOut_4_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_4_payload;
  wire                dataInRowShiftRegs_io_dataOut_5_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_5_payload;
  wire                dataInRowShiftRegs_io_dataOut_6_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_6_payload;
  wire                dataInRowShiftRegs_io_dataOut_7_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_7_payload;
  wire                dataInRowShiftRegs_io_dataOut_8_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_8_payload;
  wire                dataInRowShiftRegs_io_dataOut_9_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_9_payload;
  wire                dataInRowShiftRegs_io_dataOut_10_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_10_payload;
  wire                dataInRowShiftRegs_io_dataOut_11_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_11_payload;
  wire                dataInRowShiftRegs_io_dataOut_12_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_12_payload;
  wire                dataInRowShiftRegs_io_dataOut_13_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_13_payload;
  wire                dataInRowShiftRegs_io_dataOut_14_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_14_payload;
  wire                dataInRowShiftRegs_io_dataOut_15_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_15_payload;
  wire                dataInRowShiftRegs_io_dataOut_16_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_16_payload;
  wire                dataInRowShiftRegs_io_dataOut_17_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_17_payload;
  wire                dataInRowShiftRegs_io_dataOut_18_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_18_payload;
  wire                dataInRowShiftRegs_io_dataOut_19_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_19_payload;
  wire                dataInRowShiftRegs_io_dataOut_20_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_20_payload;
  wire                dataInRowShiftRegs_io_dataOut_21_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_21_payload;
  wire                dataInRowShiftRegs_io_dataOut_22_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_22_payload;
  wire                dataInRowShiftRegs_io_dataOut_23_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_23_payload;
  wire                dataInRowShiftRegs_io_dataOut_24_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_24_payload;
  wire                dataInRowShiftRegs_io_dataOut_25_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_25_payload;
  wire                dataInRowShiftRegs_io_dataOut_26_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_26_payload;
  wire                dataInRowShiftRegs_io_dataOut_27_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_27_payload;
  wire                dataInRowShiftRegs_io_dataOut_28_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_28_payload;
  wire                dataInRowShiftRegs_io_dataOut_29_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_29_payload;
  wire                dataInRowShiftRegs_io_dataOut_30_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_30_payload;
  wire                dataInRowShiftRegs_io_dataOut_31_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_31_payload;
  wire                dataInRowShiftRegs_io_dataOut_32_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_32_payload;
  wire                dataInRowShiftRegs_io_dataOut_33_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_33_payload;
  wire                dataInRowShiftRegs_io_dataOut_34_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_34_payload;
  wire                dataInRowShiftRegs_io_dataOut_35_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_35_payload;
  wire                dataInRowShiftRegs_io_dataOut_36_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_36_payload;
  wire                dataInRowShiftRegs_io_dataOut_37_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_37_payload;
  wire                dataInRowShiftRegs_io_dataOut_38_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_38_payload;
  wire                dataInRowShiftRegs_io_dataOut_39_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_39_payload;
  wire                dataInRowShiftRegs_io_dataOut_40_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_40_payload;
  wire                dataInRowShiftRegs_io_dataOut_41_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_41_payload;
  wire                dataInRowShiftRegs_io_dataOut_42_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_42_payload;
  wire                dataInRowShiftRegs_io_dataOut_43_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_43_payload;
  wire                dataInRowShiftRegs_io_dataOut_44_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_44_payload;
  wire                dataInRowShiftRegs_io_dataOut_45_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_45_payload;
  wire                dataInRowShiftRegs_io_dataOut_46_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_46_payload;
  wire                dataInRowShiftRegs_io_dataOut_47_valid;
  wire       [319:0]  dataInRowShiftRegs_io_dataOut_47_payload;
  wire                tcArray_io_matALoad_0_ready;
  wire                tcArray_io_matALoad_1_ready;
  wire                tcArray_io_matALoad_2_ready;
  wire                tcArray_io_matALoad_3_ready;
  wire                tcArray_io_matALoad_4_ready;
  wire                tcArray_io_matALoad_5_ready;
  wire                tcArray_io_matALoad_6_ready;
  wire                tcArray_io_matALoad_7_ready;
  wire                tcArray_io_matALoad_8_ready;
  wire                tcArray_io_matALoad_9_ready;
  wire                tcArray_io_matALoad_10_ready;
  wire                tcArray_io_matBLoad_0_0_ready;
  wire                tcArray_io_matBLoad_0_1_ready;
  wire                tcArray_io_matBLoad_0_2_ready;
  wire                tcArray_io_matBLoad_0_3_ready;
  wire                tcArray_io_matBLoad_0_4_ready;
  wire                tcArray_io_matBLoad_0_5_ready;
  wire                tcArray_io_matBLoad_0_6_ready;
  wire                tcArray_io_matBLoad_0_7_ready;
  wire                tcArray_io_matBLoad_0_8_ready;
  wire                tcArray_io_matBLoad_0_9_ready;
  wire                tcArray_io_matBLoad_0_10_ready;
  wire                tcArray_io_matBLoad_0_11_ready;
  wire                tcArray_io_matBLoad_1_0_ready;
  wire                tcArray_io_matBLoad_1_1_ready;
  wire                tcArray_io_matBLoad_1_2_ready;
  wire                tcArray_io_matBLoad_1_3_ready;
  wire                tcArray_io_matBLoad_1_4_ready;
  wire                tcArray_io_matBLoad_1_5_ready;
  wire                tcArray_io_matBLoad_1_6_ready;
  wire                tcArray_io_matBLoad_1_7_ready;
  wire                tcArray_io_matBLoad_1_8_ready;
  wire                tcArray_io_matBLoad_1_9_ready;
  wire                tcArray_io_matBLoad_1_10_ready;
  wire                tcArray_io_matBLoad_1_11_ready;
  wire                tcArray_io_matBLoad_2_0_ready;
  wire                tcArray_io_matBLoad_2_1_ready;
  wire                tcArray_io_matBLoad_2_2_ready;
  wire                tcArray_io_matBLoad_2_3_ready;
  wire                tcArray_io_matBLoad_2_4_ready;
  wire                tcArray_io_matBLoad_2_5_ready;
  wire                tcArray_io_matBLoad_2_6_ready;
  wire                tcArray_io_matBLoad_2_7_ready;
  wire                tcArray_io_matBLoad_2_8_ready;
  wire                tcArray_io_matBLoad_2_9_ready;
  wire                tcArray_io_matBLoad_2_10_ready;
  wire                tcArray_io_matBLoad_2_11_ready;
  wire                tcArray_io_matBLoad_3_0_ready;
  wire                tcArray_io_matBLoad_3_1_ready;
  wire                tcArray_io_matBLoad_3_2_ready;
  wire                tcArray_io_matBLoad_3_3_ready;
  wire                tcArray_io_matBLoad_3_4_ready;
  wire                tcArray_io_matBLoad_3_5_ready;
  wire                tcArray_io_matBLoad_3_6_ready;
  wire                tcArray_io_matBLoad_3_7_ready;
  wire                tcArray_io_matBLoad_3_8_ready;
  wire                tcArray_io_matBLoad_3_9_ready;
  wire                tcArray_io_matBLoad_3_10_ready;
  wire                tcArray_io_res_0_valid;
  wire       [71:0]   tcArray_io_res_0_payload;
  wire                tcArray_io_res_1_valid;
  wire       [71:0]   tcArray_io_res_1_payload;
  wire                tcArray_io_res_2_valid;
  wire       [71:0]   tcArray_io_res_2_payload;
  wire                tcArray_io_res_3_valid;
  wire       [71:0]   tcArray_io_res_3_payload;
  wire       [10:0]   idxGenerator_io_seqOut_0;
  wire       [10:0]   idxGenerator_io_seqOut_1;
  wire       [10:0]   idxGenerator_io_seqOut_2;
  wire       [10:0]   idxGenerator_io_seqOut_3;
  wire       [10:0]   idxGenerator_io_seqOut_4;
  wire       [10:0]   idxGenerator_io_seqOut_5;
  wire       [10:0]   idxGenerator_io_seqOut_6;
  wire       [10:0]   idxGenerator_io_seqOut_7;
  wire       [10:0]   idxGenerator_io_seqOut_8;
  wire       [10:0]   idxGenerator_io_seqOut_9;
  wire       [10:0]   idxGenerator_io_seqOut_10;
  wire       [10:0]   idxGenerator_io_seqOut_11;
  wire       [10:0]   idxGenerator_io_seqOut_12;
  wire       [10:0]   idxGenerator_io_seqOut_13;
  wire       [10:0]   idxGenerator_io_seqOut_14;
  wire       [10:0]   idxGenerator_io_seqOut_15;
  wire       [5:0]    _zz_rdFsm_rdWordCounter_valueNext;
  wire       [0:0]    _zz_rdFsm_rdWordCounter_valueNext_1;
  wire       [1:0]    _zz_rdFsm_startAssertCounter_valueNext;
  wire       [0:0]    _zz_rdFsm_startAssertCounter_valueNext_1;
  wire       [1:0]    _zz__zz_start_tcarray_out_0_1;
  wire       [0:0]    _zz__zz_start_tcarray_out_0_1_1;
  wire       [143:0]  _zz_data_tcarray_out_0;
  wire       [1:0]    _zz__zz_start_tcarray_out_1_1;
  wire       [0:0]    _zz__zz_start_tcarray_out_1_1_1;
  wire       [143:0]  _zz_data_tcarray_out_1;
  reg                 selectTcarrayIn;
  reg                 startTCarrayIn;
  wire                dataIn_0_valid;
  wire       [319:0]  dataIn_0_payload;
  wire                dataIn_1_valid;
  wire       [319:0]  dataIn_1_payload;
  (* preserve_syn_only *) reg        [511:0]  combinedDataIn0;
  (* preserve_syn_only *) reg        [511:0]  combinedDataIn1;
  reg                 selectTcarrayIn_regNext;
  reg                 selectTcarrayIn_regNext_1;
  wire                data2TcarrayCol_0_valid;
  wire                data2TcarrayCol_0_ready;
  wire       [319:0]  data2TcarrayCol_0_payload;
  wire                data2TcarrayCol_1_valid;
  wire                data2TcarrayCol_1_ready;
  wire       [319:0]  data2TcarrayCol_1_payload;
  wire                data2TcarrayCol_2_valid;
  wire                data2TcarrayCol_2_ready;
  wire       [319:0]  data2TcarrayCol_2_payload;
  wire                data2TcarrayCol_3_valid;
  wire                data2TcarrayCol_3_ready;
  wire       [319:0]  data2TcarrayCol_3_payload;
  wire                data2TcarrayCol_4_valid;
  wire                data2TcarrayCol_4_ready;
  wire       [319:0]  data2TcarrayCol_4_payload;
  wire                data2TcarrayCol_5_valid;
  wire                data2TcarrayCol_5_ready;
  wire       [319:0]  data2TcarrayCol_5_payload;
  wire                data2TcarrayCol_6_valid;
  wire                data2TcarrayCol_6_ready;
  wire       [319:0]  data2TcarrayCol_6_payload;
  wire                data2TcarrayCol_7_valid;
  wire                data2TcarrayCol_7_ready;
  wire       [319:0]  data2TcarrayCol_7_payload;
  wire                data2TcarrayCol_8_valid;
  wire                data2TcarrayCol_8_ready;
  wire       [319:0]  data2TcarrayCol_8_payload;
  wire                data2TcarrayCol_9_valid;
  wire                data2TcarrayCol_9_ready;
  wire       [319:0]  data2TcarrayCol_9_payload;
  wire                data2TcarrayCol_10_valid;
  wire                data2TcarrayCol_10_ready;
  wire       [319:0]  data2TcarrayCol_10_payload;
  wire                data2TcarrayCol_11_valid;
  wire       [319:0]  data2TcarrayCol_11_payload;
  wire                data2TcarrayRow_0_valid;
  wire                data2TcarrayRow_0_ready;
  wire       [319:0]  data2TcarrayRow_0_payload;
  wire                data2TcarrayRow_1_valid;
  wire                data2TcarrayRow_1_ready;
  wire       [319:0]  data2TcarrayRow_1_payload;
  wire                data2TcarrayRow_2_valid;
  wire                data2TcarrayRow_2_ready;
  wire       [319:0]  data2TcarrayRow_2_payload;
  wire                data2TcarrayRow_3_valid;
  wire                data2TcarrayRow_3_ready;
  wire       [319:0]  data2TcarrayRow_3_payload;
  wire                data2TcarrayRow_4_valid;
  wire                data2TcarrayRow_4_ready;
  wire       [319:0]  data2TcarrayRow_4_payload;
  wire                data2TcarrayRow_5_valid;
  wire                data2TcarrayRow_5_ready;
  wire       [319:0]  data2TcarrayRow_5_payload;
  wire                data2TcarrayRow_6_valid;
  wire                data2TcarrayRow_6_ready;
  wire       [319:0]  data2TcarrayRow_6_payload;
  wire                data2TcarrayRow_7_valid;
  wire                data2TcarrayRow_7_ready;
  wire       [319:0]  data2TcarrayRow_7_payload;
  wire                data2TcarrayRow_8_valid;
  wire                data2TcarrayRow_8_ready;
  wire       [319:0]  data2TcarrayRow_8_payload;
  wire                data2TcarrayRow_9_valid;
  wire                data2TcarrayRow_9_ready;
  wire       [319:0]  data2TcarrayRow_9_payload;
  wire                data2TcarrayRow_10_valid;
  wire                data2TcarrayRow_10_ready;
  wire       [319:0]  data2TcarrayRow_10_payload;
  wire                data2TcarrayRow_11_valid;
  wire                data2TcarrayRow_11_ready;
  wire       [319:0]  data2TcarrayRow_11_payload;
  wire                data2TcarrayRow_12_valid;
  wire                data2TcarrayRow_12_ready;
  wire       [319:0]  data2TcarrayRow_12_payload;
  wire                data2TcarrayRow_13_valid;
  wire                data2TcarrayRow_13_ready;
  wire       [319:0]  data2TcarrayRow_13_payload;
  wire                data2TcarrayRow_14_valid;
  wire                data2TcarrayRow_14_ready;
  wire       [319:0]  data2TcarrayRow_14_payload;
  wire                data2TcarrayRow_15_valid;
  wire                data2TcarrayRow_15_ready;
  wire       [319:0]  data2TcarrayRow_15_payload;
  wire                data2TcarrayRow_16_valid;
  wire                data2TcarrayRow_16_ready;
  wire       [319:0]  data2TcarrayRow_16_payload;
  wire                data2TcarrayRow_17_valid;
  wire                data2TcarrayRow_17_ready;
  wire       [319:0]  data2TcarrayRow_17_payload;
  wire                data2TcarrayRow_18_valid;
  wire                data2TcarrayRow_18_ready;
  wire       [319:0]  data2TcarrayRow_18_payload;
  wire                data2TcarrayRow_19_valid;
  wire                data2TcarrayRow_19_ready;
  wire       [319:0]  data2TcarrayRow_19_payload;
  wire                data2TcarrayRow_20_valid;
  wire                data2TcarrayRow_20_ready;
  wire       [319:0]  data2TcarrayRow_20_payload;
  wire                data2TcarrayRow_21_valid;
  wire                data2TcarrayRow_21_ready;
  wire       [319:0]  data2TcarrayRow_21_payload;
  wire                data2TcarrayRow_22_valid;
  wire                data2TcarrayRow_22_ready;
  wire       [319:0]  data2TcarrayRow_22_payload;
  wire                data2TcarrayRow_23_valid;
  wire                data2TcarrayRow_23_ready;
  wire       [319:0]  data2TcarrayRow_23_payload;
  wire                data2TcarrayRow_24_valid;
  wire                data2TcarrayRow_24_ready;
  wire       [319:0]  data2TcarrayRow_24_payload;
  wire                data2TcarrayRow_25_valid;
  wire                data2TcarrayRow_25_ready;
  wire       [319:0]  data2TcarrayRow_25_payload;
  wire                data2TcarrayRow_26_valid;
  wire                data2TcarrayRow_26_ready;
  wire       [319:0]  data2TcarrayRow_26_payload;
  wire                data2TcarrayRow_27_valid;
  wire                data2TcarrayRow_27_ready;
  wire       [319:0]  data2TcarrayRow_27_payload;
  wire                data2TcarrayRow_28_valid;
  wire                data2TcarrayRow_28_ready;
  wire       [319:0]  data2TcarrayRow_28_payload;
  wire                data2TcarrayRow_29_valid;
  wire                data2TcarrayRow_29_ready;
  wire       [319:0]  data2TcarrayRow_29_payload;
  wire                data2TcarrayRow_30_valid;
  wire                data2TcarrayRow_30_ready;
  wire       [319:0]  data2TcarrayRow_30_payload;
  wire                data2TcarrayRow_31_valid;
  wire                data2TcarrayRow_31_ready;
  wire       [319:0]  data2TcarrayRow_31_payload;
  wire                data2TcarrayRow_32_valid;
  wire                data2TcarrayRow_32_ready;
  wire       [319:0]  data2TcarrayRow_32_payload;
  wire                data2TcarrayRow_33_valid;
  wire                data2TcarrayRow_33_ready;
  wire       [319:0]  data2TcarrayRow_33_payload;
  wire                data2TcarrayRow_34_valid;
  wire                data2TcarrayRow_34_ready;
  wire       [319:0]  data2TcarrayRow_34_payload;
  wire                data2TcarrayRow_35_valid;
  wire                data2TcarrayRow_35_ready;
  wire       [319:0]  data2TcarrayRow_35_payload;
  wire                data2TcarrayRow_36_valid;
  wire                data2TcarrayRow_36_ready;
  wire       [319:0]  data2TcarrayRow_36_payload;
  wire                data2TcarrayRow_37_valid;
  wire                data2TcarrayRow_37_ready;
  wire       [319:0]  data2TcarrayRow_37_payload;
  wire                data2TcarrayRow_38_valid;
  wire                data2TcarrayRow_38_ready;
  wire       [319:0]  data2TcarrayRow_38_payload;
  wire                data2TcarrayRow_39_valid;
  wire                data2TcarrayRow_39_ready;
  wire       [319:0]  data2TcarrayRow_39_payload;
  wire                data2TcarrayRow_40_valid;
  wire                data2TcarrayRow_40_ready;
  wire       [319:0]  data2TcarrayRow_40_payload;
  wire                data2TcarrayRow_41_valid;
  wire                data2TcarrayRow_41_ready;
  wire       [319:0]  data2TcarrayRow_41_payload;
  wire                data2TcarrayRow_42_valid;
  wire                data2TcarrayRow_42_ready;
  wire       [319:0]  data2TcarrayRow_42_payload;
  wire                data2TcarrayRow_43_valid;
  wire                data2TcarrayRow_43_ready;
  wire       [319:0]  data2TcarrayRow_43_payload;
  wire                data2TcarrayRow_44_valid;
  wire                data2TcarrayRow_44_ready;
  wire       [319:0]  data2TcarrayRow_44_payload;
  wire                data2TcarrayRow_45_valid;
  wire                data2TcarrayRow_45_ready;
  wire       [319:0]  data2TcarrayRow_45_payload;
  wire                data2TcarrayRow_46_valid;
  wire                data2TcarrayRow_46_ready;
  wire       [319:0]  data2TcarrayRow_46_payload;
  wire                data2TcarrayRow_47_valid;
  wire       [319:0]  data2TcarrayRow_47_payload;
  wire                _zz_io_calEn;
  reg                 _zz_io_calEn_1;
  wire       [131:0]  _zz_io_seqIn_0;
  reg        [10:0]   idxGeneratorRes_0;
  reg        [10:0]   idxGeneratorRes_1;
  reg        [10:0]   idxGeneratorRes_2;
  reg        [10:0]   idxGeneratorRes_3;
  reg        [10:0]   idxGeneratorRes_4;
  reg        [10:0]   idxGeneratorRes_5;
  reg        [10:0]   idxGeneratorRes_6;
  reg        [10:0]   idxGeneratorRes_7;
  reg        [10:0]   idxGeneratorRes_8;
  reg        [10:0]   idxGeneratorRes_9;
  reg        [10:0]   idxGeneratorRes_10;
  reg        [10:0]   idxGeneratorRes_11;
  reg        [10:0]   idxGeneratorRes_12;
  reg        [10:0]   idxGeneratorRes_13;
  reg        [10:0]   idxGeneratorRes_14;
  reg        [10:0]   idxGeneratorRes_15;
  wire       [3:0]    switch_Misc_l241;
  reg        [10:0]   _zz_idx_res;
  reg                 rdFsm_wantStart;
  wire                rdFsm_wantKill;
  reg                 rdFsm_rdWordCounter_willIncrement;
  reg                 rdFsm_rdWordCounter_willClear;
  reg        [5:0]    rdFsm_rdWordCounter_valueNext;
  reg        [5:0]    rdFsm_rdWordCounter_value;
  wire                rdFsm_rdWordCounter_willOverflowIfInc;
  wire                rdFsm_rdWordCounter_willOverflow;
  reg                 rdFsm_startAssertCounter_willIncrement;
  reg                 rdFsm_startAssertCounter_willClear;
  reg        [1:0]    rdFsm_startAssertCounter_valueNext;
  reg        [1:0]    rdFsm_startAssertCounter_value;
  wire                rdFsm_startAssertCounter_willOverflowIfInc;
  wire                rdFsm_startAssertCounter_willOverflow;
  reg                 _zz_start_tcarray_out_0;
  reg                 _zz_1;
  reg        [1:0]    _zz_start_tcarray_out_0_1;
  reg        [1:0]    _zz_start_tcarray_out_0_2;
  wire                _zz_start_tcarray_out_0_3;
  wire                _zz_select_tcarray_out_0;
  reg                 _zz_select_tcarray_out_0_1;
  wire                _zz_io_res_0_ready;
  reg                 _zz_when_tensor_core_array_wrapper_l190;
  wire                when_tensor_core_array_wrapper_l190;
  wire                when_tensor_core_array_wrapper_l192;
  reg                 _zz_start_tcarray_out_1;
  reg                 _zz_2;
  reg        [1:0]    _zz_start_tcarray_out_1_1;
  reg        [1:0]    _zz_start_tcarray_out_1_2;
  wire                _zz_start_tcarray_out_1_3;
  wire                _zz_select_tcarray_out_1;
  reg                 _zz_select_tcarray_out_1_1;
  wire                _zz_io_res_2_ready;
  reg                 _zz_when_tensor_core_array_wrapper_l190_1;
  wire                when_tensor_core_array_wrapper_l190_1;
  wire                when_tensor_core_array_wrapper_l192_1;
  reg        [1:0]    rdFsm_stateReg;
  reg        [1:0]    rdFsm_stateNext;
  wire                _zz_when_tensor_core_array_wrapper_l148;
  reg                 _zz_when_tensor_core_array_wrapper_l148_1;
  wire                when_tensor_core_array_wrapper_l148;
  wire                when_tensor_core_array_wrapper_l156;
  wire                when_tensor_core_array_wrapper_l163;
  wire                when_tensor_core_array_wrapper_l164;
  wire                when_StateMachine_l237;
  wire                when_StateMachine_l253;

  assign _zz_rdFsm_rdWordCounter_valueNext_1 = rdFsm_rdWordCounter_willIncrement;
  assign _zz_rdFsm_rdWordCounter_valueNext = {5'd0, _zz_rdFsm_rdWordCounter_valueNext_1};
  assign _zz_rdFsm_startAssertCounter_valueNext_1 = rdFsm_startAssertCounter_willIncrement;
  assign _zz_rdFsm_startAssertCounter_valueNext = {1'd0, _zz_rdFsm_startAssertCounter_valueNext_1};
  assign _zz__zz_start_tcarray_out_0_1_1 = _zz_start_tcarray_out_0;
  assign _zz__zz_start_tcarray_out_0_1 = {1'd0, _zz__zz_start_tcarray_out_0_1_1};
  assign _zz_data_tcarray_out_0 = {tcArray_io_res_0_payload,tcArray_io_res_1_payload};
  assign _zz__zz_start_tcarray_out_1_1_1 = _zz_start_tcarray_out_1;
  assign _zz__zz_start_tcarray_out_1_1 = {1'd0, _zz__zz_start_tcarray_out_1_1_1};
  assign _zz_data_tcarray_out_1 = {tcArray_io_res_2_payload,tcArray_io_res_3_payload};
  InputShiftReg dataInColShiftRegs (
    .io_pushIn_valid       (dataIn_0_valid                                 ), //i
    .io_pushIn_payload     (dataIn_0_payload[319:0]                        ), //i
    .io_dataOut_0_valid    (dataInColShiftRegs_io_dataOut_0_valid          ), //o
    .io_dataOut_0_ready    (data2TcarrayCol_0_ready                        ), //i
    .io_dataOut_0_payload  (dataInColShiftRegs_io_dataOut_0_payload[319:0] ), //o
    .io_dataOut_1_valid    (dataInColShiftRegs_io_dataOut_1_valid          ), //o
    .io_dataOut_1_ready    (data2TcarrayCol_1_ready                        ), //i
    .io_dataOut_1_payload  (dataInColShiftRegs_io_dataOut_1_payload[319:0] ), //o
    .io_dataOut_2_valid    (dataInColShiftRegs_io_dataOut_2_valid          ), //o
    .io_dataOut_2_ready    (data2TcarrayCol_2_ready                        ), //i
    .io_dataOut_2_payload  (dataInColShiftRegs_io_dataOut_2_payload[319:0] ), //o
    .io_dataOut_3_valid    (dataInColShiftRegs_io_dataOut_3_valid          ), //o
    .io_dataOut_3_ready    (data2TcarrayCol_3_ready                        ), //i
    .io_dataOut_3_payload  (dataInColShiftRegs_io_dataOut_3_payload[319:0] ), //o
    .io_dataOut_4_valid    (dataInColShiftRegs_io_dataOut_4_valid          ), //o
    .io_dataOut_4_ready    (data2TcarrayCol_4_ready                        ), //i
    .io_dataOut_4_payload  (dataInColShiftRegs_io_dataOut_4_payload[319:0] ), //o
    .io_dataOut_5_valid    (dataInColShiftRegs_io_dataOut_5_valid          ), //o
    .io_dataOut_5_ready    (data2TcarrayCol_5_ready                        ), //i
    .io_dataOut_5_payload  (dataInColShiftRegs_io_dataOut_5_payload[319:0] ), //o
    .io_dataOut_6_valid    (dataInColShiftRegs_io_dataOut_6_valid          ), //o
    .io_dataOut_6_ready    (data2TcarrayCol_6_ready                        ), //i
    .io_dataOut_6_payload  (dataInColShiftRegs_io_dataOut_6_payload[319:0] ), //o
    .io_dataOut_7_valid    (dataInColShiftRegs_io_dataOut_7_valid          ), //o
    .io_dataOut_7_ready    (data2TcarrayCol_7_ready                        ), //i
    .io_dataOut_7_payload  (dataInColShiftRegs_io_dataOut_7_payload[319:0] ), //o
    .io_dataOut_8_valid    (dataInColShiftRegs_io_dataOut_8_valid          ), //o
    .io_dataOut_8_ready    (data2TcarrayCol_8_ready                        ), //i
    .io_dataOut_8_payload  (dataInColShiftRegs_io_dataOut_8_payload[319:0] ), //o
    .io_dataOut_9_valid    (dataInColShiftRegs_io_dataOut_9_valid          ), //o
    .io_dataOut_9_ready    (data2TcarrayCol_9_ready                        ), //i
    .io_dataOut_9_payload  (dataInColShiftRegs_io_dataOut_9_payload[319:0] ), //o
    .io_dataOut_10_valid   (dataInColShiftRegs_io_dataOut_10_valid         ), //o
    .io_dataOut_10_ready   (data2TcarrayCol_10_ready                       ), //i
    .io_dataOut_10_payload (dataInColShiftRegs_io_dataOut_10_payload[319:0]), //o
    .io_dataOut_11_valid   (dataInColShiftRegs_io_dataOut_11_valid         ), //o
    .io_dataOut_11_payload (dataInColShiftRegs_io_dataOut_11_payload[319:0]), //o
    .clk                   (clk                                            ), //i
    .clrn                  (clrn                                           )  //i
  );
  InputShiftReg_1 dataInRowShiftRegs (
    .io_pushIn_valid       (dataIn_1_valid                                 ), //i
    .io_pushIn_payload     (dataIn_1_payload[319:0]                        ), //i
    .io_dataOut_0_valid    (dataInRowShiftRegs_io_dataOut_0_valid          ), //o
    .io_dataOut_0_ready    (data2TcarrayRow_0_ready                        ), //i
    .io_dataOut_0_payload  (dataInRowShiftRegs_io_dataOut_0_payload[319:0] ), //o
    .io_dataOut_1_valid    (dataInRowShiftRegs_io_dataOut_1_valid          ), //o
    .io_dataOut_1_ready    (data2TcarrayRow_1_ready                        ), //i
    .io_dataOut_1_payload  (dataInRowShiftRegs_io_dataOut_1_payload[319:0] ), //o
    .io_dataOut_2_valid    (dataInRowShiftRegs_io_dataOut_2_valid          ), //o
    .io_dataOut_2_ready    (data2TcarrayRow_2_ready                        ), //i
    .io_dataOut_2_payload  (dataInRowShiftRegs_io_dataOut_2_payload[319:0] ), //o
    .io_dataOut_3_valid    (dataInRowShiftRegs_io_dataOut_3_valid          ), //o
    .io_dataOut_3_ready    (data2TcarrayRow_3_ready                        ), //i
    .io_dataOut_3_payload  (dataInRowShiftRegs_io_dataOut_3_payload[319:0] ), //o
    .io_dataOut_4_valid    (dataInRowShiftRegs_io_dataOut_4_valid          ), //o
    .io_dataOut_4_ready    (data2TcarrayRow_4_ready                        ), //i
    .io_dataOut_4_payload  (dataInRowShiftRegs_io_dataOut_4_payload[319:0] ), //o
    .io_dataOut_5_valid    (dataInRowShiftRegs_io_dataOut_5_valid          ), //o
    .io_dataOut_5_ready    (data2TcarrayRow_5_ready                        ), //i
    .io_dataOut_5_payload  (dataInRowShiftRegs_io_dataOut_5_payload[319:0] ), //o
    .io_dataOut_6_valid    (dataInRowShiftRegs_io_dataOut_6_valid          ), //o
    .io_dataOut_6_ready    (data2TcarrayRow_6_ready                        ), //i
    .io_dataOut_6_payload  (dataInRowShiftRegs_io_dataOut_6_payload[319:0] ), //o
    .io_dataOut_7_valid    (dataInRowShiftRegs_io_dataOut_7_valid          ), //o
    .io_dataOut_7_ready    (data2TcarrayRow_7_ready                        ), //i
    .io_dataOut_7_payload  (dataInRowShiftRegs_io_dataOut_7_payload[319:0] ), //o
    .io_dataOut_8_valid    (dataInRowShiftRegs_io_dataOut_8_valid          ), //o
    .io_dataOut_8_ready    (data2TcarrayRow_8_ready                        ), //i
    .io_dataOut_8_payload  (dataInRowShiftRegs_io_dataOut_8_payload[319:0] ), //o
    .io_dataOut_9_valid    (dataInRowShiftRegs_io_dataOut_9_valid          ), //o
    .io_dataOut_9_ready    (data2TcarrayRow_9_ready                        ), //i
    .io_dataOut_9_payload  (dataInRowShiftRegs_io_dataOut_9_payload[319:0] ), //o
    .io_dataOut_10_valid   (dataInRowShiftRegs_io_dataOut_10_valid         ), //o
    .io_dataOut_10_ready   (data2TcarrayRow_10_ready                       ), //i
    .io_dataOut_10_payload (dataInRowShiftRegs_io_dataOut_10_payload[319:0]), //o
    .io_dataOut_11_valid   (dataInRowShiftRegs_io_dataOut_11_valid         ), //o
    .io_dataOut_11_ready   (data2TcarrayRow_11_ready                       ), //i
    .io_dataOut_11_payload (dataInRowShiftRegs_io_dataOut_11_payload[319:0]), //o
    .io_dataOut_12_valid   (dataInRowShiftRegs_io_dataOut_12_valid         ), //o
    .io_dataOut_12_ready   (data2TcarrayRow_12_ready                       ), //i
    .io_dataOut_12_payload (dataInRowShiftRegs_io_dataOut_12_payload[319:0]), //o
    .io_dataOut_13_valid   (dataInRowShiftRegs_io_dataOut_13_valid         ), //o
    .io_dataOut_13_ready   (data2TcarrayRow_13_ready                       ), //i
    .io_dataOut_13_payload (dataInRowShiftRegs_io_dataOut_13_payload[319:0]), //o
    .io_dataOut_14_valid   (dataInRowShiftRegs_io_dataOut_14_valid         ), //o
    .io_dataOut_14_ready   (data2TcarrayRow_14_ready                       ), //i
    .io_dataOut_14_payload (dataInRowShiftRegs_io_dataOut_14_payload[319:0]), //o
    .io_dataOut_15_valid   (dataInRowShiftRegs_io_dataOut_15_valid         ), //o
    .io_dataOut_15_ready   (data2TcarrayRow_15_ready                       ), //i
    .io_dataOut_15_payload (dataInRowShiftRegs_io_dataOut_15_payload[319:0]), //o
    .io_dataOut_16_valid   (dataInRowShiftRegs_io_dataOut_16_valid         ), //o
    .io_dataOut_16_ready   (data2TcarrayRow_16_ready                       ), //i
    .io_dataOut_16_payload (dataInRowShiftRegs_io_dataOut_16_payload[319:0]), //o
    .io_dataOut_17_valid   (dataInRowShiftRegs_io_dataOut_17_valid         ), //o
    .io_dataOut_17_ready   (data2TcarrayRow_17_ready                       ), //i
    .io_dataOut_17_payload (dataInRowShiftRegs_io_dataOut_17_payload[319:0]), //o
    .io_dataOut_18_valid   (dataInRowShiftRegs_io_dataOut_18_valid         ), //o
    .io_dataOut_18_ready   (data2TcarrayRow_18_ready                       ), //i
    .io_dataOut_18_payload (dataInRowShiftRegs_io_dataOut_18_payload[319:0]), //o
    .io_dataOut_19_valid   (dataInRowShiftRegs_io_dataOut_19_valid         ), //o
    .io_dataOut_19_ready   (data2TcarrayRow_19_ready                       ), //i
    .io_dataOut_19_payload (dataInRowShiftRegs_io_dataOut_19_payload[319:0]), //o
    .io_dataOut_20_valid   (dataInRowShiftRegs_io_dataOut_20_valid         ), //o
    .io_dataOut_20_ready   (data2TcarrayRow_20_ready                       ), //i
    .io_dataOut_20_payload (dataInRowShiftRegs_io_dataOut_20_payload[319:0]), //o
    .io_dataOut_21_valid   (dataInRowShiftRegs_io_dataOut_21_valid         ), //o
    .io_dataOut_21_ready   (data2TcarrayRow_21_ready                       ), //i
    .io_dataOut_21_payload (dataInRowShiftRegs_io_dataOut_21_payload[319:0]), //o
    .io_dataOut_22_valid   (dataInRowShiftRegs_io_dataOut_22_valid         ), //o
    .io_dataOut_22_ready   (data2TcarrayRow_22_ready                       ), //i
    .io_dataOut_22_payload (dataInRowShiftRegs_io_dataOut_22_payload[319:0]), //o
    .io_dataOut_23_valid   (dataInRowShiftRegs_io_dataOut_23_valid         ), //o
    .io_dataOut_23_ready   (data2TcarrayRow_23_ready                       ), //i
    .io_dataOut_23_payload (dataInRowShiftRegs_io_dataOut_23_payload[319:0]), //o
    .io_dataOut_24_valid   (dataInRowShiftRegs_io_dataOut_24_valid         ), //o
    .io_dataOut_24_ready   (data2TcarrayRow_24_ready                       ), //i
    .io_dataOut_24_payload (dataInRowShiftRegs_io_dataOut_24_payload[319:0]), //o
    .io_dataOut_25_valid   (dataInRowShiftRegs_io_dataOut_25_valid         ), //o
    .io_dataOut_25_ready   (data2TcarrayRow_25_ready                       ), //i
    .io_dataOut_25_payload (dataInRowShiftRegs_io_dataOut_25_payload[319:0]), //o
    .io_dataOut_26_valid   (dataInRowShiftRegs_io_dataOut_26_valid         ), //o
    .io_dataOut_26_ready   (data2TcarrayRow_26_ready                       ), //i
    .io_dataOut_26_payload (dataInRowShiftRegs_io_dataOut_26_payload[319:0]), //o
    .io_dataOut_27_valid   (dataInRowShiftRegs_io_dataOut_27_valid         ), //o
    .io_dataOut_27_ready   (data2TcarrayRow_27_ready                       ), //i
    .io_dataOut_27_payload (dataInRowShiftRegs_io_dataOut_27_payload[319:0]), //o
    .io_dataOut_28_valid   (dataInRowShiftRegs_io_dataOut_28_valid         ), //o
    .io_dataOut_28_ready   (data2TcarrayRow_28_ready                       ), //i
    .io_dataOut_28_payload (dataInRowShiftRegs_io_dataOut_28_payload[319:0]), //o
    .io_dataOut_29_valid   (dataInRowShiftRegs_io_dataOut_29_valid         ), //o
    .io_dataOut_29_ready   (data2TcarrayRow_29_ready                       ), //i
    .io_dataOut_29_payload (dataInRowShiftRegs_io_dataOut_29_payload[319:0]), //o
    .io_dataOut_30_valid   (dataInRowShiftRegs_io_dataOut_30_valid         ), //o
    .io_dataOut_30_ready   (data2TcarrayRow_30_ready                       ), //i
    .io_dataOut_30_payload (dataInRowShiftRegs_io_dataOut_30_payload[319:0]), //o
    .io_dataOut_31_valid   (dataInRowShiftRegs_io_dataOut_31_valid         ), //o
    .io_dataOut_31_ready   (data2TcarrayRow_31_ready                       ), //i
    .io_dataOut_31_payload (dataInRowShiftRegs_io_dataOut_31_payload[319:0]), //o
    .io_dataOut_32_valid   (dataInRowShiftRegs_io_dataOut_32_valid         ), //o
    .io_dataOut_32_ready   (data2TcarrayRow_32_ready                       ), //i
    .io_dataOut_32_payload (dataInRowShiftRegs_io_dataOut_32_payload[319:0]), //o
    .io_dataOut_33_valid   (dataInRowShiftRegs_io_dataOut_33_valid         ), //o
    .io_dataOut_33_ready   (data2TcarrayRow_33_ready                       ), //i
    .io_dataOut_33_payload (dataInRowShiftRegs_io_dataOut_33_payload[319:0]), //o
    .io_dataOut_34_valid   (dataInRowShiftRegs_io_dataOut_34_valid         ), //o
    .io_dataOut_34_ready   (data2TcarrayRow_34_ready                       ), //i
    .io_dataOut_34_payload (dataInRowShiftRegs_io_dataOut_34_payload[319:0]), //o
    .io_dataOut_35_valid   (dataInRowShiftRegs_io_dataOut_35_valid         ), //o
    .io_dataOut_35_ready   (data2TcarrayRow_35_ready                       ), //i
    .io_dataOut_35_payload (dataInRowShiftRegs_io_dataOut_35_payload[319:0]), //o
    .io_dataOut_36_valid   (dataInRowShiftRegs_io_dataOut_36_valid         ), //o
    .io_dataOut_36_ready   (data2TcarrayRow_36_ready                       ), //i
    .io_dataOut_36_payload (dataInRowShiftRegs_io_dataOut_36_payload[319:0]), //o
    .io_dataOut_37_valid   (dataInRowShiftRegs_io_dataOut_37_valid         ), //o
    .io_dataOut_37_ready   (data2TcarrayRow_37_ready                       ), //i
    .io_dataOut_37_payload (dataInRowShiftRegs_io_dataOut_37_payload[319:0]), //o
    .io_dataOut_38_valid   (dataInRowShiftRegs_io_dataOut_38_valid         ), //o
    .io_dataOut_38_ready   (data2TcarrayRow_38_ready                       ), //i
    .io_dataOut_38_payload (dataInRowShiftRegs_io_dataOut_38_payload[319:0]), //o
    .io_dataOut_39_valid   (dataInRowShiftRegs_io_dataOut_39_valid         ), //o
    .io_dataOut_39_ready   (data2TcarrayRow_39_ready                       ), //i
    .io_dataOut_39_payload (dataInRowShiftRegs_io_dataOut_39_payload[319:0]), //o
    .io_dataOut_40_valid   (dataInRowShiftRegs_io_dataOut_40_valid         ), //o
    .io_dataOut_40_ready   (data2TcarrayRow_40_ready                       ), //i
    .io_dataOut_40_payload (dataInRowShiftRegs_io_dataOut_40_payload[319:0]), //o
    .io_dataOut_41_valid   (dataInRowShiftRegs_io_dataOut_41_valid         ), //o
    .io_dataOut_41_ready   (data2TcarrayRow_41_ready                       ), //i
    .io_dataOut_41_payload (dataInRowShiftRegs_io_dataOut_41_payload[319:0]), //o
    .io_dataOut_42_valid   (dataInRowShiftRegs_io_dataOut_42_valid         ), //o
    .io_dataOut_42_ready   (data2TcarrayRow_42_ready                       ), //i
    .io_dataOut_42_payload (dataInRowShiftRegs_io_dataOut_42_payload[319:0]), //o
    .io_dataOut_43_valid   (dataInRowShiftRegs_io_dataOut_43_valid         ), //o
    .io_dataOut_43_ready   (data2TcarrayRow_43_ready                       ), //i
    .io_dataOut_43_payload (dataInRowShiftRegs_io_dataOut_43_payload[319:0]), //o
    .io_dataOut_44_valid   (dataInRowShiftRegs_io_dataOut_44_valid         ), //o
    .io_dataOut_44_ready   (data2TcarrayRow_44_ready                       ), //i
    .io_dataOut_44_payload (dataInRowShiftRegs_io_dataOut_44_payload[319:0]), //o
    .io_dataOut_45_valid   (dataInRowShiftRegs_io_dataOut_45_valid         ), //o
    .io_dataOut_45_ready   (data2TcarrayRow_45_ready                       ), //i
    .io_dataOut_45_payload (dataInRowShiftRegs_io_dataOut_45_payload[319:0]), //o
    .io_dataOut_46_valid   (dataInRowShiftRegs_io_dataOut_46_valid         ), //o
    .io_dataOut_46_ready   (data2TcarrayRow_46_ready                       ), //i
    .io_dataOut_46_payload (dataInRowShiftRegs_io_dataOut_46_payload[319:0]), //o
    .io_dataOut_47_valid   (dataInRowShiftRegs_io_dataOut_47_valid         ), //o
    .io_dataOut_47_payload (dataInRowShiftRegs_io_dataOut_47_payload[319:0]), //o
    .clk                   (clk                                            ), //i
    .clrn                  (clrn                                           )  //i
  );
  TensorCoreChainArray tcArray (
    .io_matALoad_0_valid                   (data2TcarrayCol_0_valid                            ), //i
    .io_matALoad_0_ready                   (tcArray_io_matALoad_0_ready                        ), //o
    .io_matALoad_0_payload                 (data2TcarrayCol_0_payload[319:0]                   ), //i
    .io_matALoad_1_valid                   (data2TcarrayCol_1_valid                            ), //i
    .io_matALoad_1_ready                   (tcArray_io_matALoad_1_ready                        ), //o
    .io_matALoad_1_payload                 (data2TcarrayCol_1_payload[319:0]                   ), //i
    .io_matALoad_2_valid                   (data2TcarrayCol_2_valid                            ), //i
    .io_matALoad_2_ready                   (tcArray_io_matALoad_2_ready                        ), //o
    .io_matALoad_2_payload                 (data2TcarrayCol_2_payload[319:0]                   ), //i
    .io_matALoad_3_valid                   (data2TcarrayCol_3_valid                            ), //i
    .io_matALoad_3_ready                   (tcArray_io_matALoad_3_ready                        ), //o
    .io_matALoad_3_payload                 (data2TcarrayCol_3_payload[319:0]                   ), //i
    .io_matALoad_4_valid                   (data2TcarrayCol_4_valid                            ), //i
    .io_matALoad_4_ready                   (tcArray_io_matALoad_4_ready                        ), //o
    .io_matALoad_4_payload                 (data2TcarrayCol_4_payload[319:0]                   ), //i
    .io_matALoad_5_valid                   (data2TcarrayCol_5_valid                            ), //i
    .io_matALoad_5_ready                   (tcArray_io_matALoad_5_ready                        ), //o
    .io_matALoad_5_payload                 (data2TcarrayCol_5_payload[319:0]                   ), //i
    .io_matALoad_6_valid                   (data2TcarrayCol_6_valid                            ), //i
    .io_matALoad_6_ready                   (tcArray_io_matALoad_6_ready                        ), //o
    .io_matALoad_6_payload                 (data2TcarrayCol_6_payload[319:0]                   ), //i
    .io_matALoad_7_valid                   (data2TcarrayCol_7_valid                            ), //i
    .io_matALoad_7_ready                   (tcArray_io_matALoad_7_ready                        ), //o
    .io_matALoad_7_payload                 (data2TcarrayCol_7_payload[319:0]                   ), //i
    .io_matALoad_8_valid                   (data2TcarrayCol_8_valid                            ), //i
    .io_matALoad_8_ready                   (tcArray_io_matALoad_8_ready                        ), //o
    .io_matALoad_8_payload                 (data2TcarrayCol_8_payload[319:0]                   ), //i
    .io_matALoad_9_valid                   (data2TcarrayCol_9_valid                            ), //i
    .io_matALoad_9_ready                   (tcArray_io_matALoad_9_ready                        ), //o
    .io_matALoad_9_payload                 (data2TcarrayCol_9_payload[319:0]                   ), //i
    .io_matALoad_10_valid                  (data2TcarrayCol_10_valid                           ), //i
    .io_matALoad_10_ready                  (tcArray_io_matALoad_10_ready                       ), //o
    .io_matALoad_10_payload                (data2TcarrayCol_10_payload[319:0]                  ), //i
    .io_matALoad_11_valid                  (data2TcarrayCol_11_valid                           ), //i
    .io_matALoad_11_payload                (data2TcarrayCol_11_payload[319:0]                  ), //i
    .io_matBLoad_0_0_valid                 (data2TcarrayRow_0_valid                            ), //i
    .io_matBLoad_0_0_ready                 (tcArray_io_matBLoad_0_0_ready                      ), //o
    .io_matBLoad_0_0_payload               (data2TcarrayRow_0_payload[319:0]                   ), //i
    .io_matBLoad_0_1_valid                 (data2TcarrayRow_1_valid                            ), //i
    .io_matBLoad_0_1_ready                 (tcArray_io_matBLoad_0_1_ready                      ), //o
    .io_matBLoad_0_1_payload               (data2TcarrayRow_1_payload[319:0]                   ), //i
    .io_matBLoad_0_2_valid                 (data2TcarrayRow_2_valid                            ), //i
    .io_matBLoad_0_2_ready                 (tcArray_io_matBLoad_0_2_ready                      ), //o
    .io_matBLoad_0_2_payload               (data2TcarrayRow_2_payload[319:0]                   ), //i
    .io_matBLoad_0_3_valid                 (data2TcarrayRow_3_valid                            ), //i
    .io_matBLoad_0_3_ready                 (tcArray_io_matBLoad_0_3_ready                      ), //o
    .io_matBLoad_0_3_payload               (data2TcarrayRow_3_payload[319:0]                   ), //i
    .io_matBLoad_0_4_valid                 (data2TcarrayRow_4_valid                            ), //i
    .io_matBLoad_0_4_ready                 (tcArray_io_matBLoad_0_4_ready                      ), //o
    .io_matBLoad_0_4_payload               (data2TcarrayRow_4_payload[319:0]                   ), //i
    .io_matBLoad_0_5_valid                 (data2TcarrayRow_5_valid                            ), //i
    .io_matBLoad_0_5_ready                 (tcArray_io_matBLoad_0_5_ready                      ), //o
    .io_matBLoad_0_5_payload               (data2TcarrayRow_5_payload[319:0]                   ), //i
    .io_matBLoad_0_6_valid                 (data2TcarrayRow_6_valid                            ), //i
    .io_matBLoad_0_6_ready                 (tcArray_io_matBLoad_0_6_ready                      ), //o
    .io_matBLoad_0_6_payload               (data2TcarrayRow_6_payload[319:0]                   ), //i
    .io_matBLoad_0_7_valid                 (data2TcarrayRow_7_valid                            ), //i
    .io_matBLoad_0_7_ready                 (tcArray_io_matBLoad_0_7_ready                      ), //o
    .io_matBLoad_0_7_payload               (data2TcarrayRow_7_payload[319:0]                   ), //i
    .io_matBLoad_0_8_valid                 (data2TcarrayRow_8_valid                            ), //i
    .io_matBLoad_0_8_ready                 (tcArray_io_matBLoad_0_8_ready                      ), //o
    .io_matBLoad_0_8_payload               (data2TcarrayRow_8_payload[319:0]                   ), //i
    .io_matBLoad_0_9_valid                 (data2TcarrayRow_9_valid                            ), //i
    .io_matBLoad_0_9_ready                 (tcArray_io_matBLoad_0_9_ready                      ), //o
    .io_matBLoad_0_9_payload               (data2TcarrayRow_9_payload[319:0]                   ), //i
    .io_matBLoad_0_10_valid                (data2TcarrayRow_10_valid                           ), //i
    .io_matBLoad_0_10_ready                (tcArray_io_matBLoad_0_10_ready                     ), //o
    .io_matBLoad_0_10_payload              (data2TcarrayRow_10_payload[319:0]                  ), //i
    .io_matBLoad_0_11_valid                (data2TcarrayRow_11_valid                           ), //i
    .io_matBLoad_0_11_ready                (tcArray_io_matBLoad_0_11_ready                     ), //o
    .io_matBLoad_0_11_payload              (data2TcarrayRow_11_payload[319:0]                  ), //i
    .io_matBLoad_1_0_valid                 (data2TcarrayRow_12_valid                           ), //i
    .io_matBLoad_1_0_ready                 (tcArray_io_matBLoad_1_0_ready                      ), //o
    .io_matBLoad_1_0_payload               (data2TcarrayRow_12_payload[319:0]                  ), //i
    .io_matBLoad_1_1_valid                 (data2TcarrayRow_13_valid                           ), //i
    .io_matBLoad_1_1_ready                 (tcArray_io_matBLoad_1_1_ready                      ), //o
    .io_matBLoad_1_1_payload               (data2TcarrayRow_13_payload[319:0]                  ), //i
    .io_matBLoad_1_2_valid                 (data2TcarrayRow_14_valid                           ), //i
    .io_matBLoad_1_2_ready                 (tcArray_io_matBLoad_1_2_ready                      ), //o
    .io_matBLoad_1_2_payload               (data2TcarrayRow_14_payload[319:0]                  ), //i
    .io_matBLoad_1_3_valid                 (data2TcarrayRow_15_valid                           ), //i
    .io_matBLoad_1_3_ready                 (tcArray_io_matBLoad_1_3_ready                      ), //o
    .io_matBLoad_1_3_payload               (data2TcarrayRow_15_payload[319:0]                  ), //i
    .io_matBLoad_1_4_valid                 (data2TcarrayRow_16_valid                           ), //i
    .io_matBLoad_1_4_ready                 (tcArray_io_matBLoad_1_4_ready                      ), //o
    .io_matBLoad_1_4_payload               (data2TcarrayRow_16_payload[319:0]                  ), //i
    .io_matBLoad_1_5_valid                 (data2TcarrayRow_17_valid                           ), //i
    .io_matBLoad_1_5_ready                 (tcArray_io_matBLoad_1_5_ready                      ), //o
    .io_matBLoad_1_5_payload               (data2TcarrayRow_17_payload[319:0]                  ), //i
    .io_matBLoad_1_6_valid                 (data2TcarrayRow_18_valid                           ), //i
    .io_matBLoad_1_6_ready                 (tcArray_io_matBLoad_1_6_ready                      ), //o
    .io_matBLoad_1_6_payload               (data2TcarrayRow_18_payload[319:0]                  ), //i
    .io_matBLoad_1_7_valid                 (data2TcarrayRow_19_valid                           ), //i
    .io_matBLoad_1_7_ready                 (tcArray_io_matBLoad_1_7_ready                      ), //o
    .io_matBLoad_1_7_payload               (data2TcarrayRow_19_payload[319:0]                  ), //i
    .io_matBLoad_1_8_valid                 (data2TcarrayRow_20_valid                           ), //i
    .io_matBLoad_1_8_ready                 (tcArray_io_matBLoad_1_8_ready                      ), //o
    .io_matBLoad_1_8_payload               (data2TcarrayRow_20_payload[319:0]                  ), //i
    .io_matBLoad_1_9_valid                 (data2TcarrayRow_21_valid                           ), //i
    .io_matBLoad_1_9_ready                 (tcArray_io_matBLoad_1_9_ready                      ), //o
    .io_matBLoad_1_9_payload               (data2TcarrayRow_21_payload[319:0]                  ), //i
    .io_matBLoad_1_10_valid                (data2TcarrayRow_22_valid                           ), //i
    .io_matBLoad_1_10_ready                (tcArray_io_matBLoad_1_10_ready                     ), //o
    .io_matBLoad_1_10_payload              (data2TcarrayRow_22_payload[319:0]                  ), //i
    .io_matBLoad_1_11_valid                (data2TcarrayRow_23_valid                           ), //i
    .io_matBLoad_1_11_ready                (tcArray_io_matBLoad_1_11_ready                     ), //o
    .io_matBLoad_1_11_payload              (data2TcarrayRow_23_payload[319:0]                  ), //i
    .io_matBLoad_2_0_valid                 (data2TcarrayRow_24_valid                           ), //i
    .io_matBLoad_2_0_ready                 (tcArray_io_matBLoad_2_0_ready                      ), //o
    .io_matBLoad_2_0_payload               (data2TcarrayRow_24_payload[319:0]                  ), //i
    .io_matBLoad_2_1_valid                 (data2TcarrayRow_25_valid                           ), //i
    .io_matBLoad_2_1_ready                 (tcArray_io_matBLoad_2_1_ready                      ), //o
    .io_matBLoad_2_1_payload               (data2TcarrayRow_25_payload[319:0]                  ), //i
    .io_matBLoad_2_2_valid                 (data2TcarrayRow_26_valid                           ), //i
    .io_matBLoad_2_2_ready                 (tcArray_io_matBLoad_2_2_ready                      ), //o
    .io_matBLoad_2_2_payload               (data2TcarrayRow_26_payload[319:0]                  ), //i
    .io_matBLoad_2_3_valid                 (data2TcarrayRow_27_valid                           ), //i
    .io_matBLoad_2_3_ready                 (tcArray_io_matBLoad_2_3_ready                      ), //o
    .io_matBLoad_2_3_payload               (data2TcarrayRow_27_payload[319:0]                  ), //i
    .io_matBLoad_2_4_valid                 (data2TcarrayRow_28_valid                           ), //i
    .io_matBLoad_2_4_ready                 (tcArray_io_matBLoad_2_4_ready                      ), //o
    .io_matBLoad_2_4_payload               (data2TcarrayRow_28_payload[319:0]                  ), //i
    .io_matBLoad_2_5_valid                 (data2TcarrayRow_29_valid                           ), //i
    .io_matBLoad_2_5_ready                 (tcArray_io_matBLoad_2_5_ready                      ), //o
    .io_matBLoad_2_5_payload               (data2TcarrayRow_29_payload[319:0]                  ), //i
    .io_matBLoad_2_6_valid                 (data2TcarrayRow_30_valid                           ), //i
    .io_matBLoad_2_6_ready                 (tcArray_io_matBLoad_2_6_ready                      ), //o
    .io_matBLoad_2_6_payload               (data2TcarrayRow_30_payload[319:0]                  ), //i
    .io_matBLoad_2_7_valid                 (data2TcarrayRow_31_valid                           ), //i
    .io_matBLoad_2_7_ready                 (tcArray_io_matBLoad_2_7_ready                      ), //o
    .io_matBLoad_2_7_payload               (data2TcarrayRow_31_payload[319:0]                  ), //i
    .io_matBLoad_2_8_valid                 (data2TcarrayRow_32_valid                           ), //i
    .io_matBLoad_2_8_ready                 (tcArray_io_matBLoad_2_8_ready                      ), //o
    .io_matBLoad_2_8_payload               (data2TcarrayRow_32_payload[319:0]                  ), //i
    .io_matBLoad_2_9_valid                 (data2TcarrayRow_33_valid                           ), //i
    .io_matBLoad_2_9_ready                 (tcArray_io_matBLoad_2_9_ready                      ), //o
    .io_matBLoad_2_9_payload               (data2TcarrayRow_33_payload[319:0]                  ), //i
    .io_matBLoad_2_10_valid                (data2TcarrayRow_34_valid                           ), //i
    .io_matBLoad_2_10_ready                (tcArray_io_matBLoad_2_10_ready                     ), //o
    .io_matBLoad_2_10_payload              (data2TcarrayRow_34_payload[319:0]                  ), //i
    .io_matBLoad_2_11_valid                (data2TcarrayRow_35_valid                           ), //i
    .io_matBLoad_2_11_ready                (tcArray_io_matBLoad_2_11_ready                     ), //o
    .io_matBLoad_2_11_payload              (data2TcarrayRow_35_payload[319:0]                  ), //i
    .io_matBLoad_3_0_valid                 (data2TcarrayRow_36_valid                           ), //i
    .io_matBLoad_3_0_ready                 (tcArray_io_matBLoad_3_0_ready                      ), //o
    .io_matBLoad_3_0_payload               (data2TcarrayRow_36_payload[319:0]                  ), //i
    .io_matBLoad_3_1_valid                 (data2TcarrayRow_37_valid                           ), //i
    .io_matBLoad_3_1_ready                 (tcArray_io_matBLoad_3_1_ready                      ), //o
    .io_matBLoad_3_1_payload               (data2TcarrayRow_37_payload[319:0]                  ), //i
    .io_matBLoad_3_2_valid                 (data2TcarrayRow_38_valid                           ), //i
    .io_matBLoad_3_2_ready                 (tcArray_io_matBLoad_3_2_ready                      ), //o
    .io_matBLoad_3_2_payload               (data2TcarrayRow_38_payload[319:0]                  ), //i
    .io_matBLoad_3_3_valid                 (data2TcarrayRow_39_valid                           ), //i
    .io_matBLoad_3_3_ready                 (tcArray_io_matBLoad_3_3_ready                      ), //o
    .io_matBLoad_3_3_payload               (data2TcarrayRow_39_payload[319:0]                  ), //i
    .io_matBLoad_3_4_valid                 (data2TcarrayRow_40_valid                           ), //i
    .io_matBLoad_3_4_ready                 (tcArray_io_matBLoad_3_4_ready                      ), //o
    .io_matBLoad_3_4_payload               (data2TcarrayRow_40_payload[319:0]                  ), //i
    .io_matBLoad_3_5_valid                 (data2TcarrayRow_41_valid                           ), //i
    .io_matBLoad_3_5_ready                 (tcArray_io_matBLoad_3_5_ready                      ), //o
    .io_matBLoad_3_5_payload               (data2TcarrayRow_41_payload[319:0]                  ), //i
    .io_matBLoad_3_6_valid                 (data2TcarrayRow_42_valid                           ), //i
    .io_matBLoad_3_6_ready                 (tcArray_io_matBLoad_3_6_ready                      ), //o
    .io_matBLoad_3_6_payload               (data2TcarrayRow_42_payload[319:0]                  ), //i
    .io_matBLoad_3_7_valid                 (data2TcarrayRow_43_valid                           ), //i
    .io_matBLoad_3_7_ready                 (tcArray_io_matBLoad_3_7_ready                      ), //o
    .io_matBLoad_3_7_payload               (data2TcarrayRow_43_payload[319:0]                  ), //i
    .io_matBLoad_3_8_valid                 (data2TcarrayRow_44_valid                           ), //i
    .io_matBLoad_3_8_ready                 (tcArray_io_matBLoad_3_8_ready                      ), //o
    .io_matBLoad_3_8_payload               (data2TcarrayRow_44_payload[319:0]                  ), //i
    .io_matBLoad_3_9_valid                 (data2TcarrayRow_45_valid                           ), //i
    .io_matBLoad_3_9_ready                 (tcArray_io_matBLoad_3_9_ready                      ), //o
    .io_matBLoad_3_9_payload               (data2TcarrayRow_45_payload[319:0]                  ), //i
    .io_matBLoad_3_10_valid                (data2TcarrayRow_46_valid                           ), //i
    .io_matBLoad_3_10_ready                (tcArray_io_matBLoad_3_10_ready                     ), //o
    .io_matBLoad_3_10_payload              (data2TcarrayRow_46_payload[319:0]                  ), //i
    .io_matBLoad_3_11_valid                (data2TcarrayRow_47_valid                           ), //i
    .io_matBLoad_3_11_payload              (data2TcarrayRow_47_payload[319:0]                  ), //i
    .io_calEn                              (tcArray_io_calEn                                   ), //i
    .io_configPorts_matAColSubGrpLen       (tcArray_io_configPorts_matAColSubGrpLen[15:0]      ), //i
    .io_configPorts_matBColsPerTccRow      (tcArray_io_configPorts_matBColsPerTccRow[15:0]     ), //i
    .io_configPorts_tccRowBufferCnterRange (tcArray_io_configPorts_tccRowBufferCnterRange[15:0]), //i
    .io_configPorts_tccColBufferCnterRange (tcArray_io_configPorts_tccColBufferCnterRange[15:0]), //i
    .io_res_0_valid                        (tcArray_io_res_0_valid                             ), //o
    .io_res_0_ready                        (_zz_io_res_0_ready                                 ), //i
    .io_res_0_payload                      (tcArray_io_res_0_payload[71:0]                     ), //o
    .io_res_1_valid                        (tcArray_io_res_1_valid                             ), //o
    .io_res_1_ready                        (_zz_io_res_0_ready                                 ), //i
    .io_res_1_payload                      (tcArray_io_res_1_payload[71:0]                     ), //o
    .io_res_2_valid                        (tcArray_io_res_2_valid                             ), //o
    .io_res_2_ready                        (_zz_io_res_2_ready                                 ), //i
    .io_res_2_payload                      (tcArray_io_res_2_payload[71:0]                     ), //o
    .io_res_3_valid                        (tcArray_io_res_3_valid                             ), //o
    .io_res_3_ready                        (_zz_io_res_2_ready                                 ), //i
    .io_res_3_payload                      (tcArray_io_res_3_payload[71:0]                     ), //o
    .clk                                   (clk                                                ), //i
    .clrn                                  (clrn                                               )  //i
  );
  IndexGenerator idxGenerator (
    .io_seqIn_0   (idxGenerator_io_seqIn_0[10:0]  ), //i
    .io_seqIn_1   (idxGenerator_io_seqIn_1[10:0]  ), //i
    .io_seqIn_2   (idxGenerator_io_seqIn_2[10:0]  ), //i
    .io_seqIn_3   (idxGenerator_io_seqIn_3[10:0]  ), //i
    .io_seqIn_4   (idxGenerator_io_seqIn_4[10:0]  ), //i
    .io_seqIn_5   (idxGenerator_io_seqIn_5[10:0]  ), //i
    .io_seqIn_6   (idxGenerator_io_seqIn_6[10:0]  ), //i
    .io_seqIn_7   (idxGenerator_io_seqIn_7[10:0]  ), //i
    .io_seqIn_8   (idxGenerator_io_seqIn_8[10:0]  ), //i
    .io_seqIn_9   (idxGenerator_io_seqIn_9[10:0]  ), //i
    .io_seqIn_10  (idxGenerator_io_seqIn_10[10:0] ), //i
    .io_seqIn_11  (idxGenerator_io_seqIn_11[10:0] ), //i
    .io_seqOut_0  (idxGenerator_io_seqOut_0[10:0] ), //o
    .io_seqOut_1  (idxGenerator_io_seqOut_1[10:0] ), //o
    .io_seqOut_2  (idxGenerator_io_seqOut_2[10:0] ), //o
    .io_seqOut_3  (idxGenerator_io_seqOut_3[10:0] ), //o
    .io_seqOut_4  (idxGenerator_io_seqOut_4[10:0] ), //o
    .io_seqOut_5  (idxGenerator_io_seqOut_5[10:0] ), //o
    .io_seqOut_6  (idxGenerator_io_seqOut_6[10:0] ), //o
    .io_seqOut_7  (idxGenerator_io_seqOut_7[10:0] ), //o
    .io_seqOut_8  (idxGenerator_io_seqOut_8[10:0] ), //o
    .io_seqOut_9  (idxGenerator_io_seqOut_9[10:0] ), //o
    .io_seqOut_10 (idxGenerator_io_seqOut_10[10:0]), //o
    .io_seqOut_11 (idxGenerator_io_seqOut_11[10:0]), //o
    .io_seqOut_12 (idxGenerator_io_seqOut_12[10:0]), //o
    .io_seqOut_13 (idxGenerator_io_seqOut_13[10:0]), //o
    .io_seqOut_14 (idxGenerator_io_seqOut_14[10:0]), //o
    .io_seqOut_15 (idxGenerator_io_seqOut_15[10:0]), //o
    .clk          (clk                            ), //i
    .clrn         (clrn                           )  //i
  );
  assign dataIn_0_payload = combinedDataIn0[319 : 0];
  assign dataIn_0_valid = selectTcarrayIn_regNext;
  assign dataIn_1_valid = selectTcarrayIn_regNext_1;
  assign dataIn_1_payload = combinedDataIn1[319 : 0];
  assign data2TcarrayCol_0_valid = dataInColShiftRegs_io_dataOut_0_valid;
  assign data2TcarrayCol_0_payload = dataInColShiftRegs_io_dataOut_0_payload;
  assign data2TcarrayCol_1_valid = dataInColShiftRegs_io_dataOut_1_valid;
  assign data2TcarrayCol_1_payload = dataInColShiftRegs_io_dataOut_1_payload;
  assign data2TcarrayCol_2_valid = dataInColShiftRegs_io_dataOut_2_valid;
  assign data2TcarrayCol_2_payload = dataInColShiftRegs_io_dataOut_2_payload;
  assign data2TcarrayCol_3_valid = dataInColShiftRegs_io_dataOut_3_valid;
  assign data2TcarrayCol_3_payload = dataInColShiftRegs_io_dataOut_3_payload;
  assign data2TcarrayCol_4_valid = dataInColShiftRegs_io_dataOut_4_valid;
  assign data2TcarrayCol_4_payload = dataInColShiftRegs_io_dataOut_4_payload;
  assign data2TcarrayCol_5_valid = dataInColShiftRegs_io_dataOut_5_valid;
  assign data2TcarrayCol_5_payload = dataInColShiftRegs_io_dataOut_5_payload;
  assign data2TcarrayCol_6_valid = dataInColShiftRegs_io_dataOut_6_valid;
  assign data2TcarrayCol_6_payload = dataInColShiftRegs_io_dataOut_6_payload;
  assign data2TcarrayCol_7_valid = dataInColShiftRegs_io_dataOut_7_valid;
  assign data2TcarrayCol_7_payload = dataInColShiftRegs_io_dataOut_7_payload;
  assign data2TcarrayCol_8_valid = dataInColShiftRegs_io_dataOut_8_valid;
  assign data2TcarrayCol_8_payload = dataInColShiftRegs_io_dataOut_8_payload;
  assign data2TcarrayCol_9_valid = dataInColShiftRegs_io_dataOut_9_valid;
  assign data2TcarrayCol_9_payload = dataInColShiftRegs_io_dataOut_9_payload;
  assign data2TcarrayCol_10_valid = dataInColShiftRegs_io_dataOut_10_valid;
  assign data2TcarrayCol_10_payload = dataInColShiftRegs_io_dataOut_10_payload;
  assign data2TcarrayCol_11_valid = dataInColShiftRegs_io_dataOut_11_valid;
  assign data2TcarrayCol_11_payload = dataInColShiftRegs_io_dataOut_11_payload;
  assign data2TcarrayRow_0_valid = dataInRowShiftRegs_io_dataOut_0_valid;
  assign data2TcarrayRow_0_payload = dataInRowShiftRegs_io_dataOut_0_payload;
  assign data2TcarrayRow_1_valid = dataInRowShiftRegs_io_dataOut_1_valid;
  assign data2TcarrayRow_1_payload = dataInRowShiftRegs_io_dataOut_1_payload;
  assign data2TcarrayRow_2_valid = dataInRowShiftRegs_io_dataOut_2_valid;
  assign data2TcarrayRow_2_payload = dataInRowShiftRegs_io_dataOut_2_payload;
  assign data2TcarrayRow_3_valid = dataInRowShiftRegs_io_dataOut_3_valid;
  assign data2TcarrayRow_3_payload = dataInRowShiftRegs_io_dataOut_3_payload;
  assign data2TcarrayRow_4_valid = dataInRowShiftRegs_io_dataOut_4_valid;
  assign data2TcarrayRow_4_payload = dataInRowShiftRegs_io_dataOut_4_payload;
  assign data2TcarrayRow_5_valid = dataInRowShiftRegs_io_dataOut_5_valid;
  assign data2TcarrayRow_5_payload = dataInRowShiftRegs_io_dataOut_5_payload;
  assign data2TcarrayRow_6_valid = dataInRowShiftRegs_io_dataOut_6_valid;
  assign data2TcarrayRow_6_payload = dataInRowShiftRegs_io_dataOut_6_payload;
  assign data2TcarrayRow_7_valid = dataInRowShiftRegs_io_dataOut_7_valid;
  assign data2TcarrayRow_7_payload = dataInRowShiftRegs_io_dataOut_7_payload;
  assign data2TcarrayRow_8_valid = dataInRowShiftRegs_io_dataOut_8_valid;
  assign data2TcarrayRow_8_payload = dataInRowShiftRegs_io_dataOut_8_payload;
  assign data2TcarrayRow_9_valid = dataInRowShiftRegs_io_dataOut_9_valid;
  assign data2TcarrayRow_9_payload = dataInRowShiftRegs_io_dataOut_9_payload;
  assign data2TcarrayRow_10_valid = dataInRowShiftRegs_io_dataOut_10_valid;
  assign data2TcarrayRow_10_payload = dataInRowShiftRegs_io_dataOut_10_payload;
  assign data2TcarrayRow_11_valid = dataInRowShiftRegs_io_dataOut_11_valid;
  assign data2TcarrayRow_11_payload = dataInRowShiftRegs_io_dataOut_11_payload;
  assign data2TcarrayRow_12_valid = dataInRowShiftRegs_io_dataOut_12_valid;
  assign data2TcarrayRow_12_payload = dataInRowShiftRegs_io_dataOut_12_payload;
  assign data2TcarrayRow_13_valid = dataInRowShiftRegs_io_dataOut_13_valid;
  assign data2TcarrayRow_13_payload = dataInRowShiftRegs_io_dataOut_13_payload;
  assign data2TcarrayRow_14_valid = dataInRowShiftRegs_io_dataOut_14_valid;
  assign data2TcarrayRow_14_payload = dataInRowShiftRegs_io_dataOut_14_payload;
  assign data2TcarrayRow_15_valid = dataInRowShiftRegs_io_dataOut_15_valid;
  assign data2TcarrayRow_15_payload = dataInRowShiftRegs_io_dataOut_15_payload;
  assign data2TcarrayRow_16_valid = dataInRowShiftRegs_io_dataOut_16_valid;
  assign data2TcarrayRow_16_payload = dataInRowShiftRegs_io_dataOut_16_payload;
  assign data2TcarrayRow_17_valid = dataInRowShiftRegs_io_dataOut_17_valid;
  assign data2TcarrayRow_17_payload = dataInRowShiftRegs_io_dataOut_17_payload;
  assign data2TcarrayRow_18_valid = dataInRowShiftRegs_io_dataOut_18_valid;
  assign data2TcarrayRow_18_payload = dataInRowShiftRegs_io_dataOut_18_payload;
  assign data2TcarrayRow_19_valid = dataInRowShiftRegs_io_dataOut_19_valid;
  assign data2TcarrayRow_19_payload = dataInRowShiftRegs_io_dataOut_19_payload;
  assign data2TcarrayRow_20_valid = dataInRowShiftRegs_io_dataOut_20_valid;
  assign data2TcarrayRow_20_payload = dataInRowShiftRegs_io_dataOut_20_payload;
  assign data2TcarrayRow_21_valid = dataInRowShiftRegs_io_dataOut_21_valid;
  assign data2TcarrayRow_21_payload = dataInRowShiftRegs_io_dataOut_21_payload;
  assign data2TcarrayRow_22_valid = dataInRowShiftRegs_io_dataOut_22_valid;
  assign data2TcarrayRow_22_payload = dataInRowShiftRegs_io_dataOut_22_payload;
  assign data2TcarrayRow_23_valid = dataInRowShiftRegs_io_dataOut_23_valid;
  assign data2TcarrayRow_23_payload = dataInRowShiftRegs_io_dataOut_23_payload;
  assign data2TcarrayRow_24_valid = dataInRowShiftRegs_io_dataOut_24_valid;
  assign data2TcarrayRow_24_payload = dataInRowShiftRegs_io_dataOut_24_payload;
  assign data2TcarrayRow_25_valid = dataInRowShiftRegs_io_dataOut_25_valid;
  assign data2TcarrayRow_25_payload = dataInRowShiftRegs_io_dataOut_25_payload;
  assign data2TcarrayRow_26_valid = dataInRowShiftRegs_io_dataOut_26_valid;
  assign data2TcarrayRow_26_payload = dataInRowShiftRegs_io_dataOut_26_payload;
  assign data2TcarrayRow_27_valid = dataInRowShiftRegs_io_dataOut_27_valid;
  assign data2TcarrayRow_27_payload = dataInRowShiftRegs_io_dataOut_27_payload;
  assign data2TcarrayRow_28_valid = dataInRowShiftRegs_io_dataOut_28_valid;
  assign data2TcarrayRow_28_payload = dataInRowShiftRegs_io_dataOut_28_payload;
  assign data2TcarrayRow_29_valid = dataInRowShiftRegs_io_dataOut_29_valid;
  assign data2TcarrayRow_29_payload = dataInRowShiftRegs_io_dataOut_29_payload;
  assign data2TcarrayRow_30_valid = dataInRowShiftRegs_io_dataOut_30_valid;
  assign data2TcarrayRow_30_payload = dataInRowShiftRegs_io_dataOut_30_payload;
  assign data2TcarrayRow_31_valid = dataInRowShiftRegs_io_dataOut_31_valid;
  assign data2TcarrayRow_31_payload = dataInRowShiftRegs_io_dataOut_31_payload;
  assign data2TcarrayRow_32_valid = dataInRowShiftRegs_io_dataOut_32_valid;
  assign data2TcarrayRow_32_payload = dataInRowShiftRegs_io_dataOut_32_payload;
  assign data2TcarrayRow_33_valid = dataInRowShiftRegs_io_dataOut_33_valid;
  assign data2TcarrayRow_33_payload = dataInRowShiftRegs_io_dataOut_33_payload;
  assign data2TcarrayRow_34_valid = dataInRowShiftRegs_io_dataOut_34_valid;
  assign data2TcarrayRow_34_payload = dataInRowShiftRegs_io_dataOut_34_payload;
  assign data2TcarrayRow_35_valid = dataInRowShiftRegs_io_dataOut_35_valid;
  assign data2TcarrayRow_35_payload = dataInRowShiftRegs_io_dataOut_35_payload;
  assign data2TcarrayRow_36_valid = dataInRowShiftRegs_io_dataOut_36_valid;
  assign data2TcarrayRow_36_payload = dataInRowShiftRegs_io_dataOut_36_payload;
  assign data2TcarrayRow_37_valid = dataInRowShiftRegs_io_dataOut_37_valid;
  assign data2TcarrayRow_37_payload = dataInRowShiftRegs_io_dataOut_37_payload;
  assign data2TcarrayRow_38_valid = dataInRowShiftRegs_io_dataOut_38_valid;
  assign data2TcarrayRow_38_payload = dataInRowShiftRegs_io_dataOut_38_payload;
  assign data2TcarrayRow_39_valid = dataInRowShiftRegs_io_dataOut_39_valid;
  assign data2TcarrayRow_39_payload = dataInRowShiftRegs_io_dataOut_39_payload;
  assign data2TcarrayRow_40_valid = dataInRowShiftRegs_io_dataOut_40_valid;
  assign data2TcarrayRow_40_payload = dataInRowShiftRegs_io_dataOut_40_payload;
  assign data2TcarrayRow_41_valid = dataInRowShiftRegs_io_dataOut_41_valid;
  assign data2TcarrayRow_41_payload = dataInRowShiftRegs_io_dataOut_41_payload;
  assign data2TcarrayRow_42_valid = dataInRowShiftRegs_io_dataOut_42_valid;
  assign data2TcarrayRow_42_payload = dataInRowShiftRegs_io_dataOut_42_payload;
  assign data2TcarrayRow_43_valid = dataInRowShiftRegs_io_dataOut_43_valid;
  assign data2TcarrayRow_43_payload = dataInRowShiftRegs_io_dataOut_43_payload;
  assign data2TcarrayRow_44_valid = dataInRowShiftRegs_io_dataOut_44_valid;
  assign data2TcarrayRow_44_payload = dataInRowShiftRegs_io_dataOut_44_payload;
  assign data2TcarrayRow_45_valid = dataInRowShiftRegs_io_dataOut_45_valid;
  assign data2TcarrayRow_45_payload = dataInRowShiftRegs_io_dataOut_45_payload;
  assign data2TcarrayRow_46_valid = dataInRowShiftRegs_io_dataOut_46_valid;
  assign data2TcarrayRow_46_payload = dataInRowShiftRegs_io_dataOut_46_payload;
  assign data2TcarrayRow_47_valid = dataInRowShiftRegs_io_dataOut_47_valid;
  assign data2TcarrayRow_47_payload = dataInRowShiftRegs_io_dataOut_47_payload;
  assign data2TcarrayCol_0_ready = tcArray_io_matALoad_0_ready;
  assign data2TcarrayCol_1_ready = tcArray_io_matALoad_1_ready;
  assign data2TcarrayCol_2_ready = tcArray_io_matALoad_2_ready;
  assign data2TcarrayCol_3_ready = tcArray_io_matALoad_3_ready;
  assign data2TcarrayCol_4_ready = tcArray_io_matALoad_4_ready;
  assign data2TcarrayCol_5_ready = tcArray_io_matALoad_5_ready;
  assign data2TcarrayCol_6_ready = tcArray_io_matALoad_6_ready;
  assign data2TcarrayCol_7_ready = tcArray_io_matALoad_7_ready;
  assign data2TcarrayCol_8_ready = tcArray_io_matALoad_8_ready;
  assign data2TcarrayCol_9_ready = tcArray_io_matALoad_9_ready;
  assign data2TcarrayCol_10_ready = tcArray_io_matALoad_10_ready;
  assign data2TcarrayRow_0_ready = tcArray_io_matBLoad_0_0_ready;
  assign data2TcarrayRow_1_ready = tcArray_io_matBLoad_0_1_ready;
  assign data2TcarrayRow_2_ready = tcArray_io_matBLoad_0_2_ready;
  assign data2TcarrayRow_3_ready = tcArray_io_matBLoad_0_3_ready;
  assign data2TcarrayRow_4_ready = tcArray_io_matBLoad_0_4_ready;
  assign data2TcarrayRow_5_ready = tcArray_io_matBLoad_0_5_ready;
  assign data2TcarrayRow_6_ready = tcArray_io_matBLoad_0_6_ready;
  assign data2TcarrayRow_7_ready = tcArray_io_matBLoad_0_7_ready;
  assign data2TcarrayRow_8_ready = tcArray_io_matBLoad_0_8_ready;
  assign data2TcarrayRow_9_ready = tcArray_io_matBLoad_0_9_ready;
  assign data2TcarrayRow_10_ready = tcArray_io_matBLoad_0_10_ready;
  assign data2TcarrayRow_11_ready = tcArray_io_matBLoad_0_11_ready;
  assign data2TcarrayRow_12_ready = tcArray_io_matBLoad_1_0_ready;
  assign data2TcarrayRow_13_ready = tcArray_io_matBLoad_1_1_ready;
  assign data2TcarrayRow_14_ready = tcArray_io_matBLoad_1_2_ready;
  assign data2TcarrayRow_15_ready = tcArray_io_matBLoad_1_3_ready;
  assign data2TcarrayRow_16_ready = tcArray_io_matBLoad_1_4_ready;
  assign data2TcarrayRow_17_ready = tcArray_io_matBLoad_1_5_ready;
  assign data2TcarrayRow_18_ready = tcArray_io_matBLoad_1_6_ready;
  assign data2TcarrayRow_19_ready = tcArray_io_matBLoad_1_7_ready;
  assign data2TcarrayRow_20_ready = tcArray_io_matBLoad_1_8_ready;
  assign data2TcarrayRow_21_ready = tcArray_io_matBLoad_1_9_ready;
  assign data2TcarrayRow_22_ready = tcArray_io_matBLoad_1_10_ready;
  assign data2TcarrayRow_23_ready = tcArray_io_matBLoad_1_11_ready;
  assign data2TcarrayRow_24_ready = tcArray_io_matBLoad_2_0_ready;
  assign data2TcarrayRow_25_ready = tcArray_io_matBLoad_2_1_ready;
  assign data2TcarrayRow_26_ready = tcArray_io_matBLoad_2_2_ready;
  assign data2TcarrayRow_27_ready = tcArray_io_matBLoad_2_3_ready;
  assign data2TcarrayRow_28_ready = tcArray_io_matBLoad_2_4_ready;
  assign data2TcarrayRow_29_ready = tcArray_io_matBLoad_2_5_ready;
  assign data2TcarrayRow_30_ready = tcArray_io_matBLoad_2_6_ready;
  assign data2TcarrayRow_31_ready = tcArray_io_matBLoad_2_7_ready;
  assign data2TcarrayRow_32_ready = tcArray_io_matBLoad_2_8_ready;
  assign data2TcarrayRow_33_ready = tcArray_io_matBLoad_2_9_ready;
  assign data2TcarrayRow_34_ready = tcArray_io_matBLoad_2_10_ready;
  assign data2TcarrayRow_35_ready = tcArray_io_matBLoad_2_11_ready;
  assign data2TcarrayRow_36_ready = tcArray_io_matBLoad_3_0_ready;
  assign data2TcarrayRow_37_ready = tcArray_io_matBLoad_3_1_ready;
  assign data2TcarrayRow_38_ready = tcArray_io_matBLoad_3_2_ready;
  assign data2TcarrayRow_39_ready = tcArray_io_matBLoad_3_3_ready;
  assign data2TcarrayRow_40_ready = tcArray_io_matBLoad_3_4_ready;
  assign data2TcarrayRow_41_ready = tcArray_io_matBLoad_3_5_ready;
  assign data2TcarrayRow_42_ready = tcArray_io_matBLoad_3_6_ready;
  assign data2TcarrayRow_43_ready = tcArray_io_matBLoad_3_7_ready;
  assign data2TcarrayRow_44_ready = tcArray_io_matBLoad_3_8_ready;
  assign data2TcarrayRow_45_ready = tcArray_io_matBLoad_3_9_ready;
  assign data2TcarrayRow_46_ready = tcArray_io_matBLoad_3_10_ready;
  assign tcArray_io_configPorts_tccColBufferCnterRange = 16'h0180;
  assign tcArray_io_configPorts_tccRowBufferCnterRange = 16'h2400;
  assign tcArray_io_configPorts_matBColsPerTccRow = 16'h0480;
  assign tcArray_io_configPorts_matAColSubGrpLen = 16'h0008;
  assign _zz_io_calEn = start[0];
  assign tcArray_io_calEn = (_zz_io_calEn && (! _zz_io_calEn_1));
  assign _zz_io_seqIn_0 = data_tcarray_in_4[131 : 0];
  assign idxGenerator_io_seqIn_0 = _zz_io_seqIn_0[10 : 0];
  assign idxGenerator_io_seqIn_1 = _zz_io_seqIn_0[21 : 11];
  assign idxGenerator_io_seqIn_2 = _zz_io_seqIn_0[32 : 22];
  assign idxGenerator_io_seqIn_3 = _zz_io_seqIn_0[43 : 33];
  assign idxGenerator_io_seqIn_4 = _zz_io_seqIn_0[54 : 44];
  assign idxGenerator_io_seqIn_5 = _zz_io_seqIn_0[65 : 55];
  assign idxGenerator_io_seqIn_6 = _zz_io_seqIn_0[76 : 66];
  assign idxGenerator_io_seqIn_7 = _zz_io_seqIn_0[87 : 77];
  assign idxGenerator_io_seqIn_8 = _zz_io_seqIn_0[98 : 88];
  assign idxGenerator_io_seqIn_9 = _zz_io_seqIn_0[109 : 99];
  assign idxGenerator_io_seqIn_10 = _zz_io_seqIn_0[120 : 110];
  assign idxGenerator_io_seqIn_11 = _zz_io_seqIn_0[131 : 121];
  assign switch_Misc_l241 = idx_rd_addr[3 : 0];
  always @(*) begin
    case(switch_Misc_l241)
      4'b0000 : begin
        _zz_idx_res = idxGeneratorRes_0;
      end
      4'b0001 : begin
        _zz_idx_res = idxGeneratorRes_1;
      end
      4'b0010 : begin
        _zz_idx_res = idxGeneratorRes_2;
      end
      4'b0011 : begin
        _zz_idx_res = idxGeneratorRes_3;
      end
      4'b0100 : begin
        _zz_idx_res = idxGeneratorRes_4;
      end
      4'b0101 : begin
        _zz_idx_res = idxGeneratorRes_5;
      end
      4'b0110 : begin
        _zz_idx_res = idxGeneratorRes_6;
      end
      4'b0111 : begin
        _zz_idx_res = idxGeneratorRes_7;
      end
      4'b1000 : begin
        _zz_idx_res = idxGeneratorRes_8;
      end
      4'b1001 : begin
        _zz_idx_res = idxGeneratorRes_9;
      end
      4'b1010 : begin
        _zz_idx_res = idxGeneratorRes_10;
      end
      4'b1011 : begin
        _zz_idx_res = idxGeneratorRes_11;
      end
      4'b1100 : begin
        _zz_idx_res = idxGeneratorRes_12;
      end
      4'b1101 : begin
        _zz_idx_res = idxGeneratorRes_13;
      end
      4'b1110 : begin
        _zz_idx_res = idxGeneratorRes_14;
      end
      default : begin
        _zz_idx_res = idxGeneratorRes_15;
      end
    endcase
  end

  assign idx_res = _zz_idx_res;
  always @(*) begin
    rdFsm_wantStart = 1'b0;
    case(rdFsm_stateReg)
      rdFsm_enumDef_sIdle : begin
      end
      rdFsm_enumDef_sWait : begin
      end
      rdFsm_enumDef_sSend : begin
      end
      default : begin
        rdFsm_wantStart = 1'b1;
      end
    endcase
  end

  assign rdFsm_wantKill = 1'b0;
  always @(*) begin
    rdFsm_rdWordCounter_willIncrement = 1'b0;
    case(rdFsm_stateReg)
      rdFsm_enumDef_sIdle : begin
      end
      rdFsm_enumDef_sWait : begin
      end
      rdFsm_enumDef_sSend : begin
        rdFsm_rdWordCounter_willIncrement = 1'b1;
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    rdFsm_rdWordCounter_willClear = 1'b0;
    if(when_StateMachine_l253) begin
      rdFsm_rdWordCounter_willClear = 1'b1;
    end
  end

  assign rdFsm_rdWordCounter_willOverflowIfInc = (rdFsm_rdWordCounter_value == 6'h34);
  assign rdFsm_rdWordCounter_willOverflow = (rdFsm_rdWordCounter_willOverflowIfInc && rdFsm_rdWordCounter_willIncrement);
  always @(*) begin
    if(rdFsm_rdWordCounter_willOverflow) begin
      rdFsm_rdWordCounter_valueNext = 6'h00;
    end else begin
      rdFsm_rdWordCounter_valueNext = (rdFsm_rdWordCounter_value + _zz_rdFsm_rdWordCounter_valueNext);
    end
    if(rdFsm_rdWordCounter_willClear) begin
      rdFsm_rdWordCounter_valueNext = 6'h00;
    end
  end

  always @(*) begin
    rdFsm_startAssertCounter_willIncrement = 1'b0;
    case(rdFsm_stateReg)
      rdFsm_enumDef_sIdle : begin
      end
      rdFsm_enumDef_sWait : begin
        if(when_tensor_core_array_wrapper_l156) begin
          rdFsm_startAssertCounter_willIncrement = 1'b1;
        end
      end
      rdFsm_enumDef_sSend : begin
      end
      default : begin
      end
    endcase
  end

  always @(*) begin
    rdFsm_startAssertCounter_willClear = 1'b0;
    if(when_StateMachine_l253) begin
      rdFsm_startAssertCounter_willClear = 1'b1;
    end
  end

  assign rdFsm_startAssertCounter_willOverflowIfInc = (rdFsm_startAssertCounter_value == 2'b11);
  assign rdFsm_startAssertCounter_willOverflow = (rdFsm_startAssertCounter_willOverflowIfInc && rdFsm_startAssertCounter_willIncrement);
  always @(*) begin
    rdFsm_startAssertCounter_valueNext = (rdFsm_startAssertCounter_value + _zz_rdFsm_startAssertCounter_valueNext);
    if(rdFsm_startAssertCounter_willClear) begin
      rdFsm_startAssertCounter_valueNext = 2'b00;
    end
  end

  always @(*) begin
    _zz_start_tcarray_out_0 = 1'b0;
    if(when_tensor_core_array_wrapper_l190) begin
      _zz_start_tcarray_out_0 = 1'b1;
    end
  end

  always @(*) begin
    _zz_1 = 1'b0;
    if(!when_tensor_core_array_wrapper_l190) begin
      if(when_tensor_core_array_wrapper_l192) begin
        _zz_1 = 1'b1;
      end
    end
  end

  assign _zz_start_tcarray_out_0_3 = (_zz_start_tcarray_out_0_2 == 2'b11);
  always @(*) begin
    _zz_start_tcarray_out_0_1 = (_zz_start_tcarray_out_0_2 + _zz__zz_start_tcarray_out_0_1);
    if(_zz_1) begin
      _zz_start_tcarray_out_0_1 = 2'b00;
    end
  end

  assign _zz_select_tcarray_out_0 = (tcArray_io_res_0_valid && tcArray_io_res_1_valid);
  assign when_tensor_core_array_wrapper_l190 = ((_zz_select_tcarray_out_0 && (! _zz_when_tensor_core_array_wrapper_l190)) && (! _zz_start_tcarray_out_0_3));
  assign when_tensor_core_array_wrapper_l192 = (_zz_select_tcarray_out_0 && _zz_start_tcarray_out_0_3);
  assign _zz_io_res_0_ready = _zz_select_tcarray_out_0_1;
  assign start_tcarray_out_0 = (! _zz_start_tcarray_out_0_3);
  assign select_tcarray_out_0 = (_zz_select_tcarray_out_0_1 && _zz_select_tcarray_out_0);
  assign addr_tcarray_out_0 = wr_addr;
  assign data_tcarray_out_0 = {112'd0, _zz_data_tcarray_out_0};
  always @(*) begin
    _zz_start_tcarray_out_1 = 1'b0;
    if(when_tensor_core_array_wrapper_l190_1) begin
      _zz_start_tcarray_out_1 = 1'b1;
    end
  end

  always @(*) begin
    _zz_2 = 1'b0;
    if(!when_tensor_core_array_wrapper_l190_1) begin
      if(when_tensor_core_array_wrapper_l192_1) begin
        _zz_2 = 1'b1;
      end
    end
  end

  assign _zz_start_tcarray_out_1_3 = (_zz_start_tcarray_out_1_2 == 2'b11);
  always @(*) begin
    _zz_start_tcarray_out_1_1 = (_zz_start_tcarray_out_1_2 + _zz__zz_start_tcarray_out_1_1);
    if(_zz_2) begin
      _zz_start_tcarray_out_1_1 = 2'b00;
    end
  end

  assign _zz_select_tcarray_out_1 = (tcArray_io_res_2_valid && tcArray_io_res_3_valid);
  assign when_tensor_core_array_wrapper_l190_1 = ((_zz_select_tcarray_out_1 && (! _zz_when_tensor_core_array_wrapper_l190_1)) && (! _zz_start_tcarray_out_1_3));
  assign when_tensor_core_array_wrapper_l192_1 = (_zz_select_tcarray_out_1 && _zz_start_tcarray_out_1_3);
  assign _zz_io_res_2_ready = _zz_select_tcarray_out_1_1;
  assign start_tcarray_out_1 = (! _zz_start_tcarray_out_1_3);
  assign select_tcarray_out_1 = (_zz_select_tcarray_out_1_1 && _zz_select_tcarray_out_1);
  assign addr_tcarray_out_1 = wr_addr;
  assign data_tcarray_out_1 = {112'd0, _zz_data_tcarray_out_1};
  assign start_tcarray_in_0 = startTCarrayIn;
  assign select_tcarray_in_0 = selectTcarrayIn;
  assign addr_tcarray_in_0 = rd_addr;
  assign start_tcarray_in_1 = startTCarrayIn;
  assign select_tcarray_in_1 = selectTcarrayIn;
  assign addr_tcarray_in_1 = rd_addr;
  assign start_tcarray_in_2 = startTCarrayIn;
  assign select_tcarray_in_2 = selectTcarrayIn;
  assign addr_tcarray_in_2 = rd_addr;
  assign start_tcarray_in_3 = startTCarrayIn;
  assign select_tcarray_in_3 = selectTcarrayIn;
  assign addr_tcarray_in_3 = rd_addr;
  assign start_tcarray_in_4 = startTCarrayIn;
  assign select_tcarray_in_4 = selectTcarrayIn;
  assign addr_tcarray_in_4 = rd_addr;
  always @(*) begin
    rdFsm_stateNext = rdFsm_stateReg;
    case(rdFsm_stateReg)
      rdFsm_enumDef_sIdle : begin
        if(when_tensor_core_array_wrapper_l148) begin
          rdFsm_stateNext = rdFsm_enumDef_sWait;
        end
      end
      rdFsm_enumDef_sWait : begin
        if(when_tensor_core_array_wrapper_l163) begin
          rdFsm_stateNext = rdFsm_enumDef_sIdle;
        end else begin
          if(when_tensor_core_array_wrapper_l164) begin
            rdFsm_stateNext = rdFsm_enumDef_sSend;
          end
        end
      end
      rdFsm_enumDef_sSend : begin
        if(rdFsm_rdWordCounter_willOverflow) begin
          rdFsm_stateNext = rdFsm_enumDef_sIdle;
        end
      end
      default : begin
      end
    endcase
    if(rdFsm_wantStart) begin
      rdFsm_stateNext = rdFsm_enumDef_sIdle;
    end
    if(rdFsm_wantKill) begin
      rdFsm_stateNext = rdFsm_enumDef_BOOT;
    end
  end

  assign _zz_when_tensor_core_array_wrapper_l148 = load_start[0];
  assign when_tensor_core_array_wrapper_l148 = ((_zz_when_tensor_core_array_wrapper_l148 && (! _zz_when_tensor_core_array_wrapper_l148_1)) && (&{hbm_6_ready,{hbm_5_ready,{hbm_4_ready,{hbm_3_ready,{hbm_2_ready,{hbm_1_ready,hbm_0_ready}}}}}}));
  assign when_tensor_core_array_wrapper_l156 = (rdFsm_startAssertCounter_value < 2'b11);
  assign when_tensor_core_array_wrapper_l163 = (|{port_error_tcarray_in_4,{port_error_tcarray_in_3,{port_error_tcarray_in_2,{port_error_tcarray_in_1,port_error_tcarray_in_0}}}});
  assign when_tensor_core_array_wrapper_l164 = (rdFsm_startAssertCounter_willOverflow && (! (|{almost_empty_tcarray_in_4,{almost_empty_tcarray_in_3,{almost_empty_tcarray_in_2,{almost_empty_tcarray_in_1,almost_empty_tcarray_in_0}}}})));
  assign when_StateMachine_l237 = ((rdFsm_stateReg == rdFsm_enumDef_sSend) && (! (rdFsm_stateNext == rdFsm_enumDef_sSend)));
  assign when_StateMachine_l253 = ((! (rdFsm_stateReg == rdFsm_enumDef_sIdle)) && (rdFsm_stateNext == rdFsm_enumDef_sIdle));
  always @(posedge clk) begin
    if(!clrn) begin
      selectTcarrayIn <= 1'b0;
      startTCarrayIn <= 1'b0;
      rdFsm_rdWordCounter_value <= 6'h00;
      rdFsm_startAssertCounter_value <= 2'b00;
      _zz_start_tcarray_out_0_2 <= 2'b00;
      _zz_select_tcarray_out_0_1 <= 1'b0;
      _zz_start_tcarray_out_1_2 <= 2'b00;
      _zz_select_tcarray_out_1_1 <= 1'b0;
      rdFsm_stateReg <= rdFsm_enumDef_BOOT;
    end else begin
      rdFsm_rdWordCounter_value <= rdFsm_rdWordCounter_valueNext;
      rdFsm_startAssertCounter_value <= rdFsm_startAssertCounter_valueNext;
      _zz_start_tcarray_out_0_2 <= _zz_start_tcarray_out_0_1;
      _zz_select_tcarray_out_0_1 <= (_zz_start_tcarray_out_0_3 && almost_full_tcarray_out_0);
      _zz_start_tcarray_out_1_2 <= _zz_start_tcarray_out_1_1;
      _zz_select_tcarray_out_1_1 <= (_zz_start_tcarray_out_1_3 && almost_full_tcarray_out_1);
      rdFsm_stateReg <= rdFsm_stateNext;
      case(rdFsm_stateReg)
        rdFsm_enumDef_sIdle : begin
        end
        rdFsm_enumDef_sWait : begin
          if(when_tensor_core_array_wrapper_l156) begin
            startTCarrayIn <= 1'b1;
          end else begin
            startTCarrayIn <= 1'b0;
          end
        end
        rdFsm_enumDef_sSend : begin
        end
        default : begin
        end
      endcase
      if(when_StateMachine_l237) begin
        selectTcarrayIn <= 1'b0;
      end
      if(when_StateMachine_l253) begin
        startTCarrayIn <= 1'b0;
        selectTcarrayIn <= 1'b0;
      end
    end
  end

  always @(posedge clk) begin
    combinedDataIn0 <= {data_tcarray_in_1,data_tcarray_in_0};
    combinedDataIn1 <= {data_tcarray_in_3,data_tcarray_in_2};
    selectTcarrayIn_regNext <= selectTcarrayIn;
    selectTcarrayIn_regNext_1 <= selectTcarrayIn;
    _zz_io_calEn_1 <= _zz_io_calEn;
    idxGeneratorRes_0 <= idxGenerator_io_seqOut_0;
    idxGeneratorRes_1 <= idxGenerator_io_seqOut_1;
    idxGeneratorRes_2 <= idxGenerator_io_seqOut_2;
    idxGeneratorRes_3 <= idxGenerator_io_seqOut_3;
    idxGeneratorRes_4 <= idxGenerator_io_seqOut_4;
    idxGeneratorRes_5 <= idxGenerator_io_seqOut_5;
    idxGeneratorRes_6 <= idxGenerator_io_seqOut_6;
    idxGeneratorRes_7 <= idxGenerator_io_seqOut_7;
    idxGeneratorRes_8 <= idxGenerator_io_seqOut_8;
    idxGeneratorRes_9 <= idxGenerator_io_seqOut_9;
    idxGeneratorRes_10 <= idxGenerator_io_seqOut_10;
    idxGeneratorRes_11 <= idxGenerator_io_seqOut_11;
    idxGeneratorRes_12 <= idxGenerator_io_seqOut_12;
    idxGeneratorRes_13 <= idxGenerator_io_seqOut_13;
    idxGeneratorRes_14 <= idxGenerator_io_seqOut_14;
    idxGeneratorRes_15 <= idxGenerator_io_seqOut_15;
    _zz_when_tensor_core_array_wrapper_l190 <= _zz_select_tcarray_out_0;
    _zz_when_tensor_core_array_wrapper_l190_1 <= _zz_select_tcarray_out_1;
  end

  always @(posedge clk) begin
    _zz_when_tensor_core_array_wrapper_l148_1 <= _zz_when_tensor_core_array_wrapper_l148;
  end


endmodule
