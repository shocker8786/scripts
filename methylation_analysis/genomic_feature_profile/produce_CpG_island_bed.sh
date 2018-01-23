#!/bin/bash
#SBATCH --account=CpG_islands
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_CpG_islands.txt
#SBATCH --error=error_output_CpG_islands.txt
#SBATCH --job-name=CpG_islands
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#break CpG islands into 5% incriments
cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2"\t"$2+$4}' > 05_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05"\t"($3-$2)*0.1}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 10_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.10"\t"($3-$2)*0.15}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 15_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.15"\t"($3-$2)*0.2}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 20_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.10"\t"($3-$2)*0.15}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 15_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.15"\t"($3-$2)*0.2}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 20_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.20"\t"($3-$2)*0.25}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 25_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.25"\t"($3-$2)*0.3}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 30_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.30"\t"($3-$2)*0.35}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 35_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.35"\t"($3-$2)*0.4}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 40_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.40"\t"($3-$2)*0.45}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 45_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.45"\t"($3-$2)*0.5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 50_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.50"\t"($3-$2)*0.55}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 55_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.55"\t"($3-$2)*0.6}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 60_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.60"\t"($3-$2)*0.65}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 65_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.65"\t"($3-$2)*0.7}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 70_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.70"\t"($3-$2)*0.75}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 75_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.75"\t"($3-$2)*0.8}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 80_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.80"\t"($3-$2)*0.85}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 85_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.85"\t"($3-$2)*0.9}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 90_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.90"\t"($3-$2)*0.95}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 95_Island.bed

cat CpG_Islands.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.95}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2+$4"\t"$3}' > 100_Island.bed


