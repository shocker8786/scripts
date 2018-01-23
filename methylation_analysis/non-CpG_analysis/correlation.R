#load files into R
Sample1_TSS_meth_expression = read.table("Sample1_TSS.corr")
#perform correlation analysis
cor.test(Sample1_TSS_meth_expression$V1,Sample1_TSS_meth_expression$V2, method="spearman",exact=FALSE)

save.image()
