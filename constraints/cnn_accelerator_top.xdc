## =============================================================================
## cnn_accelerator_top.xdc  -- timing constraint for synthesis/implementation
## -----------------------------------------------------------------------------
## Target: PYNQ-Z2, Zynq-7000 XC7Z020, part xc7z020clg400-1
##
## This constrains the clock and excludes the unplaced top-level ports from
## timing (see below) -- no physical I/O pin locations are assigned here. That is deliberate: this phase is about getting real,
## trustworthy Utilization, Timing, and Power numbers for the FOM
## calculation, which needs a clock period defined but does NOT need the
## design mapped onto real board pins yet.
##
## Physical pin constraints (buttons, LEDs, UART, etc.) belong in a SEPARATE
## XDC written specifically for the board-demo bonus, once the top-level
## I/O has a real interface decided (e.g. a UART receiver front-end feeding
## pixel_in/pixel_in_valid) -- ask for that one when you get to that phase;
## it should be built against a verified PYNQ-Z2 master pin file, not typed
## from memory, since a wrong pin location on real hardware can be far more
## costly to debug than a wrong resource number in a report.
## =============================================================================

## -----------------------------------------------------------------------------
## Primary clock
## -----------------------------------------------------------------------------
## Start at 100 MHz (10.000 ns period) as your FIRST candidate for Phase 3's
## frequency search. Change ONLY this number (in ns) to try other candidates,
## e.g.:
##   20.000 ns ->  50 MHz
##   10.000 ns -> 100 MHz
##    8.000 ns -> 125 MHz
##    6.667 ns -> 150 MHz
## Re-run Implementation after each change and check the Timing Summary's
## WNS (Worst Negative Slack) before deciding on your final operating
## frequency -- do not just push to the highest number that barely closes.
## 6x MULTI-PUMPED BUILD, NO MMCM: clk is the 6x (DSP) clock. The system
## clock clk_sys = clk / 6 comes from a BUFR divider, which Vivado derives
## automatically, so only this one create_clock is needed.
## FOM run (tag best-fom-0.02714): 10 ns = 100 MHz -> DSP 100 MHz, system
## clock clk_sys = 16.7 MHz. Fmax check: 3.333 ns = 300 MHz -> system 50 MHz.
## FOM throughput is 1 output per SYSTEM (clk_sys) cycle.
create_clock -period 10.000 -name clk [get_ports clk]

## -----------------------------------------------------------------------------
## Top-level ports -- excluded from timing for this phase
## -----------------------------------------------------------------------------
## No pins are assigned, so every port goes through an auto-placed IBUF/OBUF
## and the clock reaches the flops ~5 ns after the clk pin (IBUF + route to
## BUFG, no MMCM to compensate). A port-to-pad path therefore costs ~5 ns of
## clock insertion plus ~2.6 ns of OBUF before any external budget -- it
## cannot meet 10 ns, let alone 3.333 ns. Those paths measure pad placement,
## not the accelerator, so they are cut here and Fmax is set only by the
## internal register-to-register paths.
##
## The ports are false-pathed explicitly (not just left unconstrained) so
## check_timing reports them as "user has a false path constraint" instead
## of "no input/output delay". This applies to all ports alike, including
## the quasi-static configuration ports (kernel_select, relu_enable) -- they
## need no special exception on top of this.
##
## REPLACE these two lines with real set_input_delay / set_output_delay in the
## board-demo XDC, once the pins and the upstream/downstream device are known
## (and add IOB registers or an MMCM there if the budget is tight).
set_false_path -from [get_ports -filter {DIRECTION == IN && NAME != clk}]
set_false_path -to [get_ports -filter {DIRECTION == OUT}]

## Switching activity (set_switching_activity) is for power analysis only and
## lives in scripts/power_activity.tcl, not in this timing XDC.

