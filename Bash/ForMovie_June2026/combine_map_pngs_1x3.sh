#!/bin/bash

# Output directory
outdir="combined_1x3"
mkdir -p "$outdir"

for f in cropped_0904_04_y*.BOTo2.260624.png
do
    # Extract year identifier (e.g. y000001)
    yid=$(echo "$f" | sed -E 's/.*_(y[0-9]+)\.BOTo2\.260624\.png/\1/')

    boto2="cropped_0904_04_${yid}.BOTo2.260624.png"
    poc="cropped_0904_04_${yid}_POCburial.260624.png"
    ctop="cropped_0904_04_${yid}_CtoPburial.260624.png"

    # Check that all three files exist
    if [[ -f "$boto2" && -f "$poc" && -f "$ctop" ]]; then

        montage \
            "$boto2" \
            "$poc" \
            "$ctop" \
            -tile 3x1 \
            -geometry +20+20 \
            -background white \
            "$outdir/combined_${yid}.png"

        echo "Created combined_${yid}.png"

    else
        echo "Skipping $yid (missing file)"
    fi

done
