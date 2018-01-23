#!/bin/bash
#SBATCH --account=TSS
#SBATCH --time=0
#SBATCH --mem=4000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_TSS.txt
#SBATCH --error=error_output_TSS.txt
#SBATCH --job-name=TSS
#SBATCH --partition=ABGC_Low
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#sort expression bed by expression level and strand
grep + Sample1_expression.bed|awk '($6==0)' > Sample1_TSS/0/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6==0)' > Sample1_TSS/0/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>0)'|awk '($6<=1)' > Sample1_TSS/1/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>0)'|awk '($6<=1)' > Sample1_TSS/1/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>1)'|awk '($6<=10)' > Sample1_TSS/10/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>1)'|awk '($6<=10)' > Sample1_TSS/10/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>10)'|awk '($6<=100)' > Sample1_TSS/100/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>10)'|awk '($6<=100)' > Sample1_TSS/100/expression_plus.bed

grep + Sample1_expression.bed|awk '($6>100)'|awk '($6<=1000)' > Sample1_TSS/1000/expression_minus.bed
grep -v + Sample1_expression.bed|awk '($6>100)'|awk '($6<=1000)' > Sample1_TSS/1000/expression_plus.bed

#produce bed files for 10kb upstream to 3kb downstream (100bp incriments)
cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-100"\t"$2}' > 100_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2"\t"$2+100}' > 100_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2"\t"$2+100}' > 100_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-100"\t"$2}' > 100_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-200"\t"$2-100}' > 200_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+100"\t"$2+200}' > 200_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+100"\t"$2+200}' > 200_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-200"\t"$2-100}' > 200_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-300"\t"$2-200}' > 300_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+200"\t"$2+300}' > 300_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+200"\t"$2+300}' > 300_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-300"\t"$2-200}' > 300_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-400"\t"$2-300}' > 400_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+300"\t"$2+400}' > 400_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+300"\t"$2+400}' > 400_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-400"\t"$2-300}' > 400_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-500"\t"$2-400}' > 500_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+400"\t"$2+500}' > 500_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+400"\t"$2+500}' > 500_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-500"\t"$2-400}' > 500_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-600"\t"$2-500}' > 600_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+500"\t"$2+600}' > 600_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+500"\t"$2+600}' > 600_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-600"\t"$2-500}' > 600_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-700"\t"$2-600}' > 700_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+600"\t"$2+700}' > 700_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+600"\t"$2+700}' > 700_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-700"\t"$2-600}' > 700_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-800"\t"$2-700}' > 800_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+700"\t"$2+800}' > 800_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+700"\t"$2+800}' > 800_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-800"\t"$2-700}' > 800_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-900"\t"$2-800}' > 900_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+800"\t"$2+900}' > 900_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+800"\t"$2+900}' > 900_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-900"\t"$2-800}' > 900_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1000"\t"$2-900}' > 1000_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+900"\t"$2+1000}' > 1000_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+900"\t"$2+1000}' > 1000_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1000"\t"$2-900}' > 1000_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1100"\t"$2-1000}' > 1100_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1000"\t"$2+1100}' > 1100_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1000"\t"$2+1100}' > 1100_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1100"\t"$2-1000}' > 1100_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1200"\t"$2-1100}' > 1200_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1100"\t"$2+1200}' > 1200_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1100"\t"$2+1200}' > 1200_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1200"\t"$2-1100}' > 1200_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1300"\t"$2-1200}' > 1300_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1200"\t"$2+1300}' > 1300_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1200"\t"$2+1300}' > 1300_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1300"\t"$2-1200}' > 1300_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1400"\t"$2-1300}' > 1400_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1300"\t"$2+1400}' > 1400_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1300"\t"$2+1400}' > 1400_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1400"\t"$2-1300}' > 1400_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1500"\t"$2-1400}' > 1500_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1400"\t"$2+1500}' > 1500_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1400"\t"$2+1500}' > 1500_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1500"\t"$2-1400}' > 1500_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1600"\t"$2-1500}' > 1600_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1500"\t"$2+1600}' > 1600_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1500"\t"$2+1600}' > 1600_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1600"\t"$2-1500}' > 1600_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1700"\t"$2-1600}' > 1700_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1600"\t"$2+1700}' > 1700_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1600"\t"$2+1700}' > 1700_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1700"\t"$2-1600}' > 1700_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1800"\t"$2-1700}' > 1800_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1700"\t"$2+1800}' > 1800_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1700"\t"$2+1800}' > 1800_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1800"\t"$2-1700}' > 1800_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-1900"\t"$2-1800}' > 1900_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1800"\t"$2+1900}' > 1900_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1800"\t"$2+1900}' > 1900_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-1900"\t"$2-1800}' > 1900_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2000"\t"$2-1900}' > 2000_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+1900"\t"$2+2000}' > 2000_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+1900"\t"$2+2000}' > 2000_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2000"\t"$2-1900}' > 2000_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2100"\t"$2-2000}' > 2100_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2000"\t"$2+2100}' > 2100_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2000"\t"$2+2100}' > 2100_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2100"\t"$2-2000}' > 2100_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2200"\t"$2-2100}' > 2200_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2100"\t"$2+2200}' > 2200_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2100"\t"$2+2200}' > 2200_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2200"\t"$2-2100}' > 2200_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2300"\t"$2-2200}' > 2300_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2200"\t"$2+2300}' > 2300_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2200"\t"$2+2300}' > 2300_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2300"\t"$2-2200}' > 2300_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2400"\t"$2-2300}' > 2400_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2300"\t"$2+2400}' > 2400_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2300"\t"$2+2400}' > 2400_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2400"\t"$2-2300}' > 2400_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2500"\t"$2-2400}' > 2500_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2400"\t"$2+2500}' > 2500_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2400"\t"$2+2500}' > 2500_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2500"\t"$2-2400}' > 2500_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2600"\t"$2-2500}' > 2600_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2500"\t"$2+2600}' > 2600_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2500"\t"$2+2600}' > 2600_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2600"\t"$2-2500}' > 2600_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2700"\t"$2-2600}' > 2700_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2600"\t"$2+2700}' > 2700_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2600"\t"$2+2700}' > 2700_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2700"\t"$2-2600}' > 2700_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2800"\t"$2-2700}' > 2800_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2700"\t"$2+2800}' > 2800_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2700"\t"$2+2800}' > 2800_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2800"\t"$2-2700}' > 2800_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-2900"\t"$2-2800}' > 2900_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2800"\t"$2+2900}' > 2900_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2800"\t"$2+2900}' > 2900_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-2900"\t"$2-2800}' > 2900_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3000"\t"$2-2900}' > 3000_upstream_plus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2+2900"\t"$2+3000}' > 3000_downstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+2900"\t"$2+3000}' > 3000_upstream_minus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2-3000"\t"$2-2900}' > 3000_downstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3100"\t"$2-3000}' > 3100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3000"\t"$2+3100}' > 3100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3200"\t"$2-3100}' > 3200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3100"\t"$2+3200}' > 3200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3300"\t"$2-3200}' > 3300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3200"\t"$2+3300}' > 3300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3400"\t"$2-3300}' > 3400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3300"\t"$2+3400}' > 3400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3500"\t"$2-3400}' > 3500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3400"\t"$2+3500}' > 3500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3600"\t"$2-3500}' > 3600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3500"\t"$2+3600}' > 3600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3700"\t"$2-3600}' > 3700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3600"\t"$2+3700}' > 3700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3800"\t"$2-3700}' > 3800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3700"\t"$2+3800}' > 3800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-3900"\t"$2-3800}' > 3900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3800"\t"$2+3900}' > 3900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4000"\t"$2-3900}' > 4000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+3900"\t"$2+4000}' > 4000_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4100"\t"$2-4000}' > 4100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4000"\t"$2+4100}' > 4100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4200"\t"$2-4100}' > 4200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4100"\t"$2+4200}' > 4200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4300"\t"$2-4200}' > 4300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4200"\t"$2+4300}' > 4300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4400"\t"$2-4300}' > 4400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4300"\t"$2+4400}' > 4400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4500"\t"$2-4400}' > 4500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4400"\t"$2+4500}' > 4500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4600"\t"$2-4500}' > 4600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4500"\t"$2+4600}' > 4600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4700"\t"$2-4600}' > 4700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4600"\t"$2+4700}' > 4700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4800"\t"$2-4700}' > 4800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4700"\t"$2+4800}' > 4800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-4900"\t"$2-4800}' > 4900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4800"\t"$2+4900}' > 4900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5000"\t"$2-4900}' > 5000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+4900"\t"$2+5000}' > 5000_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5100"\t"$2-5000}' > 5100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5000"\t"$2+5100}' > 5100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5200"\t"$2-5100}' > 5200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5100"\t"$2+5200}' > 5200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5300"\t"$2-5200}' > 5300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5200"\t"$2+5300}' > 5300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5400"\t"$2-5300}' > 5400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5300"\t"$2+5400}' > 5400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5500"\t"$2-5400}' > 5500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5400"\t"$2+5500}' > 5500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5600"\t"$2-5500}' > 5600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5500"\t"$2+5600}' > 5600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5700"\t"$2-5600}' > 5700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5600"\t"$2+5700}' > 5700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5800"\t"$2-5700}' > 5800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5700"\t"$2+5800}' > 5800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-5900"\t"$2-5800}' > 5900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5800"\t"$2+5900}' > 5900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6000"\t"$2-5900}' > 6000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+5900"\t"$2+6000}' > 6000_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6100"\t"$2-6000}' > 6100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6000"\t"$2+6100}' > 6100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6200"\t"$2-6100}' > 6200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6100"\t"$2+6200}' > 6200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6300"\t"$2-6200}' > 6300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6200"\t"$2+6300}' > 6300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6400"\t"$2-6300}' > 6400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6300"\t"$2+6400}' > 6400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6500"\t"$2-6400}' > 6500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6400"\t"$2+6500}' > 6500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6600"\t"$2-6500}' > 6600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6500"\t"$2+6600}' > 6600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6700"\t"$2-6600}' > 6700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6600"\t"$2+6700}' > 6700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6800"\t"$2-6700}' > 6800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6700"\t"$2+6800}' > 6800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-6900"\t"$2-6800}' > 6900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6800"\t"$2+6900}' > 6900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7000"\t"$2-6900}' > 7000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+6900"\t"$2+7000}' > 7000_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7100"\t"$2-7000}' > 7100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7000"\t"$2+7100}' > 7100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7200"\t"$2-7100}' > 7200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7100"\t"$2+7200}' > 7200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7300"\t"$2-7200}' > 7300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7200"\t"$2+7300}' > 7300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7400"\t"$2-7300}' > 7400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7300"\t"$2+7400}' > 7400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7500"\t"$2-7400}' > 7500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7400"\t"$2+7500}' > 7500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7600"\t"$2-7500}' > 7600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7500"\t"$2+7600}' > 7600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7700"\t"$2-7600}' > 7700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7600"\t"$2+7700}' > 7700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7800"\t"$2-7700}' > 7800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7700"\t"$2+7800}' > 7800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-7900"\t"$2-7800}' > 7900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7800"\t"$2+7900}' > 7900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8000"\t"$2-7900}' > 8000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+7900"\t"$2+8000}' > 8000_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8100"\t"$2-8000}' > 8100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8000"\t"$2+8100}' > 8100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8200"\t"$2-8100}' > 8200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8100"\t"$2+8200}' > 8200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8300"\t"$2-8200}' > 8300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8200"\t"$2+8300}' > 8300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8400"\t"$2-8300}' > 8400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8300"\t"$2+8400}' > 8400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8500"\t"$2-8400}' > 8500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8400"\t"$2+8500}' > 8500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8600"\t"$2-8500}' > 8600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8500"\t"$2+8600}' > 8600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8700"\t"$2-8600}' > 8700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8600"\t"$2+8700}' > 8700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8800"\t"$2-8700}' > 8800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8700"\t"$2+8800}' > 8800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-8900"\t"$2-8800}' > 8900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8800"\t"$2+8900}' > 8900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9000"\t"$2-8900}' > 9000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+8900"\t"$2+9000}' > 9000_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9100"\t"$2-9000}' > 9100_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9000"\t"$2+9100}' > 9100_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9200"\t"$2-9100}' > 9200_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9100"\t"$2+9200}' > 9200_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9300"\t"$2-9200}' > 9300_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9200"\t"$2+9300}' > 9300_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9400"\t"$2-9300}' > 9400_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9300"\t"$2+9400}' > 9400_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9500"\t"$2-9400}' > 9500_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9400"\t"$2+9500}' > 9500_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9600"\t"$2-9500}' > 9600_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9500"\t"$2+9600}' > 9600_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9700"\t"$2-9600}' > 9700_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9600"\t"$2+9700}' > 9700_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9800"\t"$2-9700}' > 9800_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9700"\t"$2+9800}' > 9800_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-9900"\t"$2-9800}' > 9900_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9800"\t"$2+9900}' > 9900_upstream_minus.bed

