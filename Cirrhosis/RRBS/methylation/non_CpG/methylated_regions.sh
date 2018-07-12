#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=60g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_methylated_regions.txt
#SBATCH -e error_output_methylated_regions.txt
#SBATCH -J methylated_regions
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load SAMtools/1.5-IGB-gcc-4.9.4
module load Python/2.7.13-IGB-gcc-4.9.4

#proper extract CpG sites format
#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0112_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0112_Control.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0113_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0113_Control.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0921_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0921_Cirrhosis.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0925_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0925_Cirrhosis.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0993_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0993_Cirrhosis.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0994_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0994_Cirrhosis.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0995_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0995_Cirrhosis.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0996_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0996_Control.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0997_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0997_Control.txt

#sed 's/:/\t/' /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/0998_non_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0998_Control.txt

#identify regions
python /home/a-m/kschach2/bin/python_scripts/combine_CpG_sites.py \
 -f -o /home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/all_regions.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0112_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0113_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0921_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0925_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0993_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0994_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0995_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0996_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0997_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/non_CpG/regions/0998_Control.txt \

