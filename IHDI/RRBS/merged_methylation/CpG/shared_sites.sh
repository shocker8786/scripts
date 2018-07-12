#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_shared_sitesCpG.txt
#SBATCH -e error_output_shared_sitesCpG.txt
#SBATCH -J shared_sites
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Python/3.6.1-IGB-gcc-4.9.4

#output shared sites matrix
python /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/shared_sites.py \
 --methylation \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/10T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/11T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/12N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/12T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/13_16T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/14T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/15T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/16T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/17T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/18N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/19T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/1T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/20T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/21T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/22N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/23T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/24T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/25N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/25T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/26T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/27T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/28T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/29T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/2N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/2T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/30T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/31T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/32T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/33T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/34T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/35N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/36T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/37N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/37T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/38T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/39T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/3N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/3T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/40T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/41T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/42T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/43T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/44T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/45T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/46T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/47T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/48T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/49T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/4N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/4T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/50T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/52T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/56T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/57C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/57T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/58C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/58T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/59C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/59N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/5T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/60C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/60T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/61C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/61N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/61T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/62C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/62T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/63T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/66N_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/66T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/68C_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/7T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/8T_CpG.txt \
/home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/9T_CpG.txt \
 --output /home/a-m/kschach2/IHDI/RRBS/merged_methylation/CpG/CpG