cat expression_plus.bed|cut -f 1,2|awk '{print $1"\t"$2-10000"\t"$2-9900}' > 10000_upstream_plus.bed

cat expression_minus.bed|cut -f 1,3|awk '{print $1"\t"$2+9900"\t"$2+10000}' > 10000_upstream_minus.bed

#combine plus and minus strand
cat 100_downstream_minus.bed 100_downstream_plus.bed > 100_downstream.bed

cat 100_upstream_minus.bed 100_upstream_plus.bed > 100_upstream.bed

cat 200_downstream_minus.bed 200_downstream_plus.bed > 200_downstream.bed

cat 200_upstream_minus.bed 200_upstream_plus.bed > 200_upstream.bed

cat 300_downstream_minus.bed 300_downstream_plus.bed > 300_downstream.bed

cat 300_upstream_minus.bed 300_upstream_plus.bed > 300_upstream.bed

cat 400_downstream_minus.bed 400_downstream_plus.bed > 400_downstream.bed

cat 400_upstream_minus.bed 400_upstream_plus.bed > 400_upstream.bed

cat 500_downstream_minus.bed 500_downstream_plus.bed > 500_downstream.bed

cat 500_upstream_minus.bed 500_upstream_plus.bed > 500_upstream.bed

cat 600_downstream_minus.bed 600_downstream_plus.bed > 600_downstream.bed

