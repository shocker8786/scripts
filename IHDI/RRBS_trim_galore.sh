#!/bin/bash
#PBS -j oe
#PBS -N IHDI_Trimming
#PBS -M kschach2@illinois.edu
#PBS -m abe

module load trim_galore/0.4.1

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/1TD_AACCAG_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/2ND_GTGCTT_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/2TD_TGGTGA_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/3ND_AAGCCT_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/3TD_AGTGAG_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/4ND_GTCGTA_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/4TD_GCACTA_L006_R1_001.fastq.gz

#trim adaptor sequence
trim_galore -a AGATCGGAAGAGC --fastqc -o /home/a-m/kschach2/IHDI/RRBS/adapter_trimmed/ /home/a-m/kschach2/IHDI/RRBS/5TD_ACCTCA_L006_R1_001.fastq.gz

