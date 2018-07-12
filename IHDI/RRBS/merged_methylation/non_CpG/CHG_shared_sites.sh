#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_shared_sitesCHG.txt
#SBATCH -e error_output_shared_sitesCHG.txt
#SBATCH -J shared_sites
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Python/3.6.1-IGB-gcc-4.9.4

#output shared sites matrix
python /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/shared_sites.py \
 --methylation \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/10T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/11T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/12N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/12T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/13_16T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/14T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/15T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/16T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/17T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/18N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/19T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/1T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/20T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/21T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/22N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/23T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/24T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/25N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/25T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/26T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/27T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/28T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/29T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/2N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/2T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/30T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/31T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/32T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/33T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/34T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/35N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/36T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/37N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/37T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/38T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/39T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/3N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/3T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/40T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/41T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/42T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/43T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/44T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/45T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/46T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/47T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/48T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/49T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/4N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/4T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/50T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/52T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/56T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/57C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/57T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/58C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/58T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/59C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/59N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/5T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/60T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/61T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/62C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/62T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/63T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/66N_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/66T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/68C_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/7T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/8T_CHG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/9T_CHG.txt \
 --output /home/a-m/kschach2/IHDI/RRBS/merged_methylation/non_CpG/CHG
