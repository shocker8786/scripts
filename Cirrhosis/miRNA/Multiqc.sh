#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=4g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_multiqc.txt
#SBATCH -e error_output_multiqc.txt
#SBATCH -J multiqc
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load FastQC/0.11.5-IGB-gcc-4.9.4-Java-1.8.0_152
module load MultiQC/1.2-IGB-gcc-4.9.4-Python-2.7.13

fastqc /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0112_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0113_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0921_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0925_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0993_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0994_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0995_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0996_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0997_flexbar_trimmed.fastq.gz \
/home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0998_flexbar_trimmed.fastq.gz \

multiqc /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed

