#! /bin/bash


## we get a list of all subdirectories and copy required files from remote to local
Subdir="0*"
for f in $Subdir; do sshpass -p 'xxxx' scp igelstachelbart@sprout.ggy.bris.ac.uk:cgenie_output/$f/sedgem/seddiag_misc_DATA_GLOBAL.res ./$f/sedgem/.; done

#for f in $Subdir; do sshpass -p 'xxx' scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_09999_500_diag_GLOBAL_AVERAGE.res,biogem_series_ocn_O2.res,biogem_series_ocn_H2S.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# for f in $Subdir; do sshpass -p 'xxx' scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_09999_500_diag_GLOBAL_AVERAGE.res,biogem_series_ocn_O2.res,biogem_series_ocn_H2S.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# for f in $Subdir; do sshpass -p 'xxxx' scp igelstachelbart@sprout.ggy.bris.ac.uk:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_09999_500_diag_GLOBAL_AVERAGE.res,biogem_series_ocn_O2.res,biogem_series_ocn_H2S.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/biogem_series_fseaair_pH2S.res ./$f/biogem/.;
