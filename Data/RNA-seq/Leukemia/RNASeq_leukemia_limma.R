
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


setwd("C:/Users/rawna/Documents/GSAT-540-UBC/team_Bloodies/Data/RNA-seq/Leukemia")
counts <- list(AML=read.csv('AML/AML_expected_count_data.csv', header=TRUE, row.names=1),
               ALL=read.table('CLL/CLL_expected_count_data.csv', header=TRUE, row.names=1))

groups <- factor(c(rep("AML", 7), c(rep("CLL", 7))))


limma.results <- lapply(counts, runLimmaAnalysis, groups=groups)


for(aligner in names(limma.results)){
  write.table(limma.results[[aligner]], paste("results/", aligner, ".limma.results.tsv", sep=""), row.names=TRUE, col.names=NA, sep="\t")
}
