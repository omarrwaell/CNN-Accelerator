const fs = require("fs");
const {
  Document, Packer, Paragraph, TextRun, HeadingLevel, Table, TableRow, TableCell,
  WidthType, ShadingType, BorderStyle, AlignmentType, LevelFormat, Footer, PageNumber,
  TableOfContents, PageBreak,
} = require("docx");

const OUT = process.argv[2];
const FONT = "Calibri";
const ACCENT = "1F4E79";
const TABLE_W = 9026; // A4 width 11906 - 2 x 1440 margins

// ---------- helpers ----------
const p = (text, opts = {}) =>
  new Paragraph({ spacing: { after: 120 }, ...opts, children: runs(text) });

function runs(text) {
  // **bold** and `code` inline markup
  const out = [];
  const re = /(\*\*[^*]+\*\*|`[^`]+`)/g;
  let last = 0, m;
  while ((m = re.exec(text)) !== null) {
    if (m.index > last) out.push(new TextRun({ text: text.slice(last, m.index) }));
    const t = m[0];
    if (t.startsWith("**")) out.push(new TextRun({ text: t.slice(2, -2), bold: true }));
    else out.push(new TextRun({ text: t.slice(1, -1), font: "Consolas", size: 20 }));
    last = m.index + t.length;
  }
  if (last < text.length) out.push(new TextRun({ text: text.slice(last) }));
  return out;
}

const h1 = (t) => new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun(t)] });
const h2 = (t) => new Paragraph({ heading: HeadingLevel.HEADING_2, children: [new TextRun(t)] });
const h3 = (t) => new Paragraph({ heading: HeadingLevel.HEADING_3, children: [new TextRun(t)] });
const bullet = (t, level = 0) =>
  new Paragraph({ numbering: { reference: "bullets", level }, spacing: { after: 60 }, children: runs(t) });
const bullets = (arr) => arr.map((t) => (Array.isArray(t) ? bullet(t[1], t[0]) : bullet(t)));

const border = { style: BorderStyle.SINGLE, size: 4, color: "BFBFBF" };
const borders = { top: border, bottom: border, left: border, right: border };

function table(header, rows, widths) {
  const total = widths.reduce((a, b) => a + b, 0);
  const scale = TABLE_W / total;
  const w = widths.map((x) => Math.round(x * scale));
  w[w.length - 1] += TABLE_W - w.reduce((a, b) => a + b, 0);
  const cell = (text, i, head) =>
    new TableCell({
      borders,
      width: { size: w[i], type: WidthType.DXA },
      shading: head ? { fill: "D9E2F3", type: ShadingType.CLEAR, color: "auto" } : undefined,
      margins: { top: 60, bottom: 60, left: 100, right: 100 },
      children: [new Paragraph({ children: head ? [new TextRun({ text, bold: true })] : runs(text) })],
    });
  return new Table({
    width: { size: TABLE_W, type: WidthType.DXA },
    columnWidths: w,
    rows: [
      new TableRow({ tableHeader: true, children: header.map((t, i) => cell(t, i, true)) }),
      ...rows.map((r) => new TableRow({ children: r.map((t, i) => cell(t, i, false)) })),
    ],
  });
}
const gap = () => new Paragraph({ spacing: { after: 60 }, children: [] });

// ---------- content ----------
const children = [];

children.push(
  new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { before: 1800, after: 200 },
    children: [new TextRun({ text: "CNN Convolution Accelerator", bold: true, size: 48, color: ACCENT })],
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { after: 200 },
    children: [new TextRun({ text: "Development Summary: 23-24 September 2026", size: 32 })],
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { after: 600 },
    children: [new TextRun({ text: "IEEE SSCS Egypt Chapter 2026 Student Design Competition  |  PYNQ-Z2 (xc7z020clg400-1)", size: 22, color: "595959" })],
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { after: 120 },
    children: [new TextRun({ text: "Best result so far", bold: true, size: 26 })],
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { after: 120 },
    children: [new TextRun({ text: "FOM 0.0324 (clk 100 MHz), Fmax 300 MHz, 226 LUTs, 1 DSP48E1, 0 BRAM", bold: true, size: 26, color: ACCENT })],
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER,
    children: [new TextRun({ text: "Git tag: best-fom-0.03236 (branch multipump-6x)", size: 22, color: "595959" })],
  }),
  new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { before: 400 },
    children: [new TextRun({ text: "Team: Omar Wael, Ziad Elkhiat, Salwa Galal", size: 22 })],
  }),
  new Paragraph({ children: [new PageBreak()] }),
  new TableOfContents("Contents", { hyperlink: true, headingStyleRange: "1-2" }),
  new Paragraph({ children: [new PageBreak()] }),
);

// Overview
children.push(
  h1("Overview"),
  p("This document records what changed in the accelerator between 23 and 24 September 2026, grouped into phases in the order they happened. Each phase lists what was changed, why, which files it touched, and the result."),
  p("**Starting point:** a working 3x3 streaming convolution accelerator (seven modules M1-M7). Its MAC used 9 multipliers and a 4-level adder tree, and synthesis produced several unexplained warnings."),
  p("**End point:** the same accelerator, with the same interfaces and the same results, running its 9 multiplies per output on a single DSP with 226 LUTs and no BRAM. It meets 300 MHz. FOM went from about 0.0107 (original design) to 0.0324 (see Phase 11)."),
  h2("FOM formula (from the competition announcement)"),
  p("FOM = Throughput / ( Power x ( LUTs + 50 x DSPs + 100 x BRAMs ) ), with throughput in output pixels per cycle; higher is better."),
  p("Flip-flops do not appear in the formula. Several of the changes below exploit this, trading LUTs for flip-flops."),
);

// Summary table of phases
children.push(
  h2("Phases at a glance"),
  table(
    ["Phase", "What", "Main outcome"],
    [
      ["1", "Synthesis/simulation warnings and constraints", "Warnings fixed or waived with reasons; clean clock constraint"],
      ["2", "MAC redesign: transposed form, packed DSP lanes", "9 DSP -> 6 DSP, bit-exact"],
      ["3", "Timing closure", "Fmax ~148 MHz -> 300 MHz (a LUT-built multiplier found and fixed)"],
      ["4", "Verification expansion", "16 image testbenches, 10 new test images, new scripts"],
      ["5", "Repository and checkpoints", "Private GitHub repo, tagged checkpoints"],
      ["6", "FOM analysis", "Every option weighed; 6x multi-pumping chosen"],
      ["7", "6x multi-pumped MAC", "6 DSP -> 1 DSP, MMCM removed (BUFG + BUFR)"],
      ["8", "LUT-lean datapath", "~200 LUTs removed; FOM 0.0232"],
      ["9", "FIFO and FSM counters (teammate's techniques)", "LFSR counters, no occupancy counter; FOM 0.02714"],
      ["10", "Cleanup and dynamic-power work", "Lock logic removed, kernel stream paused, M5/M2 LUT cuts"],
      ["11", "Measurement fix and final results", "SAIF recorded at the implemented clock; FOM 0.0324"],
      ["12", "Project organisation and documentation", "Renamed images, docs/ folder, README, competition report"],
    ],
    [8, 46, 46],
  ),
);

// Phase 1
children.push(
  new Paragraph({ children: [new PageBreak()] }),
  h1("Phase 1: Warnings and constraints"),
  p("**Goal:** fix every Vivado synthesis/XSIM warning, or waive it on purpose with a documented reason, and make the timing constraints trustworthy."),
  table(
    ["Warning / issue", "Cause", "Resolution"],
    [
      ["[Synth 8-3331] line_buffer has unconnected port rst", "RESET_LINE_BUF = 0 used the SRL branch, which never reads rst", "Removed the unused reset branch, the parameter and the rst port (a real fix, not a waiver)"],
      ["[Synth 8-6014] Unused sequential element (x31)", "DSP pipeline registers absorbed into the DSP (AREG/BREG/MREG/PREG), not redundant guard bits", "Widths confirmed minimal; waived, scoped to the named registers"],
      ["[Synth 8-3332] add_final/sum_out_reg[1:0] removed", "Rounding keeps only mac_result[19:4]; low bits never reach the output", "Waived, scoped to that register"],
      ["[Constraints 18-5210] No constraint will be written out", "First the power-analysis switching-activity lines in the timing XDC; then a normal note when synthesis writes its checkpoint", "Power lines moved out of the XDC; message waived"],
      ["[XSIM 43-4100] timescale mismatch with glbl", "RTL files had no `timescale", "`timescale 1ns/1ps added to all RTL files"],
      ["\"Confidence Level: Low\"", "From the power report (no switching activity), not the timing report", "SAIF recording added to the simulation flow; read automatically before report_power"],
      ["TIMING-18 / check_timing: ports without I/O delay", "No pins assigned yet", "Placeholder I/O delays were tried and failed on pad delay alone; replaced by an explicit, documented set_false_path on ports"],
    ],
    [30, 32, 38],
  ),
  gap(),
  h3("Files"),
  ...bullets([
    "`rtl/*.v`: timescale directive added to every file; `line_buffer.v`: reset branch and rst port removed",
    "`constraints/cnn_accelerator_top.xdc`: clock written as literal values (Tcl variables re-trigger 18-5210), port false paths, power lines removed",
    "`scripts/synth_msg_waivers.tcl` (new): each waiver scoped to one message instance, downgraded to INFO",
    "`scripts/power_activity.tcl` (new): reads `sim/imgtc1_active.saif` when present",
  ]),
);

// Phase 2
children.push(
  h1("Phase 2: MAC redesign, 9 DSP to 6 DSP"),
  p("**Goal:** cut DSP count, which the FOM weights at 50 LUTs each."),
  h3("Transposed-form MAC"),
  p("Every new pixel meets all three weights of its kernel row, once each, over three consecutive windows. The new MAC multiplies each incoming pixel by its three row weights once and carries column partial sums forward: result(x) = A(x-2) + B(x-1) + C(x). M2's window registers were no longer needed and were removed (48 flip-flops)."),
  h3("Two products per DSP (packed lanes)"),
  p("Two weights share the DSP's 25-bit A input: A = w0 * 2^16 + w1. Adding 2^15 in the DSP post-adder keeps the low lane positive, so both products are recovered with no correction logic: q*w0 = P[31:16] and q*w1 = {~P[15], P[14:0]}. This holds for every 8-bit weight, including -128."),
  h3("Other changes in this phase"),
  ...bullets([
    "Data registers no longer reset; only control state resets. Each stage is enabled by its valid signal.",
    "Kernel banks moved to LUT-RAM. This was reverted in Phase 8, once it was clear the FOM does not count flip-flops.",
    "Kernel storage lost its unused rst port, avoiding a new 8-3331.",
  ]),
  p("**Result:** 6 DSPs instead of 9; all 6 original testbenches pass with 0 errors (bit-exact)."),
);

// Phase 3
children.push(
  h1("Phase 3: Timing closure to 300 MHz"),
  ...bullets([
    "Measured Fmax had dropped to about 148 MHz. The critical path was 8 levels of LUT and carry logic into `ms_m_reg`: Vivado had built the three single-weight (9x8) multiplies from LUTs, and only 3 DSPs were in use.",
    "Fix: the single-weight multiply moved into its own module marked `use_dsp = \"yes\"`, giving 6 DSPs and a fully registered path.",
    "A `create_clock` error at 3.333 ns (the fixed -waveform {0 5} was longer than the period) was fixed by removing -waveform, so the duty cycle follows the period.",
    "**Result:** timing closed at 300 MHz (3.333 ns); 333 MHz (3.0 ns) failed on the kernel-to-DSP weight path.",
  ]),
);

// Phase 4
children.push(
  h1("Phase 4: Verification expansion"),
  h3("New testbenches IMG-TC7 to IMG-TC16"),
  table(
    ["Test", "Checks"],
    [
      ["TC7", "All weights -128 on a noise image (worst case for the packed lanes)"],
      ["TC8", "All weights +127 on an all-255 image (largest accumulator value)"],
      ["TC9", "Mixed -128/127/-1/0/1 weights: every high/low lane sign combination"],
      ["TC10", "Identity kernel: output must equal the window centre exactly"],
      ["TC11", "All-ones kernel: many exact .5 rounding cases"],
      ["TC12", "Seeded random signed kernel"],
      ["TC13", "Three back-to-back passes with a kernel reload between passes"],
      ["TC14", "About 30% random input stalls (seeded)"],
      ["TC15", "Reset in the middle of a pass, then a bit-exact fresh pass"],
      ["TC16", "Bank switch with ReLU toggled; writes to taps 9-15 must be ignored"],
    ],
    [12, 88],
  ),
  gap(),
  ...bullets([
    "Every pass also checks: all pixels sent, `frame_done` rises, no output after the frame, and no watchdog timeout.",
    "`sim/testbenches/tb_img_common.vh`: shared DUT, clock and tasks, so each new testbench is short.",
    "Golden model: generates data for all 16 tests (seeded) and was vectorised with NumPy, with identical arithmetic.",
    "Ten new 32x32 test images: star, rocket, umbrella, heart, house, tree, arrow, lightning, fish, key (now in `test_images/shapes/`).",
    "Scripts: `run_all_image_tests.do` (16 tests, records the SAIF), `run_first6_image_tests.do`, `run_one_image_test.do`, and an IMG_WIDTH default in the TC1 script.",
    "README rewritten; `run_image_flow.bat` and the visualizer updated.",
  ]),
);

// Phase 5
children.push(
  h1("Phase 5: Repository and checkpoints"),
  ...bullets([
    "Git repository created with a `.gitignore` that leaves out Vivado build folders, logs and generated hex/PNG/SAIF files.",
    "Pushed to a private GitHub repository: github.com/omarrwaell/CNN-Accelerator.",
    "Experimental work is kept on branch `multipump-6x`; `main` holds the 1x design.",
  ]),
  table(
    ["Tag", "Design", "Notes"],
    [
      ["checkpoint-1x-6dsp", "1x transposed MAC, 6 DSP", "On main"],
      ["best-fom-0.168", "6x multi-pumped, 1 DSP, before the LUT cuts", "0.168 corresponds to dynamic power"],
      ["best-fom-0.0232", "6x multi-pumped, 1 DSP, LUT-lean datapath", "Fmax 300 MHz"],
      ["best-fom-0.02714", "+ LFSR FIFO/FSM", ""],
      ["best-fom-0.03236", "+ M5/M2 cuts, stream pause, SAIF fix", "Current best"],
    ],
    [28, 42, 30],
  ),
  gap(),
  p("To return to any checkpoint: `git switch --detach <tag>`. The tags and the multipump-6x branch exist locally; push them with `git push origin multipump-6x --tags`."),
);

// Phase 6
children.push(
  h1("Phase 6: FOM analysis and options"),
  p("Once the formula was known, each proposed direction was estimated against it before any was built:"),
  table(
    ["Option", "Verdict", "Reason"],
    [
      ["Higher throughput (2 outputs/cycle, parallel kernels)", "Rejected", "Resources and dynamic power grow almost as fast as throughput"],
      ["Larger kernel or a third bank", "Rejected", "Adds cost; throughput unchanged"],
      ["Single kernel only", "Rejected", "Small saving; loses the multi-kernel bonus"],
      ["Time-multiplexing one MAC (lower throughput)", "Rejected", "Throughput falls faster than cost"],
      ["Constant/CSD/shift-add multipliers", "Not allowed", "Weights must be programmable 8-bit signed"],
      ["BRAM instead of LUT muxes", "Rejected", "One BRAM costs 100 in the formula"],
      ["2x2 kernel", "Possible, not taken", "Estimated ~0.03 but weaker as a design; kept as an option"],
      ["6x multi-pumped DSP", "Chosen", "9 products per system cycle on one DSP"],
    ],
    [38, 18, 44],
  ),
);

// Phase 7
children.push(
  h1("Phase 7: 6x multi-pumped MAC (6 DSP to 1 DSP)"),
  p("One DSP48E1 runs six operations per system cycle on a clock six times faster: a packed operation and a single-weight operation for each of the three rows."),
  h3("Step 1: MMCM version"),
  ...bullets([
    "New `rtl/clk_gen_6x.v`: an MMCM made a 50 MHz system clock and a 300 MHz DSP clock; the VCO was lowered to its 600 MHz minimum.",
    "A simulation-model bug gave `x` on every output (the model locked to half rate and missed DSP operations). Fixed by measuring the clock period before generating fast pulses.",
    "Problem: the MMCM alone costs about 0.1 W of total power.",
  ]),
  h3("Step 2: MMCM removed (BUFG + BUFR)"),
  ...bullets([
    "The 300 MHz input clock drives the DSP through a BUFG; the system clock is that clock divided by 6 in a BUFR (almost no power).",
    "Every clock crossing is a flip-flop-to-flip-flop path; operands are re-registered on the fast clock before the DSP, and the schedule shifted one phase to match.",
    "The DSP phase is found at run time from a toggle bit, so no fixed clock phase is assumed.",
    "Testbenches drive the 6x clock and follow the design's system clock (`dut.clk_sys`).",
    "M3 latency was kept at 6 system cycles, so M5, M6 and M7 are unchanged.",
  ]),
  p("**Result:** 1 DSP, 408 LUTs, 1043 FFs, total power 0.123 W (dynamic 0.018 W). Tagged `best-fom-0.168`."),
);

// Phase 8
children.push(
  h1("Phase 8: LUT-lean datapath (~200 LUTs removed)"),
  p("**Goal:** since the formula counts LUTs but not flip-flops, move work from LUTs into flip-flops or into the DSP."),
  table(
    ["Change", "Module", "Estimated saving"],
    [
      ["Both kernel banks in one small LUT-RAM (8 LUTs), streamed to M3 one tap per cycle", "M4 kernel_storage", "~60 LUTs"],
      ["Packed weights built from the stream with one shared 9-bit subtractor", "M3", "~18 LUTs"],
      ["6-word flip-flop ring feeds the DSP A input (no 6:1 mux)", "M3", "~35 LUTs"],
      ["Column sums accumulated on the fast clock as DSP results emerge (no column adders)", "M3", "~50 LUTs"],
      ["Rounding bias preloaded into an accumulator; M5 rounding is a bit-select", "M3, M5", "~17 LUTs"],
      ["Line buffer and delay chains kept as flip-flops, not SRLs", "M1, M3", "~17 LUTs"],
    ],
    [60, 18, 22],
  ),
  gap(),
  ...bullets([
    "Interfaces unchanged except M4 to M3, which is now a serial tap stream. M3 latency is still 6.",
    "New kernel weights reach M3 within about 12 system cycles of a write or select change. The first window arrives at least 2*IMG_WIDTH+2 cycles after start, so any IMG_WIDTH of 6 or more is unaffected.",
    "**Result (team's run):** FOM 0.0232 at Fmax 300 MHz. Tagged `best-fom-0.0232`.",
  ]),
);

// Phase 9
children.push(
  h1("Phase 9: FIFO and FSM counters (teammate's techniques)"),
  p("A teammate, working on the 1x design, cut it from 367 to 180 LUTs. Most of her techniques were already covered by the 6x design (single LUT-RAM kernel store, fewer fabric adders). Her FIFO and FSM changes were not, and were re-implemented here:"),
  ...bullets([
    "`rtl/lfsr_counter.v` (new): an XNOR LFSR event counter whose terminal state is computed at elaboration, so it replaces \"count == N\" exactly. The tap table was checked to give maximal-length sequences for 3 to 20 bits.",
    "FIFO: no occupancy counter. Before release, words held = `wr_ptr`, so the release point is `wr_ptr == 57`; \"not empty\" is `wr_ptr != rd_ptr`; the `more_r` gate is gone; the release counter is an LFSR.",
    "FSM: the 11-bit pixel counter is an LFSR and the drain counter a 7-bit shift register.",
    "**Result (team's run):** FOM 0.02714. Tagged `best-fom-0.02714`.",
  ]),
);

// Phase 10
children.push(
  h1("Phase 10: Cleanup and dynamic-power work"),
  ...bullets([
    "Leftover MMCM lock logic removed (the lock signal was a constant 1 once the MMCM was gone).",
    "M4 kernel stream paused: it runs one 10-tap sweep after each write or bank change, then stops, so nothing in M4 or M3's operand path toggles during a pass. The sweep is 10 taps, not 9, so a sweep starting on a column-1 tap rebuilds that row with a fresh column-0 value.",
    "M5: saturation is built only when the widths make overflow possible. The top level computes the largest result, 9 x 255 x 128 / 16 = 18360, which is below 32767, so saturation is omitted. ReLU became the output register's synchronous reset instead of a 16-bit mux.",
    "M2: an LFSR marks the end of each row, and two 2-bit flag registers track column >= 2 and row >= 2, replacing two binary counters and their comparators.",
    "Unused `design_1` block design removed from the Vivado project.",
    "Considered and rejected: flip-flop versions of the two LUT-RAMs (the read multiplexer would cost far more LUTs) and clock gating while idle (the SAIF only measures the active window, so the FOM would not change).",
  ]),
);

// Phase 11
children.push(
  h1("Phase 11: Measurement fix and final results"),
  p("The SAIF testbench clocked the design six times faster (1.67 ns fast clock) than the power run (10 ns). Vivado converts SAIF toggle counts into toggles per second, so every net's activity, and the signal/logic dynamic power, was reported about 6x too high. The TC1 testbench now has `CLK_PERIOD_NS` (default 10 ns), which must equal the XDC clock period. This is a measurement correction, not a design change."),
  table(
    ["Quantity", "clk = 10 ns (FOM run)", "clk = 3.333 ns (Fmax run)"],
    [
      ["Clocks", "DSP 100 MHz, system 16.7 MHz", "DSP 300 MHz, system 50 MHz"],
      ["Slice LUTs", "226 (194 logic + 32 LUT-RAM)", "229 (197 logic + 32 LUT-RAM)"],
      ["Registers", "1233", "1233"],
      ["DSP / BRAM", "1 / 0", "1 / 0"],
      ["Total power", "0.112 W (static 0.104, dynamic 0.007)", "0.126 W (static 0.105, dynamic 0.022)"],
      ["Power confidence", "High (SAIF)", "High (SAIF)"],
      ["Setup / hold slack", "WNS +5.923 ns, WHS +0.059 ns", "WNS +0.055 ns, WHS +0.075 ns"],
      ["FOM", "1 / (0.112 x 276) = 0.0324", "1 / (0.126 x 279) = 0.0284"],
    ],
    [22, 39, 39],
  ),
  gap(),
  p("**Result:** FOM 0.0324 at the 10 ns clock (team's figure 0.03236). Tagged `best-fom-0.03236`."),
);

// Phase 12
children.push(
  h1("Phase 12: Project organisation and documentation"),
  ...bullets([
    "Test images renamed without the `candidate` prefix and split into `test_images/shapes/` (14 synthetic 32x32 shapes) and `test_images/photos/` (6 photos).",
    "New `docs/` folder: competition announcement, Vivado screenshots (`docs/vivado_results/`), report figures (`docs/figures/`), this summary and the competition report.",
    "README rewritten with the final results, layout, test list and checkpoints; `run_image_flow.bat` points at the new image paths.",
  ]),
);

// Results
children.push(
  h1("Results over time"),
  p("Figures come from the Vivado reports and screenshots taken during development. FOM uses total on-chip power unless marked. \"-\" means the figure was not captured."),
  table(
    ["Build", "LUTs", "DSP", "BRAM", "Total power", "Timing", "FOM"],
    [
      ["Original (9-DSP adder tree), 100 MHz", "316", "9", "0", "0.122 W", "WNS +6.38 ns @ 100 MHz", "~0.0107"],
      ["1x transposed, 6 DSP, 100 MHz", "367", "6", "0", "0.121 W", "300 MHz met", "~0.0124"],
      ["6x pumped, no MMCM (best-fom-0.168)", "408", "1", "0", "0.123 W", "300 MHz", "0.168 (dynamic power)"],
      ["6x pumped, LUT-lean (best-fom-0.0232)", "-", "1", "0", "-", "300 MHz", "0.0232"],
      ["+ LFSR FIFO/FSM (best-fom-0.02714)", "230", "1", "0", "0.111 W (no SAIF)", "300 MHz", "0.02714"],
      ["Final (best-fom-0.03236), clk 10 ns", "226", "1", "0", "0.112 W", "WNS +5.923 ns", "0.0324"],
      ["Final, clk 3.333 ns (300 MHz)", "229", "1", "0", "0.126 W", "WNS +0.055 ns", "0.0284"],
    ],
    [34, 8, 7, 7, 15, 16, 13],
  ),
);

// Open items
children.push(
  h1("Open items"),
  ...bullets([
    "**Regression:** run all 16 testbenches on the final RTL (`run_all_image_tests.do 32`) and keep the transcript for the report.",
    "**Power definition:** state in the report that the FOM uses total on-chip power, SAIF-based, at the stated clock.",
    "**Organizers:** confirm which power figure and clock the FOM should use.",
    "**Board demo:** planned next (self-test wrapper, then a PYNQ overlay); the 125 MHz board clock can drive the design directly.",
    "**XDC:** Vivado saved auto-placed PACKAGE_PIN lines into the constraints file; they are not real board pins and are left uncommitted.",
  ]),
);

// ---------- document ----------
const doc = new Document({
  creator: "CNN Accelerator team",
  title: "CNN Accelerator - Development Summary",
  styles: {
    default: { document: { run: { font: FONT, size: 22 } } },
    paragraphStyles: [
      { id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 32, bold: true, color: ACCENT, font: FONT },
        paragraph: { spacing: { before: 360, after: 160 }, outlineLevel: 0 } },
      { id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 26, bold: true, color: ACCENT, font: FONT },
        paragraph: { spacing: { before: 240, after: 120 }, outlineLevel: 1 } },
      { id: "Heading3", name: "Heading 3", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 23, bold: true, color: "404040", font: FONT },
        paragraph: { spacing: { before: 180, after: 80 }, outlineLevel: 2 } },
    ],
  },
  numbering: {
    config: [{
      reference: "bullets",
      levels: [
        { level: 0, format: LevelFormat.BULLET, text: "•", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 540, hanging: 270 } } } },
        { level: 1, format: LevelFormat.BULLET, text: "–", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 1080, hanging: 270 } } } },
      ],
    }],
  },
  sections: [{
    properties: { page: { margin: { top: 1440, right: 1440, bottom: 1440, left: 1440 } } },
    footers: {
      default: new Footer({
        children: [new Paragraph({
          alignment: AlignmentType.CENTER,
          children: [new TextRun({ text: "CNN Accelerator - Development Summary  |  Page ", size: 18, color: "7F7F7F" }),
                     new TextRun({ children: [PageNumber.CURRENT], size: 18, color: "7F7F7F" })],
        })],
      }),
    },
    children,
  }],
});

Packer.toBuffer(doc).then((buf) => { fs.writeFileSync(OUT, buf); console.log("written", OUT); });
