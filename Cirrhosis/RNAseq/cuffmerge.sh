#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_cuffmerge.txt
#SBATCH -e error_output_cuffmerge.txt
#SBATCH -J cuffmerge
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Cufflinks/2.2.1-IGB-gcc-4.9.4-b4fa050

cuffmerge -p 1 -o /home/a-m/kschach2/Cirrhosis/RNAseq/cuffmerge -g /home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.Sscrofa11.1.90.gtf -s /home/a-m/kschach2/porcine_assembly/Sus_scrofa_original.Sscrofa11.1.dna.toplevel.fa /home/a-m/kschach2/Cirrhosis/RNAseq/assemblies.txt

