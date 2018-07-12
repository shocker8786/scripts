#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_shared_sitesCHH.txt
#SBATCH -e error_output_shared_sitesCHH.txt
#SBATCH -J shared_sites
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Python/3.6.1-IGB-gcc-4.9.4

#output shared sites matrix
python /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/shared_sites.py \
 --methylation \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/10T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/11T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/12N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/12T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/13_16T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/14T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/15T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/16T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/17T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/18N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/19T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/1T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/20T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/21T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/22N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/23T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/24T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/25N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/25T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/26T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/27T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/28T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/29T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/2N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/2T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/30T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/31T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/32T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/33T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/34T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/35N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/36T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/37N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/37T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/38T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/39T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/3N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/3T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/40T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/41T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/42T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/43T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/44T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/45T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/46T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/47T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/48T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/49T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/4N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/4T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/50T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/52T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/56T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/57C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/57T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/58C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/58T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/59C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/59N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/5T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/62C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/62T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/63T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/66N_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/66T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/68C_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/7T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/8T_CHH.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/9T_CHH.txt \
 --output /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHH
