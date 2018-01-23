#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_RNAseq.txt
#SBATCH -e error_output_RNAseq.txt
#SBATCH -J RNA-seq
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=kschach2@uic.edu

#Adaptor Trimming pipeline
module load Trim_Galore/0.4.4-IGB-gcc-4.9.4

#trim adaptor sequence from paired end files
trim_galore -q 20 --illumina --stringency 6 --paired --retain_unpaired -o /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/ /home/a-m/kschach2/IHDI/RNAseq/1T_AACCAG_L005_R1_001.fastq.gz /home/a-m/kschach2/IHDI/RNAseq/1T_AACCAG_L005_R2_001.fastq.gz

#trim A-tails from paired end files
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -a2 AAAAAAAAAAAAA --paired --retain_unpaired -o /home/a-m/kschach2/IHDI/RNAseq/A_trimmed /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/1T_AACCAG_L005_R1_001_trimmed.fq.gz /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/1T_AACCAG_L005_R2_001_trimmed.fq.gz

#trim T-tails from paired end files
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT -a2 TTTTTTTTTTTTT --paired --retain_unpaired --fastqc -o /home/a-m/kschach2/IHDI/RNAseq/final_trimmed /home/a-m/kschach2/IHDI/RNAseq/A_trimmed/1T_AACCAG_L005_R1_001_trimmed_trimmed.fq.gz /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/1T_AACCAG_L005_R2_001_trimmed.fq.gz

#trim adaptor sequence from single end files
trim_galore -q 20 --illumina --stringency 6 -o /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/ /home/a-m/kschach2/IHDI/RNAseq/1T_AACCAG_L005_R1_001.fastq.gz

#trim A-tails from single end files
trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/IHDI/RNAseq/A_trimmed /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/1T_AACCAG_L005_R1_001_trimmed.fq.gz

#trim T-tails from single end files
trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/IHDI/RNAseq/final_trimmed /home/a-m/kschach2/IHDI/RNAseq/A_trimmed/1T_AACCAG_L005_R1_001_trimmed_trimmed.fq.gz

#Alignment to Genome pipeline (let me know if this doesn't work, we might need to have them install a new module)

module load oldapps/1.0
module load Bowtie2/2.3.2-IGB-gcc-4.9.4
module load tophat2/2.1.1

#Index reference genome
bowtie2-build -f Sus_scrofa.fa Sus_scrofa

#align paired end reads to reference
tophat -o /path/to/output/paired/ -p 10 -G Sus_scrofa.gtf --transcriptome-index=/path/to/transcriptome-index/Sus_scrofa -M --rg-id Sample1_rna --rg-sample Sample1_RNA --rg-platform Illumina --keep-fasta-order --read-realign-edit-dist 0 -r 120 --library-type fr-firststrand --mate-std-dev 260 /path/to/reference/index/Sus_scrofa Sample1_R1_final.fq.gz,Sample1_R1_unpaired.fq.gz Sample1_R2_final.fq.gz

tophat -o /path/to/output/single/ -p 10 --transcriptome-index=/path/to/transcriptome-index/Sus_scrofa -M --rg-id Sample1_rna --rg-sample Sample1_RNA --rg-platform Illumina --keep-fasta-order --read-realign-edit-dist 0 --library-type fr-secondstrand /path/to/reference/index/Sus_scrofa Sample1_R2_unpaired.fq.gz

#merge paired and unpaired bam files

module load SAMtools/1.5-IGB-gcc-4.9.4

samtools merge paired_accepted_hits.bam single_accepted_hits.bam combined_accepted_hits.bam

samtools sort combined_accepted_hits.bam final_accepted_hits.bam

#determine chromosome coverage (useful to ensure alignment was successful, i.e. all chromosomes have at least some reads aligned

for i in final_accepted_hits.bam; do echo $i; samtools index $i; done;
for i in final_accepted_hits.bam; do echo $i; samtools idxstats $i > Sample1_chromosomes.txt; done;

#Quantify expression and perform differential expression analysis

module load Cufflinks/2.2.1-IGB-gcc-4.9.4

cufflinks -p 10 -o Sample1 -G Sus_scrofa.gtf -u --library-type fr-firststrand final_accepted_hits.bam

cuffmerge -o merged -g Sus_scrofa.gtf -s Sus_scrofa.fa -p 10 assemblies.txt

#example assemblies.txt file
./Sample1/transcripts.gtf
./Sample1/transcripts.gtf

cuffquant -o cuffquant/Sample1 -p 10 -b Sus_scrofa.fa -u --library-type fr-firststrand merged/merged.gtf final_accepted_hits.bam

cuffnorm -o cuffnorm -L Sample1,Sample2 -p 10 --library-type fr-firststrand --output-format cuffdiff --library-norm-method geometric merged/merged.gtf cuffquant/Sample1/abundances.cxb cuffquant/Sample2/abundances.cxb

cuffdiff -o cuffdiff -L control,treatment -b Sus_scrofa.fa -u -p --library-type fr-firststrand merged/merged.gtf cuffquant/Sample1/abundances.cxb cuffquant/Sample2/abundances.cxb

