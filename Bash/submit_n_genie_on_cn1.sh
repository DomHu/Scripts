#!/bin/bash
#SBATCH --job-name=cgenie_batch
#SBATCH --time=72:00:00
#SBATCH --nodes=1
#SBATCH --ntasks=10
#SBATCH --cpus-per-task=1
#SBATCH --mem=20G
#SBATCH -w cn1
#SBATCH --output=/home/dhuelse/cgenie_log/cgenie_batch_%j.out

BASE="muffin.DH.430tc12x.eb_go_gs_ac_bg.PO4.SPIN_Ncycle_new.seasonal"
DIR="DOM/40_Nate_Silurian_OAE"
YEARS=10000

CONFIG_DIR="$HOME/cgenie.muffin/genie-userconfigs/$DIR"

for file in "$CONFIG_DIR"/DH.260611.430tc12x*
do
    filename=$(basename "$file")

    echo "Starting $filename"

    logfile="/home/dhuelse/cgenie_log/${filename}.out"

   ./runmuffin_slurm.sh \
        "$BASE" \
        "$DIR" \
        "$filename" \
        "$YEARS" > "$logfile" 2>&1 &

    # stop after 10 simultaneous jobs
    while [ "$(jobs -r | wc -l)" -ge 10 ]; do
        sleep 10
    done
done

wait
echo "All GENIE runs finished."
