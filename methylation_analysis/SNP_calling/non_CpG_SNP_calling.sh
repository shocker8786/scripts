#!/bin/bash
#SBATCH --account=SNP_calling
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_SNP_calling.txt
#SBATCH --error=error_output_SNP_calling.txt
#SBATCH --job-name=SNP_calling
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#non-CpG site SNP calling

#determine high coverage site intervals
cat with_SNPs/Sample1_non_CpG_10.txt|cut -f 1,2 > with_SNPs/sites.txt

grep C with_SNPs/sites.txt|sed 's/:/\t/'|awk '{print $1":"$2+1}' > with_SNPs/c_ajacent.cov

grep -v C with_SNPs/sites.txt|sed 's/:/\t/'|awk '{print $1":"$2-1}' > with_SNPs/g_ajacent.cov

cat with_SNPs/sites.txt|cut -f 1 > with_SNPs/sites.cov

cat with_SNPs/sites.cov with_SNPs/c_ajacent.cov with_SNPs/g_ajacent.cov > all_non_sites.intervals

cat with_SNPs/sites.cov > all_non_sites.cov

cat with_SNPs/c_ajacent.cov > all_non_sites_plus_one.cov

cat with_SNPs/g_ajacent.cov > all_non_sites_minus_one.cov

#call variation at high coverage sites
java -Xms16g  -Xmx25g -jar ~/bin/GenomeAnalysisTK.jar -T UnifiedGenotyper -R Sus_scrofa.fa -L all_nonsites.intervals -I Sample1_realigned.bam -o Sample1_non_all_sites.vcf -stand_call_conf 50.0 -stand_emit_conf 20.0 -dcov 200 -out_mode EMIT_ALL_SITES 

java -Xms16g  -Xmx25g -jar ~/bin/GenomeAnalysisTK.jar -T UnifiedGenotyper -R Sus_scrofa.fa -L all_non_sites.intervals -I Sample1_realigned.bam -o Sample1_non_variants.vcf -stand_call_conf 50.0 -stand_emit_conf 20.0 -dcov 200 -out_mode EMIT_VARIANTS_ONLY 

grep '#' Sample1_non_all_sites.vcf > Sample1_non_all_head.txt
grep -v '#' Sample1_non_all_sites.vcf|sed 's/G\t\./G\tG/'|sed 's/C\t\./C\tC/'|grep GT: > Sample1_non_all_sites.txt
cat Sample1_non_all_head.txt Sample1_non_all_sites.txt > Sample1_non_all_convert.vcf

#1/3rd (min 4) and 2x average genome coverage for -d and -Q, respectively
vcfutils.pl varFilter -d 2 -Q 12 Sample1_non_all_convert.vcf > Sample1_non_all.vcf

vcfutils.pl varFilter -d 2 -Q 12 Sample1_non_variants.vcf > Sample1_non_snps.vcf

grep -v '#' Sample1_non_all.vcf > Sample1_non_all.txt

grep -v '#' Sample1_non_snps.vcf > Sample1_non_snps.txt

cat Sample1_non_all.txt |cut -f 1,2 |awk '{print $1":"$2}'|grep -Fwf all_non_sites.cov > Sample1_non_all_sites.txt

cat Sample1_non_all.txt |cut -f 1,2 |awk '{print $1":"$2}'|grep -Fwf all_non_sites_plus_one.cov|sed 's/:/\t/'|cut -f 1,2|awk '{print $1":"$2-1}' > Sample1_non_all_plus.txt

cat Sample1_non_all.txt |cut -f 1,2 |awk '{print $1":"$2}'|grep -Fwf all_non_sites_minus_one.cov|sed 's/:/\t/'|cut -f 1,2|awk '{print $1":"$2+1}' > Sampe1_non_all_minus.txt

cp Sample1_non_all_sites.txt non_final_results/Sample1_non_all_sites.txt

cat Sample_non_all_plus.txt Sample1_non_all_minus.txt|sort|uniq > non_final_results/Sample1_non_all_CpG_check.txt

cat Sample1_non_snps.txt |cut -f 1,2,3,4,5 |awk '{print $1":"$2"\t"$3"\t"$4"\t"$5}'|grep -Fwf all_non_sites.cov > Sample1_non_snps_sites.txt

cat Sample1_non_snps.txt |cut -f 1,2,3,4,5 |awk '{print $1":"$2"\t"$3"\t"$4"\t"$5}'|grep -Fwf all_non_sites_plus_one.cov > Sample1_non_snps_plus_one.txt

cat Sample1_non_snps.txt |cut -f 1,2,3,4,5 |awk '{print $1":"$2"\t"$3"\t"$4"\t"$5}'|grep -Fwf all_non_sites_minus_one.cov > Sample1_non_snps_minus_one.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_non_snps_plus_one.txt > Sample1_non_snps_plus_CpG.txt

position="C"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_non_snps_minus_one.txt > Sample1_non_snps_minus_CpG.txt

cat Sample1_non_snps_plus_CpG.txt|sed 's/:/\t/'|cut -f 1,2|awk '{print $1":"$2-1}' > Sample1_non_snps_plus_CpG_conv.txt

cat Sample1_non_snps_minus_CpG.txt|sed 's/:/\t/'|cut -f 1,2|awk '{print $1":"$2+1}' > Sample1_non_snps_minus_CpG_conv.txt

cat Sample1_non_snps_plus_CpG_conv.txt Sample1_non_snps_minus_CpG_conv.txt |sort|uniq > non_final_results/Sample1_non_snps_CpG_final.txt

cat Sample1_non_snps_sites.txt|cut -f 1|sort|uniq > non_final_results/Sample1_non_snps_final.txt

