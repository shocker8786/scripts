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
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' 135.CGmap|sed 's/_/./' > 135_CpG.txt

#separate sites by strand
position="C"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $2==s_position {print}' 135_CpG.txt > 135_CpG_c.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $2==s_position {print}' 135_CpG.txt > 135_CpG_g.txt

#combine strands
cat 135_CpG_c.txt|cut -f 1,2,3,7,8| awk '{print $1":"$3"\t"$2"\t"$4"\t"$5}' > 135_c_sites.txt

cat 135_CpG_g.txt|cut -f 1,2,3,7,8| awk '{print $1":"$3-1"\t"$2"\t"$4"\t"$5}' > 135_g_minus.txt

cat 135_g_minus.txt|cut -f 1 > 135_g_minus.cov

grep -Fwf 135_g_minus.cov 135_c_sites.txt > 135_shared.txt

cat 135_shared.txt |cut -f 1 > 135_shared.cov

grep -Fwf 135_shared.cov 135_c_sites.txt > 135_c_comb.txt

grep -Fwf 135_shared.cov 135_g_minus.txt > 135_g_comb.txt

grep -Fwvf 135_shared.cov 135_c_sites.txt > 135_c_noncomb.txt

grep -Fwvf 135_shared.cov 135_g_minus.txt > 135_g_noncomb.txt

cat 135_g_noncomb.txt|cut -f 1,3,4| awk '{print $1"\t""C""\t"$2"\t"$3}' > 135_g_noncomb_conv.txt

paste 135_c_comb.txt 135_g_comb.txt|cut -f 1,2,3,4,7,8|awk '{print $1"\t"$2"\t"$3+$5"\t"$4+$6}' > 135_single_strand.txt

cat 135_c_noncomb.txt 135_g_noncomb.txt 135_single_strand.txt > 135_CpG_sites.txt

awk '($4>=10)' 135_CpG_sites.txt > 135_CpG_10.cov

cat 135_CpG_10.cov | cut -f 1,2,3,4| awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$3/$4}' > with_SNPs/135_CpG_10.txt


