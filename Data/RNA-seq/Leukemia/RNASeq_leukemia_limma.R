
runLimmaAnalysis <- function(counts, groups){
  # Use the `limma` package to test for differentially expressed genes between two groups.
  #
  # Args:
  #   counts : (data.frame) Data frame of counts with genes as rows and samples a columns.
  #   groups : (factor) Grouping of samples.
  #
  # Results:
  #   results : (data.frame)
  

  
  library("limma")
  library("edgeR")
  
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
  top.table <- topTable(fit, coef=2, n=Inf, p.value=Inf)
  
  # Put results in a new data frame
  results <- with(top.table, data.frame(gene.id = I(ID),                                     
                                        p.value = P.Value,
                                        q.value = adj.P.Val,
                                        log.fc = logFC,
                                        test.stat = t))
  
  return(results)
}




#-------------------------------------------------------------


setwd("C:/Users/rawnak/Documents/team_Bloodies/Data/RNA-seq/Leukemia")
AML=read.table('AML/AML_expected_count_data.csv', sep = ',', header=TRUE, row.names=1)
CLL=read.table('CLL/CLL_expected_count_data.csv',sep = ',', header=TRUE, row.names=1)
new_AML <- AML[,-1]
rownames(new_AML) <- AML[,1]
new_CLL <- CLL[,-1]
rownames(new_CLL)<- CLL[,1]
counts <- list(new_AML,new_CLL)

na_count <-sapply(AML, function(y) sum(length(which(is.na(y)))))

groups <- factor(c(rep("AML", 7), c(rep("CLL", 7))))


limma.results <- lapply(counts, runLimmaAnalysis, groups=groups)


for(aligner in names(limma.results)){
  write.table(limma.results[[aligner]], paste("results/", aligner, ".limma.results.tsv", sep=""), row.names=TRUE, col.names=NA, sep="\t")
}
