onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /TensorCoreWrapperTb/clrn
add wave -noupdate /TensorCoreWrapperTb/clk
add wave -noupdate /TensorCoreWrapperTb/iter
add wave -noupdate /TensorCoreWrapperTb/load_start
add wave -noupdate /TensorCoreWrapperTb/in_buffer_id
add wave -noupdate /TensorCoreWrapperTb/start_tcarray_in_1
add wave -noupdate /TensorCoreWrapperTb/start_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/select_tcarray_in_1
add wave -noupdate /TensorCoreWrapperTb/select_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/start
add wave -noupdate /TensorCoreWrapperTb/start_tcarray_out_1
add wave -noupdate /TensorCoreWrapperTb/start_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/select_tcarray_out_1
add wave -noupdate /TensorCoreWrapperTb/select_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/wr_addr
add wave -noupdate /TensorCoreWrapperTb/rd_addr
add wave -noupdate /TensorCoreWrapperTb/port_error_tcarray_out_1
add wave -noupdate /TensorCoreWrapperTb/port_error_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/port_error_tcarray_in_1
add wave -noupdate /TensorCoreWrapperTb/port_error_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/hbm_3_ready
add wave -noupdate /TensorCoreWrapperTb/hbm_2_ready
add wave -noupdate /TensorCoreWrapperTb/hbm_1_ready
add wave -noupdate /TensorCoreWrapperTb/hbm_0_ready
add wave -noupdate /TensorCoreWrapperTb/dut/load_start_rising
add wave -noupdate /TensorCoreWrapperTb/data_tcarray_out_1
add wave -noupdate /TensorCoreWrapperTb/data_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/data_tcarray_in_1
add wave -noupdate /TensorCoreWrapperTb/data_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/almost_full_tcarray_out_1
add wave -noupdate /TensorCoreWrapperTb/almost_full_tcarray_out_0
add wave -noupdate -expand /TensorCoreWrapperTb/dut/data_in
add wave -noupdate /TensorCoreWrapperTb/dut/tcore_u0/colMem_0/data
add wave -noupdate /TensorCoreWrapperTb/dut/tcore_u0/rowMem_0/data
add wave -noupdate /TensorCoreWrapperTb/dut/tcore_u0/colConverters_0/io_dataIn_payload
add wave -noupdate /TensorCoreWrapperTb/dut/data_valid
add wave -noupdate -radix unsigned /TensorCoreWrapperTb/dut/rd_word_counter
add wave -noupdate /TensorCoreWrapperTb/dut/rd_state
add wave -noupdate /TensorCoreWrapperTb/dut/rd_state_next
add wave -noupdate /TensorCoreWrapperTb/almost_empty_tcarray_in_1
add wave -noupdate /TensorCoreWrapperTb/almost_empty_tcarray_in_0
add wave -noupdate /TensorCoreWrapperTb/addr_tcarray_out_0
add wave -noupdate /TensorCoreWrapperTb/addr_tcarray_in_1
add wave -noupdate /TensorCoreWrapperTb/addr_tcarray_in_0
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {98263 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 343
configure wave -valuecolwidth 100
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
WaveRestoreZoom {10538 ps} {432498 ps}
