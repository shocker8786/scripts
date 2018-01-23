#!/bin/bash
#SBATCH --account=remove_SNPs
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_remove_SNPs.txt
#SBATCH --error=error_output_remove_SNPs.txt
#SBATCH --job-name=remove_SNPs
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#filter for SNP sites
grep -Fwvf final_snps.cov with_SNPs/Sample1_CpG_10.txt > SNPs_removed/Sample1_CpG_10.txt

