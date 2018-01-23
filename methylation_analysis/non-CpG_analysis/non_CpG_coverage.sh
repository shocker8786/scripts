#!/bin/bash
#SBATCH --account=non_CpG_coverage
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_non_CpG_coverage.txt
#SBATCH --error=error_output_non_CpG_coverage.txt
#SBATCH --job-name=non_CpG_coverage
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#filter for CHG sites
position="CHG"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1.CGmap|sed 's/_/./' > Sample1_CHG.txt

#filter for CHH sites
position="CHH"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $4==s_position {print}' Sample1.CGmap|sed 's/_/./' > Sample1_CHH.txt

#filter CHG sites by depth
awk '($8>=10)' Sample1_CHG.txt|cut -f 1,2,3,4,5,6,7,8|awk '{print $1":"$3"\t"$2"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' > with_SNPs/Sample1_CHG_10.txt

#filter CHH sites by depth
awk '($8>=10)' Sample1_CHH.txt|cut -f 1,2,3,4,5,6,7,8|awk '{print $1":"$3"\t"$2"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8}' > with_SNPs/Sample1_CHH_10.txt

#combine CHG and CHH sites
cat with_SNPs/Sample1_CHG_10.txt with_SNPs/Sample1_CHH_10.txt > with_SNPs/Sample1_non_CpG_10.txt

