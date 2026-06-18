#!/bin/bash

infile="DH.260611.430tc12x.bg.PO4.Tdep.12X.PO4PD.pO2PD.Ncycle.NEW.seasonal.SPIN"

for f in 0.3 0.4 0.5 0.6 0.7
do
    outfile=$(echo "$infile" | sed "s/pO2PD/pO2_${f}xPD/")

    value=$(awk -v fac="$f" '
        /^bg_par_atm_force_scale_val_6=/ {
            split($0,a,"=");
            split(a[2],b," ");
            printf "%.6f", b[1]*fac
        }' "$infile")

    sed -E "s/^bg_par_atm_force_scale_val_6=.*/bg_par_atm_force_scale_val_6=${value} # 0.2095 = 1 PAL O2/" \
        "$infile" > "$outfile"

    echo "Created $outfile"
done
