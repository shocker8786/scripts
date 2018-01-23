#!/bin/bash
#SBATCH --account=allelic_expression
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_allelic_expression.txt
#SBATCH --error=error_output_allelic_expression.txt
#SBATCH --job-name=allelic_expression
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#call genome variation
java -Xms16g -Xmx25g -jar ~/bin/GenomeAnalysisTK.jar -T UnifiedGenotyper -R /path/to/reference/Sus_scrofa.fa -T -I /path/to/genomic/bam/Sample1_genomic.bam -o Sample1_GATK.vcf -stand_call_conf 50.0 -stand_emit_conf 20.0 -dcov 200 -out_mode EMIT_VARIANTS_ONLY

#Filter genome variation min 8 reads, max 44 (~1.75X of 25), min quality 20
vcfutils.pl varFilter -d 8 -D 44 -Q 20 Sample1_GATK.vcf > Sample1_GATK_d8_D44_Q20.vcf

#Make variation file of het SNPs only
grep '#' Sample1_GATK_d8_D44_Q20.vcf > head_mpil66.txt
grep '0/1' Sample1_GATK_d8_D44_Q20.vcf > 0_1_mpil66.txt
cat head_mpil66.txt 0_1_mpil66.txt > Sample1_GATK_d8_D44_Q20_het.vcf

#Make genecode like file for the samase pipeline, plus add 'gene_type' to gtf 
awk '{print $0,"gene_type \"protein_coding\";"}' /path/to/GTF/Sus_scrofa.gtf > test.gtf 
cat test.gtf | python getGeneNCode1.py  > genecode_Sus_Scrofa.all.gtf


#Make genemap file
perl ~/bin/samase.pl --get_gene_snp_mapping_file --use_gencode -is Sample1_GATK_d8_D44_Q20_het.vcf > snp_genemap_Sample1_final_hetD44.txt

#ase calls, min 10 reads, quality 20
        #Call variation in RNA-seq alignment, alignment tophat2 with uniq alignment nd re-aligned with GATK and removed PCR dubs with Picard
samtools mpileup -Bf /path/to/reference/Sus_scrofa.fa Sample1_nd_realigned.bam -l Sample1_GATK_d8_D44_Q20_het.vcf > Sample1.pileup_GATKD44.txt

        #Make pileup file samase ready
cat Sample1.pileup_GATKD44.txt |cut -f 6|tr '[:print:]' 'S' > Sample1.pileup_GATKD44.map.txt
cat Sample1.pileup_GATKD44.txt |cut -f 1,2,3,4,5,6|paste - Sample1.pileup_GATKD44.map.txt > Sample1.pileup_GATKD44.final.txt
        #Run samase ase
perl ~/bin/samase.pl -parse_pileup --sp Sample1.pileup_GATKD44.final.txt --vcf Sample1_GATK_d8_D44_Q20_het.vcf > Sample1.parsed_pileup_GATKD44.final.txt
perl ~/bin/samase.pl --calculate_ase_normal --pp Sample1.parsed_pileup_GATKD44.final.txt -is Sample1_GATK_d8_D44_Q20_het.vcf -r 0.5 -gf snp_genemap_Sample1_final_hetD44.txt -mrs 20 -bq 10 > Sample1_GATKD44_ase.txt

#FILTERS

#ASE Output need to be become BEDTOOLS prove
        #Remove header line 
sed 1d Sample1_GATKD44_ase.txt > Sample1_GATKD44_ase_d.txt
        #Change tabs to dummy (PAUS) - have to get rid of double tabs
sed 's/\t/PAUS/g' Sample1_GATKD44_ase_d.txt > Sample1_GATKD44_ase_d.txt_temp
        #Change double dummy (tabs) to specific dummy
sed 's/PAUSPAUS/PAUSNPAUS/g' Sample1_GATKD44_ase_d.txt_temp > Sample1_GATKD44_ase_d.txt_temp2
        #Change dummy to tab -> a 'N' will now be in double tab 