cat 600_upstream_minus.bed 600_upstream_plus.bed > 600_upstream.bed

cat 700_downstream_minus.bed 700_downstream_plus.bed > 700_downstream.bed

cat 700_upstream_minus.bed 700_upstream_plus.bed > 700_upstream.bed

cat 800_downstream_minus.bed 800_downstream_plus.bed > 800_downstream.bed

cat 800_upstream_minus.bed 800_upstream_plus.bed > 800_upstream.bed

cat 900_downstream_minus.bed 900_downstream_plus.bed > 900_downstream.bed

cat 900_upstream_minus.bed 900_upstream_plus.bed > 900_upstream.bed

cat 1000_downstream_minus.bed 1000_downstream_plus.bed > 1000_downstream.bed

cat 1000_upstream_minus.bed 1000_upstream_plus.bed > 1000_upstream.bed

cat 1100_downstream_minus.bed 1100_downstream_plus.bed > 1100_downstream.bed

cat 1100_upstream_minus.bed 1100_upstream_plus.bed > 1100_upstream.bed

cat 1200_downstream_minus.bed 1200_downstream_plus.bed > 1200_downstream.bed

cat 1200_upstream_minus.bed 1200_upstream_plus.bed > 1200_upstream.bed

cat 1300_downstream_minus.bed 1300_downstream_plus.bed > 1300_downstream.bed

