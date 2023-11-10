#! /bin/bash

## get a list of all pdf files and call pdfcrop as many times as required
FILESeps="*.pdf"
for f in $FILESeps; do pdfcrop --margins '-50 -60 -30 -70' $f $f; done