sed 's/PAUS/\t/g' Sample1_GATKD44_ase_d.txt_temp2 > Sample1_GATKD44_ase_d_N.txt
        #Include 'ND' for sites not having gene annotation
sed 's/$/\tND/' Sample1_GATKD44_ase_d_N.txt > Sample1_GATKD44_ase_d_N_ND.txt
        #Make bed file (with equal numbers of rows)
awk '{OFS="\t"; if (!/^#/){print $3,$4,$4+1,$1,$2,$3,$4,$5,$6,$7,$8,$9,$10,$11,$12,$13,$14,$15,$16,$17,$18,$19}}' Sample1_GATKD44_ase_d_N_ND.txt > Sample1_GATKD44_ase_d_N_ND.txt.bed

#Filter1: ASE positions with an other ASE SNP within 20bp
awk 'BEGIN { OFS="\t" } {print $1,$2-10,$2+10}' Sample1_GATKD44_ase_d_N_ND.txt.bed > Sample1_GATKD44_ase_d_N_ND.txt_20bp.bed
        #Remove negative numbers
sed 's/-[^:)]/0/g' Sample1_GATKD44_ase_d_N_ND.txt_20bp.bed > Sample1_GATKD44_ase_d_N_ND.txt_20bp_woneg.bed
        #Merge overlapping regions
mergeBed -i Sample1_GATKD44_ase_d_N_ND.txt_20bp_woneg.bed > Sample1_GATKD44_ase_d_N_ND.txt_20bp_merged.bed
        #Get the positions with SNP closer than 21bp
awk '{if($3-$2>20)print;}' Sample1_GATKD44_ase_d_N_ND.txt_20bp_merged.bed > Sample1_GATKD44_ase_d_N_ND.txt_20bp_merged_g20.bed
        #Filter out the positions
intersectBed -a Sample1_GATKD44_ase_d_N_ND.txt.bed -b Sample1_GATKD44_ase_d_N_ND.txt_20bp_merged_g20.bed -wao | awk '$NF==0' | cut -f 1-22 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed

#Filter2: Remove SNPs with low calling indications in genome vcf file:
        #Extract lowQ SNPs from genome vcf file
grep LowQual Sample1_d8_D44_Q20_het.vcf | cut -f 1,2 | awk '{OFS="\t"; if (!/^#/) {print $1,$2,$2+1}}' > Sample1_d8_D44_Q20_het_low.bed
        #Filter out lowq heart SNPs
intersectBed -a Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed -b Sample1_d8_D44_Q20_het_low.bed -wao | awk '$NF==0' | cut -f 1-22 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed1

#Filter3: Remove positions with ratio <0.3 between 'SNP' reads 
        #Extract 'skewed' reference reads
awk '{OFS="\t"; if (!/^#/){print $1, $2, $2+1, $10}}' Sample1_d8_D44_Q20_het.vcf | sed 's/:/\t/g'| sed 's/,/\t/g' | awk '{OFS="\t"; {print $1, $2, $3, $5, $6, $5+$6 }}' | awk '{OFS="\t"; {print $1, $2, $3, $4/$6}}'|  awk '($4<=0.3)' > Sample1_d8_D44_Q20_het_tab1_2_10_03_f.maf
        #Filter heart 'skewed' reference reads
intersectBed -a Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed1 -b Sample1_d8_D44_Q20_het_tab1_2_10_03_f.maf -wao | awk '$NF==0' | cut -f 1-22 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed2
        #Extract 'skewed' non-reference reads
awk '{OFS="\t"; if (!/^#/){print $1, $2, $2+1, $10}}' Sample1_d8_D44_Q20_het.vcf | sed 's/:/\t/g'| sed 's/,/\t/g' | awk '{OFS="\t"; {print $1, $2, $3, $5, $6, $5+$6 }}' | awk '{OFS="\t"; {print $1, $2, $3, $5/$6}}'|  awk '($4<=0.3)' > Sample1_d8_D44_Q20_het_tab1_2_10_03_r.maf
        #Filter heart 'skewed' non-reference reads
