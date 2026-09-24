cd sim/results_hex

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc work.tb_imgtc3_relu
add wave *
run -all

quit
