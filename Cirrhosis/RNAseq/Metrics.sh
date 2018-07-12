#!/bin/bash
#SBATCH -A Cirrhosis
#SBATCH --mem=20g
#SBATCH -N 1
#SBATCH -c 1
#SBATCH -o output_metrics_tophat.txt
#SBATCH -e error_output_metrics_tophat.txt
#SBATCH -J Cirrhosis_metrics
#SBATCH -p normal
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

module load picard/2.10.1-Java-1.8.0_152
module load R/3.4.2-IGB-gcc-4.9.4

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0112/0112_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0113/0113_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0113_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0113_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0921/0921_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0921_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0921_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0925/0925_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0925_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0925_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0993/0993_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0993_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0993_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0994/0994_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0994_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0994_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0995/0995_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0995_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0995_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0996/0996_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0996_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0996_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0997/0997_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0997_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0997_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/STAR_aligned/0998/0998_sorted.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0998_STAR.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0998_STAR.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0112/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0113/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0113_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0113_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0921/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0921_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0921_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0925/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0925_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0925_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0993/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0993_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0993_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0994/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0994_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0994_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0995/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0995_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0995_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0996/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0996_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0996_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0997/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0997_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0997_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/Tophat_aligned/0998/final_accepted_hits.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0998_Tophat.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0998_Tophat.pdf 

#java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/RSEM_results/0112.STAR.genome.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_RSEM.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_RSEM.pdf 

java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/HISAT_aligned/0112.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_HISAT.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_HISAT.pdf 

java -jar $EBROOTPICARD/picard.jar CollectRnaSeqMetrics I=/home/a-m/kschach2/Cirrhosis/RNAseq/RSEM_results/STAR/0112Aligned.sortedByCoord.out.bam O=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_STAR2.RNA_Metrics.txt REF_FLAT=/home/a-m/kschach2/porcine_assembly/genes/Sus_scrofa.refflat STRAND=SECOND_READ_TRANSCRIPTION_STRAND RIBOSOMAL_INTERVALS=/home/a-m/kschach2/porcine_assembly/genes/ribosomal_intervals.txt CHART_OUTPUT=/home/a-m/kschach2/Cirrhosis/RNAseq/metrics/0112_STAR2.pdf 

