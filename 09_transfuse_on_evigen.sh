#!/bin/bash

dir=/3_combined_results_0.98
R1=$dir/larval_R1.fq,$dir/lymphoid_R1.fq,$dir/PMF02_R1.fq,$dir/PMF03_R1.fq,$dir/PMF04_R1.fq,$dir/PMF08_R1.fq,$dir/PMM02_R1.fq,$dir/PMM04_R1.fq,$dir/PMM06_R1.fq
R2=$dir/larval_R2.fq,$dir/lymphoid_R2.fq,$dir/PMF02_R2.fq,$dir/PMF03_R2.fq,$dir/PMF04_R2.fq,$dir/PMF08_R2.fq,$dir/PMM02_R2.fq,$dir/PMM04_R2.fq,$dir/PMM06_R2.fq

nohup /Software/transfuse-0.5.0-modified/transfuse --assemblies=combined_multi_evigen.fa --left=$R1 --right=$R2 --threads=55 --id=0.98 --verbose --output=tranfuse_on_evigen_multi_0.98.fa &>> transfuse_on_evigen_multi_0.98.log &

