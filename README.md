# CNN Convolution Accelerator

Streaming 3x3 convolution accelerator in Verilog for the PYNQ-Z2 (Zynq-7000, `xc7z020clg400-1`), with a Python golden model and Questa/ModelSim image-based verification.

IEEE SSCS Egypt Chapter 2026 Student Design Competition. Team: **Omar Wael, Ziad Elkhiat, Salwa Galal**.

## Results at a glance

| Metric | Value |
| --- | --- |
| Resources | **226 LUTs** (194 logic + 32 LUT-RAM), 1233 FFs, **1 DSP48E1**, **0 BRAM** |
| Throughput | 1 output pixel per system cycle (gapless) |
| Max frequency | 300 MHz DSP clock met (WNS +0.055 ns), i.e. 50 MHz system clock |
| Power (clk = 100 MHz) | 0.112 W total (0.104 W static, 0.007 W dynamic), SAIF-based, confidence High |
| **FOM** (clk = 100 MHz) | 1 / (0.112 x (226 + 50 x 1)) = **0.0324** |
| FOM (clk = 300 MHz) | 1 / (0.126 x (229 + 50 x 1)) = 0.0284 |

FOM = Throughput / (Power x (LUTs + 50 x DSPs + 100 x BRAMs)), with throughput in output pixels per cycle. Screenshots of every number above are in `docs/vivado_results/`.

## Architecture

One 3x3 window in and one result out per system cycle, with a gapless output stream.

```text
pixel_in --> M1 line_buffer --(newest column: 3 pixels)--> M3 MAC (transposed, 1 DSP x6)
                  |                                            ^         ^
                  +--> M2 window_generator (window_valid) -----+         |
                                           M4 kernel_storage (tap stream) +
                                                                         |
                       M5 output_handling --> M7 FIFO --> output_pixel <-+
   M6 control_fsm: pixel_req / start / busy / done / pass_reset
   clk_gen_6x: clk -> BUFG (clk_fast, DSP) and BUFR /6 (clk_sys, everything else)
```

| Module | File | Role |
| --- | --- | --- |
| M1 | `line_buffer.v` | Two row delays in plain flip-flops (no SRLs: the FOM counts LUTs, not FFs). No reset and no `rst` port. |
| M2 | `window_generator.v` | Produces `window_valid`: an LFSR marks the end of each row, and two 2-bit flag registers track column >= 2 and row >= 2. |
| M3 | `mac.v` | Transposed-form MAC on **one DSP48E1 pumped 6x**. Each new pixel meets its 3 row weights; two weights share one DSP operation (packed lanes), so 9 products = 6 operations per system cycle. Operands come from a flip-flop ring, column sums are accumulated on the fast clock, and the rounding bias is preloaded. |
| M4 | `kernel_storage.v` | 2 kernel banks x 9 taps in one small LUT-RAM, streamed to M3 one tap per cycle for one sweep after each write or bank change, then paused. Banks are **not** cleared by reset. |
| M5 | `output_handling.v` | Round half up (bias added in M3, so a bit-select here). Saturation is built only if overflow is possible; with the default widths the largest result is 18360, so it is omitted. ReLU is the output register's synchronous reset. |
| M6 | `control_fsm.v` | IDLE / STREAM / DRAIN / DONE; `pass_reset` between passes. Pixel counter is an LFSR, drain timer a shift register. |
| M7 | `FIFO.v` | Builds a reserve so the output stream has no gaps. No occupancy counter (pointer compares only); release counter is an LFSR. |
| - | `clk_gen_6x.v` | `clk` on a BUFG drives the DSP; a BUFR divides it by 6 for the system clock. No MMCM. |
| - | `lfsr_counter.v` | LFSR event counter shared by M2, M6 and M7. |

Datapath details:

