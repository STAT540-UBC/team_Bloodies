# Data summary and processing details
Fangwu Wang  
2017-02-14  
All of the data is from BluePrint Epigenome -- 
Data portal link: http://www.medical-epigenomics.org/papers/BLUEPRINT_methylomes/#gbrowser

Reference: Farlik M, Halbritter F, Müller F, Choudry FA et al. DNA Methylation Dynamics of Human Hematopoietic Stem Cell Differentiation. Cell Stem Cell 2016 Dec 1;19(6):808-822. PMID: 27867036

#Description of DNA methylation data: 

The DNA methylation profiles are available through GEO (Gene Expression Omnibus) in the alignment format. Due to large sizes, we can not deposit the data into GitHub team repo.  

Samples: The paper generated small pools (50 cells, 100 cells) of DNA methylomes on each sample to increase the coverage and accuracy of detection. We chose three samples (biological replicates) with multiple small pool profiles for each population. Younger ages are prefered and the number and mean coverage of sites are taken into consideration for quality check.  
Quality report is available at RnBead website: http://www.medical-epigenomics.org/papers/BLUEPRINT_methylomes/data/rnbeads_reports/prog_v08_um_nsc/index.html

Processing: The available DNA methylation data has been aligned and not quantitated. The procedure of raw data processing is from the supplementary methods of the reference paper.  
1). Bisulfite sequencing was done by the Biomedical Sequencing Facility at CeMM using the 2x75bp paired-end setup on the Illumina HiSeq 3000/4000 platform.  
2). Sequencing adapter fragments were trimmed using Trimmomatic v0.32. The trimmed reads were aligned with Bismark v0.12.2 (Krueger and Andrews, 2011) with the following parameters: --minins 0 --maxins 6000 --bowtie2, which uses Bowtie2 v2.2.4 (Langmead and Salzberg, 2012) for read alignment.  
3). The GRCh38 assembly of the human reference genome was used throughout the study, in a version for sequence alignment obtained from NCBI.  
4). Duplicate reads were removed as potential PCR artefacts, and reads with a bisulfite conversion rate below 90% or with fewer than three cytosines outside a CpG context (required to confidently assess bisulfite conversion rate) were removed as potential post-bisulfite contamination. 


Summary of DNA methylation data:

