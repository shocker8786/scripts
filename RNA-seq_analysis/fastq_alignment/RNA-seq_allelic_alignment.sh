#!/bin/bash
#SBATCH --account=Tophat2
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_Tophat2.txt
#SBATCH --error=error_output_Tophat2.txt
#SBATCH --job-name=Tophat2
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#produce reference index
bowtie2-build -f Sus_scrofa.fa Sus_scrofa

#align paired reads to reference
tophat -o /path/to/output/paired/ -g 1 -p 10 -G Sus_scrofa.gtf --transcriptome-index=/path/to/transcriptome-index/Sus_scrofa -M --rg-id Sample1_rna --rg-sample Sample1_RNA --rg-platform Illumina --keep-fasta-order --read-realign-edit-dist 0 -r 120 --library-type fr-firststrand --mate-std-dev 260 /path/to/reference/index/Sus_scrofa Sample1_R1_final.fq.gz,Sample1_R1_unpaired.fq.gz Sample1_R2_final.fq.gz

tophat -o /path/to/output/single/ -g 1 -p 10 --transcriptome-index=/path/to/transcriptome-index/Sus_scrofa -M --rg-id Sample1_rna --rg-sample Sample1_RNA --rg-platform Illumina --keep-fasta-order --read-realign-edit-dist 0 --library-type fr-secondstrand /path/to/reference/index/Sus_scrofa Sample1_R2_unpaired.fq.gz

#merge bam files
samtools merge /path/to/output/Sample1_accepted_hits.bam /path/to/output/paired/accepted_hits.bam /path/to/output/single/accepted_hits.bam

samtools sort /path/to/output/Sample1_accepted_hits.bam Sample1_sorted_hits

#determine chromosome coverage
for i in Sample1_sorted_hits.bam; do echo $i; samtools index $i; done;
for i in Sample1_sorted_hits.bam; do echo $i; samtools idxstats $i > Sample1_chromosomes.txt; done;

#determine average coverage
samtools mpileup Sample1_sorted_hits.bam | awk '($1 != "Ssc9_MT")' | awk '{ count++ ; SUM += $4 } END { print "Total: " SUM "\t" "Nucleotides: " count "\t" "Average_coverage: " SUM/count }' > Sample1_coverage.out

#Remove PCR duplicates with Picard MarkDuplicates
java -Xms16g -jar ~/bin/picard-tools-1.119/MarkDuplicates.jar I=Sample1_sorted_hits.bam O=Sample1_no_dup.bam M=Sample1_metrics.txt REMOVE_DUPLICATES=true ASSUME_SORTED=true

#Index bam file for GATK analysis
samtools index Sample1_no_dup.bam

#Realign with GATK
java -Xms16g -jar ~/bin/GenomeAnalysisTK-2.3-9-ge5ebf34/GenomeAnalysisTK.jar -T RealignerTargetCreator -R Sus_scrofa.fa -I Sample1_no_dup.bam -o Sample1_no_dup.intervals

java -Xms16g -jar ~/bin/GenomeAnalysisTK-2.3-9-ge5ebf34/GenomeAnalysisTK.jar -T IndelRealigner -R Sus_scrofa.fa -I Sample1_no_dup.bam -targetIntervals Sample1_no_dup.intervals -o Sample1_nd_realigned.bam

#Index bam file for GATK analysis
samtools index Sample1_nd_realigned.bam

