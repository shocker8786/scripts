#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_60C.txt
#SBATCH -e error_output_BSseeker_60C.txt
#SBATCH -J 60C_BSseeker
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Trim_Galore/0.4.4-IGB-gcc-4.9.4
module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load SAMtools/1.7-IGB-gcc-4.9.4
module load BS-Snper/20170222-IGB-gcc-4.9.4-Perl-5.24.1

#trim reads
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/Resequencing/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/Resequencing/C60D_GAGTCA_L006_R1_001.fastq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/Resequencing/adapter_trimmed/C60D_GAGTCA_L006_R1_001_trimmed.fq.gz

#BSseeker2 alignment
bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/Resequencing/adapter_trimmed/C60D_GAGTCA_L006_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/new_human_assembly/Homo_sapiens.GRCh38.dna.primary_assembly.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/new_human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/Resequencing/alignments/60C_BSseeker.bam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

#merge bam files
samtools merge /home/a-m/kschach2/IHDI/RRBS/merged_alignments/60C_BSseeker.bam /home/a-m/kschach2/IHDI/RRBS/alignments/60C_BSseeker.bam /home/a-m/kschach2/IHDI/RRBS/Resequencing/alignments/60C_BSseeker.bam

#Call methylation
bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/merged_alignments/60C_BSseeker.bam -d /home/a-m/kschach2/new_human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.primary_assembly.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_BSseeker

#Unzip CGmap files
gunzip /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_BSseeker.CGmap.gz

# determine max depth
cat /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_BSseeker.CGmap|sort -nrk8,8 > /home/a-m/kschach2/IHDI/RRBS/merged_SNPs/60C_depth_rank.txt

#Identify and remove SNPs
BS-Snper.pl --fa /home/a-m/kschach2/new_human_assembly/Homo_sapiens.GRCh38.dna.primary_assembly.fa --input /home/a-m/kschach2/IHDI/RRBS/merged_alignments/60C_BSseeker.bam_sorted.bam --output /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/60C_SNPs.txt --methcg /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/60C_CpG_temp.txt --methchg /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/60C_CHG_temp.txt --methchh /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/60C_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/IHDI/RRBS/merged_SNPs/60C_SNP.out 2>/home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/60C_ERR.log

module load Python/3.6.1-IGB-gcc-4.9.4

python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/IHDI/RRBS/merged_SNPs/60C_SNP.out --methylation /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_BSseeker.CGmap --genome /home/a-m/kschach2/new_human_assembly/Homo_sapiens.GRCh38.dna.primary_assembly.fa --snp_output /home/a-m/kschach2/IHDI/RRBS/merged_SNPs/60C --meth_output /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C

#Determine conversion rate
python /home/a-m/kschach2/bin/python_scripts/calculate_conversion_rate.py --methylation /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_BSseeker.CGmap --output /home/a-m/kschach2/IHDI/RRBS/merged_conversion_rate/60C

#Filter for CpG sites
position="CG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/60C_CpG.txt

#Filter for CHG sites
position="CHG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60C_CHG.txt

#Filter for CHH sites
position="CHH"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/60C_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60C_CHH.txt

