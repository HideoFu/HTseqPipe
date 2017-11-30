#!/bin/sh

# -x <hisat2-idx> is in $HISAT2_INDEXES folder
# input file is ***_trimmed.fq

core=6 #number of threads

while [ "$1" != "" ]
do
    hisat2 -p $core -q --dta -x genome -U ${1}_trimmed.fq -S ${1}.sam
    shift
done
