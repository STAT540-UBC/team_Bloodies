# Methylation_merge_techinical_replicates
Fangwu Wang  
2017-03-15  

**Technical replicates** are the aliquots of cells from the same **donor condition** (same biological sample). The donor condition is illustrated in the file name of raw data, i.e., D1 indicates cells from a single donor; D2 indicates cells from two specified donors, D3 indicates cells from three specified donors, and so forth.  
The reason for merging the technical replicates is that the aliquot of cells contain very low cell number (1,10,50,1000 cells) which generates very low coverage of reads. So for each donor condition (biological sample) we merged technical replicates from 50-cell and 1000-cell samples by adding up the reads to gain an increased coverage. 
#### Methods: R and Bedtools  
#### Here is an illustration of data merging with one biological sample (HSC_D7)  
Data preprocessing to generate the 6 col format that fits into RnBeads in the later steps:  
The input format of RnBeads is bismarkCov style:


```r
library(RnBeads)
```

```
## Loading required package: BiocGenerics
```

```
## Loading required package: parallel
```

```
## 
## Attaching package: 'BiocGenerics'
```

```
## The following objects are masked from 'package:parallel':
## 
##     clusterApply, clusterApplyLB, clusterCall, clusterEvalQ,
##     clusterExport, clusterMap, parApply, parCapply, parLapply,
##     parLapplyLB, parRapply, parSapply, parSapplyLB
```

```
## The following objects are masked from 'package:stats':
## 
##     IQR, mad, xtabs
```

```
## The following objects are masked from 'package:base':
## 
##     anyDuplicated, append, as.data.frame, cbind, colnames,
##     do.call, duplicated, eval, evalq, Filter, Find, get, grep,
##     grepl, intersect, is.unsorted, lapply, lengths, Map, mapply,
##     match, mget, order, paste, pmax, pmax.int, pmin, pmin.int,
##     Position, rank, rbind, Reduce, rownames, sapply, setdiff,
##     sort, table, tapply, union, unique, unsplit, which, which.max,
##     which.min
```

```
## Loading required package: S4Vectors
```

```
## Loading required package: stats4
```

```
## 
## Attaching package: 'S4Vectors'
```

```
## The following objects are masked from 'package:base':
## 
##     colMeans, colSums, expand.grid, rowMeans, rowSums
```

```
## Loading required package: GenomicRanges
```

```
## Loading required package: IRanges
```

```
## Loading required package: GenomeInfoDb
```

```
## Loading required package: MASS
```

```
## Loading required package: RColorBrewer
```

```
## Loading required package: cluster
```

```
## Loading required package: ff
```

```
## Loading required package: bit
```

```
## Attaching package bit
```

```
## package:bit (c) 2008-2012 Jens Oehlschlaegel (GPL-2)
```

```
## creators: bit bitwhich
```

```
## coercion: as.logical as.integer as.bit as.bitwhich which
```

```
## operator: ! & | xor != ==
```

```
## querying: print length any all min max range sum summary
```

```
## bit access: length<- [ [<- [[ [[<-
```

```
## for more help type ?bit
```

```
## 
## Attaching package: 'bit'
```

```
## The following object is masked from 'package:base':
## 
##     xor
```

```
## Attaching package ff
```

```
## - getOption("fftempdir")=="/var/folders/71/vhbk15p145gg1gpcppwslv180000gn/T//Rtmpi2rRPH"
```

```
## - getOption("ffextension")=="ff"
```

```
## - getOption("ffdrop")==TRUE
```

```
## - getOption("fffinonexit")==TRUE
```

```
## - getOption("ffpagesize")==65536
```

```
## - getOption("ffcaching")=="mmnoflush"  -- consider "ffeachflush" if your system stalls on large writes
```

```
## - getOption("ffbatchbytes")==16777216 -- consider a different value for tuning your system
```

```
## - getOption("ffmaxbytes")==536870912 -- consider a different value for tuning your system
```

```
## 
## Attaching package: 'ff'
```

```
## The following objects are masked from 'package:bit':
## 
##     clone, clone.default, clone.list
```

```
## The following objects are masked from 'package:utils':
## 
##     write.csv, write.csv2
```

```
## The following objects are masked from 'package:base':
## 
##     is.factor, is.ordered
```

```
## Loading required package: fields
```

```
## Loading required package: spam
```

```
## Loading required package: grid
```

```
## Spam version 1.4-0 (2016-08-29) is loaded.
## Type 'help( Spam)' or 'demo( spam)' for a short introduction 
## and overview of this package.
## Help for individual functions is also obtained by adding the
## suffix '.spam' to the function name, e.g. 'help( chol.spam)'.
```

