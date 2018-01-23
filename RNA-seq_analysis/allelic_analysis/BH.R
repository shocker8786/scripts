sample1 <- read.table("sample1_pvals.txt",header=TRUE,sep="\t")
sample1.trans <-as.matrix(sample1)
sample1.final <- p.adjust(sample1.trans, method="BH")
write.table(sample1.final, "sample1_corrected.pval",sep="\t")

save.image()
