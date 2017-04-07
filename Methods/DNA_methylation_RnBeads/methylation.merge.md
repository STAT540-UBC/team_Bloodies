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

Then we used Bedtools with terminal command to sort and get intersect and distinct locations between two Bed files.  
Merge the first two replicates:

cd ~fangwu/Documents/540/data/Data/Progenitors/DNAmethylation/HSC
sort -k1,1 -k2,2n HSC_50_D7_1.bed > HSC_50_D7_1.sort.bed
sort -k1,1 -k2,2n HSC_50_D7_2.bed > HSC_50_D7_2.sort.bed
sort -k1,1 -k2,2n HSC_1000_D7.bed > HSC_1000_D7.sort.bed
bedtools map -a HSC_50_D7_1.sort.bed -b HSC_50_D7_2.sort.bed -c 5,6 -o sum -null 0 > Hm1.bed
bedtools intersect -a HSC_50_D7_2.sort.bed -b HSC_50_D7_1.sort.bed -v > d1.bed

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

sort -k1,1 -k2,2n Hm1p.bed > Hm1p.sort.bed
bedtools map -a Hm1p.sort.bed -b HSC_1000_D7.sort.bed -c 5,6 -o sum -null 0 > Hm2.bed
bedtools intersect -a HSC_1000_D7.sort.bed -b Hm1p.sort.bed -v > d2.bed


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

