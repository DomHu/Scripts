#! /bin/bash

##and now we crop the pdfs in case they are not cropped already

FILES="*.pdf"
for f in $FILES; do pdfcrop --margin '10 10 10 10' $f $f; done


