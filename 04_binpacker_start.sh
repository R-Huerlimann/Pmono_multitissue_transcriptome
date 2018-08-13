#!/bin/bash

#collection of binpacker assemblies

#Assembly of PM_M_04 all tissues
#Samples: PM_M_04
#Tissues: EY,GI,HL,HP,MG,MU,ST 
#15/02/2017
DIR=/trinity_PMM04_20170124/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMM04_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_02 all tissues
#Samples: PM_F_02
#Tissues: FG,HL,MU,ST
#15/02/2017
DIR=/trinity_PMF02_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMF02_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_04 all tissues
#Samples: PM_F_04
#Tissues: FG,GI,HL,ST 
#15/02/2017
DIR=/trinity_PMF04_20170206/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMF04_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_M_02 all tissues
#Samples: PM_M_02
#Tissues: EY, HP, MG, MU
#17/02/2017
DIR=/trinity_PMM02_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMM02_20170217

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_03 all tissues
#Samples: PM_F_03
#Tissues: FG
#15/02/2017
DIR=/trinity_PMF03_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMF03_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_M_06 all tissues
#Samples: PM_M_06
#Tissues: MG
#15/02/2017
DIR=/trinity_PMM06_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMM06_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of PM_F_08 all tissues
#Samples: PM_F_08
#Tissues: EY, GI, HP
#15/02/2017
DIR=/trinity_PMF08_20170207/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_PMF08_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of larval samples combined
#Samples: Larvae
#Tissues: All larval stages
#15/02/2017
DIR=/trinity_larval_20170124/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_larval_20170215

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..

#--------------------------------------------------------------------------------------------------------------------------------------------------------

#Assembly of lymphoid organ pooled
#Samples: R78, R79, R80
#Tissues: Lymphoid organ 
#22/02/2017
DIR=/trinity_lymphoid_all_20170209/insilico_read_normalization/
forward=$DIR/left.norm.fq
reverse=$DIR/right.norm.fq
outputFolder=binpacker_lymphoid_20170222

mkdir $outputFolder
cd $outputFolder
nohup /Software/BinPacker_binary/BinPacker -s fq -p pair -l $forward -r $reverse -m RF -q &>> $outputFolder".log" &
cd ..
