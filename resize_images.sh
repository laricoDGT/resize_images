#!/usr/bin/env bash

set -euo pipefail

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <folder> <size>"
  echo "Examples:"
  echo "  $0 /path/folder 800x"
  echo "  $0 /path/folder x600"
  echo "  $0 /path/folder 800x600"
  echo "  $0 /path/folder 50%"
  exit 1
fi

INPUT_DIR="$1"
SIZE="$2"
OUTPUT_DIR="$INPUT_DIR/resized"

if command -v convert >/dev/null 2>&1; then
  IM_CMD="convert"
elif command -v magick >/dev/null 2>&1; then
  IM_CMD="magick"
else
  echo "ImageMagick not found. Install it and try again."
  exit 1
fi

if [[ "$SIZE" =~ ^[0-9]+x[0-9]+$ ]]; then
  RESIZE_ARG="${SIZE}!"
elif [[ "$SIZE" =~ ^[0-9]+x$ || "$SIZE" =~ ^x[0-9]+$ || "$SIZE" =~ ^[0-9]+%$ ]]; then
  RESIZE_ARG="$SIZE"
else
  echo "Invalid size. Use formats like 800x, x600, 800x600, or 50%."
  exit 1
fi

mkdir -p "$OUTPUT_DIR"

count=0
while IFS= read -r -d '' img; do
  filename="$(basename "$img")"
  $IM_CMD "$img" -resize "$RESIZE_ARG" "$OUTPUT_DIR/$filename"
  count=$((count + 1))
done < <(find "$INPUT_DIR" -maxdepth 1 -type f \( -iname "*.jpg" -o -iname "*.jpeg" -o -iname "*.png" -o -iname "*.gif" \) -print0)

if [ "$count" -eq 0 ]; then
  echo "No images found in $INPUT_DIR"
  exit 1
fi

echo "Resized images saved to: $OUTPUT_DIR"
