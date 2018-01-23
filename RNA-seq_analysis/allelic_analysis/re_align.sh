#!/bin/bash
#SBATCH --account=RNA-seq
#SBATCH --time=0
#SBATCH --mem=20000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_realign.txt
#SBATCH --error=error_output_realign.txt
#SBATCH --job-name=realign
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#Remove PCR duplicates with Picard MarkDuplicates
java -Xms16g -jar ~/bin/picard-tools-1.119/MarkDuplicates.jar I=Sample1_accepted_hits.bam O=Sample1_no_dup.bam M=Sample1_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true

#Index bam file for GATK analysis
samtools index Sample1_no_dup.bam Sample1_no_dup.bai

#Realign with GATK
java -Xms16g -jar ~/bin/GenomeAnalysisTK-2.3-9-ge5ebf34/GenomeAnalysisTK.jar -T RealignerTargetCreator -R ../../../transcripts/reference_wMT.fa -I Sample1_no_dup.bam -o Sample1_no_dup.intervals

java -Xms16g -jar ~/bin/GenomeAnalysisTK-2.3-9-ge5ebf34/GenomeAnalysisTK.jar -T IndelRealigner -R ../../../transcripts/reference_wMT.fa -I Sample1_no_dup.bam -targetIntervals Sample1_no_dup.intervals -o Sample1_nd_realigned.bam

#Index bam file for GATK analysis
samtools index Sample1_nd_realigned.bam Sample1_nd_realigned.bai