```
##        Data.type     GEO.ID            Name           Tissue Population
## 1  Bisulfite-seq GSM2324702  HSC_50_D7_1_R1 peripheral blood        HSC
## 2  Bisulfite-seq GSM2324703  HSC_50_D7_2_R1 peripheral blood        HSC
## 3  Bisulfite-seq GSM2324704  HSC_1000_D7_R1 peripheral blood        HSC
## 4  Bisulfite-seq GSM2324708  HSC_10_D9_6_R1 peripheral blood        HSC
## 5  Bisulfite-seq GSM2324709  HSC_10_D9_7_R1 peripheral blood        HSC
## 6  Bisulfite-seq GSM2324710  HSC_50_D9_1_R1 peripheral blood        HSC
## 7  Bisulfite-seq GSM2324711  HSC_50_D9_2_R1 peripheral blood        HSC
## 8  Bisulfite-seq GSM2324693 HSC_50_D10_1_R1 peripheral blood        HSC
## 9  Bisulfite-seq GSM2324694 HSC_50_D10_2_R1 peripheral blood        HSC
## 10 Bisulfite-seq GSM2324695 HSC_1000_D10_R1 peripheral blood        HSC
## 11 Bisulfite-seq GSM2325039  MPP_50_D7_1_R1 peripheral blood        MPP
## 12 Bisulfite-seq GSM2325040  MPP_50_D7_2_R1 peripheral blood        MPP
## 13 Bisulfite-seq GSM2325041  MPP_1000_D7_R1 peripheral blood        MPP
## 14 Bisulfite-seq GSM2325061 MPP_50_D10_1_R1 peripheral blood        MPP
## 15 Bisulfite-seq GSM2325062 MPP_50_D10_2_R1 peripheral blood        MPP
## 16 Bisulfite-seq GSM2325063 MPP_1000_D10_R1 peripheral blood        MPP
## 17 Bisulfite-seq GSM2325050  MPP_50_D9_1_R1 peripheral blood        MPP
## 18 Bisulfite-seq GSM2325051  MPP_50_D9_2_R1 peripheral blood        MPP
## 19 Bisulfite-seq GSM2325052  MPP_1000_D9_R1 peripheral blood        MPP
## 20 Bisulfite-seq GSM2324524  CMP_50_D2_1_R2 peripheral blood        CMP
## 21 Bisulfite-seq GSM2324525  CMP_50_D2_2_R2 peripheral blood        CMP
## 22 Bisulfite-seq GSM2324526  CMP_1000_D2_R2 peripheral blood        CMP
## 23 Bisulfite-seq GSM2324535  CMP_50_D1_1_R2 peripheral blood        CMP
## 24 Bisulfite-seq GSM2324536  CMP_50_D1_2_R2 peripheral blood        CMP
## 25 Bisulfite-seq GSM2324537  CMP_1000_D1_R2 peripheral blood        CMP
## 26 Bisulfite-seq GSM2324546  CMP_50_D3_1_R1 peripheral blood        CMP
## 27 Bisulfite-seq GSM2324547  CMP_50_D3_2_R1 peripheral blood        CMP
## 28 Bisulfite-seq GSM2324548  CMP_1000_D3_R1 peripheral blood        CMP
## 29 Bisulfite-seq GSM2324741  MEP_50_D3_1_R1 peripheral blood        MEP
## 30 Bisulfite-seq GSM2324742  MEP_50_D3_2_R1 peripheral blood        MEP
## 31 Bisulfite-seq GSM2324743  MEP_1000_D3_R1 peripheral blood        MEP
## 32 Bisulfite-seq GSM2324730  MEP_10_D1_8_R1 peripheral blood        MEP
## 33 Bisulfite-seq GSM2324731  MEP_50_D1_1_R1 peripheral blood        MEP
## 34 Bisulfite-seq GSM2324732  MEP_50_D1_2_R1 peripheral blood        MEP
## 35 Bisulfite-seq GSM2324720  MEP_50_D2_1_R2 peripheral blood        MEP
## 36 Bisulfite-seq GSM2324721  MEP_50_D2_2_R2 peripheral blood        MEP
## 37 Bisulfite-seq GSM2324722  MEP_1000_D2_R2 peripheral blood        MEP
## 38 Bisulfite-seq GSM2324472  CLP_50_D1_1_R2 peripheral blood        CLP
## 39 Bisulfite-seq GSM2324473  CLP_50_D1_2_R2 peripheral blood        CLP
## 40 Bisulfite-seq GSM2324474  CLP_1000_D1_R2 peripheral blood        CLP
## 41 Bisulfite-seq GSM2324493  CLP_10_D3_8_R1 peripheral blood        CLP
## 42 Bisulfite-seq GSM2324494  CLP_50_D3_1_R1 peripheral blood        CLP
## 43 Bisulfite-seq GSM2324495  CLP_50_D3_2_R1 peripheral blood        CLP
## 44 Bisulfite-seq GSM2324483  CLP_50_D2_1_R1 peripheral blood        CLP
## 45 Bisulfite-seq GSM2324484  CLP_50_D2_2_R1 peripheral blood        CLP
## 46 Bisulfite-seq GSM2324485  CLP_1000_D2_R1 peripheral blood        CLP
## 47 Bisulfite-seq GSM2324601  GMP_50_D3_1_R1 peripheral blood        GMP
## 48 Bisulfite-seq GSM2324602  GMP_50_D3_2_R1 peripheral blood        GMP
## 49 Bisulfite-seq GSM2324603  GMP_1000_D3_R1 peripheral blood        GMP
## 50 Bisulfite-seq GSM2324590  GMP_50_D2_1_R1 peripheral blood        GMP
## 51 Bisulfite-seq GSM2324591  GMP_50_D2_2_R1 peripheral blood        GMP
## 52 Bisulfite-seq GSM2324592  GMP_1000_D2_R1 peripheral blood        GMP
## 53 Bisulfite-seq GSM2324579  GMP_50_D1_1_R1 peripheral blood        GMP
## 54 Bisulfite-seq GSM2324580  GMP_50_D1_2_R1 peripheral blood        GMP
## 55 Bisulfite-seq GSM2324581  GMP_1000_D1_R1 peripheral blood        GMP
## 56 Bisulfite-seq GSM2324901 MLP1_50_D1_1_R2 peripheral blood        MLP
## 57 Bisulfite-seq GSM2324902 MLP1_50_D1_2_R2 peripheral blood        MLP
## 58 Bisulfite-seq GSM2324903 MLP1_1000_D1_R2 peripheral blood        MLP
## 59 Bisulfite-seq GSM2324890 MLP1_50_D2_1_R2 peripheral blood        MLP
## 60 Bisulfite-seq GSM2324891 MLP1_50_D2_2_R2 peripheral blood        MLP
## 61 Bisulfite-seq GSM2324892 MLP1_1000_D2_R2 peripheral blood        MLP
## 62 Bisulfite-seq GSM2324879 MLP1_50_D3_1_R1 peripheral blood        MLP
## 63 Bisulfite-seq GSM2324880 MLP1_50_D3_2_R1 peripheral blood        MLP
## 64 Bisulfite-seq GSM2324881 MLP1_1000_D3_R1 peripheral blood        MLP
##    Number.of.donors Age.group Gender                 Platform Data.Format
## 1                 7        NA Female Illumina HiSeq 3000/4000   Alignment
## 2                 7        NA Female Illumina HiSeq 3000/4001   Alignment
## 3                 7        NA Female Illumina HiSeq 3000/4002   Alignment
## 4                 9        60   Male Illumina HiSeq 3000/4003   Alignment
## 5                 9        NA   Male Illumina HiSeq 3000/4004   Alignment
## 6                 9        NA   Male Illumina HiSeq 3000/4005   Alignment
## 7                 9        NA   Male Illumina HiSeq 3000/4006   Alignment
## 8                10        50   Male Illumina HiSeq 3000/4007   Alignment
## 9                10        50   Male Illumina HiSeq 3000/4008   Alignment
## 10               10        50   Male Illumina HiSeq 3000/4009   Alignment
## 11                7        NA Female Illumina HiSeq 3000/4010   Alignment
## 12                7        NA Female Illumina HiSeq 3000/4011   Alignment
## 13                7        NA Female Illumina HiSeq 3000/4012   Alignment
## 14               10        NA   Male Illumina HiSeq 3000/4013   Alignment
## 15               10        NA   Male Illumina HiSeq 3000/4014   Alignment
## 16               10        NA   Male Illumina HiSeq 3000/4015   Alignment
## 17                9        60   Male Illumina HiSeq 3000/4016   Alignment
## 18                9        60   Male Illumina HiSeq 3000/4017   Alignment
## 19                9        60   Male Illumina HiSeq 3000/4018   Alignment
## 20                2        65   Male Illumina HiSeq 3000/4019   Alignment
## 21                2        65   Male Illumina HiSeq 3000/4020   Alignment
## 22                2        65   Male Illumina HiSeq 3000/4021   Alignment
## 23                1        60   Male Illumina HiSeq 3000/4022   Alignment
## 24                1        60   Male Illumina HiSeq 3000/4023   Alignment
## 25                1        60   Male Illumina HiSeq 3000/4024   Alignment
## 26                3        55   Male Illumina HiSeq 3000/4025   Alignment
## 27                3        55   Male Illumina HiSeq 3000/4026   Alignment
## 28                3        55   Male Illumina HiSeq 3000/4027   Alignment
## 29                3        70 Female Illumina HiSeq 3000/4028   Alignment
## 30                3        70 Female Illumina HiSeq 3000/4029   Alignment
## 31                3        70 Female Illumina HiSeq 3000/4030   Alignment
## 32                1        60   Male Illumina HiSeq 3000/4031   Alignment
## 33                1        60   Male Illumina HiSeq 3000/4032   Alignment
## 34                1        60   Male Illumina HiSeq 3000/4033   Alignment
## 35                2        45   Male Illumina HiSeq 3000/4034   Alignment
## 36                2        45   Male Illumina HiSeq 3000/4035   Alignment
## 37                2        45   Male Illumina HiSeq 3000/4036   Alignment
## 38                1        65   Male Illumina HiSeq 3000/4037   Alignment
## 39                1        65   Male Illumina HiSeq 3000/4038   Alignment
## 40                1        65   Male Illumina HiSeq 3000/4039   Alignment
## 41                3        NA Female Illumina HiSeq 3000/4040   Alignment
## 42                3        NA Female Illumina HiSeq 3000/4041   Alignment
## 43                3        NA Female Illumina HiSeq 3000/4042   Alignment
## 44                2        60   Male Illumina HiSeq 3000/4043   Alignment
## 45                2        60   Male Illumina HiSeq 3000/4044   Alignment
## 46                2        60   Male Illumina HiSeq 3000/4045   Alignment
## 47                3        NA   Male Illumina HiSeq 3000/4046   Alignment
## 48                3        NA   Male Illumina HiSeq 3000/4047   Alignment
## 49                3        NA   Male Illumina HiSeq 3000/4048   Alignment
## 50                2        NA   Male Illumina HiSeq 3000/4049   Alignment
## 51                2        NA   Male Illumina HiSeq 3000/4050   Alignment
## 52                2        NA   Male Illumina HiSeq 3000/4051   Alignment
## 53                1        50   Male Illumina HiSeq 3000/4052   Alignment
## 54                1        50   Male Illumina HiSeq 3000/4053   Alignment
## 55                1        50   Male Illumina HiSeq 3000/4054   Alignment
## 56                1        55   Male Illumina HiSeq 3000/4055   Alignment
## 57                1        55   Male Illumina HiSeq 3000/4056   Alignment
## 58                1        55   Male Illumina HiSeq 3000/4057   Alignment
## 59                2        NA Female Illumina HiSeq 3000/4058   Alignment
## 60                2        NA Female Illumina HiSeq 3000/4059   Alignment
## 61                2        NA Female Illumina HiSeq 3000/4060   Alignment
## 62                3        40   Male Illumina HiSeq 3000/4061   Alignment
## 63                3        40   Male Illumina HiSeq 3000/4062   Alignment
## 64                3        40   Male Illumina HiSeq 3000/4063   Alignment
```


