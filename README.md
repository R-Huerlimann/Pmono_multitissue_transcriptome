# De novo assembly, characterization, functional annotation and expression patterns of the black tiger shrimp (Penaeus monodon) transcriptome

Workflow and scripts used for the assembly of the transcriptome. 

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

## Differential gene expression analysis
15) Loaded data into RStudio and carried out DGE using DESeq2 (https://bioconductor.org/packages/release/bioc/html/DESeq2.html).
