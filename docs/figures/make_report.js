const fs = require("fs");
const path = require("path");
const {
  Document, Packer, Paragraph, TextRun, HeadingLevel, Table, TableRow, TableCell,
  WidthType, ShadingType, BorderStyle, AlignmentType, LevelFormat, Footer, Header, PageNumber,
  TableOfContents, PageBreak, ImageRun, VerticalAlign,
} = require("docx");

const OUT = process.argv[2];
const DOCS = "C:/Users/omarr/OneDrive/Desktop/cnn 1.1/docs";
const FONT = "Calibri";
const TABLE_W = 9026;           // A4, 1-inch margins
const MAX_IMG_W = 600;          // px (~6.25 in)

// ---------------------------------------------------------------- helpers
function runs(text, base = {}) {
  const out = [];
  const re = /(\*\*[^*]+\*\*|`[^`]+`|_\{[^}]+\}|\^\{[^}]+\})/g;
  let last = 0, m;
  while ((m = re.exec(text)) !== null) {
    if (m.index > last) out.push(new TextRun({ ...base, text: text.slice(last, m.index) }));
    const t = m[0];
    if (t.startsWith("**")) out.push(new TextRun({ ...base, text: t.slice(2, -2), bold: true }));
    else if (t.startsWith("`")) out.push(new TextRun({ ...base, text: t.slice(1, -1), font: "Consolas", size: 19 }));
    else if (t.startsWith("_{")) out.push(new TextRun({ ...base, text: t.slice(2, -1), subScript: true }));
    else out.push(new TextRun({ ...base, text: t.slice(2, -1), superScript: true }));
    last = m.index + t.length;
  }
  if (last < text.length) out.push(new TextRun({ ...base, text: text.slice(last) }));
  return out;
}
const p = (text, opts = {}) => new Paragraph({ spacing: { after: 120 }, alignment: AlignmentType.JUSTIFIED, ...opts, children: runs(text) });
const h1 = (t) => new Paragraph({ heading: HeadingLevel.HEADING_1, children: [new TextRun(t)] });
const h2 = (t) => new Paragraph({ heading: HeadingLevel.HEADING_2, children: [new TextRun(t)] });
const h3 = (t) => new Paragraph({ heading: HeadingLevel.HEADING_3, children: [new TextRun(t)] });
const bullet = (t, level = 0) => new Paragraph({ numbering: { reference: "bullets", level }, spacing: { after: 60 }, children: runs(t) });
const bullets = (arr) => arr.map((t) => (Array.isArray(t) ? bullet(t[1], t[0]) : bullet(t)));
const numbered = (arr, ref = "numbers") => arr.map((t) => new Paragraph({ numbering: { reference: ref, level: 0 }, spacing: { after: 60 }, children: runs(t) }));
const eq = (t) => new Paragraph({ alignment: AlignmentType.CENTER, spacing: { before: 80, after: 140 }, children: runs(t, { font: "Cambria Math" }) });
const gap = () => new Paragraph({ spacing: { after: 40 }, children: [] });
const pageBreak = () => new Paragraph({ children: [new PageBreak()] });

const border = { style: BorderStyle.SINGLE, size: 4, color: "000000" };
const borders = { top: border, bottom: border, left: border, right: border };

function table(header, rows, widths, opts = {}) {
  const total = widths.reduce((a, b) => a + b, 0);
  const w = widths.map((x) => Math.round((x * TABLE_W) / total));
  w[w.length - 1] += TABLE_W - w.reduce((a, b) => a + b, 0);
  const cell = (text, i, head) =>
    new TableCell({
      borders,
      width: { size: w[i], type: WidthType.DXA },
      shading: head ? { fill: "D9D9D9", type: ShadingType.CLEAR, color: "auto" } : undefined,
      margins: { top: 50, bottom: 50, left: 90, right: 90 },
      verticalAlign: VerticalAlign.CENTER,
      children: [new Paragraph({ children: head ? [new TextRun({ text, bold: true, size: 20 })] : runs(text, { size: 20 }) })],
    });
  return new Table({
    width: { size: TABLE_W, type: WidthType.DXA },
    columnWidths: w,
    rows: [
      ...(header ? [new TableRow({ tableHeader: true, children: header.map((t, i) => cell(t, i, true)) })] : []),
      ...rows.map((r) => new TableRow({ children: r.map((t, i) => cell(t, i, false)) })),
    ],
  });
}

let figNo = 0, tabNo = 0;
function caption(kind, text) {
  const n = kind === "Figure" ? ++figNo : ++tabNo;
  return new Paragraph({
    alignment: AlignmentType.CENTER, spacing: { before: 80, after: 200 },
    children: [new TextRun({ text: `${kind} ${n}. `, bold: true, size: 20 }), new TextRun({ text, italics: true, size: 20 })],
  });
}
function figure(rel, wpx, hpx, text, maxW = MAX_IMG_W) {
  const scale = Math.min(1, maxW / wpx);
  return [
    new Paragraph({
      alignment: AlignmentType.CENTER, spacing: { before: 120 },
      children: [new ImageRun({ type: "png", data: fs.readFileSync(path.join(DOCS, rel)),
        transformation: { width: Math.round(wpx * scale), height: Math.round(hpx * scale) } })],
    }),
    caption("Figure", text),
  ];
}
function tableCap(text, t) { return [caption("Table", text), t, gap()]; }

