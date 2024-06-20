vlog -sv ./tb/index_gen_tb.sv ../src/generated/*.v
set TOP_LEVEL_NAME index_gen_tb

set nlayers $env(SPAR_IDXGEN_LAYER)
set nheads $env(SPAR_IDXGEN_HEAD)
set insize $env(SPAR_IDXGEN_INSIZE)

vsim -voptargs="+acc" +nlayers=$nlayers +nheads=$nheads +insize=$insize $TOP_LEVEL_NAME

view signals
view structure
view wave

log -r *

run -all

# do idxgen_wave.do