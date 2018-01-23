library(pvclust)
data <- read.table("Samples1-5.txt", header=TRUE, sep="\t")
result <- pvclust(data, method.dist="cor", method.hclust="ward.D2", nboot=10000)

save.image()

