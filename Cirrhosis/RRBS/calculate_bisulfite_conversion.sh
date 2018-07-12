#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_conversion_rate.txt
#SBATCH -e error_output_conversion_rate.txt
#SBATCH -J conversion_rate
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Python/3.6.1-IGB-gcc-4.9.4

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0112_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0112

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0113_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0113

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0921_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0921

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0925_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0925

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0993_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0993

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0994_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0994

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0995_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0995

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0996_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0996

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0997_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0997

python /home/a-m/kschach2/Cirrhosis/RRBS/calculate_conversion_rate.py --methylation /home/a-m/kschach2/Cirrhosis/RRBS/methylation/0998_BSseeker_dedup.CGmap --output /home/a-m/kschach2/Cirrhosis/RRBS/test/0998

