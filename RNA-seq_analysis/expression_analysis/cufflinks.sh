#!/bin/bash
#SBATCH --account=Cufflinks
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_Cufflinks.txt
#SBATCH --error=error_output_Cufflinks.txt
#SBATCH --job-name=Cufflinks
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

cufflinks -p 10 -o Sample1 -G /path/to/Sus_scrofa.gtf -u --library-type fr-firststrand Sample1_sorted_hits.bam

cuffmerge -o merged -g /path/to/GTF/Sus_scrofa.gtf -s /path/to/reference/Sus_scrofa.fa -p 10 assemblies.txt

#example assemblies.txt file
./Sample1/transcripts.gtf

cuffquant -o cuffquant/Sample1 -p 10 -b /path/to/reference/Sus_scrofa.fa -u --library-type fr-firststrand merged/merged.gtf Sample1_sorted_hits.bam

cuffnorm -o cuffnorm -L Sample1,Sample2 -p10 --library-type fr-firststrand --output-format cuffdiff --library-norm-method geometric merged/merged.gtf cuffquant/Sample1/abundances.cxb cuffquant/Sample2/abundances.cxb

cuffdiff -o cuffdiff -L control,treatment -b /path/to/reference/Sus_scrofa.fa -u -p --library-type fr-firststrand merged/merged.gtf cuffquant/Sample1/abundances.cxb cuffquant/Sample2/abundances.cxb

