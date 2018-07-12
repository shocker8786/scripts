#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_methylated_regions.txt
#SBATCH -e error_output_methylated_regions.txt
#SBATCH -J methylated_regions
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load SAMtools/1.5-IGB-gcc-4.9.4
module load Python/3.6.1-IGB-gcc-4.9.4
module load BEDTools/2.26.0-IGB-gcc-4.9.4

#combine CpG sites and export as DMRfinder compatible bed file
python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0112_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0112_Control.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0113_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0113_Control.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0921_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0921_Cirrhosis.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0925_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0925_Cirrhosis.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0993_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0993_Cirrhosis.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0994_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0994_Cirrhosis.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0995_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0995_Cirrhosis.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0996_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0996_Control.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0997_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0997_Control.txt

python /home/a-m/kschach2/bin/python_scripts/combine_strands.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/0998_CpG.txt  --output /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0998_Control.txt

module load Python/2.7.13-IGB-gcc-4.9.4

#identify regions
python /home/a-m/kschach2/bin/python_scripts/combine_CpG_sites.py \
 -f -o /home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/all_regions.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0112_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0113_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0921_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0925_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0993_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0994_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0995_Cirrhosis.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0996_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0997_Control.txt \
/home/a-m/kschach2/Cirrhosis/RRBS/methylation/CpG/regions/0998_Control.txt \

