This is the repository for the group project of Team Bloodies. 

**Project: Data-driven analysis of the potential candidate transcription factors in hematopoietic stem cell differentiation into multiple progenitor compartments.**
==============================================
Links to:

[Proposal](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Proposal/Proposal.md)
[Progress Report](https://github.com/STAT540-UBC/team_Bloodies/issues/11)
[Poster](team_Bloodies/Poster/Poster.pdf)

Members and division of labor  
  
| Name | Initial work assignment | Affiliation | Expertise |  
| ------------- | ------------- | ------------- | ------------- |  
| Annie Cavalla | TF motif enrichment analysis | Bioinformatics | Cancer genomics |  
| Rawnak Hoque  | RNA-seq analysis and TF motif enrichment analysis | Genome Science and Technology | Genome scale data analysis |  
| Fangwu Wang | DNA methylation analysis, TF clustering | Medical Genetics | Stem cell biology|  
| Somdeb Paul  | DNA methylation analysis | Genome Science and Technology | Transcriptomics |  


**Rationale**: Human hematopoietic stem cells (HSCs) hold great clinical promises for curative HSC transplantation therapies for numerous hematologic malignancies and diseases. Understanding the mechanisms regulating the self-renewal and lineage restriction of HSCs is crucial for improving transplantation regimens. HSC is thought to acquire multi-step lineage restriction through going down multiple progenitor populations, during which process the myeloid vs.lymphoid binary decision is made with subsequent progeny restricted to either fate. In this project, we are interested in the epigenomic status of HSCs and other progenitor populations and how it interacts with transcription factor binding to regulate lineage differentiation program.


#### Data source: 
Our Dataset includes matched [DNA methylation]() (bisulfite-seq) and [RNA-seq]() data from HSCs and 5 other progenitor cell types, obtained from a recent publication ([Farlik M. et al, Cell, 2016]()) which characterized the differentiation path of HSCs based on cell DNA methylation profiles.

**Different strategy from the published paper**: To more rigorously identify TFs with a potential function in cell differentiation, we annotated DNA methylation using both promoters and [enhancers](). The enhancer regions were defined from two hematopoietic cell lines (K562, GM12878).

**Data replicate summary**: 

Cell Type |  Replicates for Methylation  | Replicates for RNA |
---------|-------|-----
HSC|3 |1|
MPP|3 |2|
MLP|3 |2|
CMP|3 |1|
GMP|3 |2|
CLP|3 |1|

**Workflow**: We first analyzed differential DNA methylation of 5 pairwise comparisons in the annotated promoter and enhancer regions using RnBeads. The **biological meaning** of the 5 pairwise comparisons:

Comparison|Biological Meaning
---------|-------
HSC-MPP|loss of long-term regeneation potential
MPP-CMP|multipotent to myeloid commitment
MPP-MLP|multipotent to lymphoid commitment
CMP-MLP|difference between myeloid and lymphoid on the CMP-MLP level
GMP-CLP|difference between myeloid and lymphoid on the GMP-MLP level

We then used low methylated regions of each cell type from each comparison (defined by the > 40% difference from pairwise comparison) to find enriched transcription factor binding motifs using HOMER findingmotif tools, and generated a list of our data-driven candidate TFs for each population from each comparison.

We analyzed the overlapped genes of DNA methylation and RNA expression to see if there is any correlation between low methylation and high expression of genes. We inspected the expression of TFs identified from motif enrichment to see if they are highly expressed in the corresponding population. Then we used the expression of TFs identified from CMP/MLP comparison (representing the myeloid and lymphoid lineages) to cluster the leukemia samples to see whether the samples from the same leukemia type group together.

#### Analysis and Major Findings:

#### 1. [DNA Methylation]()  
RnBeads analysis of pairwise comparison:  
a. [Beta-value distribution and variation](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/1.DNA_methylation_RnBeads/Variance%26Distribution)  
b. [PCA](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/1.DNA_methylation_RnBeads/PCA)  
c. [Clustering](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/1.DNA_methylation_RnBeads/Clustering)  
d. [Differential methylated regions](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/1.DNA_methylation_RnBeads/Differential_meth_regions_filtered)  
e. [Correlation with RNA expression](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/3.DNAme_RNA_correlation)    
Methods:  
f. [Data preparation: replicate merging](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Methods/DNA_methylation_RnBeads/methylation.merge.md)  
g. [Enhancer annotation-code](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Methods/DNA_methylation_RnBeads/Annotation_Rnbeads_Revised.R)  
h. [RnBeads](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Methods/DNA_methylation_RnBeads) - The code for the RnBeads analysis can be found here.  
i. [intersection between DNA/RNA gene lists-code](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Methods/DNA_methylation_RnBeads/Methylation_Gene.expr_intersect.R)  


#### 2. [RNA expression of progenitors](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/2.RNA-seq/Normal)  
a. [Sanity check](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/2.RNA-seq/Normal)  
b. [Differential expression gene lists](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/2.RNA-seq/Normal/Genelist)  
c. Methods:  
[Data processing and gene id conversion](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Methods/RNAseq_Normal)  

#### 3. [RNA expression of leukemia samples](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/2.RNA-seq/Leukemia)  
a. [Results](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/2.RNA-seq/Leukemia/results)  
[Differential gene table](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Results/2.RNA-seq/Leukemia/results/toptable.txt)  
b. Methods:  
[limma](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Methods/RNAseq_leukemia/RNASeq_leukemia_limma.R)  


#### 4. [Transcription factor motif analysis](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/4.TF_motif_enrichment)  
a. [TFs found at Enhancer](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/4.TF_motif_enrichment/RESULTS_enhancer)  
b. [TFs found at Promoter](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/4.TF_motif_enrichment/RESULTS_promoter)  
c. Methods  
[Input files](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/4.TF_motif_enrichment/Input_text_files_TFmotif)  
[HOMER Findingmotif tool]()  

#### 5. [TF clustering in normal and leukemia expression data](https://github.com/STAT540-UBC/team_Bloodies/tree/master/Results/5.TF_clustering)  
a. [Normal samples CMP/MLP](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Results/5.TF_clustering/Clustering_TFlist_normal_CMP-MLP.pdf)  
b. [Leukemia samples AML/CLL](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Results/5.TF_clustering/Leukemia_TF_clustering.pdf)  
c. Methods  
[TF list feeding into expression](https://github.com/STAT540-UBC/team_Bloodies/blob/master/Methods/TF_clustering/TF_RNAseq_clustering.R)  


