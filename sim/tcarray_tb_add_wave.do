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
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_in_vector_flatten_valid
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_in_vector_flatten_payload
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_outBlk_flatten_valid
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/io_outBlk_flatten_payload
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/resetn
add wave -noupdate /TensorCoreArrayTb/io_calEn
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/clk
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/core_outMants_flatten
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/core_outExp
add wave -noupdate /TensorCoreArrayTb/dut/colConverters_0/core_valid_out
add wave -noupdate /TensorCoreArrayTb/dut/colMem_0
add wave -noupdate /TensorCoreArrayTb/dut/colMem_1
add wave -noupdate /TensorCoreArrayTb/dut/colMem_2
add wave -noupdate /TensorCoreArrayTb/dut/rowMem_0
add wave -noupdate /TensorCoreArrayTb/dut/rowMem_1
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
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_dataIterReady
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadValid
add wave -noupdate /TensorCoreArrayTb/dut/tensorCoreChain_6/io_loadReady
add wave -noupdate /TensorCoreArrayTb/io_res_valid
add wave -noupdate -radix unsigned /TensorCoreArrayTb/dut/computeItersReg
add wave -noupdate -radix unsigned /TensorCoreArrayTb/dut/ctrlStateMachine_resValidCounter_overflowVal
add wave -noupdate /TensorCoreArrayTb/res
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/io_res_payload_0_0
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/io_res_payload_0_1
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/io_res_payload_0_2
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/io_res_payload_1_0
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/io_res_payload_1_1
add wave -noupdate -radix hexadecimal /TensorCoreArrayTb/io_res_payload_1_2
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
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {739802 ps} 0}
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
WaveRestoreZoom {0 ps} {1607056 ps}
