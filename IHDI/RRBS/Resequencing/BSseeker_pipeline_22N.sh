#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_22N.txt
#SBATCH -e error_output_BSseeker_22N.txt
#SBATCH -J 22N_BSseeker
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Trim_Galore/0.4.4-IGB-gcc-4.9.4
module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load SAMtools/1.7-IGB-gcc-4.9.4
module load BS-Snper/20170222-IGB-gcc-4.9.4-Perl-5.24.1

#trim reads
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/Resequencing/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/Resequencing/N22D_GTGCTT_L00M_R1_001.fastq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/Resequencing/adapter_trimmed/N22D_GTGCTT_L00M_R1_001_trimmed.fq.gz

#BSseeker2 alignment
bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/Resequencing/adapter_trimmed/N22D_GTGCTT_L00M_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/new_human_assembly/Female_Homo_sapiens.GRCh38.dna.primary_assembly.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/new_human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/Resequencing/alignments/22N_BSseeker.bam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

#merge bam files
samtools merge /home/a-m/kschach2/IHDI/RRBS/merged_alignments/22N_BSseeker.bam /home/a-m/kschach2/IHDI/RRBS/alignments/22N_BSseeker.bam /home/a-m/kschach2/IHDI/RRBS/Resequencing/alignments/22N_BSseeker.bam

#Call methylation
bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/merged_alignments/22N_BSseeker.bam -d /home/a-m/kschach2/new_human_assembly/BSseeker/Female_Homo_sapiens.GRCh38.dna.primary_assembly.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_BSseeker

#Unzip CGmap files
gunzip /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_BSseeker.CGmap.gz

# determine max depth
cat /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_BSseeker.CGmap|sort -nrk8,8 > /home/a-m/kschach2/IHDI/RRBS/merged_SNPs/22N_depth_rank.txt

#Identify and remove SNPs
BS-Snper.pl --fa /home/a-m/kschach2/new_human_assembly/Female_Homo_sapiens.GRCh38.dna.primary_assembly.fa --input /home/a-m/kschach2/IHDI/RRBS/merged_alignments/22N_BSseeker.bam_sorted.bam --output /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/22N_SNPs.txt --methcg /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/22N_CpG_temp.txt --methchg /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/22N_CHG_temp.txt --methchh /home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/22N_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/IHDI/RRBS/merged_SNPs/22N_SNP.out 2>/home/a-m/kschach2/IHDI/RRBS/merged_BS-SNPer_temp/22N_ERR.log

module load Python/3.6.1-IGB-gcc-4.9.4

python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/IHDI/RRBS/merged_SNPs/22N_SNP.out --methylation /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_BSseeker.CGmap --genome /home/a-m/kschach2/new_human_assembly/Female_Homo_sapiens.GRCh38.dna.primary_assembly.fa --snp_output /home/a-m/kschach2/IHDI/RRBS/merged_SNPs/22N --meth_output /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N

#Determine conversion rate
python /home/a-m/kschach2/bin/python_scripts/calculate_conversion_rate.py --methylation /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_BSseeker.CGmap --output /home/a-m/kschach2/IHDI/RRBS/merged_conversion_rate/22N

#Filter for CpG sites
position="CG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/22N_CpG.txt

#Filter for CHG sites
position="CHG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/22N_CHG.txt

#Filter for CHH sites
position="CHH"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/22N_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/22N_CHH.txt

