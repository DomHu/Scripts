#! /bin/bash

for f in *.png; do
    convert "$f" -trim +repage -bordercolor white -border 20 "cropped_$f"
done