```
## 
## Attaching package: 'spam'
```

```
## The following object is masked from 'package:stats4':
## 
##     mle
```

```
## The following objects are masked from 'package:base':
## 
##     backsolve, forwardsolve
```

```
## Loading required package: maps
```

```
## 
## Attaching package: 'maps'
```

```
## The following object is masked from 'package:cluster':
## 
##     votes.repub
```

```
## Loading required package: ggplot2
```

```
## Loading required package: gplots
```

```
## 
## Attaching package: 'gplots'
```

```
## The following object is masked from 'package:IRanges':
## 
##     space
```

```
## The following object is masked from 'package:S4Vectors':
## 
##     space
```

```
## The following object is masked from 'package:stats':
## 
##     lowess
```

```
## Loading required package: gridExtra
```

```
## 
## Attaching package: 'gridExtra'
```

```
## The following object is masked from 'package:BiocGenerics':
## 
##     combine
```

```
## Loading required package: limma
```

```
## 
## Attaching package: 'limma'
```

```
## The following object is masked from 'package:BiocGenerics':
## 
##     plotMA
```

```
## Loading required package: matrixStats
```

```
## matrixStats v0.51.0 (2016-10-08) successfully loaded. See ?matrixStats for help.
```

```
## Loading required package: illuminaio
```

```
## Loading required package: methylumi
```

```
## Loading required package: Biobase
```

```
## Welcome to Bioconductor
## 
##     Vignettes contain introductory material; view with
##     'browseVignettes()'. To cite Bioconductor, see
##     'citation("Biobase")', and for packages 'citation("pkgname")'.
```

```
## 
## Attaching package: 'Biobase'
```

```
## The following objects are masked from 'package:matrixStats':
## 
##     anyMissing, rowMedians
```

```
## Loading required package: scales
```

```
## Loading required package: reshape2
```

```
## Loading required package: FDb.InfiniumMethylation.hg19
```

```
## Loading required package: GenomicFeatures
```

```
## Loading required package: AnnotationDbi
```

```
## 
## Attaching package: 'AnnotationDbi'
```

```
## The following object is masked from 'package:MASS':
## 
##     select
```

```
## Loading required package: TxDb.Hsapiens.UCSC.hg19.knownGene
```

```
## Loading required package: org.Hs.eg.db
```

```
## 
```

```
## Loading required package: minfi
```

```
## Loading required package: SummarizedExperiment
```

```
## 
## Attaching package: 'SummarizedExperiment'
```

```
## The following object is masked from 'package:matrixStats':
## 
##     rowRanges
```

```
## Loading required package: Biostrings
```

```
## Loading required package: XVector
```

```
## 
## Attaching package: 'Biostrings'
```

```
## The following objects are masked from 'package:ff':
## 
##     mismatch, pattern
```

```
## Loading required package: bumphunter
```

```
## Loading required package: foreach
```

```
## Loading required package: iterators
```

```
## Loading required package: locfit
```

```
## locfit 1.5-9.1 	 2013-03-22
```

```
## Setting options('download.file.method.GEOquery'='auto')
```

```
## Setting options('GEOquery.inmemory.gpl'=FALSE)
```

```
## Loading required package: plyr
```

```
## 
## Attaching package: 'plyr'
```

```
## The following object is masked from 'package:XVector':
## 
##     compact
```

```
## The following object is masked from 'package:matrixStats':
## 
##     count
```

```
## The following object is masked from 'package:maps':
## 
##     ozone
```

```
## The following object is masked from 'package:IRanges':
## 
##     desc
```

```
## The following object is masked from 'package:S4Vectors':
## 
##     rename
```

```
## Warning: replacing previous import 'gridExtra::combine' by
## 'methylumi::combine' when loading 'RnBeads'
```

```r
rnb.options(import.bed.style="bismarkCov")
rnb.options("import.bed.columns")
```

```
## $import.bed.columns
##      chr    start      end   strand     meth coverage        c        t 
##        1        2       NA       NA       NA       NA        5        6
```
These colnames correspond the columns for chromosome, start position, end position, strand, methylation degree, read coverage, number of reads with C and number of reads with T, respectively.  


