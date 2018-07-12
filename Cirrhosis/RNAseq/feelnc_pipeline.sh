#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=40g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_feelnc.txt
#SBATCH -e error_output_feelnc.txt
#SBATCH -J feelnc
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load FEELnc/20180117-IGB-gcc-4.9.4

export PERL5LIB=/home/apps/software/BioPerl/1.7.1-IGB-gcc-4.9.4-Perl-5.24.1/lib/perl5/site_perl/5.24.1:/home/apps/software/BioPerl/1.7.1-IGB-gcc-4.9.4-Perl-5.24.1/lib/perl5/site_perl/5.24.1/x86_64-linux-thread-multi:/home/apps/software/BioPerl/1.7.1-IGB-gcc-4.9.4-Perl-5.24.1:/home/apps/software/FEELnc/20180117-IGB-gcc-4.9.4/lib

#export FEELNCPATH=/home/a-m/kschach2/bin/FEELnc_scripts

#FEELnc_filter.pl --infile=/home/a-m/kschach2/Cirrhosis/RNAseq/cuffmerge/merged.gtf \
# --mRNAfile=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.Sscrofa11.1.90.gtf \
# --biotype=transcript_biotype=protein_coding \
# --monoex=-1 --proc=8 > /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.gtf 

#/home/a-m/kschach2/bin/FEELnc_scripts/scripts/FEELnc_codpot.pl --infile=/home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.gtf \
# --mRNAfile=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.Sscrofa11.1.90.gtf \
# --biotype=transcript_biotype=protein_coding \
# --genome=/home/a-m/kschach2/porcine_assembly/Sus_scrofa_original.Sscrofa11.1.dna.toplevel.fa \
# --numtx=5000,5000 \
# --mode="shuffle" \
# --spethres=0.97,0.97 \
# --proc=8 \
# --outname=filtered.gtf \
# --outdir=/home/a-m/kschach2/Cirrhosis/RNAseq/feelnc \
# --keeptmp \
# --verbosity=2

#Merge noORF and lncRNA
#cat /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.gtf.noORF.gtf /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.gtf.lncRNA.gtf > /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.gtf.lncRNAandnoORF.gtf

#FEELnc_classifier.pl --lncrna=/home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.gtf.lncRNAandnoORF.gtf \
# --mrna=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.Sscrofa11.1.90.gtf \
# --window=10000 --biotype \
# --maxwindow=1000000 > /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.class

#To class in broad catagories
awk '$1==1{print $9,$8,$12}' /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.class | sort | uniq -c | column -t > /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/filtered.catagories

