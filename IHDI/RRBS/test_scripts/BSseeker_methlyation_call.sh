#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=60g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_methylation_call_3.txt
#SBATCH -e error_output_BSseeker_methylation_call_3.txt
#SBATCH -J BSseeker_methylation_call
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.sam > /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.bam

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1T_end_to_end 

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1T_end_to_end_dedup 

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.sam > /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.bam

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1T_local

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1T_local_dedup

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1.sam > /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1.bam

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1T_local_biocluster1

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local_biocluster1_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1T_local_biocluster1_dedup

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2

bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2_dedup.sam.sorted.dedup

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1TD_bismark_bt2_biocluster1

bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/1TD_bismark_bt2_biocluster1_dedup.sam.sorted.dedup

