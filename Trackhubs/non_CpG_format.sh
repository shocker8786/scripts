#!/bin/sh

position="C"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $2==s_position {print}' non_CpG/Sample1_final.txt|awk '{print $1"\t""+""\t"$3"\t"$4"\t"$5"\t"$6"\t"$7}' > non_CpG/Sample1_c.txt

position="G"
awk -v s_position=$position 'BEGIN{FS=OFS="\t"} $2==s_position {print}' non_CpG/Sample1_final.txt|awk '{print $1"\t""-""\t"$3"\t"$4"\t"$5"\t"$6"\t"$7}' > non_CpG/Sample1_g.txt

cat non_CpG/Sample1_c.txt non_CpG/Sample1_g.txt|grep _|sed 's/_/-/' > non_CpG/Sample1_contigs.txt

cat non_CpG/Sample1_c.txt non_CpG/Sample1_g.txt|sed 's/MT/M/'|grep -v _|sed 's/^/chr/' > non_CpG/Sample1_chr.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6<=0.05)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""0,255,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_5.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.05)'|awk '($6<=0.15)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""55,255,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_15.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.15)'|awk '($6<=0.25)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""105,255,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_25.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.25)'|awk '($6<=0.35)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""155,255,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_35.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.35)'|awk '($6<=0.45)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""205,255,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_45.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.45)'|awk '($6<=0.55)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""255,255,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_55.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.55)'|awk '($6<=0.65)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""255,205,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_65.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.65)'|awk '($6<=0.75)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""255,155,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_75.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.75)'|awk '($6<=0.85)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""255,105,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_85.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.85)'|awk '($6<=0.95)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""255,55,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_95.txt

cat non_CpG/Sample1_chr.txt non_CpG/Sample1_contigs.txt|sed 's/:/\t/'|awk '($6>0.95)'|awk '{print $1"\t"$2-1"\t"$2"\t""Sample1_"$4"\t"$8"\t"$3"\t"$2-1"\t"$2"\t""255,0,0""\t"$8"\t"$6*100}'|awk 'BEGIN{OFS=FS="\t"}{$11=sprintf("%3.0f",$11)}1' > non_CpG/Sample1_100.txt

cat non_CpG/Sample1_5.txt non_CpG/Sample1_15.txt non_CpG/Sample1_25.txt non_CpG/Sample1_35.txt non_CpG/Sample1_45.txt non_CpG/Sample1_55.txt non_CpG/Sample1_65.txt non_CpG/Sample1_75.txt non_CpG/Sample1_85.txt non_CpG/Sample1_95.txt non_CpG/Sample1_100.txt|sortBed > non_CpG/Sample1_non_CpG.bed

awk '($5>=1000)' non_CpG/Sample1_non_CpG.bed |awk '{print $1"\t"$2"\t"$3"\t"$4"\t""1000""\t"$6"\t"$7"\t"$8"\t"$9"\t"$10"\t"$11}' > non_CpG/Sample1_1000.txt

awk '($5<1000)' non_CpG/Sample1_non_CpG.bed > non_CpG/Sample1.txt

cat non_CpG/Sample1.txt non_CpG/Sample1_1000.txt > non_CpG/Sample1_non_CpG.bed

rm non_CpG/Sample1*txt

