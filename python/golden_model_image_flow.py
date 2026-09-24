"""
Generic golden-model generator for arbitrary square image sizes.

This script replaces the hardcoded 32x32 and 447x447 variants by using either:
  - a target image size supplied via --img-width, or
  - the size of the input image itself when no width is provided.

Examples:
  python golden_model_image_flow.py my_image.png
  python golden_model_image_flow.py my_image.png --img-width 447
  python golden_model_image_flow.py --img-width 32 my_image.png
"""

import argparse
from pathlib import Path

import numpy as np
from PIL import Image

FRAC_BITS = 4
OUT_WIDTH = 16
PROJECT_ROOT = Path(__file__).resolve().parents[1]
TEST_IMAGES_DIR = PROJECT_ROOT / "test_images"
SIM_RESULTS_DIR = PROJECT_ROOT / "sim" / "results_hex"
IMAGE_OUTPUT_DIR = PROJECT_ROOT / "sim" / "image outputs"

SOBEL_GX = np.array([[-1, 0, 1],
                    [-2, 0, 2],
                    [-1, 0, 1]], dtype=np.int64)

SOBEL_GY = np.array([[-1, -2, -1],
                    [ 0,  0,  0],
                    [ 1,  2,  1]], dtype=np.int64)

# Q3.4 kernels for IMG-TC7..16 (value 16 = 1.0).
LAPLACIAN = np.array([[ 0,  16,  0],
                      [16, -64, 16],
                      [ 0,  16,  0]], dtype=np.int64)

SHARPEN = np.array([[  0, -16,   0],
                    [-16,  80, -16],
                    [  0, -16,   0]], dtype=np.int64)

EMBOSS = np.array([[-32, -16,  0],
                   [-16,  16, 16],
                   [  0,  16, 32]], dtype=np.int64)

IDENTITY = np.array([[0,  0, 0],
                     [0, 16, 0],
                     [0,  0, 0]], dtype=np.int64)

ALL_ONES = np.ones((3, 3), dtype=np.int64)
ALL_MIN = np.full((3, 3), -128, dtype=np.int64)
ALL_MAX = np.full((3, 3), 127, dtype=np.int64)

# Rows map to M3's packed DSPs: column 0 is the high lane, column 1 the low
# lane. Row 0 = worst case (-128 high next to a negative low), row 1 = max
# high with -128 low, row 2 = small mixed signs.
LANE_MIX = np.array([[-128,   -1,  127],
                     [ 127, -128, -128],
                     [  -1,    0,    1]], dtype=np.int64)

EXT_SEED = 2026


def parse_args():
    parser = argparse.ArgumentParser(description="Generate golden-model files for any square input image size.")
    parser.add_argument("image", nargs="?", default="test_input_image.png", help="Input grayscale image path")
    parser.add_argument("--img-width", type=int, default=None, help="Target square image width to resize to before generating the convolution outputs")
    parser.add_argument("--output-dir", type=str, default=str(SIM_RESULTS_DIR), help="Directory where generated .hex files are written")
    parser.add_argument("--image-output-dir", type=str, default=str(IMAGE_OUTPUT_DIR), help="Directory where generated PNG images are written")
    parser.add_argument("--width-file", type=str, default=None, help="Optional file where the resolved image width is written")
    return parser.parse_args()


def golden_conv2d(image, kernel, relu_enable=False):
    img_w = image.shape[0]
    kernel_size = kernel.shape[0]
    if kernel.ndim != 2 or kernel.shape[0] != kernel.shape[1]:
        raise ValueError("Kernel must be square")
    if img_w < kernel_size:
        raise ValueError(f"Image width {img_w} is smaller than kernel size {kernel_size}")
    out_size = img_w - kernel_size + 1
    max_out = (1 << (OUT_WIDTH - 1)) - 1
    min_out = -(1 << (OUT_WIDTH - 1))
    # Same integer arithmetic as a per-window loop, vectorised: accumulate one
    # shifted image slice per kernel tap.
    img = image.astype(np.int64)
    acc = np.zeros((out_size, out_size), dtype=np.int64)
    for kr in range(kernel_size):
        for kc in range(kernel_size):
            acc += int(kernel[kr, kc]) * img[kr:kr + out_size, kc:kc + out_size]
    rounded = (acc + (1 << (FRAC_BITS - 1))) >> FRAC_BITS   # round half up
    out = np.clip(rounded, min_out, max_out)
    if relu_enable:
        out = np.maximum(out, 0)
    return out


