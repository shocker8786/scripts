#!/bin/bash
#PBS -j oe
#PBS -N md5deep
#PBS -M kschach2@illinois.edu
#PBS -m abe

#Create md5sums
#$HOME/bin/md5deep -r $HOME/Cirrhosis/RNAseq/ > $HOME/Cirrhosis/RNAseq/cirrhosis.md5

#Compare md5sums
$HOME/bin/md5deep -X /home/labs/schook_lab/cirrhosis.md5 -r $HOME/Cirrhosis/RNAseq/
