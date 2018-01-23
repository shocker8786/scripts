x <- read.csv('Sample1.cov', header = F); sd(x[ , 1])

x <- read.csv('Sample1_islands.cov', header = F); sd(x[ , 1])

x <- read.csv('Sample1_shores.cov', header = F); sd(x[ , 1])

x <- read.csv('Sample1_genes.cov', header = F); sd(x[ , 1])

x <- read.csv('Sample1_exons.cov', header = F); sd(x[ , 1])

x <- read.csv('Sample1_introns.cov', header = F); sd(x[ , 1])

save.image()
