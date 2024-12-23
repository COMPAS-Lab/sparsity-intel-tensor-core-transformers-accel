onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TensorCoreWrapperTb/clk
add wave -noupdate /TensorCoreWrapperTb/clk
add wave -noupdate /TensorCoreWrapperTb/start
add wave -noupdate /TensorCoreWrapperTb/iter
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/rd_addr
add wave -noupdate /TensorCoreWrapperTb/wr_addr
add wave -noupdate /TensorCoreWrapperTb/load_start
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/lat_counter
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_tcArray/debug_out_counter_value
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_pop_ready
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_pop_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_pop_ready
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_pop_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_pop_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/rowCtrlFsm_stateReg
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/colCtrlFsm_stateReg
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/colCtrlFsm_isCalStartRecv
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_colIdxFifoNotEmpty
add wave -noupdate -radix binary /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_isCurrCasBufLoaded
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_isCurrSubgrpALoaded
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_0/io_casLoadEn
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_0/io_colSel
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_0_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_1_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_2_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_3_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_4_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_5_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_6_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_7_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_8_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_9_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_10_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_colBuffer_11_io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_0_io_datWithBubble_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_0_io_datWithBubble_payload_blkData
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_0_io_datWithBubble_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_1_io_datWithBubble_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_1_io_datWithBubble_payload_blkData
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_1_io_datWithBubble_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_2_io_datWithBubble_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_2_io_datWithBubble_payload_blkData
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_2_io_datWithBubble_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_3_io_datWithBubble_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_3_io_datWithBubble_payload_blkData
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_3_io_datWithBubble_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_4_io_datWithBubble_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_4_io_datWithBubble_payload_blkData
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_tcArray/bufferArea_casLoadBubbleInsert_4_io_datWithBubble_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_0_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_0_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_0_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_0_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_1_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_1_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_1_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_1_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_2_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_2_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_2_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_2_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_3_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_3_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_3_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_3_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_4_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_4_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_4_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_4_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_5_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_5_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_5_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_5_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_6_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_6_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_6_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_6_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_7_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_7_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_7_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_7_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_8_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_8_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_8_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_8_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_9_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_9_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_9_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_9_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_10_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_10_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_10_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_10_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_11_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_11_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_11_payload_blkData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matALoad_11_payload_rIdx
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_pop_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/start_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/select_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/addr_tcarray_in_0
add wave -noupdate -radix binary /TensorCoreWrapperTb/dut/data_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/almost_empty_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/port_error_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_0_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_0_ready
add wave -noupdate -radix binary /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_0_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_1_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_1_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_1_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_2_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_2_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_2_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_3_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_3_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_3_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_4_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_4_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_4_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_5_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_5_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/io_matBLoad_5_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/softClrnArea_newReset
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_isIdxGenWaitingOuts
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_0_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_0_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_0_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_1_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_1_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_1_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_2_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_2_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_2_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_3_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_3_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_3_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_4_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_4_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_4_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_5_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_5_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_5_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_6_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_6_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_6_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_7_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_7_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_7_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_8_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_8_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_8_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_9_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_9_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_9_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_10_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_10_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_10_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_11_valid
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_11_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqIn_11_payload_destId
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast_io_occupancy
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow_io_occupancy
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_lastGrpIns
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqOut_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqOut_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_lastGrpOut
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_isIdxGenWaitingOuts
add wave -noupdate -radix binary /TensorCoreWrapperTb/dut/softClrnArea_isLastPlaceholderRecved
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqOut_payload_idxData
add wave -noupdate -radix binary /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_seqOut_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenerator/io_lastGrpOut
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_push_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_push_ready
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_push_payload_idxData
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoFast/io_push_payload_destId
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_push_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_push_ready
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/softClrnArea_idxGenFifoSlow/io_push_payload_idxData
add wave -noupdate -divider output
add wave -noupdate /TensorCoreWrapperTb/dut/start_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/dut/select_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/dut/data_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/dut/addr_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/dut/almost_full_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/dut/port_error_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/io_push_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/io_push_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/io_push_payload
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/io_pop_valid
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/io_pop_ready
add wave -noupdate /TensorCoreWrapperTb/dut/softClrnArea_tcArray/outBuffer_0/io_pop_payload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {58015961 ps} 0} {{Cursor 2} {10065000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 328
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {15150883 ps} {175995133 ps}
