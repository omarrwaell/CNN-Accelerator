cd sim/results_hex

# Default to the synthesized IMG_WIDTH (32) so the SAIF written below matches
# the implemented design for report_power (scripts/power_activity.tcl).
if {![info exists IMG_WIDTH]} { set IMG_WIDTH 32 }

vlib work
vlog +incdir+../testbenches ../../rtl/*.v ../testbenches/*.v
vsim -voptargs=+acc -gIMG_WIDTH=$IMG_WIDTH work.tb_imgtc1_basic_correctness

# -----------------------------------------------------------------------------
# SAIF generation for FPGA power analysis.
#
# Per the organizers' Q&A: the SAIF must represent active convolution
# processing, excluding long reset/idle periods. 'busy' (asserted from
# STREAM through DRAIN until 'done') is used as the gate: power recording is
# off by default and only turned on while busy=1, so the reset window before
# 'start' and any trailing idle time after 'done' are both excluded from the
# switching-activity counts that go into the SAIF.
# -----------------------------------------------------------------------------

power add -r -in -out -inout -internal /tb_imgtc1_basic_correctness/dut/*
power off

when {/tb_imgtc1_basic_correctness/dut/busy == 1} {
    power on
}
when {/tb_imgtc1_basic_correctness/dut/busy == 0} {
    power off
}

add wave *
run -all

power report -all -bsaif ../imgtc1_active.saif

echo "-------------------------------------------------------------"
echo "SAIF written: ../imgtc1_active.saif"
echo "Recording window: gated on dut.busy (STREAM+DRAIN, i.e. active"
echo "convolution processing only) - reset and post-done idle excluded."
echo "-------------------------------------------------------------"

quit
