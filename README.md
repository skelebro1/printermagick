# PrinterMagick

A simple Windows batch script that uses [ImageMagick](https://imagemagick.org/) to clean up document photos and scans, then combine them into a PDF.

## How to use

**Put your `.jpg` or `.jpeg` images in the same directory as `printerMagick.bat`.**

```text
printerMagick/
├── printerMagick.bat
├── page01.jpg
├── page02.jpg
├── page03.jpg
└── ...
```

Then run:

```text
printerMagick.bat
```

Processed images are saved to `output/` and combined into `scans.pdf`.

```text
printerMagick/
├── printerMagick.bat
├── page01.jpg
├── page02.jpg
└── output/
    ├── page01.jpg
    ├── page02.jpg
    └── scans.pdf
```

The original images are left untouched.

## Before and after

| Original                                                              | Processed                                                                |
| --------------------------------------------------------------------- | ------------------------------------------------------------------------ |
| [![Original 1](./examples/original-1.jpg)](./examples/original-1.jpg) | [![Processed 1](./examples/processed-1.jpg)](./examples/processed-1.jpg) |
| [![Original 2](./examples/original-2.jpg)](./examples/original-2.jpg) | [![Processed 2](./examples/processed-2.jpg)](./examples/processed-2.jpg) |

## What it does

* Corrects image orientation
* Converts images to grayscale
* Straightens crooked pages
* Removes uneven backgrounds and shadows
* Improves contrast
* Reduces noise and speckles
* Creates a PDF from the processed images

## Requirements

* Windows
* [ImageMagick](https://imagemagick.org/)

Make sure the `magick` command works from Command Prompt:

```bat
magick -version
```

ImageMagick provides Windows binaries and installation instructions on its official download page.

## Output

Processed images are saved to `output/`, along with:

```text
output/scans.pdf
```

The PDF is image-based and does not include OCR/searchable text.

## License

MIT License
