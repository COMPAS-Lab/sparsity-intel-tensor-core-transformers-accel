
proc get_design_libraries {} {
  set libraries [dict create]
  dict set libraries dsp_prime_10      1
  dict set libraries tensor_core_accu  1
  dict set libraries tensor_core_entry 1
  dict set libraries tensor_core       1
  dict set libraries tensor_core_start 1
  dict set libraries ram_2port_2020 1
  dict set libraries in_buffer 1
  dict set libraries fifo_1910 1
  dict set libraries out_fifo  1
  return $libraries
}

proc get_memory_files {QSYS_SIMDIR} {
  set memory_files [list]
  return $memory_files
}

proc get_common_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
  set design_files [dict create]
  return $design_files
}

proc get_design_files {USER_DEFINED_COMPILE_OPTIONS USER_DEFINED_VERILOG_COMPILE_OPTIONS USER_DEFINED_VHDL_COMPILE_OPTIONS QSYS_SIMDIR} {
  set design_files [list]
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core_accu/dsp_prime_10/sim/tensor_core_accu_dsp_prime_10_wcj43fa.v"]\"  -work dsp_prime_10"  
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core_accu/sim/tensor_core_accu.v"]\"  -work tensor_core_accu"                                
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core_entry/dsp_prime_10/sim/tensor_core_entry_dsp_prime_10_ha6ksdq.v"]\"  -work dsp_prime_10"
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core_entry/sim/tensor_core_entry.v"]\"  -work tensor_core_entry"                             
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core/dsp_prime_10/sim/tensor_core_dsp_prime_10_iy4cj7q.v"]\"  -work dsp_prime_10"            
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core/sim/tensor_core.v"]\"  -work tensor_core" 
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core_start/dsp_prime_10/sim/tensor_core_start_dsp_prime_10_vpll32q.v"]\"  -work dsp_prime_10"            
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/tensor_core_start/sim/tensor_core_start.v"]\"  -work tensor_core_start"   
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/in_buffer/ram_2port_2020/sim/in_buffer_ram_2port_2020_um36i7a.v"]\"  -work ram_2port_2020"
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/in_buffer/sim/in_buffer.v"]\"  -work in_buffer"  
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/out_fifo/fifo_1910/sim/out_fifo_fifo_1910_stdoldq.v"]\"  -work fifo_1910"
  lappend design_files "vlog $USER_DEFINED_VERILOG_COMPILE_OPTIONS $USER_DEFINED_COMPILE_OPTIONS  \"[normalize_path "$QSYS_SIMDIR/../ips/out_fifo/sim/out_fifo.v"]\"  -work out_fifo"                                      
  return $design_files
}

proc get_elab_options {SIMULATOR_TOOL_BITNESS} {
  set ELAB_OPTIONS ""
  if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
  } else {
  }
  return $ELAB_OPTIONS
}


proc get_sim_options {SIMULATOR_TOOL_BITNESS} {
  set SIM_OPTIONS ""
  if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
  } else {
  }
  return $SIM_OPTIONS
}


proc get_env_variables {SIMULATOR_TOOL_BITNESS} {
  set ENV_VARIABLES [dict create]
  set LD_LIBRARY_PATH [dict create]
  dict set ENV_VARIABLES "LD_LIBRARY_PATH" $LD_LIBRARY_PATH
  if ![ string match "bit_64" $SIMULATOR_TOOL_BITNESS ] {
  } else {
  }
  return $ENV_VARIABLES
}


proc normalize_path {FILEPATH} {
    if {[catch { package require fileutil } err]} { 
        return $FILEPATH 
    } 
    set path [fileutil::lexnormalize [file join [pwd] $FILEPATH]]  
    if {[file pathtype $FILEPATH] eq "relative"} { 
        set path [fileutil::relative [pwd] $path] 
    } 
    return $path 
} 
