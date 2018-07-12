#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_Strip_sam.txt
#SBATCH -e error_output_Strip_sam.txt
#SBATCH -J Strip_sam
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

#/home/a-m/kschach2/IHDI/RRBS/strip_bismark_sam.sh /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1.sam

/home/a-m/kschach2/IHDI/RRBS/strip_bismark_sam.sh /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2.sam

/home/a-m/kschach2/IHDI/RRBS/strip_bismark_sam.sh /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1.sam

/home/a-m/kschach2/IHDI/RRBS/strip_bismark_sam.sh /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.sam

/home/a-m/kschach2/IHDI/RRBS/strip_bismark_sam.sh /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.sam

