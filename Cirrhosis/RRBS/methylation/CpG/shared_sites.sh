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

cat /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0112_CpG.txt|cut -f 1 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0113_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0921_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0925_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0994_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0995_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0996_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp2 /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0997_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/temp /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0998_CpG.txt|cut -f 1|sort|uniq > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov

#fill shared folder
grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0112_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0112_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0113_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0113_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0921_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0921_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0925_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0925_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0993_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0994_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0994_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0995_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0995_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0996_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0996_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0997_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0997_CpG.txt

grep -Fwf /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/shared.cov /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0998_CpG.txt|cut -f 1,5 > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/shared/0998_CpG.txt

