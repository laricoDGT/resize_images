#!/bin/bash

if [ "$#" -ne 2 ]; then
  echo "Uso: $0 carpeta_anterior dimension"
  echo "Ejemplo:"
  echo "  $0 /ruta/carpeta 800x     # Solo ancho"
  echo "  $0 /ruta/carpeta x600     # Solo alto"
  echo "  $0 /ruta/carpeta 800x600  # Ambos"
  exit 1
fi

INPUT_DIR="$1"
SIZE="$2"
OUTPUT_DIR="$INPUT_DIR/resized"

mkdir -p "$OUTPUT_DIR"

for img in "$INPUT_DIR"/*.{jpg,jpeg,png,gif}; do
  [ -e "$img" ] || continue
  filename=$(basename "$img")
  convert "$img" -resize "$SIZE" "$OUTPUT_DIR/$filename"
done

echo "Imágenes redimensionadas guardadas en: $OUTPUT_DIR"
