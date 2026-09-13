#!/bin/bash
# Builds the two Workshop images from the generated sources in Art/.
#
#   Art/Preview-source.png   ->  Mod/About/Preview.png    896 x 504, under 900 KB
#   Art/ModIcon-source.png   ->  Mod/About/ModIcon.png    128 x 128, 20-30 KB
#
# The Preview renderer loads Art/preview.html and Art/preview-palette.json,
# waits for Segoe UI, checks contrast and size, and writes visual QA artifacts.
# Install its Node dependencies with npm install --prefix _tools first.
# Both images use the full-resolution sources, never an already-reduced copy.
set -e
cd "$(dirname "$0")/.."
mkdir -p Mod/About

node _tools/build-preview.cjs

ffmpeg -v error -y -i Art/ModIcon-source.png -vf "scale=128:128:flags=lanczos" \
  -compression_level 100 -pred mixed Mod/About/ModIcon.png

ls -l Mod/About