cat 1300_upstream_minus.bed 1300_upstream_plus.bed > 1300_upstream.bed

cat 1400_downstream_minus.bed 1400_downstream_plus.bed > 1400_downstream.bed

cat 1400_upstream_minus.bed 1400_upstream_plus.bed > 1400_upstream.bed

cat 1500_downstream_minus.bed 1500_downstream_plus.bed > 1500_downstream.bed

cat 1500_upstream_minus.bed 1500_upstream_plus.bed > 1500_upstream.bed

cat 1600_downstream_minus.bed 1600_downstream_plus.bed > 1600_downstream.bed

cat 1600_upstream_minus.bed 1600_upstream_plus.bed > 1600_upstream.bed

cat 1700_downstream_minus.bed 1700_downstream_plus.bed > 1700_downstream.bed

cat 1700_upstream_minus.bed 1700_upstream_plus.bed > 1700_upstream.bed

cat 1800_downstream_minus.bed 1800_downstream_plus.bed > 1800_downstream.bed

cat 1800_upstream_minus.bed 1800_upstream_plus.bed > 1800_upstream.bed

cat 1900_downstream_minus.bed 1900_downstream_plus.bed > 1900_downstream.bed

cat 1900_upstream_minus.bed 1900_upstream_plus.bed > 1900_upstream.bed

cat 2000_downstream_minus.bed 2000_downstream_plus.bed > 2000_downstream.bed

cat 2000_upstream_minus.bed 2000_upstream_plus.bed > 2000_upstream.bed

cat 2100_downstream_minus.bed 2100_downstream_plus.bed > 2100_downstream.bed

cat 2100_upstream_minus.bed 2100_upstream_plus.bed > 2100_upstream.bed

cat 2200_downstream_minus.bed 2200_downstream_plus.bed > 2200_downstream.bed

cat 2200_upstream_minus.bed 2200_upstream_plus.bed > 2200_upstream.bed

cat 2300_downstream_minus.bed 2300_downstream_plus.bed > 2300_downstream.bed

cat 2300_upstream_minus.bed 2300_upstream_plus.bed > 2300_upstream.bed

cat 2400_downstream_minus.bed 2400_downstream_plus.bed > 2400_downstream.bed

cat 2400_upstream_minus.bed 2400_upstream_plus.bed > 2400_upstream.bed

cat 2500_downstream_minus.bed 2500_downstream_plus.bed > 2500_downstream.bed

