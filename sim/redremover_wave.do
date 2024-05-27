onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /RedundancyRemoverTb/upperInDat
add wave -noupdate /RedundancyRemoverTb/resetn
add wave -noupdate /RedundancyRemoverTb/lowerInDat
add wave -noupdate /RedundancyRemoverTb/io_upperIns_valid
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_upperIns_payload_3
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_upperIns_payload_2
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_upperIns_payload_1
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_upperIns_payload_0
add wave -noupdate /RedundancyRemoverTb/io_lowerIns_valid
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_lowerIns_payload_3
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_lowerIns_payload_2
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_lowerIns_payload_1
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_lowerIns_payload_0
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/io_lastGrpIn
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_7
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_6
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_5
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_4
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_3
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_2
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_1
add wave -noupdate -radix decimal /RedundancyRemoverTb/io_outs_0
add wave -noupdate /RedundancyRemoverTb/DWIDTH
add wave -noupdate /RedundancyRemoverTb/clk
add wave -noupdate -divider fifos
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_7_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_7_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_7_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_6_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_6_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_6_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_5_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_5_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_5_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_4_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_4_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_4_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_3_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_3_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_3_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_2_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_2_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_2_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_1_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_1_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_1_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_0_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_0_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_fifos_0_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_7_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_7_io_push_ready
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_7_io_pop_payload
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_6_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_6_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_5_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_5_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_4_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_4_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_3_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_3_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_2_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_2_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_1_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_1_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_occupancy
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_push_valid
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_push_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_pop_valid
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_pop_payload
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_rateIn
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_rotateInOffset
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_rateOut
add wave -noupdate -divider backend
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/ctrlStateMachine_stateReg
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/fifoPopEn
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_15
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_14
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_13
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_12
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_11
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_10
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_9
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_8
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_7
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_6
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_5
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_4
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_3
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_2
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_1
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigUpper_0
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_7_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_6_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_5_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_4_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_3_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_2_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_1_io_pop_payload
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_pop_payload
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_7_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_6_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_5_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_4_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_3_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_2_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_1_io_pop_ready
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_fifos_0_io_pop_ready
add wave -noupdate -radix unsigned /RedundancyRemoverTb/dut_RedundancyRemover/frontend/topRemoverFrontend_rotateOutOffset
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_7
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_6
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_5
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_4
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_3
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_2
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_1
add wave -noupdate -radix decimal /RedundancyRemoverTb/dut_RedundancyRemover/backend/io_ins_0
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_7
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_6
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_5
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_4
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_3
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_2
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_1
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/frontend/io_fifoPopSigLower_0
add wave -noupdate -radix unsigned /RedundancyRemoverTb/dut_RedundancyRemover/frontend/botRemoverFrontend_rotateOutOffset
add wave -noupdate /RedundancyRemoverTb/dut_RedundancyRemover/backend/stg1Outs_0_dat
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {130000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 315
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
configure wave -timelineunits ps
update
WaveRestoreZoom {70682 ps} {237035 ps}
