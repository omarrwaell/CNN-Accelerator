# -----------------------------------------------------------------------------
# Runs only IMG-TC1..TC6 (the original six tests), plus the TC1 SAIF.
# From the project root:  vsim -c -do "do sim/scripts/run_first6_image_tests.do 32"
# For all 16 tests use run_all_image_tests.do.
# -----------------------------------------------------------------------------
cd sim/results_hex

if {[info exists 1]} {
    set IMG_WIDTH [set 1]
} elseif {[info exists argc] && [info exists argv] && $argc > 0 && [string is integer -strict [lindex $argv 0]]} {
    set IMG_WIDTH [lindex $argv 0]
} elseif {[info exists ::env(IMG_WIDTH)]} {
    set IMG_WIDTH $::env(IMG_WIDTH)
} else {
    set IMG_WIDTH 32
}

if {![string is integer -strict $IMG_WIDTH] || $IMG_WIDTH < 3} {
    echo "ERROR: IMG_WIDTH must be an integer >= 3"
    echo "Usage: do sim/scripts/run_first6_image_tests.do <IMG_WIDTH>"
    quit -code 1
}

echo "=== Running image tests with IMG_WIDTH=$IMG_WIDTH ==="

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v

echo "=== IMG-TC1 - BASIC CORRECTNESS (+ SAIF for power analysis) ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc1_basic_correctness

# SAIF generation for FPGA power analysis (read by scripts/power_activity.tcl).
# The TC1 testbench clocks the DUT at CLK_PERIOD_NS (default 10 ns), which must
# match the XDC create_clock period of the power run -- otherwise every toggle
# rate, and so dynamic power, is scaled by the ratio of the two periods.
# Per the organizers' Q&A the SAIF must represent active convolution
# processing only: recording is gated on dut.busy (STREAM through DRAIN until
# 'done'), so reset before 'start' and idle after 'done' are excluded.
power add -r -in -out -inout -internal /tb_imgtc1_basic_correctness/dut/*
power off
when {/tb_imgtc1_basic_correctness/dut/busy == 1} {
    power on
}
when {/tb_imgtc1_basic_correctness/dut/busy == 0} {
    power off
}

run -all

power report -all -bsaif ../imgtc1_active.saif
echo "SAIF written: sim/imgtc1_active.saif (active window only, gated on dut.busy)"
if {$IMG_WIDTH != 32} {
    echo "WARNING: SAIF recorded at IMG_WIDTH=$IMG_WIDTH, but the synthesized design uses 32 -- rerun with 32 before report_power."
}
quit -sim

echo "=== IMG-TC2 - MULTI-KERNEL BONUS ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc2_multikernel
run -all
quit -sim

echo "=== IMG-TC3 - RELU BONUS ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc3_relu
run -all
quit -sim

echo "=== IMG-TC4 - GAPLESS THROUGHPUT BONUS ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc4_gapless_throughput
run -all
quit -sim

echo "=== IMG-TC5 - EDGE-DETECTION DEMO BONUS ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc5_edge_detection_demo
run -all
quit -sim

echo "=== IMG-TC6 - STALL HANDLING ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc6_stall_handling
run -all
quit -sim

echo "=== IMG-TC1..TC6 COMPLETE ==="

quit
