#!/bin/sh
i
#genomeCoverageBed -bg -ibam /media/schac001/Kyle\ Methylome\ Data/Methylation_Study/TJ_Tabasco_samples/final/Sample1_RNAseq.bam -g susScr3.chrom.sizes -scale RMP_scale -strand + -split > RNAseq/Sample1_RNAseq_plus.bedgraph

#genomeCoverageBed -bg -ibam /media/schac001/Kyle\ Methylome\ Data/Methylation_Study/TJ_Tabasco_samples/final/Sample1_RNAseq.bam -g susScr3.chrom.sizes -scale RPM_scale -strand - -split > RNAseq/Sample1_RNAseq_minus.bedgraph

#grep GL RNAseq/Sample1_RNAseq_plus.bedgraph|sed 's/\./-/' > RNAseq/Sample1_plus_GL.txt

#grep JH RNAseq/Sample1_RNAseq_plus.bedgraph|sed 's/\./-/' > RNAseq/Sample1_plus_JH.txt

#grep -v GL RNAseq/Sample1_RNAseq_plus.bedgraph|grep -v JH|sed 's/^/chr/'|sed 's/MT/M/' > RNAseq/Sample1_plus.txt

#grep GL RNAseq/Sample1_RNAseq_minus.bedgraph|sed 's/\./-/' > RNAseq/Sample1_minus_GL.txt

#grep JH RNAseq/Sample1_RNAseq_minus.bedgraph|sed 's/\./-/' > RNAseq/Sample1_minus_JH.txt

#grep -v GL RNAseq/Sample1_RNAseq_minus.bedgraph|grep -v JH|sed 's/^/chr/'|sed 's/MT/M/' > RNAseq/Sample1_minus.txt

#cat RNAseq/Sample1_plus.txt RNAseq/Sample1_plus_GL.txt RNAseq/Sample1_plus_JH.txt > RNAseq/Sample1_plus.bedgraph

#cat RNAseq/Sample1_minus.txt RNAseq/Sample1_minus_GL.txt RNAseq/Sample1_minus_JH.txt|awk '{print $1"\t"$2"\t"$3"\t""-"$4}' > RNAseq/Sample1_minus.bedgraph

bedGraphToBigWig RNAseq/Sample1_plus.bedgraph susScr3.chrom.sizes RNAseq/Sample1_plus.bigwig

bedGraphToBigWig RNAseq/Sample1_minus.bedgraph susScr3.chrom.sizes RNAseq/Sample1_minus.bigwig

