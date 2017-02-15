# Data summary and processing details
Fangwu Wang  
2017-02-14  
All of the data is from BluePrint Epigenome -- 
Data portal link: http://www.medical-epigenomics.org/papers/BLUEPRINT_methylomes/#gbrowser

Reference: Farlik M, Halbritter F, Müller F, Choudry FA et al. DNA Methylation Dynamics of Human Hematopoietic Stem Cell Differentiation. Cell Stem Cell 2016 Dec 1;19(6):808-822. PMID: 27867036

#Description of DNA methylation data: 

The DNA methylation profiles are available through GEO (Gene Expression Omnibus) in the alignment format. Due to large sizes, we can not deposit the data into GitHub team repo.  

Samples: The paper generated small pools (10 cells, 50 cells, 100 cells) of DNA methylomes on each sample to increase the coverage and accuracy of detection. We chose one sample with multiple small pool profiles for each population, based on the age group and quality of data. Younger ages are prefered and the number and mean coverage of sites are taken into consideration for quality check.  
Quality report is available at RnBead website: http://www.medical-epigenomics.org/papers/BLUEPRINT_methylomes/data/rnbeads_reports/prog_v08_um_nsc/index.html

Processing: The available DNA methylation data has been aligned and not quantitated. The procedure of raw data processing is from the supplementary methods of the reference paper.  
1). Bisulfite sequencing was done by the Biomedical Sequencing Facility at CeMM using the 2x75bp paired-end setup on the Illumina HiSeq 3000/4000 platform.  
2). Sequencing adapter fragments were trimmed using Trimmomatic v0.32. The trimmed reads were aligned with Bismark v0.12.2 (Krueger and Andrews, 2011) with the following parameters: --minins 0 --maxins 6000 --bowtie2, which uses Bowtie2 v2.2.4 (Langmead and Salzberg, 2012) for read alignment.  
3). The GRCh38 assembly of the human reference genome was used throughout the study, in a version for sequence alignment obtained from NCBI.  
4). Duplicate reads were removed as potential PCR artefacts, and reads with a bisulfite conversion rate below 90% or with fewer than three cytosines outside a CpG context (required to confidently assess bisulfite conversion rate) were removed as potential post-bisulfite contamination. 


Summary of DNA methylation data:

Data.type       GEO.ID       Name              Tissue             Population   Number.of.donors   Gender   Platform                   Data.Format 
--------------  -----------  ----------------  -----------------  -----------  -----------------  -------  -------------------------  ------------
Bisulfite-seq   GSM2324688   HSC_10_D10_1_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324689   HSC_10_D10_2_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324690   HSC_10_D10_3_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324691   HSC_10_D10_4_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324692   HSC_10_D10_7_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324693   HSC_50_D10_1_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324694   HSC_50_D10_2_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324695   HSC_1000_D10_R1   peripheral blood   HSC          10 age group 50    Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325042   MPP_10_D9_1_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325043   MPP_10_D9_2_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325044   MPP_10_D9_3_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325045   MPP_10_D9_4_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325046   MPP_10_D9_5_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325047   MPP_10_D9_6_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325048   MPP_10_D9_7_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325049   MPP_10_D9_8_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325050   MPP_50_D9_1_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325051   MPP_50_D9_2_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2325052   MPP_1000_D9_R1    peripheral blood   MPP          9 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324538   CMP_10_D3_1_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324539   CMP_10_D3_2_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324540   CMP_10_D3_3_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324541   CMP_10_D3_4_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324542   CMP_10_D3_5_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324543   CMP_10_D3_6_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324544   CMP_10_D3_7_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324545   CMP_10_D3_8_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324546   CMP_50_D3_1_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324547   CMP_50_D3_2_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324548   CMP_1000_D3_R1    peripheral blood   CMP          3 age group 55     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324712   MEP_10_D2_1_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324713   MEP_10_D2_2_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324714   MEP_10_D2_3_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324715   MEP_10_D2_4_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324716   MEP_10_D2_5_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324717   MEP_10_D2_6_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324718   MEP_10_D2_7_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324719   MEP_10_D2_8_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324720   MEP_50_D2_1_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324721   MEP_50_D2_2_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324722   MEP_1000_D2_R2    peripheral blood   MEP          2 age group 45     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324475   CLP_10_D2_1_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324476   CLP_10_D2_2_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324477   CLP_10_D2_3_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324478   CLP_10_D2_4_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324479   CLP_10_D2_5_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324480   CLP_10_D2_6_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324481   CLP_10_D2_7_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324482   CLP_10_D2_8_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324483   CLP_50_D2_1_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324484   CLP_50_D2_2_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324485   CLP_1000_D2_R1    peripheral blood   CLP          2 age group 60     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324571   GMP_10_D1_1_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324572   GMP_10_D1_2_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324573   GMP_10_D1_3_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324574   GMP_10_D1_4_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324575   GMP_10_D1_5_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324576   GMP_10_D1_6_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324577   GMP_10_D1_7_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324578   GMP_10_D1_8_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324579   GMP_50_D1_1_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324580   GMP_50_D1_2_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324581   GMP_1000_D1_R1    peripheral blood   GMP          1 age group 50     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324871   MLP1_10_D3_1_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324872   MLP1_10_D3_2_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324873   MLP1_10_D3_3_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324874   MLP1_10_D3_4_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324875   MLP1_10_D3_5_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324876   MLP1_10_D3_6_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324877   MLP1_10_D3_7_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324878   MLP1_10_D3_8_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324879   MLP1_50_D3_1_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324880   MLP1_50_D3_2_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   
Bisulfite-seq   GSM2324881   MLP1_1000_D3_R1   peripheral blood   MLP          3 age group 40     Male     Illumina HiSeq 3000/4000   Alignment   


#Description of RNA-seq data: 

The RNA-seq data was from the same study and obtained from GEO (GSE87195). The only one data file "GSE87195_rnaseq_ensT_all.csv" was deposited under "Data" folder of our team repo. The raw data is not directly available for RNA-seq. The uploaded file has been almost fully processed and the output is the format after differential expression analysis using the BitSeq software. The data is quantified at transcript level with ENST IDs.

Samples: This single file contains all seven populations of interest corresponding to the DNA methylation data with the same tissue origin.  

Processing:
1). After RNA-seq on Illumina HiSeq 2000 platform, sequencing adapter fragments were trimmed using Trimmomatic v0.32.  
2). The trimmed reads were aligned to the cDNA reference transcriptome (GRCh38 cDNA sequences from Ensembl) using Bowtie v1.1.1 and the following parameters: -q -p 6 -a -m 100 --minins 0 --maxins 5000 --fr --sam --chunkmbs 200.  
3). Duplicate reads were removed, and transcript levels were quantified with BitSeq v1.12.0. Transcript-level expression were estimated.  

Summary of DNA methylation data:

Data.type   File.name                      Tissue             Population    Number.of.cells  Platform              Data.format                       No.Columns   No.Rows
----------  -----------------------------  -----------------  -----------  ----------------  --------------------  -------------------------------  -----------  --------
RNA-seq     GSE87195_rnaseq_ensT_all.csv   Peripheral blood   HSC                       100  Illumina HiSeq 2000   Differential expression result            14     62590
                                           Peripheral blood   MMP                       100                                                                  NA        NA
                                           Peripheral blood   CMP                       100                                                                  NA        NA
                                           Peripheral blood   CLP                       100                                                                  NA        NA
                                           Peripheral blood   MLP                       100                                                                  NA        NA
                                           Peripheral blood   GMP                       100                                                                  NA        NA
                                           Peripheral blood   MEP                       100                                                                  NA        NA
