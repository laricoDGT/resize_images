# 🖼️ resize-images.sh

Script de shell para redimensionar imágenes por lotes desde la terminal, manteniendo proporciones si se desea. Las imágenes redimensionadas se guardan en una subcarpeta `resized`.

## 📦 Requisitos

- Bash
- [ImageMagick](https://imagemagick.org/) (`convert`)

Instalar ImageMagick (en Debian/Ubuntu):

```bash
sudo apt install imagemagick
```

## 🚀 Uso
```bash
./resize_images.sh <carpeta> <dimensiones>
```

## 📌 Dimensiones soportadas

800x → fija el ancho y ajusta el alto automáticamente.

x600 → fija el alto y ajusta el ancho automáticamente.

800x600 → fija ambos (no mantiene proporción).

50% → escala en porcentaje (reduce o amplía en ambos ejes proporcionalmente).

## 📁 Ejemplos
```bash
./resize_images.sh ./imagenes 800x      # Solo ancho
./resize_images.sh ./imagenes x600      # Solo alto
./resize_images.sh ./imagenes 800x600   # Ambos ejes
./resize_images.sh ./imagenes 50%       # Escala proporcional al 50%
```

Las imágenes redimensionadas se guardarán en la carpeta:
```
./imagenes/resized/
```

## 📬 Contribuciones
¡Se aceptan mejoras, issues y pull request 