// ---------------------------------------------------------------- cover
const C = [];
C.push(
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { before: 600, after: 120 },
    children: [new TextRun({ text: "IEEE SSCS Egypt Chapter", size: 26 })] }),
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 480 },
    children: [new TextRun({ text: "2026 Student Design Competition", size: 26 })] }),
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 160 },
    children: [new TextRun({ text: "FPGA-Based Edge-AI Vision Accelerator", bold: true, size: 44 })] }),
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 160 },
    children: [new TextRun({ text: "Streaming 3 x 3 CNN Convolution Engine on a Single Multi-Pumped DSP", size: 30 })] }),
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 600 },
    children: [new TextRun({ text: "Final Design Report  |  Target: PYNQ-Z2 (Zynq-7000 xc7z020clg400-1)", size: 22 })] }),
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { after: 160 },
    children: [new TextRun({ text: "Team Members", bold: true, size: 26 })] }),
);
{
  const tw = 6000, cw = [1000, 5000];
  const cell = (t, i, head) => new TableCell({
    borders, width: { size: cw[i], type: WidthType.DXA }, verticalAlign: VerticalAlign.CENTER,
    shading: head ? { fill: "D9D9D9", type: ShadingType.CLEAR, color: "auto" } : undefined,
    margins: { top: 100, bottom: 100, left: 140, right: 140 },
    children: [new Paragraph({ alignment: i === 0 ? AlignmentType.CENTER : AlignmentType.LEFT,
      children: [new TextRun({ text: t, bold: head, size: 24 })] })],
  });
  C.push(new Table({
    width: { size: tw, type: WidthType.DXA }, columnWidths: cw, alignment: AlignmentType.CENTER,
    rows: [
      new TableRow({ children: [cell("No.", 0, true), cell("Name", 1, true)] }),
      new TableRow({ children: [cell("1", 0), cell("Omar Wael", 1)] }),
      new TableRow({ children: [cell("2", 0), cell("Ziad Elkhiat", 1)] }),
      new TableRow({ children: [cell("3", 0), cell("Salwa Galal", 1)] }),
    ],
  }));
}
C.push(
  new Paragraph({ alignment: AlignmentType.CENTER, spacing: { before: 700 },
    children: [new TextRun({ text: "September 2026", size: 22 })] }),
  pageBreak(),
  new TableOfContents("Contents", { hyperlink: true, headingStyleRange: "1-2" }),
  pageBreak(),
);

// ---------------------------------------------------------------- 1 summary
C.push(
  h1("1. Executive Summary"),
  p("This report describes a streaming 3 x 3 convolution accelerator for grayscale images, written in Verilog-2001 and implemented on the Zynq-7000 xc7z020 device of the PYNQ-Z2 board. The accelerator accepts one 8-bit pixel per system clock cycle in raster order and, once its pipeline and output buffer are filled, delivers one 16-bit output pixel per system cycle without gaps. Kernel coefficients are programmable 8-bit signed fixed-point values held in two independently writable banks, and an optional ReLU can be applied to every output."),
  p("The design is shaped by the competition Figure of Merit, FOM = Throughput / (Power x (LUTs + 50 x DSPs + 100 x BRAMs)). DSP slices are weighted 50 times more than a LUT, BRAMs 100 times, and flip-flops are not counted at all. The architecture therefore computes all nine multiplications of each output on a **single DSP48E1** that runs at six times the system clock and packs two products into each of its operations. It keeps every buffer either in flip-flops or in small LUT-RAMs, and replaces binary counters and fabric adders with LFSRs, shift registers and DSP-internal logic wherever possible."),
  h2("Key results"),
  ...bullets([
    "**Resources:** 226 LUTs (194 logic + 32 LUT-RAM), 1233 flip-flops, **1 DSP48E1**, **0 BRAM**.",
    "**Throughput:** 1 output pixel per system cycle (gapless; verified by test IMG-TC4).",
    "**Maximum frequency:** DSP clock 300 MHz met (WNS +0.055 ns), giving a 50 MHz system clock, i.e. 50 Mpixel/s.",
    "**Power:** 0.112 W total on-chip at the 100 MHz reference clock (SAIF-based, confidence High).",
    "**FOM:** 1 / (0.112 x (226 + 50 x 1)) = **0.0324** at the 100 MHz reference clock; 0.0284 at the 300 MHz clock.",
    "**Verification:** 16 image-based testbenches, compared bit-for-bit with a Python golden model.",
    "**Bonus features:** one-output-pixel-per-cycle pipelined architecture, multiple kernels (2 banks), ReLU, Sobel edge-detection demo.",
  ]),
);

// ---------------------------------------------------------------- 2 spec table
C.push(
  h1("2. Specification Compliance and Results Table"),
  p("Table 1 follows the format required by the competition announcement. \"Specification\" is the requirement; \"Team Result\" is what this design achieves."),
  ...tableCap("Required results table.", table(
    ["Parameter", "Specification", "Team Result", "Units", "Comments"],
    [
      ["Input image size", ">= 32 x 32", "32 x 32 (parameter IMG_WIDTH)", "pixels", "Square image; any IMG_WIDTH >= 6 by parameter"],
      ["Input precision", "Fixed-point unsigned", "UQ8.0 (8-bit unsigned)", "bits", "Grayscale 0-255, matches image sensors"],
      ["Kernel precision", "8-bit signed", "Q3.4 (8-bit signed)", "bits", "Range -8.0 to +7.9375, step 1/16"],
      ["Architecture type", "N x N CNN convolution", "Streaming line buffer + transposed-form 3 x 3 MAC on one 6x multi-pumped DSP", "-", "Stride 1, valid convolution (30 x 30 outputs)"],
      ["Multipliers / MACs", "-", "1 DSP48E1; 9 multiplications per output as 6 DSP operations per system cycle", "DSP", "Two products packed per operation"],
      ["Pipeline stages", "-", "M3: 6, M5: 2, FIFO: 1", "system cycles", "DSP: 3 registers at the 6x clock"],
      ["Latency", "-", "8 (window to result); ~135 (first pixel to first output)", "system cycles", "Includes line-buffer fill and 58-result FIFO reserve"],
      ["Throughput", "-", "1", "output pixels / cycle", "Gapless output stream (IMG-TC4)"],
      ["FPGA utilization", "-", "226 LUT, 1233 FF, 1 DSP, 0 BRAM", "-", "LUTs: 194 logic + 32 LUT-RAM"],
      ["Maximum frequency", "-", "300 (DSP clock) / 50 (system clock)", "MHz", "WNS +0.055 ns at 3.333 ns"],
      ["Power estimate", "-", "0.112 (100 MHz clk); 0.126 (300 MHz clk)", "W", "Total on-chip, SAIF, confidence High"],
      ["Verification status", "Golden-model comparison", "16 image tests, bit-exact vs Python model", "-", "See Section 10"],
      ["FOM", "Report", "0.0324 (100 MHz clk); 0.0284 (300 MHz clk)", "1 / (W x LUT-eq.)", "Throughput = 1"],
    ],
    [16, 15, 30, 13, 26],
  )),
);

