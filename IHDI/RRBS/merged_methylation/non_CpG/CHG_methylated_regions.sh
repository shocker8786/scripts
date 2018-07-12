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

#proper extract non_CpG sites format
#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/10T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/10_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/11T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/11_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/12N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/12_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/12T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/12_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/13_16T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/13_16_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/14T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/14_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/15T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/15_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/16T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/16_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/17T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/17_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/18N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/18_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/19T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/19_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/1T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/1_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/20T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/20_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/21T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/21_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/22N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/22_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/23T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/23_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/24T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/24_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/25N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/25_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/25T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/25_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/26T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/26_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/27T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/27_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/28T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/28_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/29T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/29_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/2N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/2_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/2T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/2_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/30T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/30_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/31T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/31_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/32T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/32_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/33T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/33_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/34T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/34_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/35N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/35_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/36T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/36_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/37N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/37_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/37T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/37_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/38T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/38_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/39T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/39_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/3N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/3_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/3T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/3_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/40T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/40_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/41T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/41_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/42T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/42_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/43T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/43_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/44T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/44_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/45T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/45_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/46T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/46_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/47T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/47_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/48T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/48_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/49T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/49_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/4N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/4_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/4T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/4_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/50T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/50_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/52T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/52_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/56T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/56_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/57C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/57_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/57T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/57_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/58C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/58_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/58T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/58_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/59C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/59_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/59N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/59_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/5T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/5_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/60_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/60_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/61_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/61_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/61_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/62C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/62_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/62T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/62_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/63T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/63_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/66N_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/66_liver.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/66T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/66_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/68C_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/68_CCA.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/7T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/7_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/8T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/8_HCC.txt

#sed 's/:/\t/' /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/9T_CHG.txt|awk '{print $1"\t"$2"\t"$2+1"\t"$6"\t"$7"\t"$8-$7}' > /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/9_HCC.txt

#identify regions
python /home/a-m/kschach2/bin/python_scripts/combine_CpG_sites.py \
 -f -o /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/all_regions.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/10_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/11_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/12_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/12_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/13_16_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/14_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/15_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/16_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/17_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/18_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/19_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/1_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/20_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/21_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/22_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/23_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/24_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/25_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/25_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/26_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/27_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/28_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/29_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/2_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/2_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/30_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/31_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/32_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/33_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/34_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/35_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/36_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/37_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/37_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/38_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/39_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/3_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/3_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/40_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/41_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/42_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/43_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/44_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/45_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/46_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/47_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/48_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/49_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/4_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/4_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/50_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/52_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/56_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/57_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/57_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/58_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/58_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/59_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/59_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/5_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/60_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/60_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/61_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/61_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/61_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/62_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/62_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/63_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/66_liver.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/66_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/68_CCA.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/7_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/8_HCC.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG_regions/9_HCC.txt \
