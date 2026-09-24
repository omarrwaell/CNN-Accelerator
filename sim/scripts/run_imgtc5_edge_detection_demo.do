cd sim/results_hex

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc work.tb_imgtc5_edge_detection_demo
add wave *
run -all

quit
