#!/bin/bash
#SBATCH --account=bowtie2
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_bowtie2.txt
#SBATCH --error=error_output_bowtie2.txt
#SBATCH --job-name=bowtie2
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#build bowtie2 reference index
bowtie2-build -f Sus_scrofa.fa Sus_scrofa

#align reads to reference
bowtie2 -p 4 -N 1 -L 20 -x /path/to/reference/index/Sus_scrofa -U Sample1_trimmed.fq.gz -S Sample1.sam

#filter for uniquely aligned reads
grep -v XS:i Sample1.sam > Sample1_uniq.sam

#convert sam to bam
samtools view -bS Sample1_uniq.sam > Sample1.bam

#sort bam file
samtools sort Sample1.bam Sample1_sort

#index bam file
samtools index Sample1_sort.bam

#clean up unneeded files
rm Sample1.sam Sample1_uniq.sam Sample1.bam

#add read groups
java -Xms16g  -jar ~/bin/picard-tools-1.119/AddOrReplaceReadGroups.jar RGLB=fastq RGPL=Illumina RGPU=run RGSM=9111 I=Sample1_sort.bam O=Sample1_sort_rg.bam SORT_ORDER=coordinate CREATE_INDEX=TRUE VALIDATION_STRINGENCY=LENIENT

#create realigner targets
java -Xms16g -jar ~/bin/GenomeAnalysisTK-2.3-9-ge5ebf34/GenomeAnalysisTK.jar -T RealignerTargetCreator -R Sus_scrofa.fa -I Sample1_sort_rg.bam -o Sample1.intervals

#realign reads
java -Xms16g -jar ~/bin/GenomeAnalysisTK-2.3-9-ge5ebf34/GenomeAnalysisTK.jar -T IndelRealigner -R Sus_scrofa.fa -I Sample1_sort_rg.bam -targetIntervals Sample1.intervals -o Sample1_realigned.bam

#calculate realigned depth
samtools depth Sample1_realigned.bam| awk '{ count++ ; SUM += $3 } END { print "Total: " SUM "\t" "Nucleotides: " count "\t" "Average_coverage: " SUM/count "\t" "Prc genome cov: " count/2808525991 }' > Sample1_realigned_coverage.out

