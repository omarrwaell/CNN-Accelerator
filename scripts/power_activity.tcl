## =============================================================================
## power_activity.tcl -- switching activity for report_power  
## -----------------------------------------------------------------------------
## Run in the implemented design (Tcl console after open_run impl_1, or as
## impl_1's STEPS.ROUTE_DESIGN.TCL.POST) before report_power.
##
## Option A (used when SAIF_FILE exists): SAIF from simulation, covering ports
## and internal nets -- this is what takes report_power's Confidence Level to
## High. Produce it by running, from the project root in ModelSim/Questa,
##   do sim/scripts/run_all_image_tests.do 32
## Its IMG-TC1 run records activity only while dut.busy=1 (active convolution,
## reset/idle excluded) and writes sim/imgtc1_active.saif. Re-run it whenever
## the RTL changes so the SAIF names match the design. 

set SAIF_FILE  {../sim/imgtc1_active.saif}
set SAIF_SCOPE tb_imgtc1_basic_correctness/dut

reset_switching_activity -all

if {[file exists $SAIF_FILE]} {
    read_saif -strip_path $SAIF_SCOPE $SAIF_FILE
} else {
    puts "WARNING: $SAIF_FILE not found -- using vectorless input activity; power confidence will not reach High."
    ## Placeholder rates; replace with measured numbers when available.
    ## pixel_in: new pixel every cycle -> ~50% toggle rate per bit.
    set_switching_activity -toggle_rate 50 -static_probability 0.5 \
        [get_ports -filter {NAME =~ pixel_in* && DIRECTION == IN}]
    ## Configuration/control: effectively static during a pass.
    set_switching_activity -toggle_rate 0.1 -static_probability 0.5 \
        [get_ports -filter {DIRECTION == IN && NAME !~ pixel_in* && NAME != clk && NAME != rst}]
    ## Reset held deasserted during operation.
    set_switching_activity -toggle_rate 0 -static_probability 0 [get_ports rst]
}
