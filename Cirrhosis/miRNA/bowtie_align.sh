#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=4g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_collapse_reads.txt
#SBATCH -e error_output_collapse_reads.txt
#SBATCH -J collapse_reads
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load FASTX-Toolkit/0.0.14-IGB-gcc-4.9.4

#fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0112_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0112_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0113_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0113_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0921_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0921_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0925_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0925_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0993_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0993_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0994_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0994_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0995_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0995_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0996_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0996_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0997_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0997_collapsed.fastq

fastx_collapser -i /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0998_flexbar_trimmed.fastq -o /home/a-m/kschach2/Cirrhosis/miRNAseq/collapsed/0998_collapsed.fastq

