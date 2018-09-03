#!/bin/bash

source /etc/profile.d/modules.sh
module load corset

#Runing larval samples
#31/05/2017
# R61		Embryo
# R63		Nauplii
# R65		Zoea
# R67		Mysis
# R69		PL 1
# R71		PL 4
# R73		PL 10
# R75		PL 15
# R61_map.bam
# R63_map.bam
# R65_map.bam
# R67_map.bam
# R69_map.bam
# R71_map.bam
# R73_map.bam
# R75_map.bam

g="1,2,3,4,5,6,7,8"
n="Embryo,Nauplii,Zoea,Mysis,PL01,PL04,PL10,PL15"
bam="R61_map.bam R63_map.bam R65_map.bam R67_map.bam R69_map.bam R71_map.bam R73_map.bam R75_map.bam"

echo $g
echo $n
echo $bam
nohup corset -g $g -n $n -p larval_trimmed $bam &>> larval_corset_20170531.log &