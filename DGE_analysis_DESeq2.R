#Prawn differential gene expression analysis
#Roger Huerlimann
#17/08/2017

#====================================================================================================
####Package installation####
#====================================================================================================
install.packages("ggplot2","tidyverse","factoextra","gplots")

source("https://bioconductor.org/biocLite.R")
biocLite("DESeq2")


#====================================================================================================
####Data preparation####
#====================================================================================================
library("tidyverse")

#loading the sample information into R from csv files
sample_table_tissue <- read.csv("2_Raw_Data/Sample_information_tissue.csv", header=TRUE)
sample_table_larvae <- read.csv("2_Raw_Data/Sample_information_larvae.csv", header=TRUE)

#loading the count data into R from txt files
count_data_tissue <- read.delim("2_Raw_Data/tissue_trimmed_counts.txt", header=TRUE)
rownames(count_data_tissue) <- count_data_tissue[,1]
count_data_tissue <- as.matrix(count_data_tissue[,-1])

count_data_larvae <- read.delim("2_Raw_Data/larvae_trimmed_counts.txt", header=TRUE)
rownames(count_data_larvae) <- count_data_larvae[,1]
count_data_larvae <- as.matrix(count_data_larvae[,-1])

#loading the cluster data into R from txt files
clusters_data_tissue <- read_tsv("2_Raw_Data/tissue_trimmed_clusters.txt",col_names = c("SeqName","ClusterID"))
clusters_data_larvae <- read_tsv("2_Raw_Data/larvae_trimmed_clusters.txt",col_names = c("SeqName","ClusterID"))

#loading the annotation information into R from the csv file
annotation <- read_tsv("2_Raw_Data/V2_draft_annotation_preliminary_20170810.txt")


#====================================================================================================
####Data processing####
#====================================================================================================
library("DESeq2")

#Setting up the DESeq model
# This sets up the DESeq model
dds_tissue <- DESeqDataSetFromMatrix(countData = count_data_tissue,colData=sample_table_tissue,design = ~ Tissue)

dds_larvae <- DESeqDataSetFromMatrix(countData = count_data_larvae,colData=sample_table_larvae,design = ~ Stage)

#Running the actual DESeq fitting process. 

dds_tissue <- DESeq(dds_tissue)
res_dds_tissue <- results(dds_tissue)
write_rds(dds_tissue,"3_Temp_Files/dds_tissue.rda")

dds_larvae <- DESeq(dds_larvae)
res_dds_larvae <- results(dds_larvae)
write_rds(dds_larvae,"3_Temp_Files/dds_larvae.rda")


#====================================================================================================
####Tissue level data analysis####
#====================================================================================================
#MA plot to plot differentially expressed genes (in red), at different ranges for log fold change
#Since we are looking at completely different tissues, the fold changes are relatively large
DESeq2::plotMA(dds_tissue,ylim=c(-30,30),main='DESeq2')
dev.copy(png,'4_Outputs/deseq2_MAplot_Tissue.png')
dev.off()

####Data transformation####
vst_tissue <- varianceStabilizingTransformation(dds_tissue, blind=FALSE)

####Tissue level PCA of all genes####
pcaData_tissue <- plotPCA(vst_tissue, intgroup="Tissue", returnData=TRUE)
percentVar_tissue <- round(100 * attr(pcaData_tissue, "percentVar"))
pcaData_tissue$Tissue = factor(pcaData_tissue$Tissue)

ggplot(pcaData_tissue, aes(PC1, PC2, color=Tissue, shape=Tissue)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar_tissue[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar_tissue[2],"% variance")) + 
  coord_fixed() +
  scale_shape_manual(values = c(0, 15, 16, 17, 18, 25, 15, 8, 9)) +
  theme_bw()

####Tissue level PCA of top 1000 genes####
pcaData1000_tissue <- plotPCA(vst_tissue, intgroup="Tissue", returnData=TRUE, ntop=1000)
percentVar1000_tissue <- round(100 * attr(pcaData1000_tissue, "percentVar"))
pcaData1000_tissue$Tissue = factor(pcaData1000_tissue$Tissue)

