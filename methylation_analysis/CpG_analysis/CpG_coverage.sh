#!/bin/bash
#SBATCH --account=CpG_coverage
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_CpG_coverage.txt
#SBATCH --error=error_output_CpG_coverage.txt
#SBATCH --job-name=CpG_coverage
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#filter for CpG sites
position="CG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1.CGmap|sed 's/_/./' > Sample1_CpG.txt

#separate sites by strand
position="C"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $2==s_position {print}' Sample1_CpG.txt > Sample1_CpG_c.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $2==s_position {print}' Sample1_CpG.txt > Sample1_CpG_g.txt

#combine strands
cat Sample1_CpG_c.txt|cut -f 1,2,3,7,8| awk '{print $1":"$3"\t"$2"\t"$4"\t"$5}' > Sample1_c_sites.txt

cat Sample1_CpG_g.txt|cut -f 1,2,3,7,8| awk '{print $1":"$3-1"\t"$2"\t"$4"\t"$5}' > Sample1_g_minus.txt

cat Sample1_g_minus.txt|cut -f 1 > Sample1_g_minus.cov

grep -Fwf Sample1_g_minus.cov Sample1_c_sites.txt > Sample1_shared.txt

cat Sample1_shared.txt |cut -f 1 > Sample1_shared.cov

grep -Fwf Sample1_shared.cov Sample1_c_sites.txt > Sample1_c_comb.txt

grep -Fwf Sample1_shared.cov Sample1_g_minus.txt > Sample1_g_comb.txt

grep -Fwvf Sample1_shared.cov Sample1_c_sites.txt > Sample1_c_noncomb.txt

grep -Fwvf Sample1_shared.cov Sample1_g_minus.txt > Sample1_g_noncomb.txt

cat Sample1_g_noncomb.txt|cut -f 1,3,4| awk '{print $1"\t""C""\t"$2"\t"$3}' > Sample1_g_noncomb_conv.txt

paste Sample1_c_comb.txt Sample1_g_comb.txt|cut -f 1,2,3,4,7,8|awk '{print $1"\t"$2"\t"$3+$5"\t"$4+$6}' > Sample1_single_strand.txt

cat Sample1_c_noncomb.txt Sample1_g_noncomb.txt Sample1_single_strand.txt > Sample1_CpG_sites.txt

awk '($4>=10)' Sample1_CpG_sites.txt > Sample1_CpG_10.cov

cat Sample1_CpG_10.cov | cut -f 1,2,3,4| awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$3/$4}' > with_SNPs/Sample1_CpG_10.txt


