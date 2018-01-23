library(gplots)
my_palette <- colorRampPalette(c("red", "black", "green"))(n = 299)
heatmap.2(z_scores,labRow=FALSE,col=my_palette,density.info="none",trace="none")
