#! /bin/bash

# make a squence of the years 
years_ts_counter=(100 $(seq 400 400 400000))

for i in "${years_ts_counter[@]}"
do
	echo $i
	foo=$(printf "%06d" $i)
	echo "${foo}"

	filename_ts="${foo}.pdf"
	filename_out="${foo}_a4.pdf"	# combined figures
	
	pdfjam --outfile $filename_out --paper a4paper $filename_ts	
	pdfcrop --margin '10 10 10 10' $filename_out $filename_out

done