def write_image_hex(path, image):
    with open(path, "w") as f:
        for v in image.flatten():
            f.write(f"{int(v) & 0xFF:02x}\n")


def write_kernel_hex(path, kernel):
    with open(path, "w") as f:
        for v in kernel.flatten():
            f.write(f"{int(v) & 0xFF:02x}\n")


def write_expected_hex(path, expected):
    with open(path, "w") as f:
        for v in expected.flatten():
            f.write(f"{int(v) & 0xFFFF:04x}\n")


def save_as_image(array, path, normalize_for_display=True):
    display = np.abs(array).astype(np.float64)
    if normalize_for_display and display.max() > 0:
        display = display / display.max() * 255.0
    display = np.clip(display, 0, 255).astype(np.uint8)
    Image.fromarray(display, mode='L').save(path)


def save_preview(png_path, scale=8):
    img = Image.open(png_path)
    w, h = img.size
    preview_path = png_path.replace(".png", "_preview.png")
    img.resize((w * scale, h * scale), Image.NEAREST).save(preview_path)
    return preview_path


def report(tc_name, expected, **extra):
    line = f"{tc_name}: output range [{expected.min()}, {expected.max()}]"
    for k, v in extra.items():
        line += f", {k}={v}"
    print(line)


def load_image(path, target_width=None):
    img = Image.open(path).convert("L")
    if target_width is not None:
        if img.size != (target_width, target_width):
            print(f"Input image is {img.size}, resizing to {target_width}x{target_width}")
            img = img.resize((target_width, target_width), Image.LANCZOS)
    elif img.size[0] != img.size[1]:
        size = min(img.size)
        print(f"Input image is not square ({img.size}), using {size}x{size}")
        img = img.resize((size, size), Image.LANCZOS)
    return np.array(img, dtype=np.int64)


def write_case(output_dir, image_output_dir, n, image, kernels, expected, render=True):
    """Write imgtc{n}_image.hex, imgtc{n}_kernel_{a,b,c}.hex, imgtc{n}_exp_{a,b,c}.hex."""
    write_image_hex(str(output_dir / f"imgtc{n}_image.hex"), image)
    for tag, k in kernels.items():
        write_kernel_hex(str(output_dir / f"imgtc{n}_kernel_{tag}.hex"), k)
    for tag, e in expected.items():
        write_expected_hex(str(output_dir / f"imgtc{n}_exp_{tag}.hex"), e)
        if render:
            save_as_image(e, str(image_output_dir / f"imgtc{n}_golden_{tag}.png"))


