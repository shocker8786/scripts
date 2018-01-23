#!/bin/bash
#SBATCH --account=BS-Seeker
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_BS-seeker2.txt
#SBATCH --error=error_output_BS-seeker2.txt
#SBATCH --job-name=BS-seeker
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#produce reference index
python bs_seeker2-build.py -f Sus_scrofa.fa --aligner=bowtie2 -r -l 20 -u 180 -d /path/to/reference/index/output/

#align reads to reference
python bs_seeker2-align.py -i Sample1_trimmed.fq.gz -g Sus_scrofa.fa -r -L 20 -U 180 -m 2 --aligner=bowtie2 --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20 -d /path/to/reference/index/output/ -o Sample1.bam

#call methylation levels
bs_seeker2-call_methylation.py -r 10 -i Sample1.bam -d /path/to/reference/index/output/Sus_scrofa.fa_rrbs_20_180_bowtie2 -o Sample1

#calculate average coverage and depth
samtools depth Sample1.bam_sorted.bam | awk '{ count++ ; SUM += $3 } END { print "Total: " SUM "\t" "Nucleotides: " count "\t" "Average_coverage: " SUM/count "\t" "Prc genome cov: " count/2808525991 }' > Sample1_coverage.out

