#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_BSseeker_0993_convert.txt
#SBATCH -e error_output_BSseeker_0993_convert.txt
#SBATCH -J 0993_BSseeker
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Seeker/2.1.2-IGB-gcc-4.9.4-Python-2.7.13
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load Python/2.7.13-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/Cirrhosis/RRBS/adapter_trimmed/ /home/a-m/kschach2/Cirrhosis/RRBS/0993_16_DNA_AAGAGG_L00M_R1_001.fastq.gz

#Diversity Trimming
python /home/a-m/kschach2/Cirrhosis/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/Cirrhosis/RRBS/adapter_trimmed/0993_16_DNA_AAGAGG_L00M_R1_001_trimmed.fq.gz

#build genome index
bs_seeker2-build.py --aligner=bowtie2 -d /home/a-m/kschach2/porcine_assembly/BSseeker -f /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa

#local alignment full
bs_seeker2-align.py -i /home/a-m/kschach2/Cirrhosis/RRBS/adapter_trimmed/0993_16_DNA_AAGAGG_L00M_R1_001_trimmed.fq_trimmed.fq.gz -g /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa -m 2 --aligner=bowtie2 -d /home/a-m/kschach2/porcine_assembly/BSseeker -o /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993.sam -f sam --bt2-p 4 --bt2--local --bt2-N 1 --bt2-L 20

#Deduplicate
python /home/a-m/kschach2/IHDI/RRBS/nudup.py -f /home/a-m/kschach2/Cirrhosis/RRBS/0993_16_DNA_AAGAGG_L00M_R2_001.fastq -o /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993_dedup.sam /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993.sam

#Convert sam to bam
samtools view -bS /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993.sam > /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993.bam

#Call methylation
bs_seeker2-call_methylation.py -i /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993_dedup.sam.sorted.dedup.bam -d /home/a-m/kschach2/porcine_assembly/BSseeker/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa_bowtie2 -o /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup

#Unzip CGmap files
gunzip /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup.CGmap.gz

#Filter for CpG sites
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup.CGmap > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_dedup_CpG.txt

#Filter for CHG sites
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup.CGmap > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHG.txt

#Filter for CHH sites
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup.CGmap > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHH.txt

#combine CpG sites and export as DMRfinder compatible bed file
python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0112_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0112_Control.txt

#Filter CpG sites by depth
awk '($8>=10)' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_dedup_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_dedup_CpG_10.cov

#Filter CHG sites by depth
awk '($8>=10)' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHG_10.cov

#Filter CHH sites by depth
awk '($8>=10)' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHH_10.cov

#Combine CHG and CHH sites
cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHG_10.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_CHH_10.cov > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_dedup_non_CpG_10.cov