ggplot(pcaData1000_tissue, aes(PC1, PC2, color=Tissue, shape=Tissue)) +
  geom_point(size=3) +
  xlab(paste0("PC1: ",percentVar1000_tissue[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar1000_tissue[2],"% variance")) + 
  coord_fixed() +
  scale_shape_manual(values = c(0, 15, 16, 17, 18, 25, 15, 8, 9)) +
  theme_bw()

####Tissue Heatmaps####
library("gplots")
library("dendextend")
library("tidyr")
library('RColorBrewer')

hmcol<- colorRampPalette(brewer.pal(9, 'GnBu'))(100)

#heatmap for publication with top 2k DGE, using Pearson's colleration for the dendrogram and using denextend for colours
Rowv_Euc  <- assay(vst_tissue[head(order(-rowVars(assay(vst_tissue))),2000),]) %>% dist %>% hclust %>% as.dendrogram %>% set("branches_k_color", k = 6) %>% set("branches_lwd", 1) %>% ladderize
Rowv_Pear  <- hclust(as.dist(1-cor(t(assay(vst_tissue[head(order(-rowVars(assay(vst_tissue))),2000),]))))) %>% as.dendrogram %>% set("branches_k_color", k = 15) %>% set("branches_lwd", 1) %>% ladderize
Colv  <- assay(vst_tissue[head(order(-rowVars(assay(vst_tissue))),2000),]) %>% t %>% dist %>% hclust %>% as.dendrogram %>% set("branches_k_color", k = 9) %>% set("branches_lwd", 2) %>% ladderize

####Tissue heatmap for publication####
heatmap.2(assay(vst_tissue[head(order(-rowVars(assay(vst_tissue))),2000),]),
          col = hmcol, Rowv = Rowv_Pear, Colv = Colv, scale='none', dendrogram='both', trace='none',
          mar=c(5,0.5),lwid = c(0.5,5),lhei = c(2,13))

#extracting clustering info using Pearson's correlation generated above
tissue_clusters_2000 <- (assay(vst_tissue[head(order(-rowVars(assay(vst_tissue))),2000),]))
tissue_cluster_info_2000_pear <- heatmap.2(assay(vst_tissue[head(order(-rowVars(assay(vst_tissue))),2000),]), Rowv=Rowv_Pear, Colv = Colv, trace='none')
tissue_cluster_ID_2000_pear <- tissue_clusters_2000[rev(tissue_cluster_info_2000_pear$rowInd), tissue_cluster_info_2000_pear$colInd]
write.csv(as.data.frame(tissue_cluster_ID_2000_pear),file='4_Outputs/Tissue_cluster_ID_2000_pear.csv')

#Tissue level normalised count data for finding total and uniquely expressed clusters (findUbiquitous.pl and findUnique.pl)
#https://support.bioconductor.org/p/66067/
dds_tissue_ESF <- estimateSizeFactors(dds_tissue)
normalised_counts_tissue <- counts(dds_tissue_ESF, normalized=TRUE)
head(normalised_counts_tissue)
write.csv(as.data.frame(normalised_counts_tissue),file='4_Outputs/Tissue_normalised_counts.csv')


#====================================================================================================
####Larval level data analysis####
#====================================================================================================
####Data transformation####
vst_larvae <- varianceStabilizingTransformation(dds_larvae, blind=FALSE)

####Larval level PCA of all genes####
pcaData_larvae <- plotPCA(vst_larvae, intgroup="Stage", returnData=TRUE)
percentVar_larvae <- round(100 * attr(pcaData_larvae, "percentVar"))
pcaData_larvae$Stage_larvae = factor(pcaData_larvae$Stage)

ggplot(pcaData_larvae, aes(PC1, PC2, color=Stage, shape=Stage)) +
  geom_point(size=5) +
  xlab(paste0("PC1: ",percentVar_larvae[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar_larvae[2],"% variance")) + 
  coord_fixed() +
  scale_shape_manual(values = c(0, 15, 16, 17, 18, 25, 8, 9)) +
  theme_bw()

####Larval level PCA of top 500 genes####
pcaData500_larvae <- plotPCA(vst_larvae, intgroup="Stage", returnData=TRUE, ntop=500)
percentVar500_larvae <- round(100 * attr(pcaData500_larvae, "percentVar"))
pcaData500_larvae$Stage_larvae = factor(pcaData500_larvae$Stage)

ggplot(pcaData500_larvae, aes(PC1, PC2, color=Stage, shape=Stage)) +
  geom_point(size=5) +
  xlab(paste0("PC1: ",percentVar500_larvae[1],"% variance")) +
  ylab(paste0("PC2: ",percentVar500_larvae[2],"% variance")) + 
  coord_fixed() +
  scale_shape_manual(values = c(0, 15, 16, 17, 18, 25, 8, 9)) +
  theme_bw()

####Larval heatmaps####
#Larval heatmap for publication with top 500 DGE, using Pearson's colleration for the dendrogram and using denextend for colours
library("gplots")
library("dendextend")
library("tidyr")
library('RColorBrewer')

hmcol<- colorRampPalette(brewer.pal(9, 'GnBu'))(100)

Larvae_Rowv_Pear  <- hclust(as.dist(1-cor(t(assay(vst_larvae[head(order(-rowVars(assay(vst_larvae))),500),]))))) %>% as.dendrogram %>% set("branches_k_color", k = 9) %>% set("branches_lwd", 2)

####Larval level heatmap for publication####
heatmap.2(assay(vst_larvae[head(order(-rowVars(assay(vst_larvae))),500),]),
          col = hmcol, Rowv = Larvae_Rowv_Pear, Colv = FALSE, scale='row', dendrogram='row', trace='none',
          mar=c(5,0.5),lwid = c(0.5,3.5),lhei = c(1,20))

#Larval level extracting clustering info using Pearson's correlation generated above
larvae_clusters_500 <- (assay(vst_larvae[head(order(-rowVars(assay(vst_larvae))),500),]))
larvae_cluster_info_500_pear <- heatmap.2(assay(vst_larvae[head(order(-rowVars(assay(vst_larvae))),500),]), Rowv = Larvae_Rowv_Pear, Colv = FALSE, dendrogram='row', trace='none')
larvae_cluster_ID_500_pear <- larvae_clusters_500[rev(larvae_cluster_info_500_pear$rowInd), larvae_cluster_info_500_pear$colInd]
write.csv(as.data.frame(larvae_cluster_ID_500_pear),file='4_Outputs/Larvae_cluster_ID_500_pear.csv')


#====================================================================================================
####Merging cluster information and sp, nr and lnc annotations into one file####
#====================================================================================================

#loading the annotation information into R from the csv file
annotation_sp <- read_tsv("2_Raw_Data/transcriptome_annotation_swissprot.tsv")
annotation_nr <- read_tsv("2_Raw_Data/transcriptome_annotation_nr_arthropod.tsv")
annotation_lnc <- read_tsv("5_FEELnc_first_pass/Pmonodon_transcriptome_V2_preliminary.fasta_RF.txt")
contigs <- as.data.frame(annotation_nr$SeqName)
colnames(contigs) <- "SeqName"

contigs_linked <- contigs %>% left_join(clusters_data_tissue,by="SeqName") %>% left_join(clusters_data_larvae,by="SeqName") 
colnames(contigs_linked) <- c("SeqName", "LarvalClusters", "TissueClusters")
annotation_all <- contigs_linked %>% left_join(annotation_sp,by="SeqName") %>% left_join(annotation_nr,by="SeqName") %>% left_join(annotation_lnc,by="SeqName")
write.csv(annotation_all, file="4_outputs/Supplementary_Table_S1_Annotation_information.csv") 


