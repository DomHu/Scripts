#!/bin/bash

outdir="combined"
mkdir -p "$outdir"

for f in cropped_0904_04_y*.BOTo2.*.png; do

    yid=$(echo "$f" | sed -E 's/.*_(y[0-9]+)\.BOTo2\..*/\1/')

    boto2="cropped_0904_04_${yid}.BOTo2.260624.png"
    poc="cropped_0904_04_${yid}_POCburial.260624.png"
    po4="cropped_0904_04_${yid}.PO4Regen.260624.png"
    pop="cropped_0904_04_${yid}_POPburial.260624.png"
    ctop="cropped_0904_04_${yid}_CtoPburial.260624.png"

    blank=$(mktemp --suffix=.png)

    # Create blank panel with same size as BOTo2
    convert "$boto2" -fill white -colorize 100 "$blank"

    montage \
        "$boto2" "$poc" "$blank" \
        "$po4" "$pop" "$ctop" \
        -tile 3x2 \
        -geometry +20+20 \
        -background white \
        "$outdir/combined_${yid}.png"

    rm "$blank"

done
