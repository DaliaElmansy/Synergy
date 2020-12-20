#!/bin/bash
#SBATCH -o matlab.out
#SBATCH --time=02:00:00
#SBATCH -N 1 -n 8 --mem=5gb

#Load MATLAB module
module load matlab

# Export time zone to suppress MATLAB warning 
export TZ=America/New_York

#RUN MATLAB script
matlab -singleCompThread -nodisplay -r syn_convert_save(syn_matrix.xlsx,syn_table.xlsx)
