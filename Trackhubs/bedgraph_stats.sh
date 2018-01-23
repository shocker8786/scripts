#!/bin/sh

cat /media/schac001/Kyle\ Methylome\ Data/Methylation_Study/TJ_Tabasco_samples/final/Sample1_minus.bedgraph|cut -f 4 > bedgraph/fat_minus.cov

R -q -e "x <- read.csv('bedgraph/fat_minus.cov', header = F); summary(x); sd(x[ , 1])"

cat /media/schac001/Kyle\ Methylome\ Data/Methylation_Study/TJ_Tabasco_samples/final/Sample1_plus.bedgraph|cut -f 4 > bedgraph/fat_plus.cov

R -q -e "x <- read.csv('bedgraph/fat_plus.cov', header = F); summary(x); sd(x[ , 1])"

