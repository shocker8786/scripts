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

#sort expression bed by expression level and strand
grep + Sample1_expression.bed|awk '($6==0)' > Sample1/0/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6==0)' > Sample1/0/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>0)'|awk '($6<=1)' > Sample1/1/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>0)'|awk '($6<=1)' > Sample1/1/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>1)'|awk '($6<=10)' > Sample1/10/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>1)'|awk '($6<=10)' > Sample1/10/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>10)'|awk '($6<=100)' > Sample1/100/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>10)'|awk '($6<=100)' > Sample1/100/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>100)'|awk '($6<=1000)' > Sample1/1000/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>100)'|awk '($6<=1000)' > Sample1/1000/expression_plus.bed

#break gene down by 5% incriments
cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2"\t"$2+$4}' > 05_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05"\t"($3-$2)*0.1}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 10_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.10"\t"($3-$2)*0.15}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 15_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.15"\t"($3-$2)*0.2}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 20_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.10"\t"($3-$2)*0.15}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 15_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.15"\t"($3-$2)*0.2}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 20_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.20"\t"($3-$2)*0.25}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 25_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.25"\t"($3-$2)*0.3}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 30_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.30"\t"($3-$2)*0.35}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 35_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.35"\t"($3-$2)*0.4}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 40_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.40"\t"($3-$2)*0.45}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 45_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.45"\t"($3-$2)*0.5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 50_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.50"\t"($3-$2)*0.55}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 55_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.55"\t"($3-$2)*0.6}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 60_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.60"\t"($3-$2)*0.65}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 65_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.65"\t"($3-$2)*0.7}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 70_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.70"\t"($3-$2)*0.75}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 75_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.75"\t"($3-$2)*0.8}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 80_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.80"\t"($3-$2)*0.85}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 85_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.85"\t"($3-$2)*0.9}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 90_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.90"\t"($3-$2)*0.95}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 95_plus.bed

cat expression_plus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.95}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2+$4"\t"$3}' > 100_plus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2"\t"$2+$4}' > 100_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05"\t"($3-$2)*0.1}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 95_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.10"\t"($3-$2)*0.15}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 90_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.15"\t"($3-$2)*0.2}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 85_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.10"\t"($3-$2)*0.15}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 90_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.15"\t"($3-$2)*0.2}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 85_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.20"\t"($3-$2)*0.25}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 80_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.25"\t"($3-$2)*0.3}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 75_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.30"\t"($3-$2)*0.35}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 70_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.35"\t"($3-$2)*0.4}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 65_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.40"\t"($3-$2)*0.45}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 60_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.45"\t"($3-$2)*0.5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 55_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.50"\t"($3-$2)*0.55}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 50_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.55"\t"($3-$2)*0.6}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 45_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.60"\t"($3-$2)*0.65}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 40_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.65"\t"($3-$2)*0.7}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 35_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.70"\t"($3-$2)*0.75}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 30_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.75"\t"($3-$2)*0.8}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 25_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.80"\t"($3-$2)*0.85}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 20_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.85"\t"($3-$2)*0.9}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 15_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.90"\t"($3-$2)*0.95}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk 'BEGIN{OFS=FS="\t"}{$5=sprintf("%1.0f",$5)}1'|awk '{print $1"\t"$2+$4"\t"$2+$5}' > 10_minus.bed

cat expression_minus.bed|cut -f 1,2,3|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.95}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2+$4"\t"$3}' > 05_minus.bed

#comebine plus and minus sections
cat 05_minus.bed 05_plus.bed > 05_gene.bed

cat 55_minus.bed 55_plus.bed > 55_gene.bed

cat 10_minus.bed 10_plus.bed > 10_gene.bed

cat 60_minus.bed 60_plus.bed > 60_gene.bed

cat 15_minus.bed 15_plus.bed > 15_gene.bed

cat 65_minus.bed 65_plus.bed > 65_gene.bed

cat 20_minus.bed 20_plus.bed > 20_gene.bed

cat 70_minus.bed 70_plus.bed > 70_gene.bed

cat 25_minus.bed 25_plus.bed > 25_gene.bed

cat 75_minus.bed 75_plus.bed > 75_gene.bed

cat 30_minus.bed 30_plus.bed > 30_gene.bed

cat 80_minus.bed 80_plus.bed > 80_gene.bed

cat 35_minus.bed 35_plus.bed > 35_gene.bed

cat 85_minus.bed 85_plus.bed > 85_gene.bed

cat 40_minus.bed 40_plus.bed > 40_gene.bed

cat 90_minus.bed 90_plus.bed > 90_gene.bed

cat 45_minus.bed 45_plus.bed > 45_gene.bed

cat 95_minus.bed 95_plus.bed > 95_gene.bed

cat 50_minus.bed 50_plus.bed > 50_gene.bed

cat 100_minus.bed 100_plus.bed > 100_gene.bed

awk '$2+0<0{$2=0}1' 55_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/55.bed

awk '$2+0<0{$2=0}1' 05_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/05.bed

awk '$2+0<0{$2=0}1' 60_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/60.bed

awk '$2+0<0{$2=0}1' 10_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/10.bed

awk '$2+0<0{$2=0}1' 65_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/65.bed

awk '$2+0<0{$2=0}1' 15_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/15.bed

awk '$2+0<0{$2=0}1' 70_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/70.bed

awk '$2+0<0{$2=0}1' 20_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/20.bed

awk '$2+0<0{$2=0}1' 75_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/75.bed

awk '$2+0<0{$2=0}1' 25_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/25.bed

awk '$2+0<0{$2=0}1' 80_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/80.bed

awk '$2+0<0{$2=0}1' 30_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/30.bed

awk '$2+0<0{$2=0}1' 85_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/85.bed

awk '$2+0<0{$2=0}1' 35_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/35.bed

awk '$2+0<0{$2=0}1' 90_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/90.bed

awk '$2+0<0{$2=0}1' 40_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/40.bed

awk '$2+0<0{$2=0}1' 95_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/95.bed

awk '$2+0<0{$2=0}1' 45_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/45.bed

awk '$2+0<0{$2=0}1' 100_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/100.bed

awk '$2+0<0{$2=0}1' 50_gene.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/50.bed


