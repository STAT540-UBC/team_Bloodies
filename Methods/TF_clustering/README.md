
---
title: "TF binding enrichment"
author: "Rawnak Hoque"
date: '2017-04-07'
output:
  html_document: default
  pdf_document: default
---

###Transcription factor binding enrichment:
For transcription factor binding enrichment we used HOMER (Hypergeometric Optimization of Motif EnRichment), version (v4.9, 2-20-2017). Homer is an open source tool for motif discovery and NGS data analysis. This is a unix friendly tool written in Perl and C++. It uses ZOOPS scoring (zero or one occurrence per sequence) coupled with the hypergeometric enrichment calculations (or binomial) to determine motif enrichment. Homer supports human genome (hg17, hg18, hg19). For our analysis, we used hg19 as reference genome since our DNA-methylation data were also produced from hg19.

###Setup Homer environment for the analysis
At first, we have to make sure that the computer has a unix platform and has the following program installed-
 * perl
 * GNU make utility
 * GCC C/C++ compiler
 * wget (useful Unix utility)
 * Basic utilities such as zip/unzip/gzip/gunzip/cut/tar

Then we have to download the script configureHomer.pl from [here](http://homer.ucsd.edu/homer/) in the working directory. Using following command, we have to install Homer.
```
perl /path-to-homer/configureHomer.pl –install
```
At this point we have to add the homer directory to our executable path and change the 
```
~/.bash_profile using the following command
PATH=$PATH:/path-to-homer /homer/bin/
```
Then source the path to ~/.bash_profile

finding the enriched motif in genomic region
For finding the enriched motif in the reference genomic region, we run the following single command line-
```
findMotifsGenome.pl input_file.txt hg19 output_directory/ -size given -mask
```

The format of the input file
The input file should be a text or .txt file containing the following tab separated columns-
 *	Column1: Unique Peak ID
 *	Column2: chromosome
 *	Column3: starting position
 *	Column4: ending position
 *	Column5: Strand (+/- or 0/1, where 0="+", 1="-")
Pair wise differential methylation analysis created a pair of files containing hypomethylated region in each cell types. The cell types used for the motif enrichment in promoter and enhancer regions are- CMP-MLP, GMP-CLP, MPP-CMP, MPP-MLP, HSC-MPP. So, for our analysis, we had two files for each pair. For promoter region, we had 10 files and enhancer region we had 10 file, i.e. 20 files in total. 
Each of the run took about 1.5 hours in a supercomputer. 
The output is the enriched sequences which have known biological function. Each of the motif has its corresponding p-value, log P-value, number of target sequences with motif with the corresponding percentage, and number of background sequences with motif. The output known results file looks like the following-

The results looked very interesting since we found the top known TFs that are abundant in the enhancer and promoter region in HSCs differentiations.
In the final step, we compared the enriched motifs of the lymphoid and myeloid paired cells with corresponding genes from the RNAseq normally expressed data.
We also compared the known motifs with the corresponding lymphoid and myeloid leukemia RNAseq expression data. Though the results are not conclusive but yet evidential to follow up further analysis. 
The comparison results are stored in the results folder of the team repository. 
###Reference:
Heinz S, Benner C, Spann N, Bertolino E et al. Simple Combinations of Lineage-Determining Transcription Factors Prime cis-Regulatory Elements Required for Macrophage and B Cell Identities. Mol Cell 2010 May 28;38(4):576-589.

