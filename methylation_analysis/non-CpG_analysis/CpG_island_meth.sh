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

#get list of CpG sites within CpG Islands
intersectBed -b 05_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_05.bed

intersectBed -b 55_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_55.bed

intersectBed -b 10_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_10.bed

intersectBed -b 60_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_60.bed

intersectBed -b 15_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_15.bed

intersectBed -b 65_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_65.bed

intersectBed -b 20_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_20.bed

intersectBed -b 70_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_70.bed

intersectBed -b 25_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_25.bed

intersectBed -b 75_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_75.bed

intersectBed -b 30_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_30.bed

intersectBed -b 80_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_80.bed

intersectBed -b 35_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_35.bed

intersectBed -b 85_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_85.bed

intersectBed -b 40_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_40.bed

intersectBed -b 90_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_90.bed

intersectBed -b 45_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_45.bed

intersectBed -b 95_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_95.bed

intersectBed -b 50_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_50.bed

intersectBed -b 100_Island.bed -a Sample1.bed |sort|uniq > islands/Sample1_100.bed


#get average methylation level for each region
ls islands/*.bed| while read filename ; do awk '{sum+=$5} END { print "Average for " FILENAME " = ",sum/NR}' $filename ; done|sed 's/=/\t/'

