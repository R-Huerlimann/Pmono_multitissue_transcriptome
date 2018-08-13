#!/bin/bash

#collection of bridger assemblies

#Assembly of PM_M_04 all tissues
#Samples: PM_M_04
#Tissues: EY,GI,HL,HP,MG,MU,ST 
#13/02/2017
DIR=trinity_PMM04_20170124/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMM04_20170213

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log"

#Assembly of PM_F_02 all tissues
#Samples: PM_F_02
#Tissues: FG,HL,MU,ST
#13/02/2017
DIR=trinity_PMF02_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMF02_20170213-2

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 20 --clean &>> $outputFolder".log"

#Assembly of PM_F_04 all tissues
#Samples: PM_F_04
#Tissues: FG,GI,HL,ST 
#13/02/2017
DIR=trinity_PMF04_20170206/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMF04_20170213

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &

#Assembly of PM_M_02 all tissues
#Samples: PM_M_02
#Tissues: EY, HP, MG, MU
#13/02/2017
DIR=trinity_PMM02_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMM02_20170213

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &

#Assembly of PM_F_03 all tissues
#Samples: PM_F_03
#Tissues: FG
#14/02/2017
DIR=trinity_PMF03_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMF03_20170214

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &

#Assembly of PM_M_06 all tissues
#Samples: PM_M_06
#Tissues: MG
#14/02/2017
DIR=trinity_PMM06_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMM06_20170214

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &

#Assembly of PM_F_08 all tissues
#Samples: PM_F_08
#Tissues: EY, GI, HP
#14/02/2017
DIR=trinity_PMF08_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_PMF08_20170214

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &

#Assembly of larval samples combined
#Samples: Larvae
#Tissues: All larval stages
#14/02/2017
DIR=trinity_larval_20170124/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_larval_20170214

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &

#Assembly of lymphoid organ pooled
#Samples: R78, R79, R80
#Tissues: Lymphoid organ 
#22/02/2017
DIR=trinity_lymphoid_all_20170209/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=bridger_lymphoid_20170222

nohup perl /Software/Bridger_r2014-12-01/Bridger.pl  --seqType fq --left $forward --right $reverse  --SS_lib_type RF -o $outputFolder --CPU 10 --clean &>> $outputFolder".log" &