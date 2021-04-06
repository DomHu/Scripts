#! /bin/bash


## we get a list of all subdirectories and copy required files from remote to local
Subdir="1308*"
for f in $Subdir; do sshpass -p 'dj*jf4fv' scp igelstachelbart@domino.ucr.edu:cgenie_archive/$f.tar.gz .; done

# for f in $Subdir; do sshpass -p 'Bristol2012' scp igelstachelbart@sprout.ggy.bris.ac.uk:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc\} ./$f/biogem/.; done

#for f in $Subdir; do sshpass -p 'iversideR320k' scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_09999_500_diag_GLOBAL_AVERAGE.res,biogem_series_ocn_O2.res,biogem_series_ocn_H2S.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# for f in $Subdir; do sshpass -p 'iversideR320k' scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_09999_500_diag_GLOBAL_AVERAGE.res,biogem_series_ocn_O2.res,biogem_series_ocn_H2S.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# for f in $Subdir; do sshpass -p 'Bristol2012' scp igelstachelbart@sprout.ggy.bris.ac.uk:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_09999_500_diag_GLOBAL_AVERAGE.res,biogem_series_ocn_O2.res,biogem_series_ocn_H2S.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/biogem_series_fseaair_pH2S.res ./$f/biogem/.;
