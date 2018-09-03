#!/bin/bash

source /etc/profile.d/modules.sh
module load corset

#Tissue samples
#31/05/2017
# R18	PM_F_08	Gills	3
# R19	PM_F_08	Hepatopancreas	5
# R20	PM_F_08	Eyestalk	1
# R22	PM_M_06	Male Gonad	7
# R23	PM_F_02	Muscle	8
# R26	PM_F_02	Stomach	9
# R27	PM_M_02	Muscle	8
# R29	PM_M_02	Hepatopancreas	5
# R32	PM_F_02	Haemolymph	4
# R33	PM_F_02	Female Gonad	2
# R34	PM_F_03	Female Gonad	2
# R35	PM_M_02	Eyestalk	1
# R45	PM_M_02	Male Gonad	7
# R48	PM_F_04	Female Gonad	2
# R49	PM_F_04	Gills	3
# R50	PM_F_04	Haemolymph	4
# R53	PM_F_04	Stomach	9
# R54	PM_M_04	Eyestalk	1
# R55	PM_M_04	Gills	3
# R56	PM_M_04	Haemolymph	4
# R57	PM_M_04	Hepatopancreas	5
# R58	PM_M_04	Male Gonad	7
# R59	PM_M_04	Muscle	8
# R60	PM_M_04	Stomach	9
# R78		Lymphoid	6
# R79		Lymphoid	6
# R80		Lymphoid	6



#Tissue samples
# R18_map.bam
# R19_map.bam
# R20_map.bam
# R22_map.bam
# R23_map.bam
# R26_map.bam
# R27_map.bam
# R29_map.bam
# R32_map.bam
# R33_map.bam
# R34_map.bam
# R35_map.bam
# R45_map.bam
# R48_map.bam
# R49_map.bam
# R50_map.bam
# R53_map.bam
# R54_map.bam
# R55_map.bam
# R56_map.bam
# R57_map.bam
# R58_map.bam
# R59_map.bam
# R60_map.bam
# R78_map.bam
# R79_map.bam
# R80_map.bam

g="3,5,1,7,8,9,8,5,4,2,2,1,7,2,3,4,9,1,3,4,5,7,8,9,6,6,6"
n="GI_R18,HP_R19,EY_R20,MG_R22,MU_R23,ST_R26,MU_R27,HP_R29,HL_R32,FG_R33,FG_R34,EY_R35,MG_R45,FG_R48,GI_R49,HL_R50,ST_R53,EY_R54,GI_R55,HL_R56,HP_R57,MG_R58,MU_R59,ST_R60,LY_R78,LY_R79,LY_R80"
bam="R18_map.bam R19_map.bam R20_map.bam R22_map.bam R23_map.bam R26_map.bam R27_map.bam R29_map.bam R32_map.bam R33_map.bam R34_map.bam R35_map.bam R45_map.bam R48_map.bam R49_map.bam R50_map.bam R53_map.bam R54_map.bam R55_map.bam R56_map.bam R57_map.bam R58_map.bam R59_map.bam R60_map.bam R78_map.bam R79_map.bam R80_map.bam"


echo $g
echo $n
echo $bam
nohup corset -g $g -n $n -p tissue_trimmed $bam &>> tissue_corset_20170531.log &



