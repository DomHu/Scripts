#!/bin/bash

config_dir="../genie-userconfigs/DOM/40_Nate_Silurian_OAE"
base_config="muffin.DH.430tc12x.eb_go_gs_ac_bg.PO4.SPIN_Ncycle_new.seasonal"
config_group="DOM/40_Nate_Silurian_OAE"
n_years=10000
node="cn1"

for filepath in "$config_dir"/DH.260611.430tc12x*
do
    filename=$(basename "$filepath")

    echo "Submitting $filename"

    sbatch -w "$node" runmuffin_slurm.sh \
        "$base_config" \
        "$config_group" \
        "$filename" \
        "$n_years"

    sleep 2
done
