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

#CpG site SNP calling

#determine high coverage site intervals
cat with_SNPs/Sample1_CpG_10.txt |cut -f 1 > with_SNPs/plus_sites.cov

sed 's/:/\t/' with_SNPs/plus_sites.cov|awk '{print $1":"$2+1}' > with_SNPs/minus_sites.cov

cat with_SNPs/plus_sites.cov with_SNPs/minus_sites.cov > with_SNPs/all_sites.intervals

#call variation at high coverage sites
java -Xms16g  -Xmx25g -jar ~/bin/GenomeAnalysisTK.jar -T UnifiedGenotyper -R Sus_scrofa.fa -L with_SNPs/all_sites.intervals -I Sample1_realigned.bam -o Sample1_all_sites.vcf -stand_call_conf 50.0 -stand_emit_conf 20.0 -dcov 200 -out_mode EMIT_ALL_SITES

java -Xms16g  -Xmx25g -jar ~/bin/GenomeAnalysisTK.jar -T UnifiedGenotyper -R Sus_scrofa.fa -L with_SNPs/all_sites.intervals -I Sample1_realigned.bam -o Sample1_variants.vcf -stand_call_conf 50.0 -stand_emit_conf 20.0 -dcov 200 -out_mode EMIT_VARIANTS_ONLY

grep '#' Sample1_all_sites.vcf > Sample1_all_head.txt
grep -v '#' Sample1_all_sites.vcf|sed 's/G\t\./G\tG/'|sed 's/C\t\./C\tC/'|grep GT: > Sample1_all.txt
cat Sample1_all_head.txt Sample1_all.txt > Sample1_all_convert.vcf

#1/3rd (min 4) and 2x average genome coverage for -d and -Q, respectively
vcfutils.pl varFilter -d 2 -Q 12 Sample1_all_convert.vcf > Sample1_all.vcf

vcfutils.pl varFilter -d 2 -Q 12 Sample1_variants.vcf > Sample1_snps.vcf

grep -v '#' Sample1_all.vcf > Sample1_all.txt

grep -v '#' Sample1_snps.vcf > Sample1_snps.txt

#all covered sites and positions
position="C"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_all.txt |grep GT:|cut -f 1,2|awk '{print $1":"$2}' > Sample1_all_c.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_all.txt |grep GT:|cut -f 1,2|awk '{print $1":"$2}' > Sample1_all_g.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_all.txt |grep GT:|cut -f 1,2|awk '{print $1":"$2-1}' > Sample1_all_g_minus.txt

cat Sample1_all_c.txt Sample1_all_g.txt|sort|uniq > final_results/Sample1_all_positions.txt

cat Sample1_all_c.txt Sample1_all_g_minus.txt|sort|uniq > final_results/Sample1_all_sites.txt

#all snps at sites and positions
position="C"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_snps.txt |grep GT:|cut -f 1,2|awk '{print $1":"$2}' > Sample1_snps_c.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_snps.txt |grep GT:|cut -f 1,2|awk '{print $1":"$2}' > Sample1_snps_g.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1_snps.txt |grep GT:|cut -f 1,2|awk '{print $1":"$2-1}' > Sample1_snps_g_minus.txt

cat Sample1_snps_c.txt Sample1_snps_g.txt|sort|uniq > final_results/Sample1_snps_positions.txt

cat Sample1_snps_c.txt Sample1_snps_g_minus.txt|sort|uniq > final_results/Sample1_snps_sites.txt

cat final_results/Sample1_snps_sites.txt|sort|uniq > final_snps.cov

