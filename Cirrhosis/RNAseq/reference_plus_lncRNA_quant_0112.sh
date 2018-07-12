#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=120g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_STAR_0112.txt
#SBATCH -e error_output_STAR_0112.txt
#SBATCH -J STAR_merge
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load STAR/2.5.3a-IGB-gcc-4.9.4
module load SAMtools/1.5-IGB-gcc-4.9.4
module load RSEM/1.3.0-IGB-gcc-4.9.4

#1st pass alignment
#STAR --runThreadN 1 \
#--genomeDir /home/a-m/kschach2/porcine_assembly/Sscrofa11.1 \
#--outFileNamePrefix /home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0112_ \
#--quantMode GeneCounts \
#--outSAMtype BAM SortedByCoordinate \
#--readFilesIn /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_val_1_val_1_val_1.fq.gz \
#/home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_val_2_val_2_val_2.fq.gz \
#--readFilesCommand zcat \
#--sjdbGTFfile /home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.Sscrofa11.1.90.gtf \
#--sjdbOverhang 99

#2nd pass alignment
#STAR --runThreadN 1 \
#--sjdbFileChrStartEnd /home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0112_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0113_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0921_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0925_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0993_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0994_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0995_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0996_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0997_SJ.out.tab \
#/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0998_SJ.out.tab \
#--genomeDir /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/STAR \
#--outFileNamePrefix /home/a-m/kschach2/Cirrhosis/RNAseq/STAR_lncRNA/0112_ \
#--quantMode TranscriptomeSAM GeneCounts \
#--outSAMtype BAM SortedByCoordinate \
#--readFilesIn /home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed/0112_16_RNA_GTCCGCAC_L00M_R1_001_val_1_val_1_val_1.fq.gz \
#/home/a-m/kschach2/Cirrhosis/RNAseq/final_trimmed/0112_16_RNA_GTCCGCAC_L00M_R2_001_val_2_val_2_val_2.fq.gz \
#--readFilesCommand zcat \
#--sjdbGTFfile /home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/full_gtf/combined_sorted.gtf \
#--sjdbOverhang 99

#RSEM analysis of 2nd pass bam files w/reference index
rsem-calculate-expression --strandedness reverse \
-p 8 --calc-pme --calc-ci \
--seed-length 5 \
--alignments --paired-end /home/a-m/kschach2/Cirrhosis/RNAseq/STAR_lncRNA/0112_Aligned.toTranscriptome.out.bam \
/home/a-m/kschach2/Cirrhosis/RNAseq/feelnc/RSEM/Sus_scrofa \
/home/a-m/kschach2/Cirrhosis/RNAseq/RSEM_with_lncRNA/0112_