// ---------------------------------------------------------------- 3 architecture
C.push(
  pageBreak(),
  h1("3. Architecture Overview"),
  p("Figure 1 shows the top-level structure. Pixels enter M1, which delays the stream by one and two image rows so that three vertically aligned pixels (the newest column of the 3 x 3 window) are available every cycle. M2 decides when a column completes a valid window. M3 multiplies each new column by the kernel and accumulates the partial sums of the three window columns over time. M5 rounds and applies ReLU, and M7 buffers results so the output stream has no gaps. M4 stores the two kernel banks, M6 sequences each pass, and a small clock generator provides the 6x DSP clock and the system clock."),
  ...figure("figures/fig_block_diagram.png", 1679, 937, "Top-level block diagram (solid: data, dashed: control)."),
  ...tableCap("Modules and their roles.", table(
    ["Module", "File", "Role"],
    [
      ["M1", "line_buffer.v", "Two IMG_WIDTH-deep row delays (flip-flops); outputs the newest column of three pixels."],
      ["M2", "window_generator.v", "Position tracking; asserts window_valid when the column completes a 3 x 3 window."],
      ["M3", "mac.v", "Transposed-form MAC on one DSP48E1 at 6x clock with packed lanes; accumulators; rounding bias."],
      ["M4", "kernel_storage.v", "Two 9-tap banks in one LUT-RAM; streams the selected bank to M3."],
      ["M5", "output_handling.v", "Round-half-up, overflow handling, optional ReLU."],
      ["M6", "control_fsm.v", "Pass sequencing: IDLE, STREAM, DRAIN, DONE; pixel handshake."],
      ["M7", "FIFO.v", "64 x 16 output buffer; releases a gapless stream after a fixed reserve."],
      ["-", "clk_gen_6x.v", "BUFG (DSP clock) and BUFR divide-by-6 (system clock); no MMCM."],
      ["-", "lfsr_counter.v", "LFSR event counter used by M2, M6 and M7."],
      ["-", "cnn_accelerator_top.v", "Top level: connects all modules."],
    ],
    [9, 23, 68],
  )),
  h2("3.1 Top-level interface"),
  ...tableCap("Top-level ports (all synchronous to the system clock except clk).", table(
    ["Port", "Dir.", "Width", "Description"],
    [
      ["clk", "in", "1", "6x reference clock (DSP clock); the system clock is clk / 6"],
      ["rst", "in", "1", "Synchronous reset (control state only)"],
      ["start", "in", "1", "Pulse to begin a pass"],
      ["busy / done", "out", "1 / 1", "Pass in progress / pass finished and all results released"],
      ["kernel_wr_en, _bank, _addr, _data", "in", "1, 1, 4, 8", "Write one tap (0-8) of one bank per cycle; taps 9-15 are ignored"],
      ["kernel_select", "in", "1", "Bank used by the next pass"],
      ["relu_enable", "in", "1", "Apply ReLU to every output"],
      ["pixel_in / pixel_in_valid", "in", "8 / 1", "Raster-order pixel stream"],
      ["pixel_req", "out", "1", "Accelerator is accepting pixels (STREAM state)"],
      ["output_pixel / output_valid", "out", "16 / 1", "Result stream (Q15.0 signed)"],
      ["frame_done", "out", "1", "Last result of the pass has been released"],
    ],
    [30, 8, 14, 48],
  )),
);

