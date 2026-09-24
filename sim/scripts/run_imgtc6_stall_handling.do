cd sim/results_hex

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc work.tb_imgtc6_stall_handling
add wave *
run -all

quit
