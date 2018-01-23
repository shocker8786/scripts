#!/bin/bash
#SBATCH --account=variance
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_variance.txt
#SBATCH --error=error_output_variance.txt
#SBATCH --job-name=variance
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

cat Sample1_CpG_shared.bed|cut -f 5 > Sample1.cov

cat Sample1_islands.bed|cut -f 5 > Sample1_islands.cov

cat Sample1_shores.bed|cut -f 5 > Sample1_shores.cov

cat Sample1_genes.bed|cut -f 5 > Sample1_genes.cov

cat Sample1_exons.bed|cut -f 5 > Sample1_exons.cov

cat Sample1_introns.bed|cut -f 5 > Sample1_introns.cov

R CMD BATCH variance.R

grep -w "[1]" variance.Rout |sed 's/ /\t/' > variance_final.Rout