cat 2500_upstream_minus.bed 2500_upstream_plus.bed > 2500_upstream.bed

cat 2600_downstream_minus.bed 2600_downstream_plus.bed > 2600_downstream.bed

cat 2600_upstream_minus.bed 2600_upstream_plus.bed > 2600_upstream.bed

cat 2700_downstream_minus.bed 2700_downstream_plus.bed > 2700_downstream.bed

cat 2700_upstream_minus.bed 2700_upstream_plus.bed > 2700_upstream.bed

cat 2800_downstream_minus.bed 2800_downstream_plus.bed > 2800_downstream.bed

cat 2800_upstream_minus.bed 2800_upstream_plus.bed > 2800_upstream.bed

cat 2900_downstream_minus.bed 2900_downstream_plus.bed > 2900_downstream.bed

cat 2900_upstream_minus.bed 2900_upstream_plus.bed > 2900_upstream.bed

cat 3000_downstream_minus.bed 3000_downstream_plus.bed > 3000_downstream.bed

cat 3000_upstream_minus.bed 3000_upstream_plus.bed > 3000_upstream.bed

cat 3100_upstream_minus.bed 3100_upstream_plus.bed > 3100_upstream.bed

cat 3200_upstream_minus.bed 3200_upstream_plus.bed > 3200_upstream.bed

cat 3300_upstream_minus.bed 3300_upstream_plus.bed > 3300_upstream.bed

cat 3400_upstream_minus.bed 3400_upstream_plus.bed > 3400_upstream.bed

cat 3500_upstream_minus.bed 3500_upstream_plus.bed > 3500_upstream.bed

cat 3600_upstream_minus.bed 3600_upstream_plus.bed > 3600_upstream.bed

cat 3700_upstream_minus.bed 3700_upstream_plus.bed > 3700_upstream.bed

cat 3800_upstream_minus.bed 3800_upstream_plus.bed > 3800_upstream.bed

cat 3900_upstream_minus.bed 3900_upstream_plus.bed > 3900_upstream.bed

cat 4000_upstream_minus.bed 4000_upstream_plus.bed > 4000_upstream.bed

cat 4100_upstream_minus.bed 4100_upstream_plus.bed > 4100_upstream.bed

cat 4200_upstream_minus.bed 4200_upstream_plus.bed > 4200_upstream.bed

cat 4300_upstream_minus.bed 4300_upstream_plus.bed > 4300_upstream.bed

cat 4400_upstream_minus.bed 4400_upstream_plus.bed > 4400_upstream.bed

cat 4500_upstream_minus.bed 4500_upstream_plus.bed > 4500_upstream.bed

cat 4600_upstream_minus.bed 4600_upstream_plus.bed > 4600_upstream.bed

cat 4700_upstream_minus.bed 4700_upstream_plus.bed > 4700_upstream.bed

cat 4800_upstream_minus.bed 4800_upstream_plus.bed > 4800_upstream.bed

cat 4900_upstream_minus.bed 4900_upstream_plus.bed > 4900_upstream.bed

cat 5000_upstream_minus.bed 5000_upstream_plus.bed > 5000_upstream.bed

cat 5100_upstream_minus.bed 5100_upstream_plus.bed > 5100_upstream.bed

cat 5200_upstream_minus.bed 5200_upstream_plus.bed > 5200_upstream.bed

cat 5300_upstream_minus.bed 5300_upstream_plus.bed > 5300_upstream.bed

cat 5400_upstream_minus.bed 5400_upstream_plus.bed > 5400_upstream.bed

cat 5500_upstream_minus.bed 5500_upstream_plus.bed > 5500_upstream.bed

cat 5600_upstream_minus.bed 5600_upstream_plus.bed > 5600_upstream.bed

cat 5700_upstream_minus.bed 5700_upstream_plus.bed > 5700_upstream.bed

cat 5800_upstream_minus.bed 5800_upstream_plus.bed > 5800_upstream.bed

cat 5900_upstream_minus.bed 5900_upstream_plus.bed > 5900_upstream.bed

cat 6000_upstream_minus.bed 6000_upstream_plus.bed > 6000_upstream.bed

cat 6100_upstream_minus.bed 6100_upstream_plus.bed > 6100_upstream.bed

cat 6200_upstream_minus.bed 6200_upstream_plus.bed > 6200_upstream.bed

cat 6300_upstream_minus.bed 6300_upstream_plus.bed > 6300_upstream.bed

cat 6400_upstream_minus.bed 6400_upstream_plus.bed > 6400_upstream.bed

cat 6500_upstream_minus.bed 6500_upstream_plus.bed > 6500_upstream.bed