// ---------------------------------------------------------------- 4 datapath
C.push(
  pageBreak(),
  h1("4. Datapath"),
  h2("4.1 Line buffer and window generation (M1, M2)"),
  p("M1 holds two shift registers of IMG_WIDTH pixels each. On every accepted pixel both shift by one; the input pixel, the output of the first register (one row earlier) and the output of the second register (two rows earlier) form the newest window column (q0, q1, q2 = rows R-2, R-1, R). The registers shift only when a pixel is accepted, so a stalled source simply freezes the pipeline. Their contents are never reset: M2 only raises window_valid after two full rows and two columns of real data have entered, so no power-up value can be observed."),
  p("Because M3 works in transposed form (Section 4.2), no 3 x 3 window register is needed: M2 only has to decide when the current column completes a valid window. It tracks three facts: the end of each row (an LFSR that flags the IMG_WIDTH-th pixel), \"column >= 2\" and \"row >= 2\" (two 2-bit shift registers of flags). window_valid is their AND with the pixel-accepted signal. At each row boundary this produces a gap of KERNEL_SIZE - 1 = 2 cycles without a valid window, which M7 later absorbs."),
  h2("4.2 MAC engine (M3)"),
  h3("Transposed-form accumulation"),
  p("Let q_{r}(x) be the pixel of window row r in image column x, and w_{rc} the kernel weight in row r, column c. The output for the window ending at column x is"),
  eq("y(x) = Σ_{r} [ w_{r0} q_{r}(x-2) + w_{r1} q_{r}(x-1) + w_{r2} q_{r}(x) ]"),
  p("Each new pixel therefore meets all three weights of its kernel row over three consecutive windows. Instead of multiplying the nine window taps every cycle, M3 multiplies every new pixel once by its three row weights and forwards the column partial sums:"),
  eq("A = Σ_{r} w_{r0} q_{r},   B = Σ_{r} w_{r1} q_{r},   C = Σ_{r} w_{r2} q_{r}"),
  eq("T1 <- A,   T2 <- T1 + B,   y <- T2 + C     =>     y(x) = A(x-2) + B(x-1) + C(x)"),
  p("T1, T2 and y update only when a pixel is accepted, so stalls are handled exactly like M1. At a row boundary the first two columns of the new row refill T1 and T2 before window_valid rises again."),
  h3("Two products per DSP operation"),
  p("A pixel q is multiplied by two weights at once by packing both weights into the 25-bit A port of the DSP48E1 (Figure 2): A = w0 x 2^{16} + w1, which fits in 25 signed bits for any 8-bit weights. The DSP post-adder adds a constant 2^{15}:"),
  eq("P = q x A + 2^{15} = (q x w0) x 2^{16} + (q x w1 + 2^{15})"),
  p("Since q x w1 lies in [-32640, 32385], the low lane q x w1 + 2^{15} lies in [128, 65153]: it can neither borrow from nor carry into bit 16. Both products are therefore recovered with no correction logic: q x w0 = P[31:16], and q x w1 = P[15:0] - 2^{15}, which is simply P[15:0] with its top bit inverted. Single-weight operations use a sign-extended weight and read the low lane in the same way."),
  ...figure("figures/fig_dsp_packing.png", 2400, 760, "Operand packing on the DSP48E1 A port and lane extraction from P."),
  h3("6x multi-pumping on one DSP"),
  p("Per system cycle the kernel needs 9 products, which the packing reduces to 6 DSP operations: for each of the three rows, one packed operation (q_{r} x (w_{r0}, w_{r1})) and one single operation (q_{r} x w_{r2}). A single DSP48E1 executes these six operations in the six cycles of a clock running at six times the system clock (Figure 3). The DSP keeps its full A/B, M and P register pipeline, so it runs at 300 MHz on the -1 speed grade."),
  ...bullets([
    "**Operand ring.** The six A operands are held in a ring of six 25-bit registers on the fast clock that rotates once per system cycle, so the operand needed in each phase is always at the head of the ring. This replaces a 25-bit 6:1 multiplexer with flip-flops, which the FOM does not count.",
    "**Pixel select.** The B operand is one of the three column pixels (a 3:1 select), each used by two consecutive operations.",
    "**Phase tracking.** A bit that toggles on every system clock edge is sampled on the fast clock; its change pins a 3-bit phase counter, so the design never assumes a particular phase relationship between the two clocks.",
    "**Accumulation on the fast clock.** DSP results appear one per fast cycle. The high and low lanes of the packed operations are added into running sums A and B, and the single operations into C. The sums are copied to a holding register once complete and read at the next system clock edge; no fabric adder tree is needed.",
    "**Rounding bias.** The C sum starts from 2^{FRAC_BITS-1} = 8 instead of 0, so the result leaving M3 already contains the rounding constant used by M5.",
  ]),
  ...figure("figures/fig_multipump_schedule.png", 2600, 1250, "Schedule of the six DSP operations within one system clock period."),
  h3("Weight delivery"),
  p("M4 streams the selected bank one tap per cycle (row-major). M3 builds each packed operand when a row's column-1 tap arrives, using the column-0 tap received just before it, with one shared 9-bit subtractor (the high lane is w0 - sign(w1) because the sign extension of w1 contributes -2^{16} when w1 is negative). The finished operand is inserted into the ring in the phase in which its slot passes the ring input, without disturbing the other five slots. The stream runs for one 10-tap sweep after every kernel write or bank change and then stops, so the operand path does not switch during a pass."),
  h2("4.3 Output handling (M5)"),
  ...bullets([
    "**Rounding:** round half up. Because M3 already added 2^{FRAC_BITS-1}, rounding is only the removal of the FRAC_BITS = 4 fractional bits (a bit-select, no adder).",
    "**Overflow:** the largest possible magnitude of the 3 x 3 sum is 9 x 255 x 128 = 293760, i.e. 18360 after the shift, well inside the 16-bit signed output range (32767). Overflow is therefore impossible by construction. The top level computes this bound from the parameters and builds a saturation stage only if a different choice of widths could overflow.",
    "**ReLU:** when relu_enable is set, a negative result becomes 0. This is implemented as the synchronous reset of the output register, which uses the flip-flops' own reset pins instead of a 16-bit multiplexer.",
    "M5 has two pipeline registers, so its latency is two system cycles.",
  ]),
  h2("4.4 Output FIFO (M7)"),
  p("Valid windows occur in bursts of IMG_WIDTH - 2 per row, separated by 2-cycle gaps, while the input runs at one pixel per cycle. M7 absorbs these gaps: it stores results in a 64 x 16 LUT-RAM and starts releasing only after a reserve of RELEASE_THRESHOLD = 2 x IMG_WIDTH - 6 = 58 results has been built. From then on it releases one result per cycle, and the reserve never runs out before the frame ends, giving a gapless output stream. The peak occupancy is 57 words, so 64 entries suffice."),
  p("Before release nothing is read, so the number of stored words equals the write pointer; the release point is simply wr_ptr = RELEASE_THRESHOLD - 1 with a write in progress. After release, \"not empty\" is wr_ptr != rd_ptr. An LFSR counts released words and raises frame_done after the last one."),
);