def generate_extended_tests(image, output_dir, image_output_dir):
    """IMG-TC7..16: corner cases for the packed-DSP transposed MAC, LUTRAM
    kernel storage and control-only reset. All seeded, so reruns are stable."""
    img_width = image.shape[0]
    rng = np.random.default_rng(EXT_SEED)
    noise = rng.integers(0, 256, size=(img_width, img_width), dtype=np.int64)
    white = np.full((img_width, img_width), 255, dtype=np.int64)
    random_kernel = rng.integers(-128, 128, size=(3, 3), dtype=np.int64)

    single = [
        (7,  "extreme negative", noise, ALL_MIN),
        (8,  "extreme positive", white, ALL_MAX),
        (9,  "lane mix",         noise, LANE_MIX),
        (10, "identity",         image, IDENTITY),
        (11, "rounding",         image, ALL_ONES),
        (12, "random kernel",    image, random_kernel),
        (14, "random stall",     image, LAPLACIAN),
    ]
    for n, name, img, k in single:
        exp = golden_conv2d(img, k)
        write_case(output_dir, image_output_dir, n, img, {"a": k}, {"a": exp})
        report(f"IMG-TC{n} ({name})", exp)

    # Identity must reproduce the window centres exactly.
    ident = golden_conv2d(image, IDENTITY)
    assert np.array_equal(ident, image[1:-1, 1:-1]), "identity golden mismatch"

    exp_a = golden_conv2d(image, SOBEL_GX)
    exp_b = golden_conv2d(image, LAPLACIAN)
    exp_c = golden_conv2d(image, SHARPEN)
    write_case(output_dir, image_output_dir, 13, image,
               {"a": SOBEL_GX, "b": LAPLACIAN, "c": SHARPEN},
               {"a": exp_a, "b": exp_b, "c": exp_c})
    report("IMG-TC13 (multipass reload) C", exp_c)

    exp_b = golden_conv2d(image, SOBEL_GY)
    write_case(output_dir, image_output_dir, 15, image,
               {"a": SOBEL_GX, "b": SOBEL_GY}, {"b": exp_b})
    report("IMG-TC15 (mid-pass reset)", exp_b)

    exp_a = golden_conv2d(image, SHARPEN, relu_enable=False)
    exp_b = golden_conv2d(image, EMBOSS, relu_enable=True)
    write_case(output_dir, image_output_dir, 16, image,
               {"a": SHARPEN, "b": EMBOSS}, {"a": exp_a, "b": exp_b})
    report("IMG-TC16 (bank/ReLU/bad address)", exp_b, min_is_zero=bool(exp_b.min() >= 0))


