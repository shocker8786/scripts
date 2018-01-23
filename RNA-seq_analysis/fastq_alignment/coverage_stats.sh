#!/bin/bash
#SBATCH --account=CoverageStats
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_Coverage_stats.txt
#SBATCH --error=error_output_Coverage_stats.txt
#SBATCH --job-name=Coverage_Stats
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

samtools mpileup Sample1/sorted_accepted_hits.bam | awk '($1 != "Ssc9_MT")' | awk '{ count++ ; SUM += $4 } END { print "Total: " SUM "\t" "Nucleotides: " count "\t" "Average_coverage: " SUM/count }' > Sample1_cov_g1_c4.out
