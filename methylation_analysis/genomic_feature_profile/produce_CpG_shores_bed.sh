#!/bin/bash
#SBATCH --account=CpG_shores
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_CpG_shores.txt
#SBATCH --error=error_output_CpG_shores.txt
#SBATCH --job-name=CpG_shores
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#profile upstream and downstream shores by 100bp incriments
cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-100"\t"$2}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/100_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2"\t"$2+100}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/100_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-200"\t"$2-100}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/200_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+100"\t"$2+200}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/200_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-300"\t"$2-200}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/300_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+200"\t"$2+300}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/300_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-400"\t"$2-300}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/400_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+300"\t"$2+400}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/400_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-500"\t"$2-400}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/500_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+400"\t"$2+500}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/500_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-600"\t"$2-500}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/600_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+500"\t"$2+600}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/600_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-700"\t"$2-600}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/700_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+600"\t"$2+700}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/700_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-800"\t"$2-700}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/800_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+700"\t"$2+800}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/800_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-900"\t"$2-800}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/900_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+800"\t"$2+900}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/900_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1000"\t"$2-900}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1000_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+900"\t"$2+1000}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1000_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1100"\t"$2-1000}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1100_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1000"\t"$2+1100}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1100_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1200"\t"$2-1100}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1200_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1100"\t"$2+1200}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1200_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1300"\t"$2-1200}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1300_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1200"\t"$2+1300}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1300_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1400"\t"$2-1300}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1400_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1300"\t"$2+1400}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1400_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1500"\t"$2-1400}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1500_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1400"\t"$2+1500}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1500_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1600"\t"$2-1500}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1600_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1500"\t"$2+1600}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1600_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1700"\t"$2-1600}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1700_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1600"\t"$2+1700}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1700_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1800"\t"$2-1700}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1800_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1700"\t"$2+1800}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1800_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-1900"\t"$2-1800}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1900_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1800"\t"$2+1900}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1900_downstream.bed

cat CpG_Islands.bed|cut -f 1,2|awk '{print $1"\t"$2-2000"\t"$2-1900}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2000_upstream.bed

cat CpG_Islands.bed|cut -f 1,3|awk '{print $1"\t"$2+1900"\t"$2+2000}' |awk '$2+0<0{$2=0}1'|sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2000_downstream.bed

