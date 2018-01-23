#!/bin/sh

cat CpG/Sample1_final.txt|sed 's/_/-/'|grep - > CpG/Sample1_contigs.txt

cat CpG/Sample1_final.txt|sed 's/_/-/'|sed 's/MT/M/'|grep -v -|sed 's/^/chr/' > CpG/Sample1_chr.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6<=0.05)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""0,255,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_5.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.05)'|awk '($6<=0.15)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""55,255,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_15.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.15)'|awk '($6<=0.25)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""105,255,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_25.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.25)'|awk '($6<=0.35)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""155,255,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_35.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.35)'|awk '($6<=0.45)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""205,255,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_45.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.45)'|awk '($6<=0.55)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""255,255,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_55.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.55)'|awk '($6<=0.65)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""255,205,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_65.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.65)'|awk '($6<=0.75)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""255,155,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_75.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.75)'|awk '($6<=0.85)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""255,105,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_85.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.85)'|awk '($6<=0.95)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""255,55,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_95.txt

cat CpG/Sample1_chr.txt CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.95)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_CpG""\t"$5"\t""+""\t"$2-1"\t"$2"\t""255,0,0""\t"$5"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > CpG/Sample1_100.txt

cat CpG/Sample1_5.txt CpG/Sample1_15.txt CpG/Sample1_25.txt CpG/Sample1_35.txt CpG/Sample1_45.txt CpG/Sample1_55.txt CpG/Sample1_65.txt CpG/Sample1_75.txt CpG/Sample1_85.txt CpG/Sample1_95.txt CpG/Sample1_100.txt|sortBed > CpG/Sample1_CpG.bed

awk '($5>=1000)' CpG/Sample1_CpG.bed |awk '{print $1"\t"$2"\t"$3"\t"$4"\t""1000""\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11}' > CpG/Sample1_1000.txt

awk '($5<1000)' CpG/Sample1_CpG.bed > CpG/Sample1.txt

cat CpG/Sample1.txt CpG/Sample1_1000.txt > CpG/Sample1_CpG.bed

rm CpG/Sample1*txt

