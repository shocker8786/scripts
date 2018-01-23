#!/bin/bash
#SBATCH --account=methylkit
#SBATCH --time=0
#SBATCH --mem=20000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_methylkit.txt
#SBATCH --error=error_output_methylkit.txt
#SBATCH --job-name=methylkit
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#run methylkit scripts in methylkit.R file
R CMD BATCH methylkit.R
