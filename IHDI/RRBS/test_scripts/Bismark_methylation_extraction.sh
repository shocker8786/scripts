#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=40g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_Bismark_methylation_extraction.txt
#SBATCH -e error_output_Bismark_methylation_extraction.txt
#SBATCH -J Bismark_methylation_extraction
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load Bismark/0.18.1-IGB-gcc-4.9.4-Perl-5.24.1
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2.sam > /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2.bam

bismark_methylation_extractor --cytosine_report --CX --bedGraph --CX --scaffolds -s --comprehensive --merge_non_CpG -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/ --parallel 8 --genome_folder /home/a-m/kschach2/human_assembly /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2.bam

bismark_methylation_extractor --cytosine_report --CX --bedGraph --CX --scaffolds -s --comprehensive --merge_non_CpG -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/ --parallel 8 --genome_folder /home/a-m/kschach2/human_assembly /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed_bismark_bt2_dedup.bam.sorted.dedup.bam

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1.sam > /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1.bam

bismark_methylation_extractor --cytosine_report --CX --bedGraph --CX --scaffolds -s --comprehensive --merge_non_CpG -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/ --parallel 8 --genome_folder /home/a-m/kschach2/human_assembly /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1.bam

bismark_methylation_extractor --cytosine_report --CX --bedGraph --CX --scaffolds -s --comprehensive --merge_non_CpG -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/ --parallel 8 --genome_folder /home/a-m/kschach2/human_assembly /home/a-m/kschach2/IHDI/RRBS/Bismark_aligned/1TD_bismark_bt2_biocluster1_dedup.bam.sorted.dedup.bam

