#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_mirdeep2_module.txt
#SBATCH -e error_output_mirdeep2_module.txt
#SBATCH -J mirdeep2
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load mirdeep/2.0.0.8-IGB-gcc-4.9.4
module load Bowtie/1.2.0-IGB-gcc-4.9.4

#mapper.pl /home/a-m/kschach2/Cirrhosis/miRNAseq/config.txt -d -c -p /home/a-m/kschach2/porcine_assembly/Sus_scrofa -s /home/a-m/kschach2/Cirrhosis/miRNAseq/mirdeep2_output/combined_reads.fa -t /home/a-m/kschach2/Cirrhosis/miRNAseq/mirdeep2_output/combined.arf -v

#mapper.pl /home/a-m/kschach2/Cirrhosis/miRNAseq/config_uncollapsed.txt -d -e -h -m -p /home/a-m/kschach2/porcine_assembly/Sus_scrofa -s /home/a-m/kschach2/Cirrhosis/miRNAseq/mirdeep2_output/combined_collapsed.fa -t /home/a-m/kschach2/Cirrhosis/miRNAseq/mirdeep2_output/combined_collapsed.arf -v

/home/a-m/kschach2/bin/mirdeep2/bin/miRDeep2.pl /home/a-m/kschach2/Cirrhosis/miRNAseq/mirdeep2_output/combined_collapsed.fa /home/a-m/kschach2/porcine_assembly/mirdeep2.Sscrofa11.1.dna.toplevel.fa /home/a-m/kschach2/Cirrhosis/miRNAseq/mirdeep2_output/combined_collapsed.arf Sus_scrofa_miRNA.fa Homo_sapiens_miRNA.fa none 2>report.log