// ---------------------------------------------------------------- 5 FSM
C.push(
  pageBreak(),
  h1("5. Control FSM (M6)"),
  p("M6 is a four-state Moore machine with a synchronous reset (Figure 4). It sequences one pass over the image and implements the pixel handshake: the source presents a pixel with pixel_in_valid whenever pixel_req is high, and a pixel is accepted in cycles where both are high."),
  ...figure("figures/fig_fsm.png", 2500, 1780, "State diagram of the control FSM (M6)."),
  ...tableCap("States, outputs and transitions.", table(
    ["State", "Code", "Outputs", "Leaves when", "Next state"],
    [
      ["IDLE", "00", "busy = 0, pixel_req = 0", "start (pass_reset pulse)", "STREAM"],
      ["STREAM", "01", "pixel_req = 1, busy = 1", "last pixel of the frame accepted", "DRAIN"],
      ["DRAIN", "10", "busy = 1", "PIPE_LATENCY = 8 cycles elapsed", "DONE"],
      ["DONE", "11", "done = fifo_all_outputs_done, busy = !done", "start && fifo_all_outputs_done (pass_reset pulse)", "STREAM"],
    ],
    [13, 8, 29, 32, 18],
  )),
  ...bullets([
    "**Back-to-back passes.** DONE goes directly to STREAM on start, so a second pass (for example with the other kernel bank) needs a single start pulse. It is only accepted once M7 has released every result of the previous pass.",
    "**pass_reset.** A one-cycle pulse on every transition into STREAM clears the position tracking in M2 and the FIFO pointers in M7, so a new pass never inherits state from the previous one.",
    "**Stall-safe counting.** STREAM counts accepted pixels, not cycles, so a source that pauses cannot end the pass early. The counter is an LFSR whose terminal state is computed at elaboration.",
    "**Drain timer.** DRAIN lasts PIPE_LATENCY = 8 cycles (M3 6 + M5 2), measured with a 7-bit shift register instead of a binary counter.",
    "**Reset.** rst returns the machine to IDLE from any state; the design goes idle with no output (verified by IMG-TC15).",
  ]),
);

// ---------------------------------------------------------------- 6 memory
C.push(
  h1("6. Memory Organisation"),
  p("The FOM counts LUTs, DSPs and BRAMs but not flip-flops. Each storage element was therefore placed where it costs the fewest counted resources (Table 5). No BRAM is used: one BRAM tile would cost 100 LUT-equivalents, more than this design's entire M3 logic."),
  ...tableCap("Storage in the design.", table(
    ["Storage", "Module", "Size", "Implementation", "Reason"],
    [
      ["Row delays (line buffer)", "M1", "2 x 32 x 8 bits", "512 flip-flops", "0 LUTs; SRLs would cost ~16 LUTs"],
      ["Kernel banks", "M4", "2 x 9 x 8 bits (32 x 8 RAM)", "8 LUT-RAMs", "Cheapest readable store; flip-flops would need an 18:1 read mux"],
      ["DSP operand ring", "M3", "6 x 25 bits", "150 flip-flops", "Removes a 25-bit 6:1 mux"],
      ["Column sums, T1, T2", "M3", "18-20 bits each", "Flip-flops", "Pipeline state"],
      ["Output FIFO", "M7", "64 x 16 bits", "24 LUT-RAMs", "One LUT stores 64 bits; flip-flops would need a 64:1 read mux"],
    ],
    [20, 9, 20, 17, 34],
  )),
);

// ---------------------------------------------------------------- 7 clocking
C.push(
  h1("7. Clocking and Timing Constraints"),
  ...bullets([
    "The input clock clk drives the DSP (and the fast-clock registers of M3) through a BUFG. A BUFR divides clk by 6 to produce the system clock used by every other register. No MMCM or PLL is used; an MMCM alone would add about 0.1 W to the total power.",
    "All crossings between the two clocks are single register-to-register paths. Values from the system clock are re-registered on the fast clock before they reach the DSP, and results are held for six fast cycles before the system clock reads them. Vivado times all crossings because both clocks come from the same source.",
    "The XDC contains one create_clock on clk; Vivado derives the divided clock from the BUFR. The top-level ports are set as false paths because no board pins are assigned in this phase, so the reported Fmax reflects the design itself.",
    "The FOM run uses a 10 ns clock (DSP 100 MHz, system 16.7 MHz). The maximum-frequency run uses 3.333 ns (DSP 300 MHz, system 50 MHz), which meets timing with WNS +0.055 ns.",
  ]),
);

// ---------------------------------------------------------------- 8 bit widths
C.push(
  h1("8. Fixed-Point Bit-Width Analysis"),
  p("Pixels are UQ8.0 (unsigned, 0-255): 8 bits carry the full dynamic range of a grayscale sensor, and any narrower format would lose information before the convolution. Weights are Q3.4 (8-bit signed, 4 fractional bits), which covers the common edge, blur and sharpen kernels (for example Sobel and Laplacian, whose integer weights of up to 4 need 3 integer bits) with a resolution of 1/16. Every intermediate width in Table 6 is the smallest that holds its worst case, computed with all weights at -128 and all pixels at 255."),
  ...tableCap("Bit widths along the datapath.", table(
    ["Signal", "Format", "Bits", "Worst-case range", "Notes"],
    [
      ["Pixel q", "UQ8.0", "8", "0 to 255", "Unsigned; extended with a 0 to 9 bits signed at the DSP B port"],
      ["Weight w", "Q3.4", "8", "-128 to 127 (-8.0 to 7.9375)", "Signed"],
      ["Product q x w", "Q11.4", "16", "-32640 to 32385", "One DSP lane"],
      ["Packed operand A", "-", "25", "w0 x 2^16 + w1", "Fits the DSP48E1 A port exactly"],
      ["DSP output P (used)", "-", "32", "two 16-bit lanes", "Low lane offset by 2^15"],
      ["Column sums A, B, C", "Q13.4", "18", "3 products: +/-97920", ""],
      ["T2", "Q14.4", "19", "6 products: +/-195840", ""],
      ["M3 result y", "Q15.4", "20", "9 products + 8: +/-293760", "Includes the rounding bias"],
      ["Rounded value", "Q16.0", "17", "-18360 to 18217", "y >> 4, sign-extended by one bit"],
      ["Output pixel", "Q15.0", "16", "-18360 to 18217", "Overflow impossible (< 32767); ReLU optional"],
    ],
    [20, 11, 9, 28, 32],
  )),
  p("Rounding is round-half-up, as specified in the golden model: (sum + 8) >> 4 with an arithmetic shift. Truncation (no +8) would bias every output downward by half a least-significant bit on average. IMG-TC11 (all weights 1/16) exercises many exact .5 ties."),
);

