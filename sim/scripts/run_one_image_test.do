# -----------------------------------------------------------------------------
# Run ONE image testbench (debug helper). From the project root:
#   vsim -c -do "do sim/scripts/run_one_image_test.do tb_imgtc14_random_stall 32"
# Arg 1: testbench module name.  Arg 2: IMG_WIDTH (default 32).
# The golden .hex files must already exist for that width (run the Python
# generator first), exactly as for run_all_image_tests.do.
# -----------------------------------------------------------------------------
if {![info exists 1]} {
    echo "Usage: do sim/scripts/run_one_image_test.do <tb_module> [IMG_WIDTH]"
    quit -code 1
}
set TB [set 1]
if {[info exists 2]} { set IMG_WIDTH [set 2] } else { set IMG_WIDTH 32 }

cd sim/results_hex
vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.$TB
add wave *
run -all
quit