cat 6600_upstream_minus.bed 6600_upstream_plus.bed > 6600_upstream.bed

cat 6700_upstream_minus.bed 6700_upstream_plus.bed > 6700_upstream.bed

cat 6800_upstream_minus.bed 6800_upstream_plus.bed > 6800_upstream.bed

cat 6900_upstream_minus.bed 6900_upstream_plus.bed > 6900_upstream.bed

cat 7000_upstream_minus.bed 7000_upstream_plus.bed > 7000_upstream.bed

cat 7100_upstream_minus.bed 7100_upstream_plus.bed > 7100_upstream.bed

cat 7200_upstream_minus.bed 7200_upstream_plus.bed > 7200_upstream.bed

cat 7300_upstream_minus.bed 7300_upstream_plus.bed > 7300_upstream.bed

cat 7400_upstream_minus.bed 7400_upstream_plus.bed > 7400_upstream.bed

cat 7500_upstream_minus.bed 7500_upstream_plus.bed > 7500_upstream.bed

cat 7600_upstream_minus.bed 7600_upstream_plus.bed > 7600_upstream.bed

cat 7700_upstream_minus.bed 7700_upstream_plus.bed > 7700_upstream.bed

cat 7800_upstream_minus.bed 7800_upstream_plus.bed > 7800_upstream.bed

cat 7900_upstream_minus.bed 7900_upstream_plus.bed > 7900_upstream.bed

cat 8000_upstream_minus.bed 8000_upstream_plus.bed > 8000_upstream.bed

cat 8100_upstream_minus.bed 8100_upstream_plus.bed > 8100_upstream.bed

cat 8200_upstream_minus.bed 8200_upstream_plus.bed > 8200_upstream.bed

cat 8300_upstream_minus.bed 8300_upstream_plus.bed > 8300_upstream.bed

cat 8400_upstream_minus.bed 8400_upstream_plus.bed > 8400_upstream.bed

cat 8500_upstream_minus.bed 8500_upstream_plus.bed > 8500_upstream.bed

cat 8600_upstream_minus.bed 8600_upstream_plus.bed > 8600_upstream.bed

cat 8700_upstream_minus.bed 8700_upstream_plus.bed > 8700_upstream.bed

cat 8800_upstream_minus.bed 8800_upstream_plus.bed > 8800_upstream.bed

cat 8900_upstream_minus.bed 8900_upstream_plus.bed > 8900_upstream.bed

cat 9000_upstream_minus.bed 9000_upstream_plus.bed > 9000_upstream.bed

cat 9100_upstream_minus.bed 9100_upstream_plus.bed > 9100_upstream.bed

cat 9200_upstream_minus.bed 9200_upstream_plus.bed > 9200_upstream.bed

cat 9300_upstream_minus.bed 9300_upstream_plus.bed > 9300_upstream.bed

cat 9400_upstream_minus.bed 9400_upstream_plus.bed > 9400_upstream.bed

cat 9500_upstream_minus.bed 9500_upstream_plus.bed > 9500_upstream.bed

cat 9600_upstream_minus.bed 9600_upstream_plus.bed > 9600_upstream.bed

cat 9700_upstream_minus.bed 9700_upstream_plus.bed > 9700_upstream.bed

cat 9800_upstream_minus.bed 9800_upstream_plus.bed > 9800_upstream.bed

cat 9900_upstream_minus.bed 9900_upstream_plus.bed > 9900_upstream.bed

cat 10000_upstream_minus.bed 10000_upstream_plus.bed > 10000_upstream.bed

awk '$2+0<0{$2=0}1' 100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/100_upstream.bed

awk '$2+0<0{$2=0}1' 100_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/100_downstream.bed

awk '$2+0<0{$2=0}1' 200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/200_upstream.bed

awk '$2+0<0{$2=0}1' 200_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/200_downstream.bed

awk '$2+0<0{$2=0}1' 300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/300_upstream.bed

awk '$2+0<0{$2=0}1' 300_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/300_downstream.bed

awk '$2+0<0{$2=0}1' 400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/400_upstream.bed

awk '$2+0<0{$2=0}1' 400_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/400_downstream.bed

awk '$2+0<0{$2=0}1' 500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/500_upstream.bed

awk '$2+0<0{$2=0}1' 500_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/500_downstream.bed

awk '$2+0<0{$2=0}1' 600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/600_upstream.bed

awk '$2+0<0{$2=0}1' 600_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/600_downstream.bed

awk '$2+0<0{$2=0}1' 700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/700_upstream.bed

awk '$2+0<0{$2=0}1' 700_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/700_downstream.bed

