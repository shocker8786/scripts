#!/bin/bash
#SBATCH --account=correlation
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_correlation.txt
#SBATCH --error=error_output_correlation.txt
#SBATCH --job-name=correlation
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#produce plus TSS region
cat expression_plus.bed|cut -f 1,2,3,4,6|awk '{print $1"\t"$2"\t"$2"\t"($3-$2)*0.05"\t"$4"\t"$5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2-500"\t"$2+$4"\t"$5"\t"$6}' > TSS/plus.bed

#produce plus gene body region
cat expression_plus.bed|cut -f 1,2,3,4,6|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.05"\t"$4"\t"$5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2+$4"\t"$3"\t"$5"\t"$6}' > gene_body/plus.bed

#produce minus TSS region
cat expression_minus.bed|cut -f 1,2,3,4,6|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.95"\t"$4"\t"$5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2+$4"\t"$3+500"\t"$5"\t"$6}' > TSS/minus.bed

#produce minus gene body region
cat expression_minus.bed|cut -f 1,2,3,4,6|awk '{print $1"\t"$2"\t"$3"\t"($3-$2)*0.95"\t"$4"\t"$5}'|awk 'BEGIN{OFS=FS="\t"}{$4=sprintf("%1.0f",$4)}1'|awk '{print $1"\t"$2"\t"$2+$4"\t"$5"\t"$6}' > gene_body/minus.bed

#combine plus and minus
cat TSS/plus.bed TSS/minus.bed |awk '$2+0<0{$2=0}1' |sed 's/ /\t/g'|sortBed > TSS/gene.bed

cat gene_body/plus.bed gene_body/minus.bed |awk '$2+0<0{$2=0}1' |sed 's/ /\t/g'|sortBed > gene_body/gene.bed


