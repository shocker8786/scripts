#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_48T.txt
#SBATCH -e error_output_BSseeker_48T.txt
#SBATCH -J 48T_BSseeker
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Trim_Galore/0.4.4-IGB-gcc-4.9.4
module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4
module load BS-Snper/20170222-IGB-gcc-4.9.4-Perl-5.24.1

#trim reads
#trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/T48D_GAGTCA_L00M_R1_001.fastq.gz

#python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/T48D_GAGTCA_L00M_R1_001_trimmed.fq.gz

#BSseeker2 alignment
bs_seeker2-align.py -i /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/T48D_GAGTCA_L00M_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/new_human_assembly/Homo_sapiens.GRCh38.dna.primary_assembly.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/new_human_assembly/BSseeker -o /home/a-m/kschach2/IHDI/RRBS/alignments/48T_BSseeker.bam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

#Call methylation
bs_seeker2-call_methylation.py -i /home/a-m/kschach2/IHDI/RRBS/alignments/48T_BSseeker.bam -d /home/a-m/kschach2/new_human_assembly/BSseeker/Homo_sapiens.GRCh38.dna.primary_assembly.fa_bowtie2 -o /home/a-m/kschach2/IHDI/RRBS/methylation/48T_BSseeker

#Unzip CGmap files
gunzip /home/a-m/kschach2/IHDI/RRBS/methylation/48T_BSseeker.CGmap.gz

# determine max depth
cat /home/a-m/kschach2/IHDI/RRBS/methylation/48T_BSseeker.CGmap|sort -nrk8,8 > /home/a-m/kschach2/IHDI/RRBS/SNPs/48T_depth_rank.txt

#Identify and remove SNPs
BS-Snper.pl --fa /home/a-m/kschach2/new_human_assembly/Homo_sapiens.GRCh38.dna.primary_assembly.fa --input /home/a-m/kschach2/IHDI/RRBS/alignments/48T_BSseeker.bam_sorted.bam --output /home/a-m/kschach2/IHDI/RRBS/BS-SNPer_temp/48T_SNPs.txt --methcg /home/a-m/kschach2/IHDI/RRBS/BS-SNPer_temp/48T_CpG_temp.txt --methchg /home/a-m/kschach2/IHDI/RRBS/BS-SNPer_temp/48T_CHG_temp.txt --methchh /home/a-m/kschach2/IHDI/RRBS/BS-SNPer_temp/48T_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/IHDI/RRBS/SNPs/48T_SNP.out 2>/home/a-m/kschach2/IHDI/RRBS/BS-SNPer_temp/48T_ERR.log

module load Python/3.6.1-IGB-gcc-4.9.4

python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/IHDI/RRBS/SNPs/48T_SNP.out --methylation /home/a-m/kschach2/IHDI/RRBS/methylation/48T_BSseeker.CGmap --genome /home/a-m/kschach2/new_human_assembly/Homo_sapiens.GRCh38.dna.primary_assembly.fa --snp_output /home/a-m/kschach2/IHDI/RRBS/SNPs/48T --meth_output /home/a-m/kschach2/IHDI/RRBS/methylation/48T

#Determine conversion rate
python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/IHDI/RRBS/methylation/48T_BSseeker.CGmap --output /home/a-m/kschach2/IHDI/RRBS/conversion_rate/48T

#Filter for CpG sites
position="CG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation/48T_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/methylation/CpG/48T_CpG.txt

#Filter for CHG sites
position="CHG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation/48T_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/methylation/non_CpG/48T_CHG.txt

#Filter for CHH sites
position="CHH"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $3==s_position {print}' /home/a-m/kschach2/IHDI/RRBS/methylation/48T_meth_snps_removed.txt > /home/a-m/kschach2/IHDI/RRBS/methylation/non_CpG/48T_CHH.txt

