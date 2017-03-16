library(pheatmap)
library(DESeq)

# load data
data2<-read.table(file="/Users/fangwu/Documents/540/data/Data/Progenitors/RNA-seq/GSE87195_rnaseq_ensT_all.csv", header=T,sep=",")
rownames(data)<-data[,1]

# remove outlier "RNA_D2_GMP_100"
data<-data[,c(-12)]

# remove samples that will not be used in this study - HSCbm, MLP0, MLP2, MLP3
colnames(data)
data<-data[,c(2:4,7,10:13)]

# filtering out transcripts with low expression
# the total reads of all samples
sum<-rowSums(data)
data<-data.frame(data,sum)
# filter out transcripts with total reads below 50
data<-data[data$sum>50,] 
data<-data[,1:8]

# Big difference of the means across samples
colMeans(data) 
# Normalization using DESeq-"sizefactor"
data.frame(row.names=colnames(data),condition=c("CLP","GMP","HSC","MLP","MPP","CMP","MLP","MPP"))->metadata
cds=newCountDataSet(countData = data,conditions = metadata)
cds = estimateSizeFactors(cds)
sizeFactors(cds)->sizefactor
for (i in 1:8)
{data[,i]<-data[,i]/sizefactor[i]}
data<-round(data)

# Now the means of samples look closer to each other
colMeans(data)

# order the data based on the mean expression
mean<-rowMeans(data)
data<-data.frame(data,mean)
data<-data[order(data$mean,decreasing = T),]
data<-data[,1:8]

# clustering based on the most abundant 2000 transcripts
jpeg(file="heatmap_clustering.jpg")
pheatmap(mat=data[1:2000,],scale="row",cluster_cols = T, cluster_rows = T, show_rownames = F)
dev.off()

# take the mean of MPP/MLP replicates
MPP_mean<-(data[,5]+data[,8])/2 # MPP
MLP_mean<-(data[,4]+data[,7])/2 # MLP
data<-data.frame(data,MPP_mean,MLP_mean)

# transform to log2 scale
logdata<-log2(data+1)

# pairwise FC 
colnames(logdata)
HSCvsMPP<-logdata[,3]-logdata[,9]
MPPvsCMP<-logdata[,9]-logdata[,6]
MPPvsCLP<-logdata[,9]-logdata[,1]
CLPvsMLP<-logdata[,1]-logdata[,10]
CMPvsGMP<-logdata[,6]-logdata[,2]
logdatacomp<-data.frame(logdata,HSCvsMPP,MPPvsCMP,MPPvsCLP,CLPvsMLP,CMPvsGMP)

# get the gene lists with > 2-FC
setwd("/Users/fangwu/Documents/540/data/RNAseq_list")  
HSCvsMPP_HSC<-rownames(logdatacomp[logdatacomp$HSCvsMPP>1,])
HSCvsMPP_HSC<-as.data.frame(HSCvsMPP_HSC)
write.table(x=HSCvsMPP_HSC,file="HSCvsMPP_HSC.txt",col.names = F,quote = F)
HSCvsMPP_MPP<-rownames(logdatacomp[logdatacomp$HSCvsMPP<(-1),])
HSCvsMPP_MPP<-as.data.frame(HSCvsMPP_MPP)
write.table(x=HSCvsMPP_MPP,file="HSCvsMPP_MPP.txt",col.names = F,quote = F)
MPPvsCMP_MPP<-rownames(logdatacomp[logdatacomp$MPPvsCMP>1,])
MPPvsCMP_MPP<-as.data.frame(MPPvsCMP_MPP)
write.table(x=MPPvsCMP_MPP,file="MPPvsCMP_MPP.txt",col.names = F,quote = F)
MPPvsCMP_CMP<-rownames(logdatacomp[logdatacomp$MPPvsCMP<(-1),])
MPPvsCMP_CMP<-as.data.frame(MPPvsCMP_CMP)
write.table(x=MPPvsCMP_CMP,file="MPPvsCMP_CMP.txt",col.names = F,quote = F)
MPPvsCLP_CLP<-rownames(logdatacomp[logdatacomp$MPPvsCLP<(-1),])
MPPvsCLP_CLP<-as.data.frame(MPPvsCLP_CLP)
write.table(x=MPPvsCLP_CLP,file="MPPvsCLP_CLP.txt",col.names = F,quote = F)
MPPvsCLP_MPP<-rownames(logdatacomp[logdatacomp$MPPvsCLP>1,])
MPPvsCLP_MPP<-as.data.frame(MPPvsCLP_MPP)
write.table(x=MPPvsCLP_MPP,file="MPPvsCLP_MPP.txt",col.names = F,quote = F)
CMPvsGMP_CMP<-rownames(logdatacomp[logdatacomp$CMPvsGMP>1,])
CMPvsGMP_CMP<-as.data.frame(CMPvsGMP_CMP)
write.table(x=CMPvsGMP_CMP,file="CMPvsGMP_CMP.txt",col.names = F,quote = F)
CMPvsGMP_GMP<-rownames(logdatacomp[logdatacomp$CMPvsGMP<(-1),])
CMPvsGMP_GMP<-as.data.frame(CMPvsGMP_GMP)
write.table(x=CMPvsGMP_GMP,file="CMPvsGMP_GMP.txt",col.names = F,quote = F)
CLPvsMLP_CLP<-rownames(logdatacomp[logdatacomp$CLPvsMLP>1,])
CLPvsMLP_CLP<-as.data.frame(CLPvsMLP_CLP)
write.table(x=CLPvsMLP_CLP,file="CLPvsMLP_CLP.txt",col.names = F,quote = F)
CLPvsMLP_MLP<-rownames(logdatacomp[logdatacomp$CLPvsMLP<(-1),])
CLPvsMLP_MLP<-as.data.frame(CLPvsMLP_MLP)
write.table(x=CLPvsMLP_MLP,file="CLPvsMLP_MLP.txt",col.names = F,quote = F)


