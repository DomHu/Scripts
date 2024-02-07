#! /bin/bash


##now we get a list of all eps files and call eps as many times as required
# FILESeps="0606*"
# for f in $FILESeps; do epstopdf $f; done


# add characters to lines in all config-files in the folder
sed -i -- 's/bg_ctrl_bio_remin_POC_fixed=.false./# bg_ctrl_bio_remin_POC_fixed=.false./g' *
sed -i -- 's/bg_par_bio_remin_POC_K1=9.0E11/# bg_par_bio_remin_POC_K1=9.0E11/g' *
sed -i -- 's/bg_par_bio_remin_POC_Ea1=54000.0/# bg_par_bio_remin_POC_Ea1=54000.0/g' *
sed -i -- 's/bg_par_bio_remin_POC_K2=1.0E14/# bg_par_bio_remin_POC_K2=1.0E14/g' *
sed -i -- 's/bg_par_bio_remin_POC_Ea2=80000.0/# bg_par_bio_remin_POC_Ea2=80000.0/g' *
sed -i -- 's/bg_par_bio_remin_POC_frac2=0.008/# bg_par_bio_remin_POC_frac2=0.008/g' *
sed -i -- 's/bg_opt_bio_remin_scavenge_H2StoPOMS="kinetic"/# bg_opt_bio_remin_scavenge_H2StoPOMS="kinetic"/g' *
sed -i -- 's/bg_par_bio_remin_kH2StoPOMS=1000000.0/# bg_par_bio_remin_kH2StoPOMS=1000000.0/g' *
