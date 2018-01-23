#!/bin/sh

sort -k1,1 -k2,2n Sample1_non_CpG.bed > Sample1_sorted.bed

bedToBigBed -as=Sample1.as -type=bed9+2 Sample1_sorted.bed ../susScr3.chrom.sizes Sample1.bb
