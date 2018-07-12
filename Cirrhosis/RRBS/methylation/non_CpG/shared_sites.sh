#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_shared_sites.txt
#SBATCH -e error_output_shared_sites.txt
#SBATCH -J shared_Cirrhosis
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#combine CHG and CHH
cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_non_CpG.txt

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_CHG.txt /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_CHH.txt > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_non_CpG.txt

#identify shared sites

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_non_CpG.txt|cut -f 1 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_non_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov

#fill shared folder
grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0112_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0113_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0921_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0925_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0993_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0994_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0995_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0996_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0997_non_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_non_CpG.txt|cut -f 1,3,4,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/shared/0998_non_CpG.txt

