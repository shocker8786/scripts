library(methylKit)

#load files
file.list=list("Sample1_final.txt","Sample2_final.txt","Sample3_final.txt","Sample4_final.txt")

myobj=read(file.list,pipeline=list(fraction=TRUE,chr.col=1,start.col=2,end.col=2,coverage.col=5,strand.col=3,freqC.col=6),sample.id=list("s1","s2","s3","s4"),assembly="ssc",treatment=c(0,0,1,1))

save.image()
#produce methylation histogram
jpeg('Sample1_histogram.jpg')
getMethylationStats(myobj[[1]],plot=T,both.strands=F)
dev.off()

jpeg('Sample2_histogram.jpg')
getMethylationStats(myobj[[2]],plot=T,both.strands=F)
dev.off()

jpeg('Sample3_histogram.jpg')
getMethylationStats(myobj[[3]],plot=T,both.strands=F)
dev.off()

jpeg('Sample4_histogram.jpg')
getMethylationStats(myobj[[4]],plot=T,both.strands=F)
dev.off()

#filter out highly covered bases
filtered.myobj=filterByCoverage(myobj,lo.count=10,lo.perc=NULL,hi.count=NULL,hi.perc=99.9)

#filter data for only shared sites
meth=unite(filtered.myobj, destrand=FALSE)

save.image()
#correlation between samples
jpeg('Correlations.jpg')
getCorrelation(meth,plot=T)
dev.off()

#cluster samples
jpeg('Cluster.jpg')
clusterSamples(meth, dist="correlation", method="ward", plot=TRUE)
dev.off()

#produce 100bp tiles for DMRs
tiles=tileMethylCounts(filtered.myobj,win.size=100,step.size=100)
regions=unite(tiles, destrand=FALSE)

save.image()
#correlation between samples
jpeg('Correlation_regions.jpg')
getCorrelation(regions,plot=T)
dev.off()

#cluster samples
jpeg('Cluster_regions.jpg')
clusterSamples(regions, dist="correlation", method="ward", plot=TRUE)
dev.off()

#find differentially methylated sites
myDiffSites=calculateDiffMeth(meth,num.cores=4)

save.image()
#find differentially methylated regions
myDiffRegions=calculateDiffMeth(regions,num.cores=4)

save.image()
#get hyper methylated sites/regions
myDiff25p.hypersites=get.methylDiff(myDiffSites,difference=25,qvalue=0.01,type="hyper")
myDiff25p.hyperregions=get.methylDiff(myDiffRegions,difference=25,qvalue=0.01,type="hyper")

#get hypo methylated sites/regions
myDiff25p.hyposites=get.methylDiff(myDiffSites,difference=25,qvalue=0.01,type="hypo")
myDiff25p.hyporegions=get.methylDiff(myDiffRegions,difference=25,qvalue=0.01,type="hypo")

#plot diff meth by chromosome
jpeg('chromosomes_sites.jpg')
diffMethPerChr(myDiffSites,plot=TRUE,qvalue.cutoff=0.01,meth.cutoff=25)
dev.off()

jpeg('chromosomes_regions.jpg')
diffMethPerChr(myDiffRegions,plot=TRUE,qvalue.cutoff=0.01,meth.cutoff=25)
dev.off()

#extract differential methylation
write.table(myDiff25p.hypersites,"diff_sites_hyper.txt",sep="\t")
write.table(myDiff25p.hyperregions,"diff_regions_hyper.txt",sep="\t")
write.table(myDiff25p.hyposites,"diff_sites_hypo.txt",sep="\t")
write.table(myDiff25p.hyporegions,"diff_regions_hypo.txt",sep="\t")

save.image()
