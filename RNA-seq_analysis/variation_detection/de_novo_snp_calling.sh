#!/bin/bash
#SBATCH --account=de_novo_calling
#SBATCH --time=0
#SBATCH --mem=40000
#SBATCH --ntasks=1
#SBATCH --nodes=1
#SBATCH --constraint=normalmem
#SBATCH --output=output_Sample_A_tumor_realign.txt
#SBATCH --error=error_output_Sample_A_tumor_realign.txt
#SBATCH --job-name=de_novo_calling
#SBATCH --partition=ABGC_Std
#SBATCH --mail-type=ALL
#SBATCH --mail-user=shocker8786@gmail.com

#build STAR genome index
genomeDir=/path/to/STAR/original
mkdir $genomeDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles /path/to/reference.fa --runThreadN 10 --sjdbGTFfile /path/to/Sus_scrofa.Sscrofa10.2.81.gtf --sjdbOverhang 99

#align
runDir=/path/to/Sample_A_tumor/1pass
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_tumor_trimmed_1.fq.gz /path/to/Sample_A_tumor_trimmed_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#create new index from first pass
genomeDir=/path/to/STAR/Sample_A_tumor_2pass
mkdir $genomeDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles /path/to/reference.fa --sjdbFileChrStartEnd $runDir/SJ.out.tab --sjdbGTFfile /path/to/Sus_scrofa.Sscrofa10.2.81.gtf --sjdbOverhang 99 --runThreadN 10

#produce final alignment
runDir=/path/to/Sample_A_tumor/2pass
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_tumor_trimmed_1.fq.gz /path/to/Sample_A_tumor_trimmed_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#align unpaired
genomeDir=/path/to/STAR/original
runDir=/path/to/Sample_A_tumor/unpaired
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_tumor_trimmed_unpaired_1.fq.gz,/path/to/Sample_A_tumor_trimmed_unpaired_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#create new index from first pass
genomeDir=/path/to/STAR/Sample_A_tumor_up_2pass
mkdir $genomeDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles /path/to/reference.fa --sjdbFileChrStartEnd SJ.out.tab --sjdbGTFfile /path/to/Sus_scrofa.Sscrofa10.2.81.gtf --sjdbOverhang 99 --runThreadN 10

#produce final unpaired alignment
runDir=/path/to/Sample_A_tumor/unpaired_2pass
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_tumor_trimmed_unpaired_1.fq.gz,/path/to/Sample_A_tumor_trimmed_unpaired_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#combine bam files
cd /path/to/working_directory
samtools view -bS Sample_A_tumor/2pass/Aligned.out.sam > Sample_A_tumor/2pass/Aligned.out.bam
samtools view -bS Sample_A_tumor/unpaired_2pass/Aligned.out.sam > Sample_A_tumor/unpaired_2pass/Aligned.out.bam
samtools merge Sample_A_tumor/final_hits.bam Sample_A_tumor/2pass/Aligned.out.bam Sample_A_tumor/unpaired_2pass/Aligned.out.bam

#add read groups, sort, mark duplicates, create index
java -Xms16g -jar ~/bin/picard-tools-1.119/AddOrReplaceReadGroups.jar I=Sample_A_tumor/final_hits.bam O=Sample_A_tumor/rg_added_sorted.bam SO=coordinate RGID=Sample_A_tumor RGLB=Sample_A_Tumor RGPL=Illumina RGPU=HiSeq2000 RGSM=Sample_A

java -Xms16g -jar ~/bin/picard-tools-1.119/MarkDuplicates.jar I=Sample_A_tumor/rg_added_sorted.bam O=Sample_A_tumor/dedupped.bam M=Sample_A_tumor/metrics.txt CREATE_INDEX=true REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=SILENT

#split reads into exon segments
java -Xms16g -jar ~/bin/GenomeAnalysisTK.jar -T SplitNCigarReads -R /path/to/reference.fa -I Sample_A_tumor/dedupped.bam -o Sample_A_tumor/split.bam -rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 -U ALLOW_N_CIGAR_READS

#Realign with GATK
java -Xms16g -jar ~/bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /path/to/reference.fa -I Sample_A_tumor/split.bam -o Sample_A_tumor/no_dup.intervals

java -Xms16g -jar ~/bin/GenomeAnalysisTK.jar -T IndelRealigner -R /path/to/reference.fa -I Sample_A_tumor/split.bam -targetIntervals Sample_A_tumor/no_dup.intervals -o Sample_A_tumor/realigned.bam

#Index bam file for GATK analysis
samtools index Sample_A_tumor/realigned.bam

#Variant Calling
java -Xms16g -Xmx25g -jar ~/bin/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar -T HaplotypeCaller -R /path/to/reference.fa -I Sample_A_tumor/realigned.bam -dontUseSoftClippedBases -stand_call_conf 20.0 -stand_emit_conf 20.0 -o Sample_A_tumor/GATK.vcf

