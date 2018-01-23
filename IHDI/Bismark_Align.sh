#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_Bismark.txt
#SBATCH -e error_output_Bismark.txt
#SBATCH -J Bismark
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load Bismark/0.18.1-IGB-gcc-4.9.4-Perl-5.24.1
module load Bowtie2/2.3.2-IGB-gcc-4.9.4

bismark -N 1 -p 8 -o /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned --sam --nucleotide_coverage /home/a-m/kschach2/human_assembly /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz

