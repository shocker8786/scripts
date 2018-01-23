#!/bin/bash
#SBATCH --account=pigWUR
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_weblogo.txt
#SBATCH --error=error_weblogo.txt
#SBATCH --job-name=weblogo
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com
 
weblogo -F svg -A dna -i -3 -s large -t non_CpG --annotate -3,-2,-1,0,1,2,3,4,5 -x "Distance from C(nt)" --errorbars no -c classic < Sample1.fa > Sample1.svg
