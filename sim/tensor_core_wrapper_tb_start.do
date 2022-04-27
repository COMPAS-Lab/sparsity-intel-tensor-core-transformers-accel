set QSYS_SIMDIR .
source $QSYS_SIMDIR/mentor/msim_setup.tcl

dev_com
com
vlog ./tb/TensorCoreWrapperTb.sv ../nx10-matmul-project/src/tensor_core_array_wrapper.sv ../src/generated/TensorCoreChainArray.v
set TOP_LEVEL_NAME TensorCoreWrapperTb

#vlib work
#vmap work work

#vcom is used for compile VHDL files


# vlog is used for compile Verilog files
vlog -reportprogress 300 -work work ./tb/fourteennm_atoms.sv


elab_debug

view signals
view structure
view wave

do tcwrapper_tb_add_wave.do

log -r *