intersectBed -a Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed2 -b Sample1_d8_D44_Q20_het_tab1_2_10_03_r.maf -wao | awk '$NF==0' | cut -f 1-22 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed3

#Filter4: Remove sites around indels
        #Call indels
java -Xms16g -Xmx25g -jar ~/bin/GenomeAnalysisTK.jar -T UnifiedGenotyper -R /path/to/reference/Sus_scrofa.fa -T  -glm INDEL -I /path/to/genomic/bam/Sample1_genomic.bam -o Sample1_indel.vcf -stand_call_conf 50.0 -stand_emit_conf 20.0 -dcov 200 -out_mode EMIT_VARIANTS_ONLY
vcfutils.pl varFilter -d 8 -D 44 -Q 20 Sample1_indel.vcf > Sample1_indel_d8_D44_Q20.vcf
        #Make bed file, 30bp (2x15bp)
awk '{OFS="\t"; if (!/^#/){print $1,$2-15,$2+15}}' Sample_indel_d8_D44_Q20.vcf | sed 's/chr/SUS/g' > Sample1_indel_d8_D44_Q20_15bp.bed 
        #Filter out sites around heart indels 
intersectBed -a Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed3 -b Sample1_indel_d8_D44_Q20_15bp.bed -wao | awk '$NF==0' | cut -f 1-22 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed4

#Some output files

#heart  #Split gene field to get specific gene identifier
sed 's/:[a-z]/\t/g' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed4 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5
        #Get list of tested SNP overlapping annotated genes
grep -vw ND Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp_mRNA.bed5
        #Get mono-allelic expressed SNPs
awk '($9==0)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp_woind_mono.bed
	#Get list of tested SNPs overlapping annotated genes
grep -vw ND Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 > Sample1_annotated_genes.bed
cat Sample1_annotated_genes.bed|cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_annotated_gene_names.cov

        #Get mono-allelic expressed SNPs overlapping annotated genes
awk '($9==0)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 | grep -vw ND > Sample1_mono_genes.bed
awk '($9==1)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5|grep -vw ND > Sample1_non_mono_genes.bed
cat Sample1_mono_genes.bed|cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_mono_gene_names.cov
cat Sample1_non_mono_genes.bed |cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_non_mono_gene_names.cov
grep -Fwvf Sample1_non_mono_gene_names.cov Sample1_mono_gene_names.cov > Sample1_mono_genes_final.cov

        #Get ase p<0.01 expressed SNPs
awk '($21<0.01)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp_woind_sig01.bed
        #Get ase p<0.05 expressed SNPs 
awk '($21<0.05)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 > Sample1_GATKD44_ase_d_N_ND.txt_wo20bp_woind_sig05.bed
        #Get ase p<0.01 expressed SNPs overlapping annotated genes
awk '($21<0.01)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 | grep -vw ND > Sample1_allelic_01_genes.bed
awk '($21>0.01)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 | grep -vw ND > Sample1_non_allelic_01_genes.bed
cat Sample1_allelic_01_genes.bed|cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_allelic_01_gene_names.cov
cat Sample1_non_allelic_01_genes.bed |cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_non_allelic_01_gene_names.cov
grep -Fwvf Sample1_non_allelic_01_gene_names.cov Sample1_allelic_01_gene_names.cov > Sample1_sig01_genes_final.cov


        #Get ase p<0.05 expressed SNPs overlapping annotated genes
awk '($21<0.05)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 | grep -vw ND > Sample1_allelic_05_genes.bed
awk '($21>0.05)' Sample1_GATKD44_ase_d_N_ND.txt_wo20bp.bed5 | grep -vw ND > Sample1_non_allelic_05_genes.bed
cat Sample1_allelic_05_genes.bed|cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_allelic_05_gene_names.cov
cat Sample1_non_allelic_05_genes.bed |cut -f 22|sed 's/:/\t/'|cut -f 1|sort|uniq > Sample1_non_allelic_05_gene_names.cov
grep -Fwvf Sample1_non_allelic_05_gene_names.cov Sample1_allelic_05_gene_names.cov > Sample1_sig05_genes_final.cov

