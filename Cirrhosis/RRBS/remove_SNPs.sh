#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=60g
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
#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0112_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0112_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0112_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0112_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0112_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0112_ERR.log

python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0112_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0112 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0112

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0113_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0113_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0113_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0113_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0113_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0113_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0113_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0113_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0113_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0113 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0113

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0921_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0921_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0921_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0921_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0921_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0921_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0921_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0921_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0921_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0921 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0921

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0925_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0925_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0925_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0925_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0925_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0925_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0925_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0925_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0925_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0925 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0925

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0993_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0993_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0993_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0993_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0993_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0993_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0993_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0993_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0993 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0994_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0994_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0994_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0994_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0994_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0994_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0994_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0994_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0994_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0994 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0994

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0995_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0995_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0995_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0995_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0995_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0995_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0995_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0995_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0995_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0995 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0995

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0996_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0996_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0996_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0996_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0996_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0996_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0996_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0996_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0996_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0996 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0996

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0997_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0997_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0997_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0997_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0997_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0997_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0997_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0997_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0997_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0997 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0997

#BS-Snper.pl --fa /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --input /home/a-m/kschach2/Cirrhosis/RRBS/alignments/0998_dedup.sam.sorted.dedup.bam_sorted.bam --output /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0998_dedup_SNPs.txt --methcg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0998_CpG_temp.txt --methchg /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0998_CHG_temp.txt --methchh /home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0998_CHH_temp.txt --minhetfreq 0.1 --minhomfreq 0.85 --minquali 15 --mincover 10 --maxcover 10000 --minread2 2 --errorate 0.02 --mapvalue 20 >/home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0998_SNP.out 2>/home/a-m/kschach2/Cirrhosis/RRBS/BS-SNPer_temp/0998_ERR.log

#python /home/a-m/kschach2/Cirrhosis/RRBS/remove_SNPs.py --snps /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0998_SNP.out --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0998_BSseeker_dedup.CGmap --genome /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa --snp_output /home/a-m/kschach2/Cirrhosis/RRBS/SNPs/0998 --meth_output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0998

#Remove Y
#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0112_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0112_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0113_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0113_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0921_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0921_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0925_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0925_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0994_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0994_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0995_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0995_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0996_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0996_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0997_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0997_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0998_CpG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0998_CpG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_CHG.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_CHG.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_CHH.txt

#grep -vw Y /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp

#mv /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_CHH.txt


