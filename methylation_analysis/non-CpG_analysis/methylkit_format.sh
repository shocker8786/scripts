#!/bin/bash
#SBATCH --account=methylkit_format
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_methylkit_format.txt
#SBATCH --error=error_output_methylkit_format.txt
#SBATCH --job-name=methylkit_format
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#convert file to methylkit compatible format
cat Sample1_non_CpG_10.txt|sed 's/:/\t/'| awk '{print $1"\t"$2"\t""+""\t"$4"\t"$5"\t"$6}'|sed 's/X/19/'|sed 's/Y/20/'|sed 's/GL/21/'|sed 's/JH/22/'|sed 's/.//'|grep -v MT > methylkit/Sample1.txt

