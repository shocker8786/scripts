#!/bin/bash
#SBATCH -A IHDI
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_STAR_7T.txt
#SBATCH -e error_output_STAR_7T.txt
#SBATCH -J 7T_STAR
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load Trim_Galore/0.4.4-IGB-gcc-4.9.4
module load STAR/2.5.3a-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4
module load picard/2.10.1-Java-1.8.0_152
module load R/3.4.2-IGB-gcc-4.9.4
module load RSEM/1.3.0-IGB-gcc-4.9.4

#trim adaptor sequence
#trim_galore -q 20 --illumina --stringency 6 --fastqc -o /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/ /home/a-m/kschach2/IHDI/RNAseq/T7_TCGGATTC_L00M_R1_001.fastq.gz

#trim A-tails
#trim_galore -q 20 --stringency 6 -a AAAAAAAAAAAAA -o /home/a-m/kschach2/IHDI/RNAseq/A_trimmed /home/a-m/kschach2/IHDI/RNAseq/adapter_trimmed/T7_TCGGATTC_L00M_R1_001_trimmed.fq.gz

#trim T-tails
#trim_galore -q 20 --stringency 6 -a TTTTTTTTTTTTT --fastqc -o /home/a-m/kschach2/IHDI/RNAseq/final_trimmed /home/a-m/kschach2/IHDI/RNAseq/A_trimmed/T7_TCGGATTC_L00M_R1_001_trimmed_trimmed.fq.gz

#1st pass alignment
#STAR --runThreadN 1 --genomeDir /home/a-m/kschach2/new_human_assembly/Female_Star_index --outFileNamePrefix /home/a-m/kschach2/IHDI/RNAseq/aligned/7T_ --quantMode GeneCounts --outSAMtype BAM SortedByCoordinate --readFilesIn /home/a-m/kschach2/IHDI/RNAseq/final_trimmed/T7_TCGGATTC_L00M_R1_001_trimmed_trimmed_trimmed.fq.gz --readFilesCommand zcat --sjdbGTFtagExonParentGene gene --sjdbGTFfile /home/a-m/kschach2/new_human_assembly/gene_set/Female_Homo_sapiens.GRCh38.91.gtf --sjdbOverhang 149

#remove Y from SJ.out.tab
#grep -vw Y /home/a-m/kschach2/IHDI/RNAseq/aligned/7T_SJ.out.tab > /home/a-m/kschach2/IHDI/RNAseq/SJ_female/7T_SJ.out.tab

#2nd pass alignment
STAR --runThreadN 1 \
--sjdbFileChrStartEnd /home/a-m/kschach2/IHDI/RNAseq/SJ_female/1T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/2N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/2T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/3T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/4T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/5T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/3N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/4N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/57C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/58C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/59C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/60C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/61C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/62C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/63C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/68C_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/18N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/37N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/59N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/61N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/63N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/66N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/11T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/13T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/14T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/15T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/17T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/19T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/20T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/23T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/29T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/30T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/32T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/33T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/36T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/37T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/38T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/39T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/40T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/42T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/43T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/44T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/47T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/48T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/50T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/52T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/56T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/57T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/58T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/60T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/61T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/62T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/63T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/66T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/8T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/SJ_female/9T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/22N_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/10T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/12T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/16T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/21T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/34T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/41T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/45T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/46T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/49T_SJ.out.tab \
/home/a-m/kschach2/IHDI/RNAseq/aligned/7T_SJ.out.tab \
--limitSjdbInsertNsj 1500000 \
--genomeDir /home/a-m/kschach2/new_human_assembly/Female_Star_index \
--outFileNamePrefix /home/a-m/kschach2/IHDI/RNAseq/STAR_2_pass_female/7T_ \
--quantMode TranscriptomeSAM GeneCounts \
--outSAMtype BAM SortedByCoordinate \
--readFilesIn /home/a-m/kschach2/IHDI/RNAseq/final_trimmed/T7_TCGGATTC_L00M_R1_001_trimmed_trimmed_trimmed.fq.gz \
--readFilesCommand zcat \
--sjdbGTFfile /home/a-m/kschach2/new_human_assembly/gene_set/Female_Homo_sapiens.GRCh38.91.gtf \
--sjdbOverhang 149

#determine chromosome coverage
for i in /home/a-m/kschach2/IHDI/RNAseq/STAR_2_pass_female/7T_Aligned.sortedByCoord.out.bam; do echo $i; samtools index $i; done;
for i in /home/a-m/kschach2/IHDI/RNAseq/STAR_2_pass_female/7T_Aligned.sortedByCoord.out.bam; do echo $i; samtools idxstats $i > /home/a-m/kschach2/IHDI/RNAseq/coverage/7T_chromosomes.txt; done;

#determine average coverage
samtools mpileup /home/a-m/kschach2/IHDI/RNAseq/STAR_2_pass_female/7T_Aligned.sortedByCoord.out.bam | awk '($1 != "MT")' | awk '{ count++ ; SUM += $4 } END { print "Total: " SUM "\t" "Nucleotides: " count "\t" "Average_coverage: " SUM/count }' > /home/a-m/kschach2/IHDI/RNAseq/coverage/7T_coverage.out

#alignment metrics
java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics \
I=/home/a-m/kschach2/IHDI/RNAseq/STAR_2_pass_female/7T_Aligned.sortedByCoord.out.bam \
O=/home/a-m/kschach2/IHDI/RNAseq/metrics/7T.RNA_Metrics \
REF_FLAT=/home/a-m/kschach2/new_human_assembly/gene_set/Female_Homo_sapiens.refflat \
STRAND=FIRST_READ_TRANSCRIPTION_STRAND \
RIBOSOMAL_INTERVALS=/home/a-m/kschach2/new_human_assembly/gene_set/Female_ribosomal_intervals.txt \
CHART_OUTPUT=/home/a-m/kschach2/IHDI/RNAseq/metrics/7T.pdf

#RSEM_female analysis of 2nd pass bam files w/reference index
rsem-calculate-expression --strandedness forward \
--estimate-rspd -p 8 \
--calc-pme --calc-ci \
--seed-length 5 \
--alignments /home/a-m/kschach2/IHDI/RNAseq/STAR_2_pass_female/7T_Aligned.toTranscriptome.out.bam \
/home/a-m/kschach2/new_human_assembly/RSEM_female/Homo_sapiens_star \
/home/a-m/kschach2/IHDI/RNAseq/RSEM_female/7T_

