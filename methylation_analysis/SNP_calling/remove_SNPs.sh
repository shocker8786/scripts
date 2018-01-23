#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=40g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_remove_SNPs.txt
#SBATCH -e error_output_remove_SNPs.txt
#SBATCH -J remove_SNPs
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load BS-Snper/20170222-IGB-gcc-4.9.4-Perl-5.24.1
module load SAMtools/1.5-IGB-gcc-4.9.4
module load Python/3.6.1-IGB-gcc-4.9.4

#identify SNPs
BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0112_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112_dedup_SNPs_temp.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/methylation_SNPs_removed/0112_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/methylation_SNPs_removed/0112_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/methylation_SNPs_removed/0112_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 1000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/methylation_SNPs_removed/0112_ERR.log

python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/0112_temp.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0112

