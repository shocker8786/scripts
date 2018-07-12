#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=80g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_methylated_regions.txt
#SBATCH -e error_output_methylated_regions.txt
#SBATCH -J methylated_regions
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load SAMtools/1.5-IGB-gcc-4.9.4
module load Python/2.7.13-IGB-gcc-4.9.4

#proper extract CpG sites format
#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/10T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/10_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/11T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/11_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/12N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/12_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/12T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/12_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/13_16T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/13_16_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/14T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/14_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/15T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/15_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/16T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/16_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/17T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/17_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/18N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/18_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/19T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/19_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/1T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/1_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/20T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/20_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/21T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/21_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/22N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/22_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/23T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/23_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/24T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/24_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/25N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/25_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/25T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/25_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/26T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/26_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/27T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/27_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/28T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/28_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/29T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/29_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/2N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/2_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/2T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/2_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/30T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/30_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/31T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/31_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/32T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/32_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/33T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/33_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/34T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/34_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/35N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/35_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/36T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/36_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/37N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/37_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/37T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/37_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/38T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/38_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/39T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/39_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/3N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/3_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/3T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/3_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/40T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/40_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/41T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/41_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/42T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/42_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/43T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/43_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/44T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/44_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/45T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/45_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/46T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/46_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/47T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/47_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/48T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/48_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/49T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/49_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/4N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/4_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/4T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/4_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/50T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/50_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/52T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/52_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/56T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/56_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/57C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/57_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/57T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/57_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/58C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/58_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/58T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/58_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/59C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/59_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/59N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/59_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/5T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/5_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/60C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/60_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/60T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/60_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/61C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/61_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/61N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/61_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/61T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/61_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/62C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/62_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/62T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/62_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/63T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/63_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/66N_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/66_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/66T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/66_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/68C_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/68_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/7T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/7_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/8T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/8_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/9T_CpG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/9_HCC.txt

#identify regions
python /home/a-m/kschach2/bin/python_scripts/combine_CpG_sites.py \
 -f -o /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/all_regions.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/10_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/11_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/12_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/12_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/13_16_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/14_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/15_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/16_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/17_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/18_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/19_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/1_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/20_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/21_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/22_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/23_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/24_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/25_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/25_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/26_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/27_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/28_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/29_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/2_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/2_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/30_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/31_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/32_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/33_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/34_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/35_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/36_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/37_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/37_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/38_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/39_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/3_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/3_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/40_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/41_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/42_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/43_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/44_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/45_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/46_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/47_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/48_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/49_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/4_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/4_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/50_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/52_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/56_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/57_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/57_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/58_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/58_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/59_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/59_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/5_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/60_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/60_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/61_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/61_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/61_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/62_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/62_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/63_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/66_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/66_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/68_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/7_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/8_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/regions/9_HCC.txt \

