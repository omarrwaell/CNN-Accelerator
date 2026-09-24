cd sim/results_hex

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc work.tb_imgtc2_multikernel
add wave *
run -all

quit
