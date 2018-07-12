#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=4g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_trim_galore.txt
#SBATCH -e error_output_trim_galore.txt
#SBATCH -J trim_galore
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Trim_Galore/0.4.4-IGB-gcc-4.9.4

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0112_16_RNA_GTCCGCAC_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0112_16_RNA_GTCCGCAC_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0113_16_RNA_GTGAAACG_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0113_16_RNA_GTGAAACG_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0113_16_RNA_GTGAAACG_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0113_16_RNA_GTGAAACG_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0113_16_RNA_GTGAAACG_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0113_16_RNA_GTGAAACG_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0113_16_RNA_GTGAAACG_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0113_16_RNA_GTGAAACG_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0113_16_RNA_GTGAAACG_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0113_16_RNA_GTGAAACG_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0113_16_RNA_GTGAAACG_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0113_16_RNA_GTGAAACG_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0921_16_RNA_ATCACGAT_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0921_16_RNA_ATCACGAT_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0921_16_RNA_ATCACGAT_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0921_16_RNA_ATCACGAT_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0921_16_RNA_ATCACGAT_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0921_16_RNA_ATCACGAT_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0921_16_RNA_ATCACGAT_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0921_16_RNA_ATCACGAT_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0921_16_RNA_ATCACGAT_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0921_16_RNA_ATCACGAT_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0921_16_RNA_ATCACGAT_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0921_16_RNA_ATCACGAT_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0925_16_RNA_CGATGTAT_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0925_16_RNA_CGATGTAT_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0925_16_RNA_CGATGTAT_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0925_16_RNA_CGATGTAT_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0925_16_RNA_CGATGTAT_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0925_16_RNA_CGATGTAT_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0925_16_RNA_CGATGTAT_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0925_16_RNA_CGATGTAT_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0925_16_RNA_CGATGTAT_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0925_16_RNA_CGATGTAT_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0925_16_RNA_CGATGTAT_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0925_16_RNA_CGATGTAT_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0993_16_RNA_TTAGGCAT_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0993_16_RNA_TTAGGCAT_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0993_16_RNA_TTAGGCAT_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0993_16_RNA_TTAGGCAT_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0993_16_RNA_TTAGGCAT_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0993_16_RNA_TTAGGCAT_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0993_16_RNA_TTAGGCAT_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0993_16_RNA_TTAGGCAT_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0993_16_RNA_TTAGGCAT_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0993_16_RNA_TTAGGCAT_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0993_16_RNA_TTAGGCAT_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0993_16_RNA_TTAGGCAT_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0994_16_RNA_TGACCAAT_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0994_16_RNA_TGACCAAT_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0994_16_RNA_TGACCAAT_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0994_16_RNA_TGACCAAT_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0994_16_RNA_TGACCAAT_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0994_16_RNA_TGACCAAT_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0994_16_RNA_TGACCAAT_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0994_16_RNA_TGACCAAT_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0994_16_RNA_TGACCAAT_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0994_16_RNA_TGACCAAT_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0994_16_RNA_TGACCAAT_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0994_16_RNA_TGACCAAT_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0995_16_RNA_ACAGTGAT_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0995_16_RNA_ACAGTGAT_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0995_16_RNA_ACAGTGAT_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0995_16_RNA_ACAGTGAT_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0995_16_RNA_ACAGTGAT_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0995_16_RNA_ACAGTGAT_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0995_16_RNA_ACAGTGAT_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0995_16_RNA_ACAGTGAT_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0995_16_RNA_ACAGTGAT_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0995_16_RNA_ACAGTGAT_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0995_16_RNA_ACAGTGAT_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0995_16_RNA_ACAGTGAT_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0996_16_RNA_AGTTCCGT_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0996_16_RNA_AGTTCCGT_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0996_16_RNA_AGTTCCGT_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0996_16_RNA_AGTTCCGT_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0996_16_RNA_AGTTCCGT_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0996_16_RNA_AGTTCCGT_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0996_16_RNA_AGTTCCGT_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0996_16_RNA_AGTTCCGT_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0996_16_RNA_AGTTCCGT_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0996_16_RNA_AGTTCCGT_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0996_16_RNA_AGTTCCGT_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0996_16_RNA_AGTTCCGT_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0997_16_RNA_ATGTCAGA_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0997_16_RNA_ATGTCAGA_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0997_16_RNA_ATGTCAGA_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0997_16_RNA_ATGTCAGA_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0997_16_RNA_ATGTCAGA_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0997_16_RNA_ATGTCAGA_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0997_16_RNA_ATGTCAGA_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0997_16_RNA_ATGTCAGA_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0997_16_RNA_ATGTCAGA_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0997_16_RNA_ATGTCAGA_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0997_16_RNA_ATGTCAGA_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0997_16_RNA_ATGTCAGA_L00M_R2_001_val_2_unpaired_2.fq.gz

#trim adaptor sequence
trim_galore -q 20 --illumina --stringency 6 --fastqc --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/0998_16_RNA_CCGTCCCG_L00M_R1_001.fastq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/0998_16_RNA_CCGTCCCG_L00M_R2_001.fastq.gz

#trim A-tails
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0998_16_RNA_CCGTCCCG_L00M_R1_001_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0998_16_RNA_CCGTCCCG_L00M_R2_001_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0998_16_RNA_CCGTCCCG_L00M_R1_001_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/adapter_trimmed/0998_16_RNA_CCGTCCCG_L00M_R2_001_unpaired_2.fq.gz

#trim T-tails
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0998_16_RNA_CCGTCCCG_L00M_R1_001_val_1_val_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0998_16_RNA_CCGTCCCG_L00M_R2_001_val_2_val_2.fq.gz

trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0998_16_RNA_CCGTCCCG_L00M_R1_001_unpaired_1_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0998_16_RNA_CCGTCCCG_L00M_R2_001_unpaired_2_trimmed.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0998_16_RNA_CCGTCCCG_L00M_R1_001_val_1_unpaired_1.fq.gz /home/a-m/kschach2/Cirrhosis/RNAseq/A_trimmed/0998_16_RNA_CCGTCCCG_L00M_R2_001_val_2_unpaired_2.fq.gz

