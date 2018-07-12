#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=4g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_flexbar.txt
#SBATCH -e error_output_flexbar.txt
#SBATCH -J flexbar
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load flexbar/3.0.3-IGB-gcc-4.9.4

#trim adaptor sequence and quality filtering
#flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0112_16_smRNAseq_GATCAG_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0112_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0113_16_smRNAseq_TAGCTT_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0113_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0921_16_smRNAseq_ATCACG_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0921_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0925_16_smRNAseq_CGATGT_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0925_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0993_16_smRNAseq_TTAGGC_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0993_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0994_16_smRNAseq_TGACCA_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0994_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0995_16_smRNAseq_ACAGTG_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0995_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0996_16_smRNAseq_GCCAAT_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0996_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0997_16_smRNAseq_CAGATC_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0997_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

flexbar -r /home/a-m/kschach2/Cirrhosis/miRNAseq/0998_16_smRNAseq_ACTTGA_L001_R1_001.fastq.gz -a /home/a-m/kschach2/Cirrhosis/miRNAseq/adapters.fasta -t /home/a-m/kschach2/Cirrhosis/miRNAseq/adapter_trimmed/0998_flexbar_trimmed --adapter-trim-end RIGHT --min-read-length 14 --qtrim WIN -qf i1.8 -qt 25 --zip-output GZ

