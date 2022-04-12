onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/clk
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/resetn
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/mat_a0
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/mat_a1
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/mat_a2
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/mat_b0
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/mat_b1
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/res
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/resetn
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/clk
add wave -noupdate /TensorCoreArrayTb/dut/fixedBfpConverter_9/io_dataIn_valid
add wave -noupdate /TensorCoreArrayTb/dut/fixedBfpConverter_9/io_dataIn_payload
add wave -noupdate /TensorCoreArrayTb/dut/fixedBfpConverter_9/largestExp
add wave -noupdate /TensorCoreArrayTb/dut/fixedBfpConverter_9/resExp
add wave -noupdate /TensorCoreArrayTb/dut/fixedBfpConverter_9/io_dataOut_valid
add wave -noupdate /TensorCoreArrayTb/dut/fixedBfpConverter_9/io_dataOut_payload
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIn_0
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIn_1
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIn_2
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expIn_0
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expIn_1
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expIn_2
add wave -noupdate -radix unsigned /TensorCoreArrayTb/dut/colBufferRdCounter_value
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expCascadeIn
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadCascadeIn
add wave -noupdate -radix unsigned /TensorCoreArrayTb/dut/rowBufferRdCounter_value
add wave -noupdate /TensorCoreArrayTb/io_calEn
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIterReady
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadReady
add wave -noupdate /TensorCoreArrayTb/io_res_valid
add wave -noupdate -radix unsigned /TensorCoreArrayTb/dut/computeItersReg
add wave -noupdate -radix unsigned /TensorCoreArrayTb/dut/ctrlStateMachine_resValidCounter_overflowVal
add wave -noupdate /TensorCoreArrayTb/res
add wave -noupdate /TensorCoreArrayTb/dut/tensorLoadValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorDataValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadCascadeIn
add wave -noupdate /TensorCoreArrayTb/dut/ctrlStateMachine_resValidCounter_value
add wave -noupdate /TensorCoreArrayTb/dut/ctrlStateMachine_computeIterCounter_value
add wave -noupdate /TensorCoreArrayTb/dut/ctrlStateMachine_computeIterCounter_willOverflow
add wave -noupdate /TensorCoreArrayTb/dut/ctrlStateMachine_stateReg
add wave -noupdate /TensorCoreArrayTb/dut/ctrlStateMachine_stateNext
add wave -noupdate /TensorCoreArrayTb/dut/ctrlStateMachine_dataInIterReady
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_valid
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_payload_0
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_payload_1
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_payload_2
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_payload_3
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_payload_4
add wave -noupdate /TensorCoreArrayTb/dut/tcArrayRes_payload_5
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/data
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/wrreq
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/rdreq
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/clock
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/q
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/full
add wave -noupdate /TensorCoreArrayTb/dut/outputBuffer/empty
add wave -noupdate -divider {first tc core}
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/tensor_core_1_load_bb_one
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIn_0
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIn_1
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIn_2
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expIn_0
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expIn_1
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expIn_2
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadCascadeIn
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_expCascadeIn
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIterReady
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadReady
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_outValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_res_0
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_res_1
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_res_2
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_inputIters
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_outValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/tcAccu/clk
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/tcAccu/acc_en
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/tcAccu/zero_en
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/tcAccu/bf24_a1
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/tcAccu/cascade_data_in_col_1
add wave -noupdate -divider converter
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_dataIn_valid
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_dataIn_payload
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_dataOut_valid
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_dataOut_payload
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {5465753 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 394
configure wave -valuecolwidth 146
configure wave -justifyvalue left
configure wave -signalnamewidth 0
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
WaveRestoreZoom {5442714 ps} {5569911 ps}
