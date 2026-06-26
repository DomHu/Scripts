#! /bin/bash

for f in *260625.png; do
    mv "$f" "${f%260625.png}260624.png"
done