```r
# This is a 50-cell aliquot sample
temp<-read.table(file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/HSC_50_D7_1_R1.aln.dedup.filt.CpG_report_filt.min")
temp[,5]<-temp[,4]-temp[,3]
temp[,6]<-100*(temp[,3]/temp[,4])
temp<-cbind(temp[,1:2],temp[,2],temp[,6],temp[,3],temp[,5])
temp[,4]<-round(temp[,4])
# output bed file:
write.table(temp,file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/HSC_50_D7_1.bed",quote = F,sep = "\t",row.names = F,col.names = F)
# The data looks like this:
head(temp)
```

```
##     V1    V2 temp[, 2] temp[, 6] temp[, 3] temp[, 5]
## 1 chr2 12994     12994       100         1         0
## 2 chr2 16865     16865       100         2         0
## 3 chr2 16906     16906       100         2         0
## 4 chr2 17184     17184       100         1         0
## 5 chr2 17278     17278       100         1         0
## 6 chr2 19086     19086       100         1         0
```
Repeat this for the other two replicates:

```r
# This is a 50-cell aliquot sample
temp<-read.table(file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/HSC_50_D7_2_R1.aln.dedup.filt.CpG_report_filt.min")
temp[,5]<-temp[,4]-temp[,3]
temp[,6]<-100*(temp[,3]/temp[,4])
temp<-cbind(temp[,1:2],temp[,2],temp[,6],temp[,3],temp[,5])
temp[,4]<-round(temp[,4])
write.table(temp,file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/HSC_50_D7_2.bed",quote = F,sep = "\t",row.names = F,col.names = F)
# This is a 1000-cell aliquot sample
temp<-read.table(file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/HSC_1000_D7_R1.aln.dedup.filt.CpG_report_filt.min")
temp[,5]<-temp[,4]-temp[,3]
temp[,6]<-100*(temp[,3]/temp[,4])
temp<-cbind(temp[,1:2],temp[,2],temp[,6],temp[,3],temp[,5])
temp[,4]<-round(temp[,4])
write.table(temp,file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/HSC_1000_D7.bed",quote = F,sep = "\t",row.names = F,col.names = F)
```

Then we use Bedtools with terminal command to sort and get intersect and distinct locations between two Bed files.  
Merge the first two replicates:
---
cd ~fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC
sort -k1,1 -k2,2n HSC_50_D7_1.bed > HSC_50_D7_1.sort.bed
sort -k1,1 -k2,2n HSC_50_D7_2.bed > HSC_50_D7_2.sort.bed
sort -k1,1 -k2,2n HSC_1000_D7.bed > HSC_1000_D7.sort.bed
bedtools map -a HSC_50_D7_1.sort.bed -b HSC_50_D7_2.sort.bed -c 5,6 -o sum -null 0 > Hm1.bed
bedtools intersect -a HSC_50_D7_2.sort.bed -b HSC_50_D7_1.sort.bed -v > d1.bed
---
Following processing with R:

```r
merge1<-read.delim(file="/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/Hm1.bed",header=F,sep="\t")
merge1[,5]<-merge1[,5]+merge1[,7]
merge1[,6]<-merge1[,6]+merge1[,8]
dist<-read.delim("/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/d1.bed",header=F,sep="\t")
merge1<-merge1[,1:6]
merge1<-rbind(merge1, dist)
write.table(merge1,file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/Hm1p.bed",quote = F,sep = "\t",row.names = F,col.names = F)
```

Now merge the third replicate to the merged file of the first two replicates: 
Terminal command-  
---
sort -k1,1 -k2,2n Hm1p.bed > Hm1p.sort.bed
bedtools map -a Hm1p.sort.bed -b HSC_1000_D7.sort.bed -c 5,6 -o sum -null 0 > Hm2.bed
bedtools intersect -a HSC_1000_D7.sort.bed -b Hm1p.sort.bed -v > d2.bed
---

```r
merge1<-read.delim(file="/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/Hm2.bed",header=F,sep="\t")
merge1[,5]<-merge1[,5]+merge1[,7]
merge1[,6]<-merge1[,6]+merge1[,8]
dist<-read.delim("/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/d2.bed",header=F,sep="\t")
merge1<-merge1[,1:6]
merge1<-rbind(merge1, dist)
write.table(merge1,file = "/Users/fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC/Hm2p.bed",quote = F,sep = "\t",row.names = F,col.names = F)
```
The final bed file is like this:  

```r
head(merge1)
```

```
##     V1    V2    V3  V4 V5 V6
## 1 chr1 28660 28660   0  0  1
## 2 chr1 28677 28677   0  0  1
## 3 chr1 28692 28692   0  0  1
## 4 chr1 51588 51588 100  1  0
## 5 chr1 51592 51592 100  1  0
## 6 chr1 51594 51594 100  1  0
```

