#!/bin/bash

mkdir -p movie_frames

times=(
0.5 99.5 499.5 999.5 4999.5 9999.5 19999.5 29999.5 39999.5
49999.5 59999.5 79999.5 99999.5 124999.5 149999.5 174999.5
199999.5 224999.5 249999.5 274999.5 299999.5 324999.5
349999.5 374999.5 399999.5 424999.5 449999.5 474999.5
499999.5 549999.5 599999.5 699999.5 799999.5
)

i=0

for png in combined/combined_y*.png
do
    t=${times[$i]}

    # Number of copies of frame
    repeats=$(python3 - << EOF
import math
t=$t
print(max(1, round(math.log10(t+10))))
EOF
)

    for ((j=1;j<=repeats;j++))
    do
        printf -v fname "movie_frames/frame_%05d.png" $((++frame))
        cp "$png" "$fname"
    done

    ((i++))
done

ffmpeg -y \
    -framerate 2 \
    -i movie_frames/frame_%05d.png \
    -c:v libx264 \
    -pix_fmt yuv420p \
    -crf 18 \
    OAE2_movie_slow.mp4
