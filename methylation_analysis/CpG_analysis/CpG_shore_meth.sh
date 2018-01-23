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
intersectBed -b final/100_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_100u.bed

intersectBed -b final/200_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_200d.bed

intersectBed -b final/200_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_200u.bed

intersectBed -b final/300_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_300d.bed

intersectBed -b final/300_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_300u.bed

intersectBed -b final/400_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_400d.bed

intersectBed -b final/400_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_400u.bed

intersectBed -b final/500_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_500d.bed

intersectBed -b final/500_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_500u.bed

intersectBed -b final/600_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_600d.bed

intersectBed -b final/600_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_600u.bed

intersectBed -b final/700_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_700d.bed

intersectBed -b final/700_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_700u.bed

intersectBed -b final/800_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_800d.bed

intersectBed -b final/800_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_800u.bed

intersectBed -b final/900_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_900d.bed

intersectBed -b final/900_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_900u.bed

intersectBed -b final/1000_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1000d.bed

intersectBed -b final/1000_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1000u.bed

intersectBed -b final/1100_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1100d.bed

intersectBed -b final/1100_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1100u.bed

intersectBed -b final/1200_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1200d.bed

intersectBed -b final/1200_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1200u.bed

intersectBed -b final/1300_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1300d.bed

intersectBed -b final/1300_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1300u.bed

intersectBed -b final/1400_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1400d.bed

intersectBed -b final/1400_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1400u.bed

intersectBed -b final/1500_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1500d.bed

intersectBed -b final/1500_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1500u.bed

intersectBed -b final/1600_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1600d.bed

intersectBed -b final/1600_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1600u.bed

intersectBed -b final/1700_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1700d.bed

intersectBed -b final/1700_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1700u.bed

intersectBed -b final/1800_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1800d.bed

intersectBed -b final/1800_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1800u.bed

intersectBed -b final/1900_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1900d.bed

intersectBed -b final/1900_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_1900u.bed

intersectBed -b final/2000_downstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_2000d.bed

intersectBed -b final/2000_upstream.bed -a Sample1.bed |intersectBed -v -b CpG_Islands.bed -a stdin |sort|uniq > shores/Sample1_2000u.bed

#get average methylation level for each region
ls shores/*.bed| while read filename ; do awk '{sum+=$5} END { print "Average for " FILENAME " = ",sum/NR}' $filename ; done|sed 's/=/\t/'

