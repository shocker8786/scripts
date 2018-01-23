#!/bin/bash
#SBATCH --account=Iron_PRRSv
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_genomic_regions.txt
#SBATCH --error=error_output_genomic_regions.txt
#SBATCH --job-name=genomic_regions
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

intersectBed -b CpG_Islands.bed -a Sample1.bed|sort|uniq > Sample1_islands.bed

intersectBed -b final_shores.bed -a Sample1.bed|sort|uniq > Sample1_shores.bed

intersectBed -b genes.bed -a Sample1.bed|sort|uniq > Sample1_genes.bed

intersectBed -b exons.bed -a Sample1_genes.bed|sort|uniq > Sample1_exons.bed

intersectBed -v -b exons.bed -a Sample1_genes.bed|sort|uniq > Sample1_introns.bed

