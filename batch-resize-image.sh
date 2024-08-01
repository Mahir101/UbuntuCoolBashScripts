#!/bin/bash
mkdir -p resized
for img in *.jpg; do
    convert "$img" -resize 800x800 "resized/$img"
done
