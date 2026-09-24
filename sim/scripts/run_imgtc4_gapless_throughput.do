cd sim/results_hex

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc work.tb_imgtc4_gapless_throughput
add wave *
run -all

quit
