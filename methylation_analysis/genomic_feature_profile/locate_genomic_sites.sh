#!/bin/bash
#SBATCH --account=genomic_sites
#SBATCH --time=0
#SBATCH --mem=300000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=largemem
#SBATCH --output=output_genomic_sites.txt
#SBATCH --error=error_output_genomic_sites.txt
#SBATCH --job-name=genomic_sites
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#find all cytosines in genome
python fastaRegexFinder.py -r 'C' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > genome_C.bed

#find all CAG sites
python fastaRegexFinder.py -r 'CAG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > genome_CAG.bed

#find all CTG sites
python fastaRegexFinder.py -r 'CTG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > genome_CTG.bed

#find all CCG sites
python fastaRegexFinder.py -r 'CCG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > genome_CCG.bed

#find all CpG sites
python fastaRegexFinder.py -r 'CG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > final_genome_CG.bed

#find all TpG sites
python fastaRegexFinder.py -r 'TG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > final_genome_TG.bed

#find all ApG sites
python fastaRegexFinder.py -r 'AG' -f Sus_scrofa.fa|sed 's/ /\t/'|cut -f 1,3,4,7,8 > final_genome_AG.bed

#combine all CHG sites
cat genome_CAG.bed genome_CTG.bed genome_CCG.bed > final_genome_CHG.bed

#combine all CHH sites
intersectBed -v -b final_genome_CHG.bed -a genome_C.bed|intersectBed -v -b final_genome_CG.bed -a stdin > final_genome_CHH.bed

