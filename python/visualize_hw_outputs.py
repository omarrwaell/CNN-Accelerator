"""
Generic hardware-output visualizer for any square image size.

This script automatically renders any generated hw hex files back to image form,
without assuming a 32x32 or 447x447 image size.

Examples:
  python visualize_hw_outputs.py
  python visualize_hw_outputs.py --img-width 447
"""

import argparse
import math
from pathlib import Path

import numpy as np
from PIL import Image

PROJECT_ROOT = Path(__file__).resolve().parents[1]
SIM_RESULTS_DIR = PROJECT_ROOT / "sim" / "results_hex"
IMAGE_OUTPUT_DIR = PROJECT_ROOT / "sim" / "image outputs"


def parse_args():
    parser = argparse.ArgumentParser(description="Render hardware hex outputs into images for any image width.")
    parser.add_argument("--img-width", type=int, default=None, help="Optional image width used to infer the output image size if the file itself is not square")
    parser.add_argument("--kernel-size", type=int, default=3, help="Kernel width used to calculate output size: img_width - kernel_size + 1")
    parser.add_argument("--input-dir", type=str, default=str(SIM_RESULTS_DIR), help="Directory containing the generated hardware .hex files")
    parser.add_argument("--output-dir", type=str, default=str(IMAGE_OUTPUT_DIR), help="Directory where rendered .png files are written")
    return parser.parse_args()


def read_hex16(path, out_size=None):
    vals = []
    with open(path) as f:
        for line in f:
            line = line.strip()
            if not line:
                continue
            v = int(line, 16)
            if v >= 0x8000:
                v -= 0x10000
            vals.append(v)
    if not vals:
        raise ValueError(f"No data found in {path}")

    if out_size is None:
        out_size = int(math.isqrt(len(vals)))
        if out_size * out_size != len(vals):
            raise ValueError(f"{path} contains {len(vals)} values, which is not a square output image")
    n = out_size * out_size
    return np.array(vals[:n]).reshape(out_size, out_size)


def save_as_image(array, path, normalize=True):
    display = np.abs(array).astype(np.float64)
    if normalize and display.max() > 0:
        display = display / display.max() * 255.0
    display = np.clip(display, 0, 255).astype(np.uint8)
    Image.fromarray(display, mode='L').save(path)


def save_preview(png_path, scale=8):
    img = Image.open(png_path)
    w, h = img.size
    preview_path = png_path.replace(".png", "_preview.png")
    img.resize((w * scale, h * scale), Image.NEAREST).save(preview_path)
    return preview_path


def render_case(path, output_name=None, img_width=None, kernel_size=3):
    if img_width is not None:
        out_size = img_width - kernel_size + 1
    else:
        out_size = None

    arr = read_hex16(path, out_size)
    out_path = output_name if output_name is not None else str(Path(path).with_suffix(".png"))
    save_as_image(arr, out_path)
    print(f"{Path(path).name}: range=[{arr.min()},{arr.max()}] -> {out_path}")
    return arr


def main():
    args = parse_args()
    input_dir = Path(args.input_dir)
    output_dir = Path(args.output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)

    files = [
        ("imgtc1_hw_output.hex", "imgtc1_hw_output.png"),
        ("imgtc2_hw_gx.hex", "imgtc2_hw_gx.png"),
        ("imgtc2_hw_gy.hex", "imgtc2_hw_gy.png"),
        ("imgtc3_hw_norelu.hex", "imgtc3_hw_norelu.png"),
        ("imgtc3_hw_relu.hex", "imgtc3_hw_relu.png"),
        ("imgtc5_hw_gx.hex", "imgtc5_hw_gx.png"),
        ("imgtc5_hw_gy.hex", "imgtc5_hw_gy.png"),
        ("imgtc6_hw_output.hex", "imgtc6_hw_output.png"),
        ("imgtc7_hw_output.hex", "imgtc7_hw_output.png"),
        ("imgtc8_hw_output.hex", "imgtc8_hw_output.png"),
        ("imgtc9_hw_output.hex", "imgtc9_hw_output.png"),
        ("imgtc10_hw_output.hex", "imgtc10_hw_output.png"),
        ("imgtc11_hw_output.hex", "imgtc11_hw_output.png"),
        ("imgtc12_hw_output.hex", "imgtc12_hw_output.png"),
        ("imgtc13_hw_pass1.hex", "imgtc13_hw_pass1.png"),
        ("imgtc13_hw_pass2.hex", "imgtc13_hw_pass2.png"),
        ("imgtc13_hw_pass3.hex", "imgtc13_hw_pass3.png"),
        ("imgtc14_hw_output.hex", "imgtc14_hw_output.png"),
        ("imgtc15_hw_output.hex", "imgtc15_hw_output.png"),
        ("imgtc16_hw_bank1_relu.hex", "imgtc16_hw_bank1_relu.png"),
        ("imgtc16_hw_bank0.hex", "imgtc16_hw_bank0.png"),
    ]

    for in_name, out_name in files:
        in_path = input_dir / in_name
        out_path = output_dir / out_name
        if not in_path.exists():
            continue
        try:
            arr = render_case(str(in_path), str(out_path), args.img_width, args.kernel_size)
            if out_name.endswith("_edges.png"):
                pass
        except ValueError as exc:
            print(f"Skipped {in_name}: {exc}")

    # IMG-TC5 edge-magnitude view
    gx_in = input_dir / "imgtc5_hw_gx.hex"
    gy_in = input_dir / "imgtc5_hw_gy.hex"
    if gx_in.exists() and gy_in.exists():
        hw_gx = read_hex16(str(gx_in))
        hw_gy = read_hex16(str(gy_in))
        edge_mag_hw = np.clip(np.abs(hw_gx) + np.abs(hw_gy), 0, 255)
        edge_out = output_dir / "imgtc5_hw_edges.png"
        save_as_image(edge_mag_hw, str(edge_out))
        save_preview(str(edge_out))
        print(f"IMG-TC5 hardware edges: range=[{edge_mag_hw.min()},{edge_mag_hw.max()}] -> {edge_out.name}")

    print()
    print("All available hardware outputs rendered as standalone images.")


if __name__ == "__main__":
    main()
