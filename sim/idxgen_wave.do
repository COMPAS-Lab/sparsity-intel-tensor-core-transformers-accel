onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /index_gen_tb/word_idx
add wave -noupdate /index_gen_tb/stimu_path
add wave -noupdate /index_gen_tb/resetn
add wave -noupdate /index_gen_tb/PLACEHOLDER
add wave -noupdate /index_gen_tb/outfd
add wave -noupdate /index_gen_tb/out_path
add wave -noupdate /index_gen_tb/out_counter
add wave -noupdate /index_gen_tb/LAYER
add wave -noupdate /index_gen_tb/iter
add wave -noupdate /index_gen_tb/u_IndexGenerator/io_lastGrpOut
add wave -noupdate /index_gen_tb/io_seqOut_valid
add wave -noupdate -radix decimal /index_gen_tb/io_seqOut_payload_idxData
add wave -noupdate /index_gen_tb/io_seqOut_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/io_lastGrpIns
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/clk
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_lastGrpOut
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/ctrlStateMachine_stateReg
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/ctrlStateMachine_hasNoInput
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_21/io_idx_ins_1_valid_delay_1
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_21/io_idx_ins_1_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_21/io_idx_ins_1_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_21/io_idx_ins_1_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_21/io_idx_ins_1_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_11_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_11_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_11_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_11_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_10_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_10_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_10_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_10_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_9_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_9_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_9_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_9_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_8_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_8_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_8_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_8_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_7_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_7_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_7_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_7_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_6_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_6_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_6_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_6_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_5_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_5_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_5_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_5_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_4_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_4_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_4_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_4_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_3_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_3_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_3_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_3_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_2_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_2_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_2_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_2_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_1_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_1_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_1_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_1_payload_destId
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_0_valid
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_0_ready
add wave -noupdate -radix decimal /index_gen_tb/io_seqIn_0_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/io_seqIn_0_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_21/ctrlStateMachine_stateReg
add wave -noupdate /index_gen_tb/io_lastGrpOut
add wave -noupdate /index_gen_tb/input_vectors
add wave -noupdate /index_gen_tb/IN_SIZE
add wave -noupdate /index_gen_tb/curr_out
add wave -noupdate /index_gen_tb/concat_ins_valid
add wave -noupdate /index_gen_tb/concat_ins
add wave -noupdate /index_gen_tb/clk
add wave -noupdate -divider repeater
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/ctrlStateMachine_lastCompareFinished
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/ctrlStateMachine_stateReg
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_ready
add wave -noupdate -radix unsigned /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_ready
add wave -noupdate -radix unsigned /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_payload_idxData
add wave -noupdate -radix unsigned /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_payload_destId
add wave -noupdate -divider stg1
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/resetn
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_lastGrpOut
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_outs_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_outs_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_outs_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_ins_1_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_ins_1_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_ins_1_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_ins_0_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_ins_0_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/io_idx_ins_0_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_1_io_push_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_1_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_1_io_pop_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_1_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_1_io_pop_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_1_io_flush
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_0_io_push_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_0_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_0_io_pop_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_0_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_0_io_pop_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifos_0_io_flush
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/ctrlStateMachine_lastCompareFinished
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/fifoPopEn
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/ctrlStateMachine_stateReg
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_11/ctrlStateMachine_stateNext
add wave -noupdate -divider {New Divider}
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_lastGrpOut
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_lastGrpIns
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_outs_fire
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_1_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_1_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_1_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_1_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_0_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_0_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_0_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/io_idx_ins_0_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_push_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_push_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_pop_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_1_io_flush
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_push_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_push_ready
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_valid
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_ready
add wave -noupdate -radix decimal /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_payload_idxData
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_pop_payload_destId
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifos_0_io_flush
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/fifoPopEn
add wave -noupdate /index_gen_tb/u_IndexGenerator/mergeSortRedundancyRemoverUnit_19/ctrlStateMachine_insRecved
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {94150000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 281
configure wave -valuecolwidth 111
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
WaveRestoreZoom {91932126 ps} {96501854 ps}
