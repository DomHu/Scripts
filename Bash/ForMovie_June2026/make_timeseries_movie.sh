#!/bin/bash

    ffmpeg -y \
    -framerate 5 \
    -i 260625_0904_04_MOVIE_frame%04d.png \
    -c:v libx264 \
    -pix_fmt yuv420p \
    -crf 18 \
    01_260625_0904_04_MOVIE.mp4