#Filter variation by quality (20) and depth min 10 reads, min 3 reads calling variant
vcfutils.pl varFilter -d 10 -a 3 -Q 20 Sample_A_tumor/GATK.vcf > Sample_A_tumor/GATK_d10_v3.vcf

#more filters 3 snps within 35bp, and remove strand bias
java -Xms16g -jar ~/bin/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar -T VariantFiltration -R /path/to/reference.fa -V Sample_A_tumor/GATK_d10_v3.vcf -window 35 -cluster 3 -filterName FS -filter "FS > 30.0" -o Sample_A_tumor/GATK_3_35.vcf
 
#2 snps within 20bp
java -Xms16g -jar ~/bin/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar -T VariantFiltration -R /path/to/reference.fa -V Sample_A_tumor/GATK_3_35.vcf -window 20 -cluster 2 -o Sample_A_tumor/GATK_2_20.vcf

# snps within 15bp of indels
bcftools filter -g 15 -o Sample_A_tumor/GATK_indel_15.vcf Sample_A_tumor/GATK_2_20.vcf

#remove indels
vcftools --vcf Sample_A_tumor/GATK_indel_15.vcf --remove-indels --recode --recode-INFO-all --out Sample_A_tumor/GATK_snps.vcf

#rename file
mv Sample_A_tumor/GATK_snps.vcf.recode.vcf Sample_A_tumor/GATK_snps.vcf

#annotate snps to genes
java -Xms16g -jar ~/bin/snpEff/snpEff.jar -stats Sample_A_tumor/snpEff_genes.txt -no-downstream -no-intergenic -no-intron -no-upstream -no-utr Sscrofa10.2.79 Sample_A_tumor/GATK_snps.vcf > Sample_A_tumor/GATK_snpEff_genes.vcf

#filter out synonymous snps and snps not passing filters
grep -v synonymous Sample_A_tumor/GATK_snpEff_genes.vcf|grep PASS|grep ANN > Sample_A_tumor/GATK_non_synon_snps.txt
grep \# Sample_A_tumor/GATK_snpEff_genes.vcf > Sample_A_tumor/header.vcf
cat Sample_A_tumor/header.vcf Sample_A_tumor/GATK_non_synon_snps.txt > Sample_A_tumor/GATK_non_synon_snps.vcf

#create interval file
cut -f 1,2 Sample_A_tumor/GATK_non_synon_snps.txt |awk '{print $1":"$2}' > Sample_A_tumor/non_synon.intervals

#re-call SNPs
java -Xms16g -Xmx25g -jar ~/bin/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar -T HaplotypeCaller -R /path/to/reference.fa -I Sample_A_tumor/realigned.bam -dontUseSoftClippedBases -stand_call_conf 20.0 -stand_emit_conf 20.0 -ip 100 -L Sample_A_tumor/non_synon.intervals -o Sample_A_tumor/recall_padding.vcf -bamout Sample_A_tumor/recall_padding.bam

#identify final SNP list
grep -v \# Sample_A_tumor/recall_padding.vcf|awk '{print $1":"$2}'|grep -Fwf Sample_A_tumor/non_synon.intervals > Sample_A_tumor/final_snps.intervals

#locate snps in tumor not present in controls.

#align
genomeDir=/path/to/STAR/original
runDir=/path/to/Sample_A_control/1pass
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_control_trimmed_1.fq.gz /path/to/Sample_A_control_trimmed_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#create new index from first pass
genomeDir=/path/to/STAR/Sample_A_control_2pass
mkdir $genomeDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles /path/to/reference.fa --sjdbFileChrStartEnd $runDir/SJ.out.tab --sjdbGTFfile /path/to/Sus_scrofa.Sscrofa10.2.81.gtf --sjdbOverhang 99 --runThreadN 10

#produce final alignment
runDir=/path/to/Sample_A_control/2pass
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_control_trimmed_1.fq.gz /path/to/Sample_A_control_trimmed_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#align unpaired
genomeDir=/path/to/STAR/original
runDir=/path/to/Sample_A_control/unpaired
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_control_trimmed_unpaired_1.fq.gz,/path/to/Sample_A_control_trimmed_unpaired_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#create new index from first pass
genomeDir=/path/to/STAR/Sample_A_control_up_2pass
mkdir $genomeDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --runMode genomeGenerate --genomeDir $genomeDir --genomeFastaFiles /path/to/reference.fa --sjdbFileChrStartEnd SJ.out.tab --sjdbGTFfile /path/to/Sus_scrofa.Sscrofa10.2.81.gtf --sjdbOverhang 99 --runThreadN 10

