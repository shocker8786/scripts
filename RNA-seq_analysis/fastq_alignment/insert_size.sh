#!/bin/bash
#SBATCH --account=InsertSize
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_insert_size.txt
#SBATCH --error=error_output_insert_size.txt
#SBATCH --job-name=insert_size
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

java -Xmx2g -jar /home/WUR/schac001/bin/picard-tools-1.119/CollectInsertSizeMetrics.jar INPUT=Sample1_accepted_hits.bam OUTPUT=Sample1.txt HISTOGRAM_FILE=Sample1.hist
