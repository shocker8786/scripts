#!/bin/bash
#SBATCH --account=gene_body
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_gene_body.txt
#SBATCH --error=error_output_gene_body.txt
#SBATCH --job-name=gene_body
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#get list of CpG sites within gene body regions
intersectBed -b Sample1/0/final/05.bed -a Sample1.bed |sort|uniq > expression0/Sample1_05.bed

intersectBed -b Sample1/0/final/55.bed -a Sample1.bed |sort|uniq > expression0/Sample1_55.bed

intersectBed -b Sample1/0/final/10.bed -a Sample1.bed |sort|uniq > expression0/Sample1_10.bed

intersectBed -b Sample1/0/final/60.bed -a Sample1.bed |sort|uniq > expression0/Sample1_60.bed

intersectBed -b Sample1/0/final/15.bed -a Sample1.bed |sort|uniq > expression0/Sample1_15.bed

intersectBed -b Sample1/0/final/65.bed -a Sample1.bed |sort|uniq > expression0/Sample1_65.bed

intersectBed -b Sample1/0/final/20.bed -a Sample1.bed |sort|uniq > expression0/Sample1_20.bed

intersectBed -b Sample1/0/final/70.bed -a Sample1.bed |sort|uniq > expression0/Sample1_70.bed

intersectBed -b Sample1/0/final/25.bed -a Sample1.bed |sort|uniq > expression0/Sample1_25.bed

intersectBed -b Sample1/0/final/75.bed -a Sample1.bed |sort|uniq > expression0/Sample1_75.bed

intersectBed -b Sample1/0/final/30.bed -a Sample1.bed |sort|uniq > expression0/Sample1_30.bed

intersectBed -b Sample1/0/final/80.bed -a Sample1.bed |sort|uniq > expression0/Sample1_80.bed

intersectBed -b Sample1/0/final/35.bed -a Sample1.bed |sort|uniq > expression0/Sample1_35.bed

intersectBed -b Sample1/0/final/85.bed -a Sample1.bed |sort|uniq > expression0/Sample1_85.bed

intersectBed -b Sample1/0/final/40.bed -a Sample1.bed |sort|uniq > expression0/Sample1_40.bed

intersectBed -b Sample1/0/final/90.bed -a Sample1.bed |sort|uniq > expression0/Sample1_90.bed

intersectBed -b Sample1/0/final/45.bed -a Sample1.bed |sort|uniq > expression0/Sample1_45.bed

intersectBed -b Sample1/0/final/95.bed -a Sample1.bed |sort|uniq > expression0/Sample1_95.bed

intersectBed -b Sample1/0/final/50.bed -a Sample1.bed |sort|uniq > expression0/Sample1_50.bed

intersectBed -b Sample1/0/final/100.bed -a Sample1.bed |sort|uniq > expression0/Sample1_100.bed

#get average methylation level for each region
ls expression0/*.bed| while read filename ; do awk '{sum+=$5} END { print "Average for " FILENAME " = ",sum/NR}' $filename ; done|sed 's/=/\t/'

