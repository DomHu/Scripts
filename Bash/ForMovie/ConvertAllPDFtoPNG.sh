#! /bin/bash

# combine three figures from matlab together, crop them, and convert to png

# make a squence of the years 
years_ts_counter=(100 $(seq 400 400 400000))

for i in "${years_ts_counter[@]}"
do
	echo $i
	foo=$(printf "%06d" $i)
	echo "${foo}"

	filename_pdf="Out_Year_Merge_${foo}.pdf"	 
	filename_ppng="Out_Year_Merge_${foo}.png"	 
	# convert to png to make a movie
	pdftoppm -png $filename_pdf > $filename_ppng
done

mkdir pdf_files
mv *.pdf pdf_files/.

#FILES="*.pdf"
#for f in $FILES; do pdfcrop --margin '10 10 10 10' $f $f; done


