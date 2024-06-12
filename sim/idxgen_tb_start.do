
vlog -sv ./tb/index_gen_tb.sv ../src/generated/*.v
set TOP_LEVEL_NAME index_gen_tb

vsim $TOP_LEVEL_NAME

view signals
view structure
view wave

log -r *

run -all

# do idxgen_wave.do