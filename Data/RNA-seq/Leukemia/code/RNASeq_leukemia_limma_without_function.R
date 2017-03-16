library("limma")
library(edgeR)
setwd("C:/Users/rawnak/Documents/team_Bloodies/Data/RNA-seq/Leukemia")
AML=read.table('AML/AML_expected_count_data.csv', sep = ',', header=TRUE, row.names=1)
CLL=read.table('CLL/CLL_expected_count_data.csv',sep = ',', header=TRUE, row.names=1)
new_AML <- AML[,-1]
rownames(new_AML) <- AML[,1]
new_CLL <- CLL[,-1]
rownames(new_CLL)<- CLL[,1]
counts <- cbinf(new_AML,new_CLL)

groups <- factor(c(rep("AML", 7), c(rep("CLL", 7))))

groups

# Build design matrix
des <- model.matrix(~groups)

# Compute normalisation
norm.factors <- calcNormFactors(counts)

lib.size <- norm.factors * colSums(counts)

# Convert counts to log2-cpm
dat <- voom(counts, des, lib.size=lib.size)

# Fit model
fit <- lmFit(dat, des)

fit <- eBayes(fit)

# Extract all results
top.table1 <- topTable(fit, coef=2, n=Inf, p.value=0.05)

write.table(top.table, file = "toptable.tsv", row.names=TRUE, col.names=NA, sep="\t")




