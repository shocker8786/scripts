#!/bin/bash
#SBATCH --account=shared_Sites
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

#filter for shared CHG sites
cat Sample1_CHG_10.txt|cut -f 1 > Sample1_CHG.cov

grep -Fwf Sample1_CHG.cov Sample2_CHG_10.txt|cut -f 1 > Sample2_CHG.cov

grep -Fwf Sample2_CHG.cov Sample3_CHG_10.txt|cut -f 1 > shared_CHG.cov

grep -Fwf shared_CHG.cov Sample1_CHG_10.txt > Sample1_CHG_shared.txt

grep -Fwf shared_CHG.cov Sample2_CHG_10.txt > Sample2_CHG_shared.txt

grep -Fwf shared_CHG.cov Sample3_CHG_10.txt > Sample3_CHG_shared.txt

#convert files to bed format
cat Sample1_CHG_shared.txt|sed 's/:/\t/'|cut -f 1,2,6,8|awk '{print $1"\t"$2"\t"$2"\t"$3"\t"$4}' > Sample1_CHG_shared.bed

#filter for shared CHH sites
cat Sample1_CHH_10.txt|cut -f 1 > Sample1_CHH.cov

grep -Fwf Sample1_CHH.cov Sample2_CHH_10.txt|cut -f 1 > Sample2_CHH.cov

grep -Fwf Sample2_CHH.cov Sample3_CHH_10.txt|cut -f 1 > shared_CHH.cov

grep -Fwf shared_CHH.cov Sample1_CHH_10.txt > Sample1_CHH_shared.txt

grep -Fwf shared_CHH.cov Sample2_CHH_10.txt > Sample2_CHH_shared.txt

grep -Fwf shared_CHH.cov Sample3_CHH_10.txt > Sample3_CHH_shared.txt

#convert files to bed format
cat Sample1_CHH_shared.txt|sed 's/:/\t/'|cut -f 1,2,6,8|awk '{print $1"\t"$2"\t"$2"\t"$3"\t"$4}' > Sample1_CHH_shared.bed

#combine CHG and CHH sites
cat Sample1_CHH_shared.bed Sample1_CHG_shared.bed > Sample1_non_CpG_shared.bed

