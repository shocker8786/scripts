#!/bin/bash


# Variables and source need to launch FEELnc
export FEELNCPATH="/home/users/faang/tderrien/FEELnc_pig_v3shuf/FEELnc"
export PERL5LIB=$PERL5LIB:${FEELNCPATH}/lib/
export PATH=$PATH:${FEELNCPATH}/scripts/
export PATH=$PATH:${FEELNCPATH}/bin/LINUX/

input=cuff.stringtie.merge.gtf # input file following transcriptome reconstruction 
input_clean=$(basename $input)

# gallus gallus 
# FROM : /home/projects/faang_cost/projects/lncRNA_pipeline/chicken_test/HISAT_StrTie/README
ANNOTATION=/home/projects/faang_cost/data/transcriptome_indexes/hisat2/2.0.5/gallus_gallus/Gallus_gallus-5.0/annotation_Ensembl_87/galGal5_Ens87_changed_chrNames.gtf
GENOME=/home/projects/faang_cost/data/transcriptome_indexes/hisat2/2.0.5/gallus_gallus/Gallus_gallus-5.0/annotation_Ensembl_87/galGal5.fa
 
output=$(basename $input .gtf)_filtered.gtf

# FILTER
########
#--infile	: 	input file of assembled transcripts from RNASeq
# --biotype 	:	biotype mRNA  for training
# --monoex 	:	how to deal with monoexonix (-1 = only keep monoexonic antisense of mRNAs; remove )
# --proc	:	number of proc
mkdir filter
time FEELnc_filter.pl --infile=$input --mRNAfile=$ANNOTATION --biotype=transcript_biotype=protein_coding --monoex=-1 --proc=8 >  ./filter/$output


# CODPOT (example avec des .gtf en entrée)
#############
########      --infile=$output  # lncRNA candidates from previous step
########      --mRNAfile=$ANNOTATION  # annotation file
########      --biotype=transcript_biotype=protein_coding  # biotype mRNA  for training
########      --genome=$GENOME  # genome file or dir
########      --numtx=5000,5000  # number transcript mRNA, lncRNA for training
########      --outdir=intergenicMode  # outdir name
########      --spethres=0.97,0.97  # choose a specificity cutoff based on training dataset
########      --proc=4  # number of proc for parrallel
########      --keeptmp # keep tmp files for debugging

time FEELnc_codpot.pl  --infile=./filter/$output \
--mRNAfile=$ANNOTATION \
--biotype=transcript_biotype=protein_coding \
--genome=$GENOME \
--numtx=5000,5000 \
--mode="shuffle" \
--spethres=0.97,0.97 \
--proc=8 \
--keeptmp 

# Merge noORF and lncRNA
#cat intergenic_0.97_Mode/${input_clean}_filtered.gtf.noORF.gtf intergenic_0.99_Mode/${input_clean}_filtered.gtf.lncRNA.gtf >  intergenic_0.99_Mode/${input_clean}_filtered.gtf.lncRNAandnoORF.gtf


# CLASSIFICATION
################
# --lncrna	:	annotated lncRNAs
# --mrna	: 	annotation
# --window	: 	step window within maxwindow
# --maxwindow	:	window around lncRNA to search for
#input="./intergenic_0.99_Mode/${input_clean}_filtered.gtf.lncRNAandnoORF.gtf"
#output=$(basename $input .gtf).class

time FEELnc_classifier.pl --lncrna=$input --mrna=$ANNOTATION --window=10000 --maxwindow=1000000 > $output

#
# To class in broad catgories
#  awk '$1==1{print $7,$6,$10}' merged_and_vega_exon.gff_filtered.gtf.lncRNAandnoORF.class | sort | uniq -c | column -t
# 1229  genic       antisense  exonic
# 1209  genic       antisense  intronic
# 566   genic       sense      exonic
# 528   genic       sense      intronic
# 2397  intergenic  antisense  downstream
# 3388  intergenic  antisense  upstream
# 2517  intergenic  sense      downstream
# 2402  intergenic  sense      upstream
