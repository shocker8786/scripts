#!/bin/bash
#SBATCH --account=Coverage
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_Coverage.txt
#SBATCH --error=error_output_Coverage.txt
#SBATCH --job-name=Coverage
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

for i in Sample1_accepted_hits.bam; do echo $i; samtools index $i; done;
for i in Sample1_accepted_hits.bam; do echo $i; samtools idxstats $i > Sample1_chromosomes.txt; done;
