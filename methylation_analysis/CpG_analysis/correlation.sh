#!/bin/bash
#SBATCH --account=correlation
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_correlation.txt
#SBATCH --error=error_output_correlation.txt
#SBATCH --job-name=correlation
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#run correlation analysis from correlation.R file
R CMD BATCH correlation.R
