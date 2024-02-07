#! /bin/bash

# combine three figures together

# make a squence of the years 
# years_ts=($(seq -w 000400 400 400000))
years_ts_counter=(100 $(seq 400 400 400000))


years_maps=($(seq -w 00000 10000 400000))

years_maps_change=($(seq -w 005000 5000 400000))



for i in "${years_ts_counter[@]}"
do
	echo $i
	foo=$(printf "%06d" $i)
	echo "${foo}"

	filename_ts="${foo}_a4.pdf"
	filename_out="Out_Year_Merge_${foo}.pdf"	# combined figures
	echo $filename_ts
	if [[ $i -lt 5000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[0]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 15000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[1]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 25000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[2]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 35000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[3]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 45000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[4]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 55000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[5]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 65000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[6]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 75000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[7]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 85000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[8]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 95000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[9]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 105000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[10]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 115000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[11]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 125000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[12]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 135000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[13]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 145000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[14]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 155000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[15]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 165000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[16]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 175000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[17]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 185000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[18]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 195000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[19]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 205000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[20]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 215000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[21]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 225000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[22]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 235000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[23]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 245000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[24]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 255000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[25]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 265000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[26]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 275000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[27]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 285000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[28]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 295000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[29]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 305000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[30]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 315000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[31]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 325000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[32]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 335000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[33]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 345000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[34]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 355000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[35]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 365000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[36]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 375000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[37]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 385000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[38]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	elif [[ $i -lt 395000 ]]
	then
		filename_map="Out_Year_3maps_${years_maps[39]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out
	else
		filename_map="Out_Year_3maps_${years_maps[40]}.pdf"
		echo $filename_map
		pdfnup $filename_ts $filename_map --nup 1x2 --outfile $filename_out

	fi

done

#FILES="*.pdf"
#for f in $FILES; do pdfcrop --margin '10 10 10 10' $f $f; done

