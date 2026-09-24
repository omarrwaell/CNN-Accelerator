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
    echo "Usage: do sim/scripts/run_all_image_tests.do <IMG_WIDTH>"
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

echo "=== IMG-TC7 - EXTREME NEGATIVE WEIGHTS (-128) ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc7_extreme_negative
run -all
quit -sim

echo "=== IMG-TC8 - EXTREME POSITIVE WEIGHTS (+127, WHITE IMAGE) ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc8_extreme_positive
run -all
quit -sim

echo "=== IMG-TC9 - PACKED-DSP LANE SIGN MIX ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc9_lane_mix
run -all
quit -sim

echo "=== IMG-TC10 - IDENTITY KERNEL ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc10_identity
run -all
quit -sim

echo "=== IMG-TC11 - ROUNDING (ALL-ONES KERNEL) ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc11_rounding
run -all
quit -sim

echo "=== IMG-TC12 - RANDOM SIGNED KERNEL ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc12_random_kernel
run -all
quit -sim

echo "=== IMG-TC13 - THREE PASSES + KERNEL RELOAD ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc13_multipass_reload
run -all
quit -sim

echo "=== IMG-TC14 - RANDOM 30% INPUT STALLS ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc14_random_stall
run -all
quit -sim

echo "=== IMG-TC15 - RESET MID-PASS, THEN RECOVER ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc15_midpass_reset
run -all
quit -sim

echo "=== IMG-TC16 - BANK SWITCH + RELU + INVALID TAP WRITES ==="
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc16_bank_relu_badaddr
run -all
quit -sim

echo "=== ALL 16 IMAGE-BASED TESTS COMPLETE ==="

quit
