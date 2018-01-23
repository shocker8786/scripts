#!/bin/bash
#SBATCH --account=RNA_edit
#SBATCH --time=0
#SBATCH --mem=10000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_bowtie2_33.txt
#SBATCH --error=error_output_bowtie2_33.txt
#SBATCH --job-name=bowtie2_33
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

bowtie2-build -f reference.fa reference

bowtie2 -p 8 --sensitive -X 580 -x /path/to/bowtie2/index/ -1 Sample1_paired_1.fq.gz -2 Sample1_paired_2.fq.gz -U Sample1_unpaired_1.fq.gz,Sample1_unpaired_2.fq.gz -S Sample1.sam

grep -v XS:i Sample1.sam > Sample1_uniq.sam

samtools view -bS Sample1_uniq.sam > Sample1.bam

samtools sort Sample1.bam Sample1_sort

samtools index Sample1_sort.bam

