#!/bin/bash

source /etc/profile.d/modules.sh
module load bowtie2
module load samtools

bowtie2-build transcriptome.fasta transcriptome

mkdir -p 4_mapped_files_trimmed

for file in 3_trimmed_corrected_20170515/*_R1_P.fq; do 
	r1=$file
	r2=${file/_R1/_R2}
	r1_strip=$(echo $r1 | sed 's|3_trimmed_corrected_20170515/||')
	outname=${r1_strip%%_R1_P.fq}

	echo "Running bowtie2 on sample $outname and writing outputs to 4_mapped_files_trimmed/$outname.bam"

	bowtie2 --no-mixed --no-discordant --end-to-end --all --score-min L,-0.1,-0.1 --threads 1 \
	-x transcriptome -1 $r1 -2 $r2 | samtools view -S -b - > 4_mapped_files_trimmed/$outname"_map.bam" &

done
