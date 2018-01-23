#!/bin/bash
#SBATCH --account=statistics
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_statistics.txt
#SBATCH --error=error_output_statistics.txt
#SBATCH --job-name=statistics
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

R CMD BATCH statistics.R

