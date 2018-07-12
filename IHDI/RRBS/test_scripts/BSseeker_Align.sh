#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=160g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_RR.txt
#SBATCH -e error_output_BSseeker_RR.txt
#SBATCH -J BSseeker_RR
#SBATCH -p normal
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load Python/2.7.13-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#end-to-end alignment
#bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_end_to_end.sam -f sam --bt2-p 4 --bt2--end-to-end --bt2-N 1 --bt2-L 20

#local alignment
#bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/BSseeker_aligned/1T_local.sam -f sam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

#local alignment RR
#bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR.sam -f sam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20 -r -L 20 -U 520

#end-to-end alignment RR
#bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/human_assembly/Homo_sapiens.GRCh38.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR.sam -f sam --bt2-p 4 --bt2--end-to-end --bt2-N 1 --bt2-L 20 -r -L 20 -U 520

#Deduplicate
#python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR_dedup.sam /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR.sam

#python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R2_001.fastq -o /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR_dedup.sam /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR.sam

#convert sam to bam
#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR.sam > /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR.bam

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR.sam > /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR.bam

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR_dedup.sam.sorted.dedup.bam > /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR_dedup.bam

#samtools view -bS /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR_dedup.sam.sorted.dedup.bam > /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR_dedup.bam

#Call methylation
#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_end_to_end_RR_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR_dedup

#bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/1T_BSseeker_testing/1T_local_RR_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR_dedup

#Unzip CGmap files
#gunzip /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR.CGmap.gz

#gunzip /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR.CGmap.gz

#gunzip /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR_dedup.CGmap.gz

#gunzip /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR_dedup.CGmap.gz

#Filter for CpG sites
#position="CG"
#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG.txt

#Filter for CHG sites
#position="CHG"
#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG.txt

#Filter for CHH sites
#position="CHH"
#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_end_to_end_RR_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH.txt

#awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/1T_local_RR_dedup.CGmap > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH.txt

#Filter CpG sites by depth
#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_CpG_10.cov

#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_CpG_10.cov

#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_end_to_end_RR_dedup_CpG_10.cov

#awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG_2.cov

#awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG_3.cov

#awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG_5.cov

#awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/CpG/1T_local_RR_dedup_CpG_10.cov

#Filter CHG sites by depth

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHG_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHG_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHG_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHG_10.cov

#Filter CHH sites by depth

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_CHH_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_CHH_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_end_to_end_RR_dedup_CHH_10.cov

awk '($8>=2)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH_2.cov

awk '($8>=3)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH_3.cov

awk '($8>=5)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH_5.cov

awk '($8>=10)' /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH.txt > /home/a-m/kschach2/IHDI/RRBS/1T_testing_methylation/non_CpG/1T_local_RR_dedup_CHH_10.cov


