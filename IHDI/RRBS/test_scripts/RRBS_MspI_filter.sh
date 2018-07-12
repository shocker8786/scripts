#!/bin/bash
#PBS -j oe
#PBS -N MspI_Filtering
#PBS -M kschach2@illinois.edu
#PBS -m abe

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/1TD_AACCAG_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/2ND_GTGCTT_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/2TD_TGGTGA_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/3ND_AAGCCT_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/3TD_AGTGAG_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/4ND_GTCGTA_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/4TD_GCACTA_L006_R1_001_trimmed.fq.gz

python /home/a-m/kschach2/IHDI/RRBS/trimRRBSdiversityAdaptCustomers.py -1 /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/5TD_ACCTCA_L006_R1_001_trimmed.fq.gz

