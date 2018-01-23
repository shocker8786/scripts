#!/bin/bash
#SBATCH --account=expression_correlation
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_expression_correlation.txt
#SBATCH --error=error_output_expression_correlation.txt
#SBATCH --job-name=expression_correlation
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#sort bed files by chromosome coordinates
sortBed -i Sample1.bed > Sample1_sorted.bed

#define TSS region for all plus strand genes (300bp upstream to 200bp downstream)
cat /Sample1/expression_plus.bed|sortBed|awk '{print $1"\t"$2-300"\t"$2+200"\t"$6}'|awk '$2+0<0{$2=0}1'|sed 's/ /\t/g' > /Sample1/TSS_plus.bed

#define TSS region for all minus strand genes (300bp upstream to 200bp downstream)
cat /Sample1/expression_minus.bed|sortBed|awk '{print $1"\t"$3-200"\t"$3+300"\t"$6}'|awk '$2+0<0{$2=0}1'|sed 's/ /\t/g' > /Sample1/TSS_minus.bed

#combine plus and minus strands
cat /Sample1/TSS_plus.bed /Sample1/TSS_minus.bed|sortBed > /Sample1/TSS.bed

#define gene body region for all plus strand genes (exclude first 5% of gene)
cat /Sample1/expression_plus.bed|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.05"\t"$6}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2+$4"\t"$3"\t"$5}' > /Sample1/body_plus.bed

#define gene body region for all minus strand genes (exclude first 5% of gene)
cat /Sample1/expression_minus.bed|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.95"\t"$6}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2"\t"$2+$4"\t"$5}' > /Sample1/body_minus.bed

#combine plus and minus strands
cat /Sample1/body_plus.bed /Sample1/body_minus.bed|sortBed > /Sample1/body.bed

#coutn # of CpG sites in genome
python fastaRegexFinder.py -r 'CG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > final_genome_CG.bed

#count # of CpG sites in gene body regions
bedtools map -a /Sample1/body.bed -b final_genome_CG.bed -c 4 -o count > expression_correlation/CpG_sites_body_count.bed

#count # of CpG sites in TSS regions
bedtools map -a /Sample1/TSS.bed -b final_genome_CG.bed -c 4 -o count > expression_correlation/CpG_sites_TSS_count.bed

#count # of covered sites in gene body regions
bedtools map -a /Sample1/body.bed -b Sample1_sorted.bed -c 5 -o count > expression_correlation/Sample1_body_count.bed

#count # of covered sties in TSS regions
bedtools map -a /Sample1/TSS.bed -b Sample1_sorted.bed -c 5 -o count > expression_correlation/Sample1_TSS_count.bed

#average methylation level of gene body regions
bedtools map -a /Sample1/body.bed -b Sample1_sorted.bed -c 5 -o mean > expression_correlation/Sample1_body_mean.bed

#average methylation level of TSS regions
bedtools map -a /Sample1/TSS.bed -b Sample1_sorted.bed -c 5 -o mean > expression_correlation/Sample1_TSS_mean.bed

#combine gene body correlation information
paste expression_correlation/Sample1_body_mean.bed expression_correlation/Sample1_body_count.bed expression_correlation/CpG_sites_body_count.bed|cut -f 1,2,3,4,5,10,15|awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"($7/($3-$2))*100}' > expression_correlation/Sample1_body.bed

#combine TSS correlation information
paste expression_correlation/Sample1_TSS_mean.bed expression_correlation/Sample1_TSS_count.bed expression_correlation/CpG_sites_TSS_count.bed|cut -f 1,2,3,4,5,10,15|awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"($7/($3-$2))*100}' > expression_correlation/Sample1_TSS.bed

#create TSS files for correlation (methylation and expression)
cat expression_correlation/Sample1_TSS.bed|awk '($6>=2)'|cut -f 4,5 > Sample1_TSS.corr

#create gene body files for correlation (methylation and expression)
cat expression_correlation/Sample1_body.bed|awk '($6>=2)'|cut -f 4,5 > Sample1_body.corr

#correlate TSS methylation with CpG density
cat expression_correlation/Sample1_TSS.bed|awk '($6>=2)'|cut -f 5,7 > Sample1_TSS_meth_dense.corr

#correlate gene body methylation with CpG density
cat expression_correlation/Sample1_body.bed|awk '($6>=2)'|cut -f 5,8 > Sample1_body_meth_dense.corr

#correlation TSS CpG density with expression
cat expression_correlation/Sample1_TSS.bed|cut -f 4,7 > Sample1_TSS_dense_express.corr

#correlate gene body CpG density with expression
cat expression_correlation/Sample1_body.bed|cut -f 4,8 > Sample1_body_dense_express.corr