awk '$2+0<0{$2=0}1' 800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/800_upstream.bed

awk '$2+0<0{$2=0}1' 800_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/800_downstream.bed

awk '$2+0<0{$2=0}1' 900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/900_upstream.bed

awk '$2+0<0{$2=0}1' 900_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/900_downstream.bed

awk '$2+0<0{$2=0}1' 1000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1000_upstream.bed

awk '$2+0<0{$2=0}1' 1000_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1000_downstream.bed

awk '$2+0<0{$2=0}1' 1100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1100_upstream.bed

awk '$2+0<0{$2=0}1' 1100_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1100_downstream.bed

awk '$2+0<0{$2=0}1' 1200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1200_upstream.bed

awk '$2+0<0{$2=0}1' 1200_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1200_downstream.bed

awk '$2+0<0{$2=0}1' 1300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1300_upstream.bed

awk '$2+0<0{$2=0}1' 1300_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1300_downstream.bed

awk '$2+0<0{$2=0}1' 1400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1400_upstream.bed

awk '$2+0<0{$2=0}1' 1400_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1400_downstream.bed

awk '$2+0<0{$2=0}1' 1500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1500_upstream.bed

awk '$2+0<0{$2=0}1' 1500_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1500_downstream.bed

awk '$2+0<0{$2=0}1' 1600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1600_upstream.bed

awk '$2+0<0{$2=0}1' 1600_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1600_downstream.bed

awk '$2+0<0{$2=0}1' 1700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1700_upstream.bed

awk '$2+0<0{$2=0}1' 1700_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1700_downstream.bed

awk '$2+0<0{$2=0}1' 1800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1800_upstream.bed

awk '$2+0<0{$2=0}1' 1800_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1800_downstream.bed

awk '$2+0<0{$2=0}1' 1900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1900_upstream.bed

awk '$2+0<0{$2=0}1' 1900_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/1900_downstream.bed

awk '$2+0<0{$2=0}1' 2000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2000_upstream.bed

awk '$2+0<0{$2=0}1' 2000_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2000_downstream.bed

awk '$2+0<0{$2=0}1' 2100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2100_upstream.bed

awk '$2+0<0{$2=0}1' 2100_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2100_downstream.bed

awk '$2+0<0{$2=0}1' 2200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2200_upstream.bed

awk '$2+0<0{$2=0}1' 2200_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2200_downstream.bed

awk '$2+0<0{$2=0}1' 2300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2300_upstream.bed

awk '$2+0<0{$2=0}1' 2300_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2300_downstream.bed

awk '$2+0<0{$2=0}1' 2400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2400_upstream.bed

awk '$2+0<0{$2=0}1' 2400_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2400_downstream.bed

awk '$2+0<0{$2=0}1' 2500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2500_upstream.bed

awk '$2+0<0{$2=0}1' 2500_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2500_downstream.bed

awk '$2+0<0{$2=0}1' 2600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2600_upstream.bed

awk '$2+0<0{$2=0}1' 2600_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2600_downstream.bed

awk '$2+0<0{$2=0}1' 2700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2700_upstream.bed

awk '$2+0<0{$2=0}1' 2700_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2700_downstream.bed

awk '$2+0<0{$2=0}1' 2800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2800_upstream.bed

awk '$2+0<0{$2=0}1' 2800_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2800_downstream.bed

awk '$2+0<0{$2=0}1' 2900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2900_upstream.bed

awk '$2+0<0{$2=0}1' 2900_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/2900_downstream.bed

awk '$2+0<0{$2=0}1' 3000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3000_upstream.bed

awk '$2+0<0{$2=0}1' 3000_downstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3000_downstream.bed

awk '$2+0<0{$2=0}1' 3100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3100_upstream.bed

awk '$2+0<0{$2=0}1' 3200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3200_upstream.bed

awk '$2+0<0{$2=0}1' 3300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3300_upstream.bed

awk '$2+0<0{$2=0}1' 3400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3400_upstream.bed

awk '$2+0<0{$2=0}1' 3500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3500_upstream.bed

awk '$2+0<0{$2=0}1' 3600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3600_upstream.bed

awk '$2+0<0{$2=0}1' 3700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3700_upstream.bed

awk '$2+0<0{$2=0}1' 3800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3800_upstream.bed

awk '$2+0<0{$2=0}1' 3900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/3900_upstream.bed

awk '$2+0<0{$2=0}1' 4000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4000_upstream.bed

awk '$2+0<0{$2=0}1' 4100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4100_upstream.bed

awk '$2+0<0{$2=0}1' 4200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4200_upstream.bed

awk '$2+0<0{$2=0}1' 4300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4300_upstream.bed

