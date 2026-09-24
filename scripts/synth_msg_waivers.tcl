## =============================================================================
## synth_msg_waivers.tcl -- deliberate, reviewed waivers for synth_1
## -----------------------------------------------------------------------------
## Hooked in as synth_1's pre-synthesis script:
##   set_property STEPS.SYNTH_DESIGN.TCL.PRE \
##       [file normalize {<repo>/scripts/synth_msg_waivers.tcl}] [get_runs synth_1]
##
## Each rule is narrowed with -string to the one instance that was reviewed, so
## the same message ID from anywhere else in the design still reports as a
## WARNING. Waived messages are downgraded to INFO, not suppressed, so they
## stay visible in the log.
## =============================================================================

## [Synth 8-6014] M3 DSP pipeline registers are absorbed into the DSP48E1:
## 6x build (pumped_dsp): a_r -> AREG, b_r -> BREG, m_r -> MREG, p -> PREG;
## 1x build (g_row[*]): wp_a/ws_a -> AREG, q_b -> BREG, mp_m/ms_m -> MREG,
## mp_p/ms_p -> PREG. See the "DSP Report: register ... is absorbed" lines.
## The registers still exist, inside the DSP. Expected.
## -string is a substring match on the message text (the [file:line] suffix
## is not part of it), so each rule names one M3 register. The last two cover
## Vivado's renamed/unnamed copies of the A-port register.
foreach reg {a_r_reg b_r_reg m_r_reg {element p_reg } wp_a_reg ws_a_reg q_b_reg mp_m_reg ms_m_reg mp_p_reg ms_p_reg} {
    set_msg_config -id {Synth 8-6014} -string [list $reg] -new_severity INFO
}
set_msg_config -id {Synth 8-6014} -string {{element A was removed}}  -new_severity INFO
set_msg_config -id {Synth 8-6014} -string {{element  was removed}}  -new_severity INFO

## [Synth 8-3332] u_m3_mac/acc_r_reg[3:0] removed.
## M3 adds the rounding bias 2^(FRAC_BITS-1) itself and output_handling keeps
## only mac_result[ACC_WIDTH-1:FRAC_BITS], so the FRAC_BITS low result bits
## never reach the output. The flops are dead; the adder's lower input bits
## still feed the carry chain and are kept. Expected.
set_msg_config -id {Synth 8-3332} -string {{u_m3_mac/acc_r_reg}} -new_severity INFO

## [Constraints 18-5210] No constraint will be written out.
## Emitted by write_checkpoint at the end of synth_1, after synth_design has
## finished. The run marks the XDC used_in_implementation=false inside the
## synthesis DCP because implementation re-reads the XDC file itself, so there
## is nothing to embed. The constraints are applied in impl_1. Expected.
set_msg_config -id {Constraints 18-5210} -string {{No constraint will be written out}} \
    -new_severity INFO
