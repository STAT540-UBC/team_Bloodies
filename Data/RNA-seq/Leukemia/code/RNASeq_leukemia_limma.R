library(limma)
library(edgeR)
#setting working directiory
setwd("C:/Users/rawnak/Documents/team_Bloodies/Data/RNA-seq/Leukemia")

#reading files from two group of leukemia disease
AML=read.table('AML/AML_expected_count_data.csv', sep = ',', header=TRUE, row.names=1)
CLL=read.table('CLL/CLL_expected_count_data.csv',sep = ',', header=TRUE, row.names=1)

#making the first column as rownames
new_AML <- AML[,-1]
rownames(new_AML) <- AML[,1]
new_CLL <- CLL[,-1]
rownames(new_CLL)<- CLL[,1]
counts <- cbind(new_AML,new_CLL)
#factorizing data
groups <- factor(c(rep("AML", 7), c(rep("CLL", 7))))


# Build design matrix
des <- model.matrix(~groups)

# Compute normalisation
norm.factors <- calcNormFactors(counts)

lib.size <- norm.factors * colSums(counts)

# Convert counts to log2-cpm
dat <- voom(counts, des, lib.size=lib.size)

# Fit model
fit <- lmFit(dat, des)
#create an mean difference plot displaying the log-fold-changes and average A-values for each gene
plotMD(fit)
abline(0,0,col="blue")
#Empirical Bayes analysis
fit <- eBayes(fit)

# Extract all results
top.table1 <- topTable(fit, coef=2, n=Inf, p.value=0.001)
#distribution of the p value
hist(top.table1$P.Value,col="grey50", border="white")
write.table(top.table, file = "toptable.tsv", row.names=TRUE, col.names=NA, sep="\t")




