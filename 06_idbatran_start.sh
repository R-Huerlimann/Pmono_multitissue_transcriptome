#!/bin/bash

#preparing the interleaved input files

echo "starting"

#Assembly of PM_M_04 all tissues
#Samples: PM_M_04
#Tissues: EY,GI,HL,HP,MG,MU,ST 
#20/02/2017
DIR=/trinity_PMM04_20170124/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMM04_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 15 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_02 all tissues
#Samples: PM_F_02
#Tissues: FG,HL,MU,ST
#20/02/2017
DIR=/trinity_PMF02_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMF02_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 15 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_04 all tissues
#Samples: PM_F_04
#Tissues: FG,GI,HL,ST 
#20/02/2017
DIR=/trinity_PMF04_20170206/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMF04_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_M_02 all tissues
#Samples: PM_M_02
#Tissues: EY, HP, MG, MU
#20/02/2017
DIR=/trinity_PMM02_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMM02_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_03 all tissues
#Samples: PM_F_03
#Tissues: FG
#20/02/2017
DIR=/trinity_PMF03_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMF03_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_M_06 all tissues
#Samples: PM_M_06
#Tissues: MG
#20/02/2017
DIR=/trinity_PMM06_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMM06_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_08 all tissues
#Samples: PM_F_08
#Tissues: EY, GI, HP
#20/02/2017
DIR=/trinity_PMF08_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_PMF08_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of larval samples combined
#Samples: Larvae
#Tissues: All larval stages
#20/02/2017
DIR=/trinity_larval_20170124/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_larval_20170220

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &

nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log" &

#--------------------------------------------------------------------------------------------------------------

#Assembly of lymphoid organ pooled
#Samples: R78, R79, R80
#Tissues: Lymphoid organ 
#22/02/2017
DIR=/trinity_lymphoid_all_20170209/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=idbatran_lymphoid_20170222

mkdir $outputFolder
nohup /Software/idba-master/bin/fq2fa --merge $forward  $reverse $outputFolder/merged_for_idba.fa &>> $outputFolder/fastq2fastaout.log &
nohup /Software/idba-master/bin/idba_tran --read $outputFolder/merged_for_idba.fa --out $outputFolder --num_threads 10 &>> $outputFolder".log"