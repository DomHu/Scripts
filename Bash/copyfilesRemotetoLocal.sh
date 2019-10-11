#! /bin/bash


## we get a list of all subdirectories and copy required files from remote to local
Subdir="04*"
for f in $Subdir; do sshpass -p 'Bristol2012' scp igelstachelbart@sprout.ggy.bris.ac.uk:cgenie_output/$f/biogem/{fields_biogem_2d.nc,fields_biogem_3d.nc,biogem_year_19999_500_diag_GLOBAL_AVERAGE.res,biogem_series_fseaair_pH2S.res\} ./$f/biogem/.; done

# scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/biogem_series_fseaair_pH2S.res ./$f/biogem/.;
