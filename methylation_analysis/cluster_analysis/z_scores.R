values <- read.table("Samples.txt",header=TRUE,sep="\t")
tvalues <- t(values)
temp <- scale(tvalues,center=TRUE,scale=TRUE)
z_scores <- t(temp)
