
library(gplots)
library(NMF)
library(DESeq2)
library(limma)
library(edgeR)

setwd("C:/Users/rawna/Documents/GSAT-540-UBC/team_Bloodies/Data/RNA-seq/Normal")
expr_data = read.csv('GSE87195_rnaseq_ensT_all.csv', header = T,  sep = ',', row.names = 1)
factor_data = read.csv('factor_data.csv', header = T, sep = ',')
str(expr_data)
#heatmap 
cellType = factor(factor_data$cell_type, labels = c('CLP', 'GMP', 'HSC', 'HSC1','MLP', 'MLP1', 'MLP2',
                                                    'MLP3', 'MPP', 'CMP', 'GMP2', 'MLP4', 'MPP1' ))
aheatmap(cor(expr_data), Rowv = FALSE, Colv = FALSE, 
  annCol = list(Treatment = cellType))


