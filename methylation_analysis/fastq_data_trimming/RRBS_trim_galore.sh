#!/bin/bash
#SBATCH --account=trimming
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_trim.txt
#SBATCH --error=error_output_trim.txt
#SBATCH --job-name=trimming
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

trim_galore -q 20 --rrbs --length 20 -o /path/to/output Sample1.fastq.gz

mv /path/to/output/Sample1_trimmed.fq.gz /path/to/output/Sample1_trimmed.fq.gz