// ---------------------------------------------------------------- 9 RTL
C.push(
  pageBreak(),
  h1("9. RTL Implementation Details"),
  p("All RTL is Verilog-2001 and parameterised by PIXEL_WIDTH, WEIGHT_WIDTH, IMG_WIDTH, ACC_WIDTH, OUT_WIDTH, FRAC_BITS and NUM_KERNELS. Table 7 gives the resource usage of each module after implementation."),
  ...tableCap("Post-implementation utilization per module (10 ns clock).", table(
    ["Instance", "LUTs", "of which LUT-RAM", "Flip-flops", "DSP"],
    [
      ["u_clk_gen (BUFG + BUFR)", "0", "0", "0", "0"],
      ["u_m1_line_buffer", "0", "0", "512", "0"],
      ["u_m2_window_generator", "3", "0", "10", "0"],
      ["u_m3_mac", "135", "0", "588", "1"],
      ["u_m4_kernel_storage", "27", "8", "28", "0"],
      ["u_m5_output_handling", "1", "0", "34", "0"],
      ["u_m6_control_fsm", "18", "0", "20", "0"],
      ["u_m7_fifo", "42", "24", "41", "0"],
      ["**Total**", "**226**", "**32**", "**1233**", "**1**"],
    ],
    [40, 12, 18, 16, 14],
  )),
  h2("9.1 Implementation techniques"),
  ...bullets([
    "**Flip-flops instead of LUTs.** Delay lines and state are kept in flip-flops (shreg_extract = \"no\" prevents Vivado from turning them into LUT-based shift registers).",
    "**DSP inference.** The multiply-add is written as a registered A x B + constant in its own module with use_dsp = \"yes\", so Vivado absorbs every register into the DSP48E1 (AREG/BREG, MREG, PREG) and the constant into the post-adder.",
    "**LFSR counters.** Counters that only need to detect a fixed count (pixels per frame, pixels per row, released results) are LFSRs: one feedback LUT plus an equality compare, instead of a carry chain plus a compare. The feedback taps were checked to give maximal-length sequences for widths 3 to 20.",
    "**No dead logic.** Saturation is built only when overflow is possible, ReLU uses reset pins, the FIFO has no occupancy counter (it equals wr_ptr - rd_ptr), and the rounding constant is preloaded rather than added.",
    "**Reset policy.** Only control state is reset (valid bits, FSM, pointers, counters). Data registers load only when their valid signal is high and are never read unqualified, which keeps the reset network small.",
    "**Stall handling.** Every data stage is enabled by its own valid signal, so input stalls freeze the pipeline and cost no extra logic.",
  ]),
);

// ---------------------------------------------------------------- 10 verification
C.push(
  h1("10. Verification"),
  h2("10.1 Golden reference model"),
  p("python/golden_model_image_flow.py loads any image, converts it to grayscale, resizes it to IMG_WIDTH x IMG_WIDTH, and computes the reference output with exactly the hardware arithmetic: an integer 3 x 3 multiply-accumulate, round half up ((sum + 8) >> 4), clamp to 16-bit signed, and optional ReLU. It writes the image, kernels and expected outputs as hex files for all 16 tests, and PNG previews. Test data for the extended tests is seeded, so every run produces identical files."),
  h2("10.2 Testbenches"),
  p("Each testbench loads the kernels through the write port, starts a pass, streams the image following the pixel_req handshake, compares every output with the expected hex file and writes the hardware output to a hex file that python/visualize_hw_outputs.py renders back into an image. A test passes when it prints TOTAL ERRORS: 0. IMG-TC7 to IMG-TC16 share a common testbench body and additionally check that all pixels were sent, frame_done rises, no output appears after the frame, and no watchdog timeout occurs."),
  ...tableCap("Test cases.", table(
    ["Test", "Purpose"],
    [
      ["IMG-TC1", "Basic correctness with the Sobel Gx kernel (also records the SAIF for power analysis)"],
      ["IMG-TC2", "Multi-kernel: Gx in bank 0 and Gy in bank 1, two back-to-back passes"],
      ["IMG-TC3", "ReLU disabled and enabled on the same image"],
      ["IMG-TC4", "Gapless throughput: 900 outputs in 900 consecutive cycles"],
      ["IMG-TC5", "Edge-detection demo: Gx and Gy combined into an edge-magnitude image"],
      ["IMG-TC6", "Input stalls while streaming"],
      ["IMG-TC7", "All weights -128 on a noise image (worst case for the packed lanes)"],
      ["IMG-TC8", "All weights +127 on an all-255 image (largest positive result)"],
      ["IMG-TC9", "Mixed -128/127/-1/0/1 weights: every high/low lane sign combination"],
      ["IMG-TC10", "Identity kernel: each output must equal the window centre"],
      ["IMG-TC11", "All weights 1/16: many exact rounding ties"],
      ["IMG-TC12", "Seeded random signed kernel"],
      ["IMG-TC13", "Three back-to-back passes with a kernel reload between passes"],
      ["IMG-TC14", "About 30% random input stalls with a Laplacian kernel"],
      ["IMG-TC15", "Reset in the middle of a pass, then a bit-exact fresh pass"],
      ["IMG-TC16", "Bank switch with ReLU toggled; writes to non-existent taps 9-15 must be ignored"],
    ],
    [14, 86],
  )),
  h2("10.3 Test images"),
  p("test_images/shapes/ contains 14 synthetic 32 x 32 images (arrow, fish, heart, house, key, lightning, moon, rocket, sphere, square, star, tree, triangle, umbrella) with sharp corners, diagonals, curves, thin lines and holes. test_images/photos/ contains six natural photographs that the golden model resizes to the chosen width. The whole flow (golden model, all 16 simulations, rendering) runs with one command: run_image_flow.bat <image> [IMG_WIDTH]."),
  h2("10.4 Results"),
  p("All 16 image testbenches produce outputs identical to the golden model (TOTAL ERRORS: 0) for the 32 x 32 test images. The rendered hardware images in sim/image outputs/ are pixel-identical to the golden previews."),
  p("**Waveforms.** [Insert ModelSim waveform screenshots here: IMG-TC4 showing pixel_req, pixel_in_valid, window_valid, mac_result_valid, output_valid and output_pixel, including the start of the gapless output burst; and IMG-TC6 showing a stall.]"),
);

