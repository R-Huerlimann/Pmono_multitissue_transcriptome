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

3) Used Trinity to quality trim and normalise the raw data, and assemble all samples by individual prawn.

4-6) Used BinPacker, Bridger and IDBA-tran on the normalised reads produced by Trinity for assembly.




