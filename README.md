# 🖼️ resize-images.sh

Script de shell para redimensionar imágenes por lotes desde la terminal. Soporta fijar ancho, alto, ambos ejes sin mantener proporción, o escala en porcentaje. Las imágenes redimensionadas se guardan en la subcarpeta `resized`.

## 📦 Requisitos

*   Bash
*   [ImageMagick](https://imagemagick.org/) (`convert` o `magick`)

**Instalar ImageMagick (Debian/Ubuntu):**

```
sudo apt update
sudo apt install imagemagick
```

**Verificar instalación:**

```
convert -version || magick -version
```

## 🚀 Uso

```
./resize_images.sh <carpeta> <dimensiones>
```

**Dar permisos de ejecución si hace falta:**

```
chmod +x resize_images.sh
```

## 📌 Dimensiones soportadas

*   `800x` → fija el **ancho** y ajusta el alto proporcionalmente.
*   `x600` → fija el **alto** y ajusta el ancho proporcionalmente.
*   `800x600` → fija **ambos** ejes y **no mantiene proporción** (se fuerza con `!` internamente).
*   `50%` → escala proporcional en ambos ejes.

## 📁 Ejemplos

```
./resize_images.sh ./imagenes 800x
./resize_images.sh ./imagenes x600
./resize_images.sh ./imagenes 800x600
./resize_images.sh ./imagenes 50%
```

Las imágenes redimensionadas se guardarán en:

```
./imagenes/resized/
```

## 🛠️ Notas

*   Se procesan archivos `.jpg`, `.jpeg`, `.png`, `.gif` con mayúsculas o minúsculas.
*   Si tu sistema solo tiene `magick` en lugar de `convert`, el script lo detecta automáticamente.
*   Si pasas `800x600`, el resultado fuerza exactamente ese tamaño.

## 📬 Contribuciones

¡Se aceptan mejoras, issues y pull requests!
