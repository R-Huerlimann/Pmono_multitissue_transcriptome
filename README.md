# De novo assembly, characterization, functional annotation and expression patterns of the black tiger shrimp (Penaeus monodon) transcriptome

Workflow and scripts used for the assembly of the transcriptome. 


### Publication information
Roger Huerlimann, Nicholas M Wade, Lavinia Gordon, Juan D Montenegro, Jake Goodall, Sean McWilliam, Matthew Tinning, Kirby Siemering, Erika Giardina, Dallas Donovan, Melony J Sellars, Jeff A Cowley, Kelly Condon, Greg J Coman, Mehar S Khatkar, Herman W Raadsma, Gregory Maes, Kyall R Zenger, Dean R Jerry (2018). De novo assembly, characterization, functional annotation and expression patterns of the black tiger shrimp (Penaeus monodon) transcriptome. Scientific Reportsvolume 8, Article number: 13553 (2018); https://rdcu.be/6cYY 



 


### Availability of raw data and assembly
Raw short read data and transcriptome assembly are available on NCBI under the following accession numbers: BioProject: PRJNA421400, BioSamples: SAMN08741487-SAMN08741521, SRA: SRP127068 (RR6868116-SRR6868172), TRA: GGLH00000000.


## Transcriptome assembly

1) Concatenated files that have been run across two lanes into one file and simplified the sample names at the same time.

For example:
```
cat R48_CAE85ANXX_ATTACTCG-TATAGCCT_L002_R1.fastq R48_CAE85ANXX_ATTACTCG-TATAGCCT_L003_R1.fastq > R48_R1.fastq &
cat R48_CAE85ANXX_ATTACTCG-TATAGCCT_L002_R2.fastq R48_CAE85ANXX_ATTACTCG-TATAGCCT_L003_R2.fastq > R48_R2.fastq 
```

2) Collectively ran Rcorrector on all files by executing the 02_Rcorrector.sh script.

3) Used Trinity to quality trim and normalise the raw data, and assemble all samples by individual prawn using  	03_trinity_start.sh.

4) to 6. Used BinPacker (04_binpacker_start.sh), Bridger (05_bridger_start.sh) and IDBA-tran (06_idbatran_start.sh) on the normalised reads produced by Trinity for assembly.

7) Concatenated all assemblies, including the mulitple k-mer from IDBA-tran, into a single assembly.

8) Used Evidential Gene on all collated contigs to merge redundant contigs. Then concatenated okay and alternative contigs toghether for maximal completeness.

```
module load cd-hit
module load blast
perl /Software/evigene/scripts/rnaseq/trformat.pl combined_individual.fa
nohup perl /Software/evigene/scripts/prot/tr2aacds.pl -mrnaseq combined_individual_rn.fa -NCPU=25 -MAXMEM=80000 -logfile
cat combined_individual_rn.okay.fa combined_individual_rn.okalt.fa > combined_multi_evigen.fa
```

9) Further reduced and clusterer the okay and alterantive contigs produced by Evidential Gene using TransFuse with a ID of 0.98  through the 09_transfuse_on_evigen.sh script

10) Removed contigs <300 bp using removesmalls.pl

https://github.com/drtamermansour/p_asteroides/blob/master/scripts/removesmalls.pl

11) Validated the assembly using TransRate V1.0.1 and BUSCO41 V2 using the arthropoda_odb9 database 

## Read mapping and counting
12) Since the initial trimming with Trimmomatic in Trinity included palindrome trimming, which discards fully overlapping reads, Trimmomatic was run again on the Rcorrected data using 12_trimming.sh, this time with palindrome trimming turned off (see Trimmomatic documentation for additional information: http://www.usadellab.org/cms/?page=trimmomatic).

13) Mapped reads in parallel to assembled transcriptome using bowtie2 through script 13_bowtie_mapping_trimmed.sh.

14) Carried out read counting using Corset (https://github.com/Oshlack/Corset/wiki) on tissue and larval samples separately through scripts 14_corset_tissues_trimmed.sh and 14_corset_larval_trimmed.sh.

15) To reduce the number of sequences for KEGG analysis, the longest contig per cluster was chosen from the combined tissue type and early life-history stage data using findLongestContig.pl. The KEGG Automatic Annotation Server (KAAS, http://www.genome.jp/tools/kaas/) was used to generate KEGG pathway maps for each contig using BLAST with the 134 single-directional best hit (SBH) method.

## Differential gene expression analysis
16) Loaded data into RStudio and carried out DGE using DESeq2 (https://bioconductor.org/packages/release/bioc/html/DESeq2.html).
    See DGE_analysis_DESeq2.R for details.

```
> sessionInfo()
R version 3.4.1 (2017-06-30)
Platform: x86_64-w64-mingw32/x64 (64-bit)
Running under: Windows 7 x64 (build 7601) Service Pack 1

Matrix products: default

locale:
[1] LC_COLLATE=English_Australia.1252  LC_CTYPE=English_Australia.1252    LC_MONETARY=English_Australia.1252
[4] LC_NUMERIC=C                       LC_TIME=English_Australia.1252    

attached base packages:
[1] parallel  stats4    stats     graphics  grDevices utils     datasets  methods   base     

other attached packages:
 [1] dendextend_1.8.0            DESeq2_1.16.1               RColorBrewer_1.1-2          gplots_3.0.1               
 [5] factoextra_1.0.5            forcats_0.3.0               stringr_1.3.1               dplyr_0.7.6                
 [9] purrr_0.2.5                 readr_1.1.1                 tidyr_0.8.1                 tibble_1.4.2               
[13] ggplot2_3.0.0               tidyverse_1.2.1             SummarizedExperiment_1.6.5  DelayedArray_0.2.7         
[17] BiocParallel_1.10.1         matrixStats_0.54.0          Biobase_2.36.2              GenomicRanges_1.28.6       
[21] GenomeInfoDb_1.12.3         IRanges_2.10.5              S4Vectors_0.14.7            BiocGenerics_0.22.1        
```

16) To generate the numbers of transcript clusters and cluster annotation rates across transcriptomes determined for the nine adult P. monodon tissue types analysed(bioRxiv Table 3, Scientific Reports Table 2), findUbiquitous.pl and findUnique.pl were used on Tissue_normalised_counts.csv generated in DGE_analysis_DESeq2.R. Clusters expressed in specific tissues (total number of expressed clusters per tissue) were defined as >50 normalized read counts. Uniquely expressed clusters were defined as having a normalized read count of >10 in a specific tissue, while having <10 read counts in all other 213 tissues. Finally, constitutively expressed clusteres were defined as having >50 normalized read counts in all tissue types.