awk '$2+0<0{$2=0}1' 4400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4400_upstream.bed

awk '$2+0<0{$2=0}1' 4500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4500_upstream.bed

awk '$2+0<0{$2=0}1' 4600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4600_upstream.bed

awk '$2+0<0{$2=0}1' 4700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4700_upstream.bed

awk '$2+0<0{$2=0}1' 4800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4800_upstream.bed

awk '$2+0<0{$2=0}1' 4900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/4900_upstream.bed

awk '$2+0<0{$2=0}1' 5000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5000_upstream.bed

awk '$2+0<0{$2=0}1' 5100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5100_upstream.bed

awk '$2+0<0{$2=0}1' 5200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5200_upstream.bed

awk '$2+0<0{$2=0}1' 5300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5300_upstream.bed

awk '$2+0<0{$2=0}1' 5400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5400_upstream.bed

awk '$2+0<0{$2=0}1' 5500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5500_upstream.bed

awk '$2+0<0{$2=0}1' 5600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5600_upstream.bed

awk '$2+0<0{$2=0}1' 5700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5700_upstream.bed

awk '$2+0<0{$2=0}1' 5800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5800_upstream.bed

awk '$2+0<0{$2=0}1' 5900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/5900_upstream.bed

awk '$2+0<0{$2=0}1' 6000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6000_upstream.bed

awk '$2+0<0{$2=0}1' 6100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6100_upstream.bed

awk '$2+0<0{$2=0}1' 6200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6200_upstream.bed

awk '$2+0<0{$2=0}1' 6300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6300_upstream.bed

awk '$2+0<0{$2=0}1' 6400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6400_upstream.bed

awk '$2+0<0{$2=0}1' 6500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6500_upstream.bed

awk '$2+0<0{$2=0}1' 6600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6600_upstream.bed

awk '$2+0<0{$2=0}1' 6700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6700_upstream.bed

awk '$2+0<0{$2=0}1' 6800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6800_upstream.bed

awk '$2+0<0{$2=0}1' 6900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/6900_upstream.bed

awk '$2+0<0{$2=0}1' 7000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7000_upstream.bed

awk '$2+0<0{$2=0}1' 7100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7100_upstream.bed

awk '$2+0<0{$2=0}1' 7200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7200_upstream.bed

awk '$2+0<0{$2=0}1' 7300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7300_upstream.bed

awk '$2+0<0{$2=0}1' 7400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7400_upstream.bed

awk '$2+0<0{$2=0}1' 7500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7500_upstream.bed

awk '$2+0<0{$2=0}1' 7600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7600_upstream.bed

awk '$2+0<0{$2=0}1' 7700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7700_upstream.bed

awk '$2+0<0{$2=0}1' 7800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7800_upstream.bed

awk '$2+0<0{$2=0}1' 7900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/7900_upstream.bed

awk '$2+0<0{$2=0}1' 8000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8000_upstream.bed

awk '$2+0<0{$2=0}1' 8100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8100_upstream.bed

awk '$2+0<0{$2=0}1' 8200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8200_upstream.bed

awk '$2+0<0{$2=0}1' 8300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8300_upstream.bed

awk '$2+0<0{$2=0}1' 8400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8400_upstream.bed

awk '$2+0<0{$2=0}1' 8500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8500_upstream.bed

awk '$2+0<0{$2=0}1' 8600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8600_upstream.bed

awk '$2+0<0{$2=0}1' 8700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8700_upstream.bed

awk '$2+0<0{$2=0}1' 8800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8800_upstream.bed

awk '$2+0<0{$2=0}1' 8900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/8900_upstream.bed

awk '$2+0<0{$2=0}1' 9000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9000_upstream.bed

awk '$2+0<0{$2=0}1' 9100_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9100_upstream.bed

awk '$2+0<0{$2=0}1' 9200_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9200_upstream.bed

awk '$2+0<0{$2=0}1' 9300_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9300_upstream.bed

awk '$2+0<0{$2=0}1' 9400_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9400_upstream.bed

awk '$2+0<0{$2=0}1' 9500_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9500_upstream.bed

awk '$2+0<0{$2=0}1' 9600_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9600_upstream.bed

awk '$2+0<0{$2=0}1' 9700_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9700_upstream.bed

awk '$2+0<0{$2=0}1' 9800_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9800_upstream.bed

awk '$2+0<0{$2=0}1' 9900_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/9900_upstream.bed

awk '$2+0<0{$2=0}1' 10000_upstream.bed |sed 's/ /\t/'|sed 's/ /\t/' | grep -v "-" > final/10000_upstream.bed

