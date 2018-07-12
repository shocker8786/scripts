#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=160g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_test.txt
#SBATCH -e error_output_test.txt
#SBATCH -J test
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load Python/2.7.13-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#Call methylation
bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/test/123

