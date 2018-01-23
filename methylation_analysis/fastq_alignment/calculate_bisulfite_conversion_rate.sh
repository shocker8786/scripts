#!/bin/bash
#SBATCH --account=conversion
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_conversion.txt
#SBATCH --error=error_output_conversion.txt
#SBATCH --job-name=conversion
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#extract mitochondrial sites
grep MT Sample1.CGmap |awk '($8>=1)' > Sample1_MT.CGmap

#reads covering Cs
ls Sample1_MT.CGmap| while read filename ; do awk '{sum+=$8} END { print "Reads Covering Cs For " FILENAME " = ",sum}' $filename ; done

#non-converted reads
ls Sample1_MT.CGmap| while read filename ; do awk '{sum+=$7} END { print "Non-converted reads for " FILENAME " = ",sum}' $filename ; done|sed 's/=/\t/'
