#!/bin/bash
#SBATCH --account=TSS
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_TSS.txt
#SBATCH --error=error_output_TSS.txt
#SBATCH --job-name=TSS
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#get list of CpG sites within TSS regions
intersectBed -b Sample1_TSS/0/final/100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_100d.bed

intersectBed -b Sample1_TSS/0/final/100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_100u.bed

intersectBed -b Sample1_TSS/0/final/200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_200d.bed

intersectBed -b Sample1_TSS/0/final/200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_200u.bed

intersectBed -b Sample1_TSS/0/final/300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_300d.bed

intersectBed -b Sample1_TSS/0/final/300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_300u.bed

intersectBed -b Sample1_TSS/0/final/400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_400d.bed

intersectBed -b Sample1_TSS/0/final/400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_400u.bed

intersectBed -b Sample1_TSS/0/final/500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_500d.bed

intersectBed -b Sample1_TSS/0/final/500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_500u.bed

intersectBed -b Sample1_TSS/0/final/600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_600d.bed

intersectBed -b Sample1_TSS/0/final/600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_600u.bed

intersectBed -b Sample1_TSS/0/final/700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_700d.bed

intersectBed -b Sample1_TSS/0/final/700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_700u.bed

intersectBed -b Sample1_TSS/0/final/800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_800d.bed

intersectBed -b Sample1_TSS/0/final/800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_800u.bed

intersectBed -b Sample1_TSS/0/final/900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_900d.bed

intersectBed -b Sample1_TSS/0/final/900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_900u.bed

intersectBed -b Sample1_TSS/0/final/1000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1000d.bed

intersectBed -b Sample1_TSS/0/final/1000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1000u.bed

intersectBed -b Sample1_TSS/0/final/1100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1100d.bed

intersectBed -b Sample1_TSS/0/final/1100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1100u.bed

intersectBed -b Sample1_TSS/0/final/1200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1200d.bed

intersectBed -b Sample1_TSS/0/final/1200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1200u.bed

intersectBed -b Sample1_TSS/0/final/Sample1300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_Sample1300d.bed

intersectBed -b Sample1_TSS/0/final/Sample1300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_Sample1300u.bed

intersectBed -b Sample1_TSS/0/final/1400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1400d.bed

intersectBed -b Sample1_TSS/0/final/1400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1400u.bed

intersectBed -b Sample1_TSS/0/final/1500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1500d.bed

intersectBed -b Sample1_TSS/0/final/1500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1500u.bed

intersectBed -b Sample1_TSS/0/final/1600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1600d.bed

intersectBed -b Sample1_TSS/0/final/1600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1600u.bed

intersectBed -b Sample1_TSS/0/final/1700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1700d.bed

intersectBed -b Sample1_TSS/0/final/1700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1700u.bed

intersectBed -b Sample1_TSS/0/final/1800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1800d.bed

intersectBed -b Sample1_TSS/0/final/1800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1800u.bed

intersectBed -b Sample1_TSS/0/final/1900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1900d.bed

intersectBed -b Sample1_TSS/0/final/1900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_1900u.bed

intersectBed -b Sample1_TSS/0/final/2000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2000d.bed

intersectBed -b Sample1_TSS/0/final/2000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2000u.bed

intersectBed -b Sample1_TSS/0/final/2100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2100d.bed

intersectBed -b Sample1_TSS/0/final/2100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2100u.bed

intersectBed -b Sample1_TSS/0/final/2200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2200d.bed

intersectBed -b Sample1_TSS/0/final/2200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2200u.bed

intersectBed -b Sample1_TSS/0/final/2300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2300d.bed

intersectBed -b Sample1_TSS/0/final/2300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2300u.bed

intersectBed -b Sample1_TSS/0/final/2400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2400d.bed

intersectBed -b Sample1_TSS/0/final/2400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2400u.bed

intersectBed -b Sample1_TSS/0/final/2500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2500d.bed

intersectBed -b Sample1_TSS/0/final/2500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2500u.bed

intersectBed -b Sample1_TSS/0/final/2600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2600d.bed

intersectBed -b Sample1_TSS/0/final/2600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2600u.bed

intersectBed -b Sample1_TSS/0/final/2700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2700d.bed

intersectBed -b Sample1_TSS/0/final/2700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2700u.bed

intersectBed -b Sample1_TSS/0/final/2800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2800d.bed

intersectBed -b Sample1_TSS/0/final/2800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2800u.bed

intersectBed -b Sample1_TSS/0/final/2900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2900d.bed

intersectBed -b Sample1_TSS/0/final/2900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_2900u.bed

intersectBed -b Sample1_TSS/0/final/3000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3000d.bed

intersectBed -b Sample1_TSS/0/final/3000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3000u.bed

intersectBed -b Sample1_TSS/0/final/3100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3100u.bed

intersectBed -b Sample1_TSS/0/final/3200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3200u.bed

intersectBed -b Sample1_TSS/0/final/3300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3300u.bed

intersectBed -b Sample1_TSS/0/final/3400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3400u.bed

intersectBed -b Sample1_TSS/0/final/3500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3500u.bed

intersectBed -b Sample1_TSS/0/final/3600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3600u.bed

