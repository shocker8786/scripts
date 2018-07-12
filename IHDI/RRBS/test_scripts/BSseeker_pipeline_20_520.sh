#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=80g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_RR.txt
#SBATCH -e error_output_BSseeker_RR.txt
#SBATCH -J BSseeker_RR
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#local alignment
#bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/4ND_GTCGTA_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local.sam -f sam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

#Deduplicate reads
python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/4ND_GTCGTA_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local_dedup.sam /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local.sam

#Convert sam to bam
#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local.sam > /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local.bam

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local_dedup.sam.sorted.dedup.bam > /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local_dedup.bam

#Call methylation
#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local

bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/4N_local_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local_dedup

#Unzip CGmap files
#gunzip /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local.CGmap.gz

gunzip /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local_dedup.CGmap.gz

#Filter for CpG sites
position="CG"
#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local.CGmap > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG.txt

awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG.txt

#Filter for CHG sites
position="CHG"
#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local.CGmap > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG.txt

awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG.txt

#Filter for CHH sites
position="CHH"
#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local.CGmap > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH.txt

awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/4N_local_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH.txt

#Filter CpG sites by depth
#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_CpG_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/CpG/4N_local_dedup_CpG_10.cov

#Filter CHG sites by depth
#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHG_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHG_10.cov

#Filter CHH sites by depth
#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_CHH_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/methylation_calls/non_CpG/4N_local_dedup_CHH_10.cov



