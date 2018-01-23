#!/bin/bash
#SBATCH --account=shared_sites
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_shared_sites.txt
#SBATCH --error=error_output_shared_sites.txt
#SBATCH --job-name=shared_sites
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#filter for shared sites
cat Sample1_CpG_10.txt|cut -f 1 > Sample1.cov

grep -Fwf Sample1.cov Sample2_CpG_10.txt|cut -f 1 > Sample2.cov

grep -Fwf Sample2.cov Sample3_CpG_10.txt|cut -f 1 > shared.cov

grep -Fwf shared.cov Sample1_CpG_10.txt > Sample1_CpG_shared.txt

grep -Fwf shared.cov Sample2_CpG_10.txt > Sample2_CpG_shared.txt

grep -Fwf shared.cov Sample3_CpG_10.txt > Sample3_CpG_shared.txt

#convert files to bed format
cat Sample1_CpG_shared.txt|sed 's/:/\t/'|cut -f 1,2,3,4,5|awk '{print $1"\t"$2"\t"$2"\t"$5"\t"$4}' > Sample1_CpG_shared.bed



