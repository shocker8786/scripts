#!/bin/bash
#SBATCH --account=pigWUR
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_pyLogo.txt
#SBATCH --error=error_pyLogo.txt
#SBATCH --job-name=pyLogo
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

python non-CPG_sequencelogo.py Sample1.CGmap Sample1_pos.fa Sample1_neg.fa

cat Sample1_pos.fa Sample1_neg.fa > Sample1.fa

