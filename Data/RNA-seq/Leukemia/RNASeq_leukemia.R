setwd("C:/Users/rawna/Documents/GSAT-540-UBC/team_Bloodies/Data/RNA-seq/Leukemia")
runEdgerAnalysis <- function(counts, groups){
  # Use the `edgeR` package to test for differentially expressed genes between two groups.
  #
  # Args:
  #   counts : (data.frame) Data frame of counts with genes as rows and samples a columns.
  #   groups : (factor) Grouping of samples.
  #
  # Results:
  #   results : (data.frame)
  
  library('edgeR')
  
  # Build data object
  dat <- DGEList(counts=counts, group=groups)
  keep <- rowSums(cpm(dat)>2)
  dat <- dat[keep, , keep.lib.sizes=FALSE]
  
  # Build design matrix
  des <- model.matrix(~groups)
  
  # Normalise data
  dat <- estimateGLMCommonDisp(dat, des)
  
  dat <- estimateGLMTrendedDisp(dat, des)
  
  dat <- estimateGLMTagwiseDisp(dat, des)
  
  # GLM fitting
  fit <- glmFit(dat, des)
  
  lrt <- glmLRT(fit, coef=2)
  
  # Extract results
  top.tags <- topTags(lrt, adjust.method="BH", n=Inf)
  
  top.table <- top.tags$table
  
  # Store results in standard format data frame.
  results <- data.frame(gene.id = I(row.names(top.table)),
                        p.value = top.table$PValue,
                        q.value = top.table$FDR,
                        log.fc = top.table$logFC,
                        test.stat = top.table$LR)
  return(results)    
}


counts <- list(AML=read.csv('AML/AML_expected_count_data.csv', header=TRUE, row.names=1),
               ALL=read.table('CLL/CLL_expected_count_data.csv', header=TRUE, row.names=1))

groups <- factor(c(rep("AML", 7), c(rep("CLL", 7))))
edger.results <- lapply(counts, runEdgerAnalysis, groups=groups)

for(aligner in names(edger.results)){
  write.table(edger.results[[aligner]], paste("results/", aligner, ".edger.results.tsv", sep=""), row.names=TRUE, col.names=NA, sep="\t")
}


             