// ---------------------------------------------------------------- 11 FPGA results
C.push(
  pageBreak(),
  h1("11. FPGA Implementation Results"),
  p("Synthesis and implementation used Vivado 2018.2 for the xc7z020clg400-1 device with default strategies. Power was estimated by Vivado's report_power with switching activity from a SAIF file recorded in simulation during the active part of IMG-TC1 (gated on busy), at the same clock period as the implementation run, giving confidence level High."),
  h2("11.1 Utilization"),
  ...figure("vivado_results/utilization_100MHz.png", 1271, 352, "Utilization by module, 10 ns clock (Vivado)."),
  ...figure("vivado_results/utilization_300MHz.png", 1272, 367, "Utilization by module, 3.333 ns clock (Vivado)."),
  h2("11.2 Timing"),
  ...figure("vivado_results/timing_100MHz.png", 1245, 380, "Timing summary, 10 ns clock: WNS +5.923 ns, WHS +0.059 ns."),
  ...figure("vivado_results/timing_300MHz.png", 1140, 267, "Timing summary, 3.333 ns clock (300 MHz): WNS +0.055 ns, WHS +0.075 ns; all constraints met."),
  h2("11.3 Power"),
  ...figure("vivado_results/power_100MHz.png", 838, 446, "Power, 10 ns clock: 0.112 W total (static 0.104 W, dynamic 0.007 W), confidence High.", 480),
  ...figure("vivado_results/power_300MHz.png", 848, 436, "Power, 3.333 ns clock: 0.126 W total (static 0.105 W, dynamic 0.022 W), confidence High.", 480),
  p("Device static power (0.104 W) is the leakage of the whole xc7z020 die and does not depend on the design; it is about 93% of the total at the reference clock. Design choices therefore mainly act on the area term of the FOM."),
  h2("11.4 Placement"),
  ...figure("vivado_results/device_placement.png", 687, 641, "Placed design on the device: the whole accelerator fits in clock region X0Y0, as required by the BUFR.", 380),
  h2("11.5 Figure of Merit"),
  eq("FOM = Throughput / ( Power x ( LUTs + 50 x DSPs + 100 x BRAMs ) )"),
  ...tableCap("FOM calculation.", table(
    ["Quantity", "10 ns clock (reference)", "3.333 ns clock (Fmax)"],
    [
      ["Throughput (output pixels / system cycle)", "1", "1"],
      ["Total power (W)", "0.112", "0.126"],
      ["LUTs + 50 x DSPs + 100 x BRAMs", "226 + 50 + 0 = 276", "229 + 50 + 0 = 279"],
      ["**FOM**", "**1 / (0.112 x 276) = 0.0324**", "1 / (0.126 x 279) = 0.0284"],
    ],
    [40, 30, 30],
  )),
);

// ---------------------------------------------------------------- 12 tradeoffs
C.push(
  h1("12. Design Trade-offs and Optimisation History"),
  p("The design evolved from a conventional 9-multiplier adder tree to the final single-DSP engine. Each step was evaluated against the FOM (Table 10)."),
  ...tableCap("Design evolution (total power, throughput 1).", table(
    ["Step", "LUTs", "DSP", "FOM", "Main change"],
    [
      ["Original design", "316", "9", "0.0107", "Nine multipliers and a 4-level adder tree"],
      ["Transposed form, packed lanes", "367", "6", "0.0124", "Two products per DSP; 9 to 6 DSPs"],
      ["6x multi-pumped, no MMCM", "408", "1", "0.0178", "All operations on one DSP; BUFG + BUFR clocking"],
      ["LUT-lean datapath", "-", "1", "0.0232", "Operand ring, fast-clock accumulation, serial kernel stream, FF line buffer"],
      ["LFSR FIFO and FSM", "230", "1", "0.0271", "No occupancy counter; LFSR counters"],
      ["Final", "226", "1", "0.0324", "M5/M2 simplification, paused kernel stream, SAIF at the implemented clock"],
    ],
    [26, 9, 7, 10, 48],
  )),
  h2("12.1 Decisions and alternatives"),
  ...bullets([
    "**One multi-pumped DSP instead of several DSPs.** One DSP costs 50 LUT-equivalents; the six-fold clock and the operand ring cost only flip-flops and a few LUTs. The price is that the system clock is one sixth of the DSP clock (50 MHz at 300 MHz).",
    "**No MMCM.** A 6x clock from an MMCM would allow a faster system clock for the same input, but the MMCM alone adds about 0.1 W, roughly doubling total power. Dividing the input clock with a BUFR costs almost nothing.",
    "**Throughput kept at 1.** Producing more outputs per cycle (wider input or parallel kernels) grows area and dynamic power almost as fast as throughput. Time-sharing the DSP further lowers throughput faster than it saves area.",
    "**Kernel size 3 x 3.** A larger kernel increases the work per output without increasing throughput. A 2 x 2 kernel would score higher, but 3 x 3 is the standard CNN kernel and is required for the Sobel edge-detection demo.",
    "**Gapless FIFO kept.** Removing M7 would save about 42 LUTs, but the output would have 2-cycle gaps at every row boundary and the one-output-per-cycle bonus would be lost.",
    "**Weights must stay programmable.** Constant-coefficient techniques (shift-and-add, CSD) are not applicable.",
  ]),
);

