#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_Dedup_2.txt
#SBATCH -e error_output_Dedup_@.txt
#SBATCH -J Dedup
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load Python/2.7.13-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1_dedup.sam /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1.sam_stripped.sam

python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2_dedup.sam /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2.sam_stripped.sam

python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end_dedup.sam /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.sam

python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_dedup.sam /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.sam

python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1_dedup.sam /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1.sam

