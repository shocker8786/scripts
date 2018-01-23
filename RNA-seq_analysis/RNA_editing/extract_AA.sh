#!/bin/bash
#SBATCH --account=Iron_PRRSv
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_extract_AA.txt
#SBATCH --error=error_output_extract_AA.txt
#SBATCH --job-name=extract_AA
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

samtools view Sample1_sort.bam HTR2C-AAAAA:1179-1191|cut -f 4,10|awk '{print 1179-$1"\t"$2}'|python exact_seq.py|python translate.py > Sample1_AA.txt