#Description of RNA-seq data: 

##**RNA-seq for normal samples (matched to DNA methylation)**
The RNA-seq data was from the same study and obtained from GEO (GSE87195). The only one data file "GSE87195_rnaseq_ensT_all.csv" was deposited under "Data" folder of our team repo. The raw data is not directly available for RNA-seq. The uploaded file has been almost fully processed and the output is the format after differential expression analysis using the BitSeq software. The data is quantified at transcript level with ENST IDs.

Samples: This single file contains all seven populations of interest corresponding to the DNA methylation data with the same tissue origin.  

Processing:
1). After RNA-seq on Illumina HiSeq 2000 platform, sequencing adapter fragments were trimmed using Trimmomatic v0.32.  
2). The trimmed reads were aligned to the cDNA reference transcriptome (GRCh38 cDNA sequences from Ensembl) using Bowtie v1.1.1 and the following parameters: -q -p 6 -a -m 100 --minins 0 --maxins 5000 --fr --sam --chunkmbs 200.  
3). Duplicate reads were removed, and transcript levels were quantified with BitSeq v1.12.0. Transcript-level expression were estimated.  

Summary of DNA methylation data:


##**RNA-seq for leukemia samples**

Two types of leukemia samples--Acute myeloid leukemia and chromic lymphocytic leukemia--were derived from BluePrint Epigenome consortium: http://dcc.blueprint-epigenome.eu/#/experiments