def main():
    args = parse_args()
    image_path = Path(args.image)
    if not image_path.is_absolute():
        candidate_paths = [image_path, TEST_IMAGES_DIR / image_path]
        for candidate in candidate_paths:
            if candidate.exists():
                image_path = candidate
                break

    output_dir = Path(args.output_dir)
    image_output_dir = Path(args.image_output_dir)
    output_dir.mkdir(parents=True, exist_ok=True)
    image_output_dir.mkdir(parents=True, exist_ok=True)

    image = load_image(str(image_path), args.img_width)
    img_width = image.shape[0]
    width_file = Path(args.width_file) if args.width_file is not None else output_dir / "img_width.txt"
    width_file.parent.mkdir(parents=True, exist_ok=True)
    width_file.write_text(f"{img_width}\n")
    print(f"Loaded {image_path}: shape={image.shape}, range=[{image.min()},{image.max()}]")
    print(f"Resolved IMG_WIDTH written to {width_file}")

    save_as_image(image, str(image_output_dir / "img_input.png"), normalize_for_display=False)
    preview_path = save_preview(str(image_output_dir / "img_input.png"))
    print(f"Crisp preview saved: {preview_path} (nearest-neighbor upscaled 8x)")
    print()

    tc1_exp = golden_conv2d(image, SOBEL_GX, relu_enable=False)
    write_image_hex(str(output_dir / "imgtc1_image.hex"), image)
    write_kernel_hex(str(output_dir / "imgtc1_kernel.hex"), SOBEL_GX)
    write_expected_hex(str(output_dir / "imgtc1_expected.hex"), tc1_exp)
    save_as_image(tc1_exp, str(image_output_dir / "imgtc1_golden_output.png"))
    report("IMG-TC1 (basic correctness)", tc1_exp)

    tc2_exp_gx = golden_conv2d(image, SOBEL_GX, relu_enable=False)
    tc2_exp_gy = golden_conv2d(image, SOBEL_GY, relu_enable=False)
    write_image_hex(str(output_dir / "imgtc2_image.hex"), image)
    write_kernel_hex(str(output_dir / "imgtc2_gx_kernel.hex"), SOBEL_GX)
    write_kernel_hex(str(output_dir / "imgtc2_gy_kernel.hex"), SOBEL_GY)
    write_expected_hex(str(output_dir / "imgtc2_exp_gx.hex"), tc2_exp_gx)
    write_expected_hex(str(output_dir / "imgtc2_exp_gy.hex"), tc2_exp_gy)
    save_as_image(tc2_exp_gx, str(image_output_dir / "imgtc2_golden_gx.png"))
    save_as_image(tc2_exp_gy, str(image_output_dir / "imgtc2_golden_gy.png"))
    report("IMG-TC2 Gx", tc2_exp_gx)
    report("IMG-TC2 Gy", tc2_exp_gy)

    tc3_exp_norelu = golden_conv2d(image, SOBEL_GY, relu_enable=False)
    tc3_exp_relu = golden_conv2d(image, SOBEL_GY, relu_enable=True)
    write_image_hex(str(output_dir / "imgtc3_image.hex"), image)
    write_kernel_hex(str(output_dir / "imgtc3_kernel.hex"), SOBEL_GY)
    write_expected_hex(str(output_dir / "imgtc3_exp_norelu.hex"), tc3_exp_norelu)
    write_expected_hex(str(output_dir / "imgtc3_exp_relu.hex"), tc3_exp_relu)
    save_as_image(tc3_exp_norelu, str(image_output_dir / "imgtc3_golden_norelu.png"))
    save_as_image(tc3_exp_relu, str(image_output_dir / "imgtc3_golden_relu.png"))
    report("IMG-TC3 no-ReLU", tc3_exp_norelu, negatives=int((tc3_exp_norelu < 0).sum()))
    report("IMG-TC3 with-ReLU", tc3_exp_relu, min_is_zero=bool(tc3_exp_relu.min() == 0))

    tc4_exp = golden_conv2d(image, SOBEL_GX, relu_enable=False)
    write_image_hex(str(output_dir / "imgtc4_image.hex"), image)
    write_kernel_hex(str(output_dir / "imgtc4_kernel.hex"), SOBEL_GX)
    write_expected_hex(str(output_dir / "imgtc4_expected.hex"), tc4_exp)
    report("IMG-TC4 (gapless throughput)", tc4_exp)

    tc5_exp_gx = golden_conv2d(image, SOBEL_GX, relu_enable=False)
    tc5_exp_gy = golden_conv2d(image, SOBEL_GY, relu_enable=False)
    write_image_hex(str(output_dir / "imgtc5_image.hex"), image)
    write_kernel_hex(str(output_dir / "imgtc5_gx_kernel.hex"), SOBEL_GX)
    write_kernel_hex(str(output_dir / "imgtc5_gy_kernel.hex"), SOBEL_GY)
    write_expected_hex(str(output_dir / "imgtc5_exp_gx.hex"), tc5_exp_gx)
    write_expected_hex(str(output_dir / "imgtc5_exp_gy.hex"), tc5_exp_gy)
    edge_mag_golden = np.clip(np.abs(tc5_exp_gx) + np.abs(tc5_exp_gy), 0, 255)
    save_as_image(edge_mag_golden, str(image_output_dir / "imgtc5_golden_edges.png"))
    save_preview(str(image_output_dir / "imgtc5_golden_edges.png"))
    report("IMG-TC5 (edge-detection demo)", edge_mag_golden)

    tc6_exp = golden_conv2d(image, SOBEL_GX, relu_enable=False)
    write_image_hex(str(output_dir / "imgtc6_image.hex"), image)
    write_kernel_hex(str(output_dir / "imgtc6_kernel.hex"), SOBEL_GX)
    write_expected_hex(str(output_dir / "imgtc6_expected.hex"), tc6_exp)
    report("IMG-TC6 (stall handling)", tc6_exp)

    generate_extended_tests(image, output_dir, image_output_dir)

    print()
    print(f"All 16 image-based test case files generated for {img_width}x{img_width} input image.")


if __name__ == "__main__":
    main()