// ---------------------------------------------------------------- 13 bonus
C.push(
  h1("13. Bonus Features"),
  ...tableCap("Bonus items from the announcement.", table(
    ["Bonus item", "Status", "Evidence"],
    [
      ["One-output-pixel-per-cycle pipelined architecture", "Implemented", "Gapless output, IMG-TC4"],
      ["Multiple kernels", "Implemented (2 banks)", "IMG-TC2, IMG-TC13, IMG-TC16"],
      ["ReLU activation", "Implemented", "IMG-TC3, IMG-TC16"],
      ["Edge-detection demo", "Implemented", "IMG-TC5: Sobel Gx + Gy edge magnitude"],
      ["Board demonstration", "Planned", "The 125 MHz PYNQ-Z2 clock can drive the design directly (system clock 20.8 MHz)"],
    ],
    [38, 22, 40],
  )),
);

// ---------------------------------------------------------------- 14 assumptions
C.push(
  h1("14. Assumptions"),
  ...numbered([
    "Throughput is the steady-state number of output pixels per system clock cycle once the output stream has started (1, gapless).",
    "Power is the total on-chip power reported by Vivado report_power, including device static power, with switching activity from a SAIF recorded at the same clock period as the implementation run.",
    "The reference FOM uses a 10 ns clock on clk (system clock 16.7 MHz); the maximum-frequency result uses 3.333 ns. Both are reported.",
    "The image is square, IMG_WIDTH = 32, and the convolution is \"valid\" (no padding), giving 30 x 30 outputs.",
    "Kernel banks are written before start and not changed during a pass; banks are not cleared by reset.",
    "No board pins are assigned in this phase; top-level ports are false paths, so timing results reflect the accelerator itself.",
    "The pixel source delivers pixels in raster order whenever pixel_req is high; it may stall at any time.",
  ]),
);

// ---------------------------------------------------------------- 15 conclusion
C.push(
  h1("15. Conclusion"),
  p("The accelerator meets every mandatory specification and implements four of the five bonus items. By combining a transposed-form convolution, two products per DSP operation and six-fold multi-pumping, all nine multiplications of a 3 x 3 window run on one DSP48E1, and the rest of the design was rebuilt so that storage and control use flip-flops and LUT-RAM rather than counted logic. The result is 226 LUTs, 1 DSP and no BRAM for one output pixel per cycle, meeting timing at 300 MHz, with a Figure of Merit of 0.0324 at the reference clock."),
  h2("Appendix: reproducing the results"),
  ...bullets([
    "Golden model, simulations and rendering: `run_image_flow.bat test_images\\shapes\\sphere.png`",
    "Simulations only: `vsim -c -do \"do sim/scripts/run_all_image_tests.do 32\"`",
    "Vivado: project `synthesis/project_1`, constraints `constraints/cnn_accelerator_top.xdc`, pre-synthesis waivers `scripts/synth_msg_waivers.tcl`, post-route power script `scripts/power_activity.tcl`.",
  ]),
);

// ---------------------------------------------------------------- document
const doc = new Document({
  creator: "Omar Wael, Ziad Elkhiat, Salwa Galal",
  title: "FPGA-Based Edge-AI Vision Accelerator - Final Report",
  styles: {
    default: { document: { run: { font: FONT, size: 22 } } },
    paragraphStyles: [
      { id: "Heading1", name: "Heading 1", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 30, bold: true, color: "000000", font: FONT },
        paragraph: { spacing: { before: 320, after: 140 }, outlineLevel: 0 } },
      { id: "Heading2", name: "Heading 2", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 25, bold: true, color: "000000", font: FONT },
        paragraph: { spacing: { before: 220, after: 100 }, outlineLevel: 1 } },
      { id: "Heading3", name: "Heading 3", basedOn: "Normal", next: "Normal", quickFormat: true,
        run: { size: 22, bold: true, italics: true, color: "000000", font: FONT },
        paragraph: { spacing: { before: 160, after: 80 }, outlineLevel: 2 } },
    ],
  },
  numbering: {
    config: [
      { reference: "bullets", levels: [
        { level: 0, format: LevelFormat.BULLET, text: "\u2022", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 540, hanging: 270 } } } },
        { level: 1, format: LevelFormat.BULLET, text: "\u2013", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 1080, hanging: 270 } } } } ] },
      { reference: "numbers", levels: [
        { level: 0, format: LevelFormat.DECIMAL, text: "%1.", alignment: AlignmentType.LEFT,
          style: { paragraph: { indent: { left: 540, hanging: 360 } } } } ] },
    ],
  },
  sections: [{
    properties: { page: { margin: { top: 1440, right: 1440, bottom: 1440, left: 1440 } } },
    footers: { default: new Footer({ children: [new Paragraph({ alignment: AlignmentType.CENTER,
      children: [new TextRun({ text: "FPGA-Based Edge-AI Vision Accelerator  |  Page ", size: 18 }),
                 new TextRun({ children: [PageNumber.CURRENT], size: 18 })] })] }) },
    children: C,
  }],
});

Packer.toBuffer(doc).then((b) => { fs.writeFileSync(OUT, b); console.log("written", OUT); });