Processing:
The GRAPE 2(https://github.com/guigolab/grape-nf) pipeline has been used to process the data. The used profile is STAR-RSEM, adapted from the ENCODE Long RNA-Seq pipeline (https://github.com/ENCODE-DCC/long-rna-seq-pipeline).  
1). Mapping: The mapping step is performed using the [STAR] spliced aligner to map the RNA-seq reads to the references, which can be found in the Blueprint references FTP (ftp://ftp.ebi.ac.uk/pub/databases/blueprint/reference/20150407_reference_files).  
2). Signal: In this step the STAR (https://github.com/alexdobin/STAR/) spliced aligner is used to produce signal files. The procedure is differentiated for strand-specific and non-strand-specific samples. For strand-specific data the signal from the two strands is separated. For non-strand-specific data the signal from the two strands is collapsed.   
3). Contigs: In this step BEDtools (http://bedtools.readthedocs.org/en/latest) and the contigsNew Python script (https://github.com/guigolab/grape-nf/blob/develop/bin/contigsNew.py) are used to produce a BED file with the contig information. 
4). Quantification: In this step RSEM (http://deweylab.biostat.wisc.edu/rsem/) is used to provide transcript and gene quantifications. A specific SAMtools version (https://github.com/emi80/samtools/tree/1.2-rglab-CRG) is used to systematically sort the reads as required by RSEM (http://deweylab.biostat.wisc.edu/rsem/) .  
Output files ( RSEM output format (http://deweylab.biostat.wisc.edu/rsem/rsem-calculate-expression.html#output)):  
${prefix}.genes.results
${prefix}.isoforms.results

Summary of DNA methylation data:






