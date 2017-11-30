#!/bin/sh

# -x <hisat2-idx> is in  $HISAT2_INDEXES folder
# input file is ***_1_val_1.fq and ***_2_val_2.fq

core=6 #number of threads

while [ "$1" != "" ]
do
    hisat2 -p $core -q --dta -x genome -1 ${1}_1_val_1.fq -2 ${1}_2_val_2.fq -S ${1}.sam
    shift
done
