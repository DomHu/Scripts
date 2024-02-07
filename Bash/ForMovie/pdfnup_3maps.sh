#! /bin/bash

# combine three figures together

# make a squence of the years 
years=($(seq -w 00000 10000 400000))

for i in "${years[@]}"
do
	echo $i
	filename="Year_$i.pdf"
	filename_out="Out_Year_3maps_$i.pdf"

	pdfnup *$i*.pdf  --nup 3x1 --outfile $filename
	pdfcrop --margin '10 50 10 10' $filename $filename

	pdfjam --outfile $filename_out --paper b0paper $filename	
	pdfcrop --margin '10 50 10 10' $filename_out $filename_out
	
done

rm Year*.pdf