- **Latency:** M3 6 + M5 2 = 8 system cycles (`PIPE_LATENCY = 8`), plus line-buffer fill and the M7 reserve.
- **Formats:** pixels UQ8.0, weights Q3.4 (`16` = 1.0), accumulator Q15.4 (20 bits), output Q15.0 (16 bits).
- **Resets:** only control state (valid bits, counters, FSM, FIFO pointers) is reset. Data registers load only when their stage is valid.
- **Kernel loading:** write every tap of a bank before using it. New weights reach M3 within about 12 system cycles.

## Project Layout

```text
.
|-- README.md
|-- run_image_flow.bat                (one-command golden -> simulate -> render flow)
|-- rtl/                              (design sources, see table above)
|-- constraints/
|   `-- cnn_accelerator_top.xdc      (clock + port false paths)
|-- scripts/
|   |-- synth_msg_waivers.tcl        (reviewed synthesis message waivers)
|   `-- power_activity.tcl           (SAIF / switching activity for report_power)
|-- python/
|   |-- golden_model_image_flow.py   (golden model, writes hex for all 16 tests)
|   `-- visualize_hw_outputs.py      (hardware hex -> PNG)
|-- sim/
|   |-- results_hex/                 (generated test data and hardware outputs)
|   |-- scripts/
|   |   |-- run_all_image_tests.do   (all 16 tests + SAIF)
|   |   |-- run_first6_image_tests.do
|   |   |-- run_one_image_test.do    (any single test)
|   |   `-- run_imgtc1..6_*.do       (original single-test scripts)
|   `-- testbenches/
|       |-- tb_img_common.vh         (shared DUT/tasks for TC7-TC16)
|       |-- tb_imgtc1..6_*.v
|       `-- tb_imgtc7..16_*.v
|-- test_images/
|   |-- shapes/                      (32x32 synthetic shapes)
|   `-- photos/                      (natural images, resized by the golden model)
|-- docs/
|   |-- competition_announcement.pdf
|   |-- CNN_Accelerator_Report.docx  (competition report)
|   |-- figures/                     (block diagram, FSM, timing figures)
|   `-- vivado_results/              (utilization / timing / power screenshots)
`-- synthesis/                        (Vivado 2018.2 project)
```

## Test Images

- `test_images/shapes/`: 32x32 grayscale shapes, bright shape on a dark background: arrow, fish, heart, house, key, lightning, moon, rocket, sphere, square, star, tree, triangle, umbrella.
- `test_images/photos/`: dog, elephant, lion, lotus, nyc, zebra. The golden model resizes these to the requested width.

## Requirements

- Python 3 with NumPy and Pillow
- Siemens Questa or ModelSim
- Vivado 2018.2 (for synthesis/implementation)

```bash
pip install numpy pillow
```

Run commands from the project root.

## Quick Start

```bash
.\run_image_flow.bat test_images\shapes\sphere.png
```

This runs all three steps:

1. The Python golden-model generator. It writes the hex files for all 16 tests and records the resolved width in `sim/results_hex/img_width.txt`.
2. All 16 Questa/ModelSim image testbenches at that `IMG_WIDTH`, plus the SAIF recording during IMG-TC1.
3. Rendering of the hardware `.hex` outputs back into PNG images in `sim/image outputs/`.

To force a specific resize width, pass it as the second argument:

```bash
.\run_image_flow.bat test_images\photos\nyc.jpg 360
```

With no arguments it uses `test_images\shapes\sphere.png`.

## Manual Flow

```bash
python python/golden_model_image_flow.py test_images/shapes/sphere.png --img-width 32
vsim -c -do "do sim/scripts/run_all_image_tests.do 32"
python python/visualize_hw_outputs.py --img-width 32
```

Every testbench derives its memory sizes from `IMG_WIDTH`, so no Verilog edits are needed when the image size changes. The TC7 to TC16 data is seeded, so reruns produce identical files.

## Test Cases

| Test | Purpose |
| --- | --- |
| `IMG-TC1` | Basic correctness with Sobel Gx (also records the SAIF) |
| `IMG-TC2` | Multi-kernel selection, Gx and Gy |
| `IMG-TC3` | ReLU disabled vs enabled |
| `IMG-TC4` | Gapless output throughput |
| `IMG-TC5` | Edge-detection demo using Gx and Gy |
| `IMG-TC6` | Stall handling while streaming pixels |
| `IMG-TC7` | All weights -128 on a noise image (worst case for the packed DSP lanes) |
| `IMG-TC8` | All weights +127 on an all-255 image (largest accumulator value) |
| `IMG-TC9` | Mixed -128/127/-1/0/1 weights: every high/low lane sign combination |
| `IMG-TC10` | Identity kernel: output must equal the window centre exactly |
| `IMG-TC11` | All-ones kernel (1/16): many exact .5 rounding ties |
| `IMG-TC12` | Seeded random signed kernel |
| `IMG-TC13` | Three back-to-back passes; bank 0 reloaded between passes 2 and 3 |
| `IMG-TC14` | Laplacian with ~30% of input cycles stalled at random (seeded) |
| `IMG-TC15` | Reset mid-pass: must go idle, then a fresh pass must be bit-exact |
| `IMG-TC16` | Bank switch with ReLU toggled; junk writes to taps 9..15 must be ignored |

TC7 to TC16 also check, per pass, that every pixel was sent, `frame_done` rises, no `output_valid` appears after the frame, and no watchdog timeout occurs. Each test prints `TOTAL ERRORS: 0` on success.

Single test, any width:

```bash
vsim -c -do "do sim/scripts/run_one_image_test.do tb_imgtc14_random_stall 32"
```

## SAIF Output (Power Analysis)

`run_all_image_tests.do` (and `run_first6_image_tests.do`) record switching activity during IMG-TC1 into `sim/imgtc1_active.saif`, gated on `dut.busy` so reset and idle time are excluded.

The SAIF only matches the implemented design when it is recorded at `IMG_WIDTH = 32` and with the TC1 testbench's `CLK_PERIOD_NS` (default 10 ns) equal to the XDC `create_clock` period. Vivado converts SAIF toggle counts to toggles per second, so a faster simulation clock inflates dynamic power by the same ratio. Regenerate it after any RTL change.

## Vivado Implementation

**Clock.** `constraints/cnn_accelerator_top.xdc` has one clock constraint on `clk`, the 6x (DSP) clock; Vivado derives the /6 system clock from the BUFR.

```tcl
create_clock -period 10.000 -name clk [get_ports clk]
```

- `10.000` is the FOM run; `3.333` (300 MHz) is the Fmax check.
- Don't add `-waveform`, and keep the file to literal values (Tcl variables trigger `[Constraints 18-5210]`).
- No pins are assigned; top-level ports are `set_false_path`'d so Fmax reflects the design only. The board demo gets its own XDC.

**Hook the scripts into the runs** (once, in the Vivado Tcl console):

```tcl
set_property STEPS.SYNTH_DESIGN.TCL.PRE {C:/Users/omarr/OneDrive/Desktop/cnn 1.1/scripts/synth_msg_waivers.tcl} [get_runs synth_1]
set_property STEPS.ROUTE_DESIGN.TCL.POST {C:/Users/omarr/OneDrive/Desktop/cnn 1.1/scripts/power_activity.tcl} [get_runs impl_1]
```

`synth_msg_waivers.tcl` downgrades reviewed, expected messages to INFO (DSP register absorption, unused low result bits, the synthesis checkpoint note). `power_activity.tcl` loads the SAIF before `report_power`.

## Checkpoints (git tags)

| Tag | Design |
| --- | --- |
| `checkpoint-1x-6dsp` | 1x transposed MAC, 6 DSP (on `main`) |
| `best-fom-0.0232` | 6x pumped, 1 DSP, LUT-lean datapath |
| `best-fom-0.02714` | + LFSR FIFO/FSM |
| **`best-fom-0.03236`** | + M5/M2 cuts, paused kernel stream, SAIF clock fix (current best) |

Return to any of them with `git switch --detach <tag>`.

## Notes

- Keep generated `.hex` files in `sim/results_hex/` and PNGs in `sim/image outputs/`.