#produce final unpaired alignment
runDir=/path/to/Sample_A_control/unpaired_2pass
mkdir $runDir
cd $runDir
/home/WUR/schac001/STAR-STAR_2.4.2a/source/STAR --genomeDir $genomeDir --readFilesIn /path/to/Sample_A_control_trimmed_unpaired_1.fq.gz,/path/to/Sample_A_control_trimmed_unpaired_2.fq.gz --runThreadN 10 --readFilesCommand zcat

#combine bam files
cd /path/to/working_directory
samtools view -bS Sample_A_control/2pass/Aligned.out.sam > Sample_A_control/2pass/Aligned.out.bam
samtools view -bS Sample_A_control/unpaired_2pass/Aligned.out.sam > Sample_A_control/unpaired_2pass/Aligned.out.bam
samtools merge Sample_A_control/final_hits.bam Sample_A_control/2pass/Aligned.out.bam Sample_A_control/unpaired_2pass/Aligned.out.bam

#add read groups, sort, mark duplicates, create index
java -Xms16g -jar ~/bin/picard-tools-1.119/AddOrReplaceReadGroups.jar I=Sample_A_control/final_hits.bam O=Sample_A_control/rg_added_sorted.bam SO=coordinate RGID=Sample_A_control RGLB=Sample_A_Control RGPL=Illumina RGPU=HiSeq2000 RGSM=Sample_A

java -Xms16g -jar ~/bin/picard-tools-1.119/MarkDuplicates.jar I=Sample_A_control/rg_added_sorted.bam O=Sample_A_control/dedupped.bam M=Sample_A_control/metrics.txt CREATE_INDEX=true REMOVE_DUPLICATES=true ASSUME_SORTED=true VALIDATION_STRINGENCY=SILENT

#split reads into exon segments
java -Xms16g -jar ~/bin/GenomeAnalysisTK.jar -T SplitNCigarReads -R /path/to/reference.fa -I Sample_A_control/dedupped.bam -o Sample_A_control/split.bam -rf ReassignOneMappingQuality -RMQF 255 -RMQT 60 -U ALLOW_N_CIGAR_READS

#Realign with GATK
java -Xms16g -jar ~/bin/GenomeAnalysisTK.jar -T RealignerTargetCreator -R /path/to/reference.fa -I Sample_A_control/split.bam -o Sample_A_control/no_dup.intervals

java -Xms16g -jar ~/bin/GenomeAnalysisTK.jar -T IndelRealigner -R /path/to/reference.fa -I Sample_A_control/split.bam -targetIntervals Sample_A_control/no_dup.intervals -o Sample_A_control/realigned.bam

#Index bam file for GATK analysis
samtools index Sample_A_control/realigned.bam

#emit all covered sites from final SNP list
java -Xms16g -Xmx25g -jar ~/bin/GenomeAnalysisTK-3.4-46/GenomeAnalysisTK.jar -T HaplotypeCaller -R /path/to/reference.fa -I Sample_A_control/realigned.bam -dontUseSoftClippedBases -stand_call_conf 20.0 -stand_emit_conf 20.0 -ERC BP_RESOLUTION -ip 100 -L Sample_A_tumor/final_snps.intervals -o Sample_A_control/BP_RES_padding_late.vcf -bamout Sample_A_control/BP_RES_padding_late.bam

#Filter for SNP sites
grep -v \# Sample_A_control/BP_RES_padding_late.vcf|awk '{print $1":"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10}'|grep -Fwf Sample_A_tumor/final_snps.intervals > Sample_A_control/control_output_late.txt

#Filter for potential de novo positions
cut -f 1,2,3,4,5 Sample_A_control/control_output_late.txt |grep -v ,|cut -f 1 > Sample_A_control/potential_de_novo_sites_late.cov
grep -Fwf Sample_A_control/potential_de_novo_sites_late.cov Sample_A_control/control_output_late.txt > Sample_A_control/potential_de_novo_sites_late.txt
sed 's/:/\t/g' Sample_A_control/potential_de_novo_sites_late.txt |awk '($16>=10)'|cut -f 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17 > Sample_A_control/potential_de_novo_sites_late_10.txt

#Filter sites with all reads calling reference
grep ,0 Sample_A_control/potential_de_novo_sites_late_10.txt > Sample_A_control/de_novo_sites_late.txt

#pull de novo snps 
awk '{print $1":"$2}' Sample_A_control/de_novo_sites_late.txt > Sample_A_control/de_novo_sites_late.cov
awk '{print $1":"$2"\t"$3"\t"$4"\t"$5"\t"$6"\t"$7"\t"$8"\t"$9"\t"$10}' Sample_A_tumor/GATK_non_synon_snps.txt > Sample_A_tumor/non_synon_snps.txt
grep -Fwf Sample_A_control/de_novo_sites_late.cov Sample_A_tumor/non_synon_snps.txt > Sample_A_tumor/de_novo_sites.txt

#Need to determine expression levels for genes containing mutations

# pull genes containing mutations, the mutation, and resulting protein change

