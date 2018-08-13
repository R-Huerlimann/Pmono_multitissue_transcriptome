#!/bin/bash

source /etc/profile.d/modules.sh
module load jellyfish
module load bowtie2
module load samtools

echo "starting"

#assembling the most complete individual in terms of number of tissues
#Samples: PM_M_04
#Tissues: Eyestalk, Gills, Haemolymph, Hepatopancreas, Male Gonad, Muscle, Stomach
#24/01/2017
DIR=2_corrected_reads
forward=$DIR/R54_R1.cor.fq,$DIR/R55_R1.cor.fq,$DIR/R56_R1.cor.fq,$DIR/R57_R1.cor.fq,$DIR/R58_R1.cor.fq,$DIR/R59_R1.cor.fq,$DIR/R60_R1.cor.fq
reverse=$DIR/R54_R2.cor.fq,$DIR/R55_R2.cor.fq,$DIR/R56_R2.cor.fq,$DIR/R57_R2.cor.fq,$DIR/R58_R2.cor.fq,$DIR/R59_R2.cor.fq,$DIR/R60_R2.cor.fq
outputFolder=trinity_PMM04_20170124

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 15 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#assembling all the larval stages together
#Samples: all larval stages
#Tissues: Embryo, Nauplii, Zoea, Mysis, PL 1, PL 4, PL 10, PL 15,
#24/01/2017
DIR=2_corrected_reads
forward=$DIR/R61_R1.cor.fq,$DIR/R63_R1.cor.fq,$DIR/R65_R1.cor.fq,$DIR/R67_R1.cor.fq,$DIR/R69_R1.cor.fq,$DIR/R71_R1.cor.fq,$DIR/R73_R1.cor.fq,$DIR/R75_R1.cor.fq
reverse=$DIR/R61_R2.cor.fq,$DIR/R63_R2.cor.fq,$DIR/R65_R2.cor.fq,$DIR/R67_R2.cor.fq,$DIR/R69_R2.cor.fq,$DIR/R71_R2.cor.fq,$DIR/R73_R2.cor.fq,$DIR/R75_R2.cor.fq
outputFolder=trinity_larval_20170124

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 15 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#Assembly of all larval stages individually
#Samples: R61
#Tissues: Embryo
#30/01/2017
DIR=2_corrected_reads
forward=$DIR/R61_R1.cor.fq
reverse=$DIR/R61_R2.cor.fq
outputFolder=trinity_R61_embryo_20170130

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#Assembly of remaining individuals with all available tissues pooled
#Samples: PM_F_04
#Tissues: Female Gonad, Gills, Haemolymph, Stomach
#06/02/2017
DIR=2_corrected_reads
forward=$DIR/R48_R1.cor.fq,$DIR/R49_R1.cor.fq,$DIR/R50_R1.cor.fq,$DIR/R53_R1.cor.fq
reverse=$DIR/R48_R2.cor.fq,$DIR/R49_R2.cor.fq,$DIR/R50_R2.cor.fq,$DIR/R53_R2.cor.fq
outputFolder=trinity_PMF04_20170206

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#Assembly of remaining individuals with all available tissues pooled
#Samples: PM_F_02
#Tissues: Female Gonad, Haemolymph, Muscle, Stomach 
#07/02/2017
DIR=2_corrected_reads
forward=$DIR/R33_R1.cor.fq,$DIR/R32_R1.cor.fq,$DIR/R23_R1.cor.fq,$DIR/R26_R1.cor.fq
reverse=$DIR/R33_R2.cor.fq,$DIR/R32_R2.cor.fq,$DIR/R23_R2.cor.fq,$DIR/R26_R2.cor.fq
outputFolder=trinity_PMF02_20170207

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &


#Assembly of remaining individuals with all available tissues pooled
#Samples: PM_F_08
#Tissues: Eyestalk, Gills, Hepatopancreas 
#07/02/2017
DIR=2_corrected_reads
forward=$DIR/R20_R1.cor.fq,$DIR/R18_R1.cor.fq,$DIR/R19_R1.cor.fq
reverse=$DIR/R20_R2.cor.fq,$DIR/R18_R2.cor.fq,$DIR/R19_R2.cor.fq
outputFolder=trinity_PMF08_20170207

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#Assembly of remaining individuals with all available tissues pooled
#Samples: PM_F_03
#Tissues: Female Gonad 
#07/02/2017
DIR=2_corrected_reads
forward=$DIR/R34_R1.cor.fq
reverse=$DIR/R34_R2.cor.fq
outputFolder=trinity_PMF03_20170207

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#Assembly of remaining individuals with all available tissues pooled
#Samples: PM_M_02
#Tissues: Eyestalk, Hepatopancreas, Male Gonad, Muscle 
#07/02/2017
DIR=2_corrected_reads
forward=$DIR/R35_R1.cor.fq,$DIR/R29_R1.cor.fq,$DIR/R45_R1.cor.fq,$DIR/R27_R1.cor.fq
reverse=$DIR/R35_R2.cor.fq,$DIR/R29_R2.cor.fq,$DIR/R45_R2.cor.fq,$DIR/R27_R2.cor.fq
outputFolder=trinity_PMM02_20170207

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &> $outputFolder".log" &

#Assembly of remaining individuals with all available tissues pooled
#Samples: PM_M_06
#Tissues: Male Gonad 
#07/02/2017
DIR=2_corrected_reads
forward=$DIR/R22_R1.cor.fq
reverse=$DIR/R22_R2.cor.fq
outputFolder=trinity_PMM06_20170207

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &>> $outputFolder".log" &

#Assembly of lymphoid organ pooled
#Samples: R78, R79, R80
#Tissues: Lymphoid organ 
#09/02/2017
DIR=2_corrected_reads
forward=$DIR/R78_R1.cor.fq,$DIR/R79_R1.cor.fq,$DIR/R80_R1.cor.fq
reverse=$DIR/R78_R2.cor.fq,$DIR/R79_R2.cor.fq,$DIR/R80_R2.cor.fq
outputFolder=trinity_lymphoid_all_20170209

nohup /Software/trinityrnaseq-2.3.2/Trinity --seqType fq --max_memory 200G --trimmomatic --left $forward --right $reverse --SS_lib_type RF --CPU 10 --output $outputFolder --quality_trimming_params "ILLUMINACLIP:/Software/trinityrnaseq-2.3.2/trinity-plugins/Trimmomatic-0.32/adapters/TruSeq3-PE-2.fa:2:40:15 LEADING:2 TRAILING:2 MINLEN:25" &>> $outputFolder".log" &