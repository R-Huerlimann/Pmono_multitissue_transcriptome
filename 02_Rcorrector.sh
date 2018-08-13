#!/bin/bash

#Roger Huerlimann
#18/01/2017
#
#This script runs Rcorrector on a folder called 1_Raw_data which contains several PE fastq files

source /etc/profile.d/modules.sh
module load jellyfish

mkdir 2_corrected_reads

for File in 1_Raw_data/*R1.fastq;do
	let COUNTER=COUNTER+1
	if [ "$COUNTER" = 1 ]
	then
		filelist1="${File%%R1.fastq}""R1.fastq"
		filelist2="${File%%R1.fastq}""R2.fastq"
	else
		filelist1="$filelist1"",""${File%%R1.fastq}""R1.fastq"
		filelist2="$filelist2"",""${File%%R1.fastq}""R2.fastq"	
		R1="$filelist1"
		R2="$filelist2"
	fi
done

nohup perl /Software/rcorrector/run_rcorrector.pl -k 31 -t 50 -1 $R1 -2 $R2 -od 2_corrected_reads &> 2_corrected_reads/Rcorrector.log &