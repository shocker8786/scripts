#!/bin/bash
#SBATCH --account=down
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_down.txt
#SBATCH --error=error_output_down.txt
#SBATCH --job-name=down
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#get list of CpG sites within downstream regions
intersectBed -b Sample1_down/0/final/100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_100d.bed

intersectBed -b Sample1_down/0/final/200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_200d.bed

intersectBed -b Sample1_down/0/final/300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_300d.bed

intersectBed -b Sample1_down/0/final/400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_400d.bed

intersectBed -b Sample1_down/0/final/500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_500d.bed

intersectBed -b Sample1_down/0/final/600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_600d.bed

intersectBed -b Sample1_down/0/final/700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_700d.bed

intersectBed -b Sample1_down/0/final/800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_800d.bed

intersectBed -b Sample1_down/0/final/900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_900d.bed

intersectBed -b Sample1_down/0/final/1000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1000d.bed

intersectBed -b Sample1_down/0/final/1100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1100d.bed

intersectBed -b Sample1_down/0/final/1200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1200d.bed

intersectBed -b Sample1_down/0/final/Sample1300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_Sample1300d.bed

intersectBed -b Sample1_down/0/final/1400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1400d.bed

intersectBed -b Sample1_down/0/final/1500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1500d.bed

intersectBed -b Sample1_down/0/final/1600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1600d.bed

intersectBed -b Sample1_down/0/final/1700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1700d.bed

intersectBed -b Sample1_down/0/final/1800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1800d.bed

intersectBed -b Sample1_down/0/final/1900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_1900d.bed

intersectBed -b Sample1_down/0/final/2000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2000d.bed

intersectBed -b Sample1_down/0/final/2100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2100d.bed

intersectBed -b Sample1_down/0/final/2200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2200d.bed

intersectBed -b Sample1_down/0/final/2300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2300d.bed

intersectBed -b Sample1_down/0/final/2400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2400d.bed

intersectBed -b Sample1_down/0/final/2500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2500d.bed

intersectBed -b Sample1_down/0/final/2600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2600d.bed

intersectBed -b Sample1_down/0/final/2700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2700d.bed

intersectBed -b Sample1_down/0/final/2800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2800d.bed

intersectBed -b Sample1_down/0/final/2900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_2900d.bed

intersectBed -b Sample1_down/0/final/3000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3000d.bed

intersectBed -b Sample1_down/0/final/3100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3100d.bed

intersectBed -b Sample1_down/0/final/3200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3200d.bed

intersectBed -b Sample1_down/0/final/3300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3300d.bed

intersectBed -b Sample1_down/0/final/3400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3400d.bed

intersectBed -b Sample1_down/0/final/3500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3500d.bed

intersectBed -b Sample1_down/0/final/3600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3600d.bed

intersectBed -b Sample1_down/0/final/3700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3700d.bed

intersectBed -b Sample1_down/0/final/3800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3800d.bed

intersectBed -b Sample1_down/0/final/3900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_3900d.bed

intersectBed -b Sample1_down/0/final/4000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4000d.bed

intersectBed -b Sample1_down/0/final/4100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4100d.bed

intersectBed -b Sample1_down/0/final/4200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4200d.bed

intersectBed -b Sample1_down/0/final/4300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4300d.bed

intersectBed -b Sample1_down/0/final/4400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4400d.bed

intersectBed -b Sample1_down/0/final/4500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4500d.bed

intersectBed -b Sample1_down/0/final/4600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4600d.bed

intersectBed -b Sample1_down/0/final/4700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4700d.bed

intersectBed -b Sample1_down/0/final/4800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4800d.bed

intersectBed -b Sample1_down/0/final/4900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_4900d.bed

intersectBed -b Sample1_down/0/final/5000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5000d.bed

intersectBed -b Sample1_down/0/final/5100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5100d.bed

intersectBed -b Sample1_down/0/final/5200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5200d.bed

intersectBed -b Sample1_down/0/final/5300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5300d.bed

intersectBed -b Sample1_down/0/final/5400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5400d.bed

intersectBed -b Sample1_down/0/final/5500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5500d.bed

intersectBed -b Sample1_down/0/final/5600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5600d.bed

intersectBed -b Sample1_down/0/final/5700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5700d.bed

intersectBed -b Sample1_down/0/final/5800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5800d.bed

intersectBed -b Sample1_down/0/final/5900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_5900d.bed

intersectBed -b Sample1_down/0/final/6000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6000d.bed

intersectBed -b Sample1_down/0/final/6100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6100d.bed

intersectBed -b Sample1_down/0/final/6200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6200d.bed

intersectBed -b Sample1_down/0/final/6300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6300d.bed

intersectBed -b Sample1_down/0/final/6400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6400d.bed

intersectBed -b Sample1_down/0/final/6500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6500d.bed

intersectBed -b Sample1_down/0/final/6600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6600d.bed

intersectBed -b Sample1_down/0/final/6700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6700d.bed

intersectBed -b Sample1_down/0/final/6800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6800d.bed

intersectBed -b Sample1_down/0/final/6900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_6900d.bed

intersectBed -b Sample1_down/0/final/7000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7000d.bed

intersectBed -b Sample1_down/0/final/7100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7100d.bed

intersectBed -b Sample1_down/0/final/7200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7200d.bed

intersectBed -b Sample1_down/0/final/7300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7300d.bed

intersectBed -b Sample1_down/0/final/7400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7400d.bed

intersectBed -b Sample1_down/0/final/7500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7500d.bed

intersectBed -b Sample1_down/0/final/7600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7600d.bed

intersectBed -b Sample1_down/0/final/7700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7700d.bed

intersectBed -b Sample1_down/0/final/7800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7800d.bed

intersectBed -b Sample1_down/0/final/7900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_7900d.bed

intersectBed -b Sample1_down/0/final/8000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8000d.bed

intersectBed -b Sample1_down/0/final/8100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8100d.bed

intersectBed -b Sample1_down/0/final/8200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8200d.bed

intersectBed -b Sample1_down/0/final/8300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8300d.bed

intersectBed -b Sample1_down/0/final/8400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8400d.bed

intersectBed -b Sample1_down/0/final/8500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8500d.bed

intersectBed -b Sample1_down/0/final/8600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8600d.bed

intersectBed -b Sample1_down/0/final/8700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8700d.bed

intersectBed -b Sample1_down/0/final/8800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8800d.bed

intersectBed -b Sample1_down/0/final/8900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_8900d.bed

intersectBed -b Sample1_down/0/final/9000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9000d.bed

intersectBed -b Sample1_down/0/final/9100_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9100d.bed

intersectBed -b Sample1_down/0/final/9200_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9200d.bed

intersectBed -b Sample1_down/0/final/9300_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9300d.bed

intersectBed -b Sample1_down/0/final/9400_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9400d.bed

intersectBed -b Sample1_down/0/final/9500_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9500d.bed

intersectBed -b Sample1_down/0/final/9600_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9600d.bed

intersectBed -b Sample1_down/0/final/9700_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9700d.bed

intersectBed -b Sample1_down/0/final/9800_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9800d.bed

intersectBed -b Sample1_down/0/final/9900_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_9900d.bed

intersectBed -b Sample1_down/0/final/10000_downstream.bed -a Sample1.bed  |sort|uniq > expression0_down/Sample1_10000d.bed

#get average methylation level for each region
ls expression0_down/*.bed| while read filename ; do awk '{sum+=$5} END { print "Average for " FILENAME " = ",sum/NR}' $filename ; done|sed 's/=/\t/'

