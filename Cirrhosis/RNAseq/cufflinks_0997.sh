#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=80g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_cufflinks_0997.txt
#SBATCH -e error_output_cufflinks_0997.txt
#SBATCH -J 0997_cufflinks
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Cufflinks/2.2.1-IGB-gcc-4.9.4-b4fa050

cufflinks -p 1 -o /home/a-m/kschach2/Cirrhosis/RNAseq/cufflinks/0997 --library-type fr-firststrand -g /home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.Sscrofa11.1.90.gtf -b /home/a-m/kschach2/porcine_assembly/Sus_scrofa_original.Sscrofa11.1.dna.toplevel.fa -u /home/a-m/kschach2/Cirrhosis/RNAseq/STAR_2_pass/0997_Aligned.sortedByCoord.out.bam

