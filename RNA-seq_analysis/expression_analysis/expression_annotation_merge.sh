#!/bin/bash
#SBATCH --account=annotate
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_annotate.txt
#SBATCH --error=error_output_annotate.txt
#SBATCH --job-name=annotate
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#separate samples
cat genes.read_group_tracking|cut -f 1,2,7|grep -w Sample1 > Sample1_FPKM.txt

cat genes.fpkm_tracking |cut -f 1,5|grep -v tracking_id > gene_names.txt

paste gene_names.txt Sample1_FPKM.txt|cut -f 2,4,5|sed 's/-/_/g'|sed 's/,//g' > Sample1_expression.txt

cat Sample1_expression.txt|cut -f 1|sort|uniq -u > Sample1.cov

#create stranded gene list
grep -w gene Sus_scrofa.gtf |cut -f 1,4,5,7,9|sed 's/gene_id "//'|sed 's/";/\t/'|grep -wv gene_name|awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$5}' > temp_genes.txt

grep -w gene Sus_scrofa.gtf |cut -f 1,4,5,7,9|sed 's/gene_id "//'|sed 's/";/\t/'|grep -w gene_name|sed 's/gene_name "//'|sed 's/";/\t/g'|awk '{print $1"\t"$2"\t"$3"\t"$4"\t"$5"\t"$8}' > temp_genes_2.txt

cat temp_genes.txt temp_genes_2.txt|sed 's/-/_/g'|sed 's/,//g' > final_genes.bed

cat final_genes.bed|cut -f 6|sort|uniq -u > genes.cov

#merge expression with annotation
grep -Fwf genes.cov Sample1.cov > Sample1_genes.cov

grep -Fwf Sample1_genes.cov Sample1_expression.txt|sort -k 1,1 > Sample1_shared.txt

grep -Fwf Sample1_genes.cov final_genes.bed|sort -k 6,6 > Sample1_genes_shared.txt

paste Sample1_genes_shared.txt Sample1_shared.txt|cut -f 1,2,3,4,8,9 > Sample1_expression.bed