intersectBed -b Sample1_TSS/0/final/3700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3700u.bed

intersectBed -b Sample1_TSS/0/final/3800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3800u.bed

intersectBed -b Sample1_TSS/0/final/3900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_3900u.bed

intersectBed -b Sample1_TSS/0/final/4000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4000u.bed

intersectBed -b Sample1_TSS/0/final/4100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4100u.bed

intersectBed -b Sample1_TSS/0/final/4200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4200u.bed

intersectBed -b Sample1_TSS/0/final/4300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4300u.bed

intersectBed -b Sample1_TSS/0/final/4400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4400u.bed

intersectBed -b Sample1_TSS/0/final/4500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4500u.bed

intersectBed -b Sample1_TSS/0/final/4600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4600u.bed

intersectBed -b Sample1_TSS/0/final/4700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4700u.bed

intersectBed -b Sample1_TSS/0/final/4800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4800u.bed

intersectBed -b Sample1_TSS/0/final/4900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_4900u.bed

intersectBed -b Sample1_TSS/0/final/5000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5000u.bed

intersectBed -b Sample1_TSS/0/final/5100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5100u.bed

intersectBed -b Sample1_TSS/0/final/5200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5200u.bed

intersectBed -b Sample1_TSS/0/final/5300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5300u.bed

intersectBed -b Sample1_TSS/0/final/5400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5400u.bed

intersectBed -b Sample1_TSS/0/final/5500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5500u.bed

intersectBed -b Sample1_TSS/0/final/5600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5600u.bed

intersectBed -b Sample1_TSS/0/final/5700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5700u.bed

intersectBed -b Sample1_TSS/0/final/5800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5800u.bed

intersectBed -b Sample1_TSS/0/final/5900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_5900u.bed

intersectBed -b Sample1_TSS/0/final/6000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6000u.bed

intersectBed -b Sample1_TSS/0/final/6100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6100u.bed

intersectBed -b Sample1_TSS/0/final/6200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6200u.bed

intersectBed -b Sample1_TSS/0/final/6300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6300u.bed

intersectBed -b Sample1_TSS/0/final/6400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6400u.bed

intersectBed -b Sample1_TSS/0/final/6500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6500u.bed

intersectBed -b Sample1_TSS/0/final/6600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6600u.bed

intersectBed -b Sample1_TSS/0/final/6700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6700u.bed

intersectBed -b Sample1_TSS/0/final/6800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6800u.bed

intersectBed -b Sample1_TSS/0/final/6900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_6900u.bed

intersectBed -b Sample1_TSS/0/final/7000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7000u.bed

intersectBed -b Sample1_TSS/0/final/7100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7100u.bed

intersectBed -b Sample1_TSS/0/final/7200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7200u.bed

intersectBed -b Sample1_TSS/0/final/7300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7300u.bed

intersectBed -b Sample1_TSS/0/final/7400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7400u.bed

intersectBed -b Sample1_TSS/0/final/7500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7500u.bed

intersectBed -b Sample1_TSS/0/final/7600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7600u.bed

intersectBed -b Sample1_TSS/0/final/7700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7700u.bed

intersectBed -b Sample1_TSS/0/final/7800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7800u.bed

intersectBed -b Sample1_TSS/0/final/7900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_7900u.bed

intersectBed -b Sample1_TSS/0/final/8000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8000u.bed

intersectBed -b Sample1_TSS/0/final/8100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8100u.bed

intersectBed -b Sample1_TSS/0/final/8200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8200u.bed

intersectBed -b Sample1_TSS/0/final/8300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8300u.bed

intersectBed -b Sample1_TSS/0/final/8400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8400u.bed

intersectBed -b Sample1_TSS/0/final/8500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8500u.bed

intersectBed -b Sample1_TSS/0/final/8600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8600u.bed

intersectBed -b Sample1_TSS/0/final/8700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8700u.bed

intersectBed -b Sample1_TSS/0/final/8800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8800u.bed

intersectBed -b Sample1_TSS/0/final/8900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_8900u.bed

intersectBed -b Sample1_TSS/0/final/9000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9000u.bed

intersectBed -b Sample1_TSS/0/final/9100_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9100u.bed

intersectBed -b Sample1_TSS/0/final/9200_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9200u.bed

intersectBed -b Sample1_TSS/0/final/9300_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9300u.bed

intersectBed -b Sample1_TSS/0/final/9400_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9400u.bed

intersectBed -b Sample1_TSS/0/final/9500_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9500u.bed

intersectBed -b Sample1_TSS/0/final/9600_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9600u.bed

intersectBed -b Sample1_TSS/0/final/9700_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9700u.bed

intersectBed -b Sample1_TSS/0/final/9800_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9800u.bed

intersectBed -b Sample1_TSS/0/final/9900_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_9900u.bed

intersectBed -b Sample1_TSS/0/final/10000_upstream.bed -a Sample1.bed  |sort|uniq > expression0_TSS/Sample1_10000u.bed

#get average methylation level for each region
ls expression0_TSS/*.bed| while read filename ; do awk '{sum+=$5} END { print "Average for " FILENAME " = ",sum/NR}' $filename ; done|sed 's/=/\t/'

