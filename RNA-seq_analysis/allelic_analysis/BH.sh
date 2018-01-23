#!/bin/bash
#SBATCH --account=multiple_test_correction
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_correction.txt
#SBATCH --error=error_output_correction.txt
#SBATCH --job-name=multiple_test_correction
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

R CMD BATCH BH.R