## set_property PACKAGE_PIN V20 [get_ports {pixel_in[2]}]
## set_property PACKAGE_PIN R18 [get_ports {output_pixel[9]}]
## set_property PACKAGE_PIN P20 [get_ports {pixel_in[5]}]
## set_property PACKAGE_PIN V18 [get_ports {output_pixel[7]}]
## set_property PACKAGE_PIN W18 [get_ports {output_pixel[6]}]
## set_property PACKAGE_PIN W19 [get_ports {output_pixel[5]}]
## set_property PACKAGE_PIN T19 [get_ports {output_pixel[0]}]
## set_property PACKAGE_PIN P16 [get_ports {output_pixel[1]}]
## set_property PACKAGE_PIN N20 [get_ports {pixel_in[6]}]
## set_property PACKAGE_PIN P15 [get_ports {output_pixel[2]}]
## set_property PACKAGE_PIN W16 [get_ports {output_pixel[13]}]
## set_property PACKAGE_PIN V8 [get_ports {kernel_wr_addr[2]}]
## set_property PACKAGE_PIN V16 [get_ports {output_pixel[14]}]
## set_property PACKAGE_PIN R17 [get_ports {output_pixel[11]}]
## set_property PACKAGE_PIN Y8 [get_ports {kernel_wr_addr[3]}]
## set_property PACKAGE_PIN T9 [get_ports relu_enable]
## set_property PACKAGE_PIN T5 [get_ports {kernel_wr_data[2]}]
## set_property PACKAGE_PIN Y6 [get_ports {kernel_wr_bank[0]}]
## set_property PACKAGE_PIN W11 [get_ports {kernel_wr_data[4]}]
## set_property PACKAGE_PIN U9 [get_ports {kernel_wr_data[6]}]
## set_property PACKAGE_PIN Y11 [get_ports {kernel_wr_data[3]}]
## set_property PACKAGE_PIN Y12 [get_ports {kernel_wr_data[0]}]
## set_property PACKAGE_PIN U5 [get_ports {kernel_wr_data[1]}]
## set_property PACKAGE_PIN U10 [get_ports pixel_in_valid]
## set_property PACKAGE_PIN W6 [get_ports busy]
## set_property PACKAGE_PIN V10 [get_ports frame_done]
## set_property PACKAGE_PIN T17 [get_ports {output_pixel[10]}]
## set_property PACKAGE_PIN V17 [get_ports {output_pixel[8]}]
## set_property PACKAGE_PIN W20 [get_ports {pixel_in[1]}]
## set_property PACKAGE_PIN N17 [get_ports {output_pixel[4]}]
## set_property PACKAGE_PIN P18 [get_ports {output_pixel[3]}]
## set_property PACKAGE_PIN U20 [get_ports {pixel_in[3]}]
## set_property PACKAGE_PIN T20 [get_ports {pixel_in[4]}]
## set_property PACKAGE_PIN Y18 [get_ports {pixel_in[0]}]
## set_property PACKAGE_PIN P19 [get_ports {pixel_in[7]}]
## set_property PACKAGE_PIN R16 [get_ports {output_pixel[12]}]
## set_property PACKAGE_PIN W8 [get_ports {kernel_wr_addr[1]}]
## set_property PACKAGE_PIN Y9 [get_ports {kernel_select[0]}]
## set_property PACKAGE_PIN V11 [get_ports output_valid]
## set_property PACKAGE_PIN V5 [get_ports start]
## set_property PACKAGE_PIN W10 [get_ports {kernel_wr_addr[0]}]
## set_property PACKAGE_PIN W9 [get_ports {kernel_wr_data[7]}]
## set_property PACKAGE_PIN Y19 [get_ports {output_pixel[15]}]
## set_property PACKAGE_PIN U8 [get_ports {kernel_wr_data[5]}]
## set_property PACKAGE_PIN V6 [get_ports done]
## set_property PACKAGE_PIN Y13 [get_ports pixel_req]
## set_property PACKAGE_PIN V7 [get_ports rst]
## set_property PACKAGE_PIN U7 [get_ports clk]
## set_property PACKAGE_PIN Y7 [get_ports kernel_wr_en]
