#!/bin/bash

#script to trim the corrected RNA-seq reads with relaxed trimming parameters. In contrast to trinity, here fragments that read through the adapter in F and R are not having their R reads discarded.
#using the same trimmomatic version as for the trinity assemblies.

#setting trimming parameter
param="ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2_mod.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25"
path=/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32
newdir=3_trimmed_corrected_20170515/

for file in 1_corrected_reads_individual/*R1.cor.fq; do
	R1=$file
	R2=${file/_R1/_R2}
	sample=$(echo $file | sed 's|1_corrected_reads_individual/||' | sed 's|_R1.cor.fq||')
	echo "trimming sample" $sample 
	java -jar $path/trimmomatic-0.32.jar PE -threads 30 -phred33 $R1 $R2 $newdir$sample"_R1_P.fq" $newdir$sample"_R1_UP.fq" $newdir$sample"_R2_P.fq" $newdir$sample"_R2_UP.fq" $param
done

