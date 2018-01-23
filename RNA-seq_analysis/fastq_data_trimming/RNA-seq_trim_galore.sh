#!/bin/bash
#SBATCH --account=trimming
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_trim.txt
#SBATCH --error=error_output_trim.txt
#SBATCH --job-name=trimming
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#trim adaptor sequence
trim_galore -q 20 --paired --retain_unpaired -a AGATCGGAAGA -a2 AGATCGGAAGA --stringency 6 -o /path/to/output/ Sample1_R1.fastq.gz Sample1_R2.fastq.gz

mv /path/to/output/Sample1_R1_val_1.fq.gz /path/to/output/Sample1_R1_trim.fq.gz

mv /path/to/output/Sample1_R2_val_2.fq.gz /path/to/output/Sample1_R2_trim.fq.gz

#validate paired end files
validate_paired_end_files --pair_cutoff 20 --keep_unpaired -r1 35 -r2 35 /path/to/output/Sample1_R1_trim.fq.gz /path/to/output/Sample1_R2_trim.fq.gz

#compress output
gzip /path/to/output/Sample1_R1_trim.fq.gz.val_paired_1.fq /path/to/output/Sample1_R2_trim.fq.gz.val_paired_2.fq

#trim A-tails
trim_galore --paired --stringency 6 --retain_unpaired -q 20 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA -o /path/to/output/ /path/to/output/Sample1_R1_trim.fq.gz.val_paired_1.fq.gz /path/to/output/Sample1_R2_trim.fq.gz.val_paired_2.fq.gz

mv /path/to/output/Sample1_R1_trim.fq.gz.val_paired_1_val_1.fq.gz /path/to/output/Sample1_R1_A_trim.fq.gz

mv /path/to/output/Sample1_R2_trim.fq.gz.val_paired_2_val_2.fq.gz /path/to/output/Sample1_R2_A_trim.fq.gz

#validate paired end files
validate_paired_end_files --pair_cutoff 20 --keep_unpaired -r1 35 -r2 35 /path/to/output/Sample1_R1_A_trim.fq.gz /path/to/output/Sample1_R2_A_trim.fq.gz

#compress output
gzip /path/to/output/Sample1_R1_A_trim.fq.gz.val_paired_1.fq /path/to/output/Sample1_R2_A_trim.fq.gz.val_paired_2.fq

#trim T-tails
trim_galore --paired --stringency 6 --retain_unpaired -q 20 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT -o /path/to/output/ /path/to/output/Sample1_R1_A_trim.fq.gz.val_paired_1.fq.gz /path/to/output/Sample1_R2_A_trim.fq.gz.val_paired_2.fq.gz

mv /path/to/output/Sample1_R1_A_trim.fq.gz.val_paired_1_val_1.fq.gz /path/to/output/Sample1_R1_T_trim.fq.gz

mv /path/to/output/Sample1_R2_A_trim.fq.gz.val_paired_2_val_2.fq.gz /path/to/output/Sample1_R2_T_trim.fq.gz

#validate paired end files
validate_paired_end_files --pair_cutoff 20 --keep_unpaired -r1 35 -r2 35 /path/to/output/Sample1_R1_T_trim.fq.gz /path/to/output/Sample1_R2_T_trim.fq.gz

#compress output
gzip /path/to/output/Sample1_R1_T_trim.fq.gz.val_paired_1.fq /path/to/output/Sample1_R2_T_trim.fq.gz.val_paired_2.fq

mv /path/to/output/Sample1_R1_T_trim.fq.gz.val_paired_1.fq /path/to/output/Sample1_R1_final.fq.gz

mv /path/to/output/Sample1_R2_T_trim.fq.gz.val_paired_2.fq /path/to/output/Sample1_R2_final.fq.gz

#combine unpaired files
gunzip Sample1_R1_unpaired_1.fq.gz Sample1_R2_unpaired_2.fq.gz Sample1_R1_trim.fq.gz.val_paired_1_unpaired_1.fq.gz Sample1_R2_trim.fq.gz.val_paired_2_unpaired_2.fq.gz Sample1_R1_A_trim.fq.gz.val_paired_1_unpaired_1.fq.gz Sample1_R2_A_trim.fq.gz.val_paired_2_unpaired_2.fq.gz

cat Sample1_R1_unpaired_1.fq.gz Sample1_R1_trim.fq.gz.val_paired_1_unpaired_1.fq.gz Sample1_R1_A_trim.fq.gz.val_paired_1_unpaired_1.fq.gz > Sample1_R1_unpaired.fq

cat Sample1_R2_unpaired_2.fq.gz Sample1_R2_trim.fq.gz.val_paired_2_unpaired_2.fq.gz Sample1_R2_A_trim.fq.gz.val_paired_2_unpaired_2.fq.gz > Sample1_R2_unpaired.fq

gzip Sample1_R1_unpaired.fq Sample1_R2_unpaired.fq


