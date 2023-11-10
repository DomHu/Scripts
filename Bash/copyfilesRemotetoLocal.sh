#! /bin/bash


## we get a list of all subdirectories and copy required files from remote to local
Subdir="0208_*"
for f in $Subdir; do sshpass -p 'password' scp -P 60606 dashrainbow@sterling.ucr.edu:cgenie_output/$f/biogem/{biogem_series_misc_opsi.res,biogem_series_ocn_O2.res,biogem_series_ocn_SO4.res,biogem_series_ocn_H2S.res,biogem_series_ocn_PO4.res,biogem_series_ocn_ALK.res,biogem_series_ocn_DIC.res,biogem_series_ocn_DIC_13C.res,biogem_series_atm_pCO2.res,biogem_series_atm_pO2.res,biogem_series_atm_temp.res,biogem_series_ocn_temp.res,biogem_series_fexport_POC.res,biogem_series_focnsed_CaCO3.res,biogem_series_sed_CaCO3.res,biogem_series_focnsed_POC.res,biogem_series_fsedocn_DIC.res,biogem_series_fsedocn_Ca.res,biogem_series_diag_weather_PO4.res\} ./$f/biogem/.; done

# scp igelstachelbart@domino.ucr.edu:cgenie_output/$f/biogem/biogem_series_fseaair_pH2S.res ./$f/biogem/.;
