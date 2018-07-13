library(DESeq2)
library(gplots)
library(RColorBrewer)
#inputting the raw count table
ct <- read.table("/Users/alviyasmin/Desktop/new_exp.txt")
#first column contains the gene names. assigning the first column to "nams"
nams = ct[,1]
#deleting the first column containing gene names 
ct <- ct[,-1]
#naming the columns with sample ids
colnames(ct) <- c("0112","0113","0996","0997","0998", "0921", "0925","0993","0994","0995")
#naming the rows with gene names. some gene name repeats, thats why unique command was used to make the gene names unique for the rownames)
rownames(ct) = make.names(nams, unique=TRUE)
#putting the data in the matrix form 
ctnew <-as.matrix(ct)
#factoring the conditions with 2 levels 
conds <- factor( c( "untreated", "untreated", "untreated","untreated","untreated", "treated","treated" ,"treated","treated","treated") )
#dataframing the conditions
colData <- DataFrame(conds)
dds <- DESeqDataSetFromMatrix(countData = ctnew,colData = colData,design = ~ conds)
dds <- DESeq(dds)
#normalization
normdata <- counts(dds, normalized=TRUE)
#DESeqresults producing basemean, log2FoldChange, lfcSE, stat, pvaluue, padj
res <- results(dds)
#arranging the results in the order of padj value (optional)
res <- res[order(res$padj),]
#IF yu want to see the results
head(res)
#if you want to see the number of Differential expression genes
table(res$padj<0.05)



#leaving out "all zeros"rows and keeping the rest for the heatmap
g <- normdata[which(rowSums(normdata) > 0),] 
#producing the heatmap of all genes.
hr <- hclust(as.dist(1-cor(t(g), method="pearson")),
             method="complete")
hc <- hclust(as.dist(1-cor(g, method="spearman")), method="complete")
heatmap.2(g, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc),
          scale="row", density.info="none",col=redgreen(75),trace="none", cexRow=0.5)
g[rev(hr$labels[hr$order]), hc$labels[hc$order]]
select <- rownames(subset(df))

#heatmap of the differential expression
#extracting the results if padj is less than 0.05 
df <- res[which(res$padj<0.05),]
#extracting the rownames(gene names) of the differential expression genes
select <- rownames(subset(df))
#differential genes with normizalized values for all samples
deg <- normdata[select,]
#producing the heatmap of differential expression genes
hr <- hclust(as.dist(1-cor(t(deg), method="pearson")),
             method="complete")
hc <- hclust(as.dist(1-cor(deg, method="spearman")), method="complete")
heatmap.2(deg, Rowv=as.dendrogram(hr), Colv=as.dendrogram(hc),
          scale="row", density.info="none",col=redgreen(75),trace="none", cexRow=0.5)
deg[rev(hr$labels[hr$order]), hc$labels[hc$order]]
