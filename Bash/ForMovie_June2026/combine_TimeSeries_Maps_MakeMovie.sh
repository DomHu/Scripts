#!/bin/bash
set -e

tsdir="TimeSeries"
mapdir="Maps/makeMovie/combined_1x3"
outdir="CombinedMovieFrames"

mkdir -p "$outdir"

canvasWidth=2048
mapScale="22%"

mapTimes=(1 100 500 1000 5000 10000 20000 30000 40000 50000 60000 80000
100000 125000 150000 175000 200000 225000 250000 275000 300000
325000 350000 375000 400000 425000 450000 475000 500000 550000
600000 700000 800000)

frameTimes=(1 1340 2700 4050 5350 6700 8050 9400 10800 12000 13400 14800
16200 17400 18800 20000 21500 23000 24000 25500 27000 28000
29500 31000 32000 33500 35000 36000 37500 39000 40500 41500
43000 44500 45500 47000 48500 49500 51000 52500 53500 55000
56500 57500 59000 60500 61500 63000 64500 66000 67000 68500
70000 71000 72500 74000 75000 76500 78000 79000 80500 82000
83000 84500 86000 87000 88500 90000 91500 92500 94000 95500
96500 98000 99500 100000 102000 104000 106000 108000 110000
112000 114000 116000 118000 120000 122000 124000 126000 128000
130000 132000 134000 136000 138000 140000 142000 144000 146000
148000 150000 152000 154000 156000 158000 160000 162000 164000
166000 168000 170000 172000 174000 176000 178000 180000 182000
184000 186000 188000 190000 192000 194000 196000 198000 200000
205000 210000 215000 220000 225000 230000 235000 240000 245000
250000 255000 260000 265000 270000 275000 280000 285000 290000
295000 300000 305000 310000 315000 320000 325000 330000 335000
340000 345000 350000 355000 360000 365000 370000 375000 380000
385000 390000 395000 400000 405000 410000 415000 420000 425000
430000 435000 445000 450000 455000 460000 465000 470000 475000
480000 485000 490000 495000 500000 505000 510000 515000 525000
530000 535000 540000 545000 550000 555000 560000 565000 570000
575000 580000 585000 590000 595000 605000 610000 615000 620000
625000 630000 635000 640000 645000 650000 655000 660000 665000
670000 675000 685000 690000 695000 700000 705000 710000 715000
720000 725000 730000 735000 740000 745000 750000 755000 765000
770000 775000 780000 785000 790000 795000 800000)

get_map_time () {
    t=$1
    best=${mapTimes[0]}
    bestdiff=$(( t > best ? t-best : best-t ))

    for mt in "${mapTimes[@]}"; do
        diff=$(( t > mt ? t-mt : mt-t ))
        if (( diff < bestdiff )); then
            best=$mt
            bestdiff=$diff
        fi
    done

    echo "$best"
}

center_to_width () {
    local infile="$1"
    local outfile_local="$2"
    local w h

    w=$(identify -format "%w" "$infile")
    h=$(identify -format "%h" "$infile")

    if (( w < canvasWidth )); then
        convert "$infile" \
            -background white \
            -gravity center \
            -extent "${canvasWidth}x${h}" \
            "$outfile_local"
    else
        cp "$infile" "$outfile_local"
    fi
}

for i in "${!frameTimes[@]}"; do

    frameNo=$(printf "%04d" $((i+1)))
    t=${frameTimes[$i]}

    mapTime=$(get_map_time "$t")
    mapID=$(printf "y%06d" "$mapTime")

    tsfile="${tsdir}/cropped_260625_0904_04_MOVIE_frame${frameNo}.png"
    mapfile="${mapdir}/combined_${mapID}.png"
    outfile="${outdir}/combined_frame${frameNo}.png"

    if [[ ! -f "$tsfile" ]]; then
        echo "Missing time-series file: $tsfile"
        exit 1
    fi

    if [[ ! -f "$mapfile" ]]; then
        echo "Missing map file: $mapfile"
        exit 1
    fi

    tmpmap_resized=$(mktemp --suffix=.png)
    tmpmap_centered=$(mktemp --suffix=.png)
    tmpts_centered=$(mktemp --suffix=.png)

    convert "$mapfile" -resize "$mapScale" "$tmpmap_resized"

    center_to_width "$tsfile" "$tmpts_centered"
    center_to_width "$tmpmap_resized" "$tmpmap_centered"

    convert "$tmpts_centered" "$tmpmap_centered" -append "$outfile"

    rm "$tmpmap_resized" "$tmpmap_centered" "$tmpts_centered"

    echo "Created $outfile using map $mapID for t=$t yr"

done

ffmpeg -y \
  -framerate 5 \
  -i "${outdir}/combined_frame%04d.png" \
  -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2,format=yuv420p" \
  -c:v libx264 \
  -crf 18 \
  260625_0904_04_FULL_MOVIE.mp4
