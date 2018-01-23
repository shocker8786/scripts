#!/bin/bash
#SBATCH --account=Iron_PRRSv
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_RNA_edit.txt
#SBATCH --error=error_output_RNA_edit.txt
#SBATCH --job-name=RNA_edit
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

python /path/to/REDItoolKnown.py -i Sample1_sort.bam -f /path/to/reference.fa -l reference_list.txt -o Sample1 -c 0 -q 0 -m 0 -v 2 -n 0

gunzip reference_list.txt.gz
rm reference_list.txt.gz.tbi

