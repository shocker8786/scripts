#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_ETE.txt
#SBATCH -e error_output_BSseeker_ETE.txt
#SBATCH -J BSseeker_ETE
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4

#end-to-end alignment
bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.sam -f sam --bt2-p 4 --bt2--end-to-end --bt2-N 1 --bt2-L 20

#local alignment
#bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.sam -f sam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

