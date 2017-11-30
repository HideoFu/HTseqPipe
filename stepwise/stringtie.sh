#!/bin/bash

core=6  #number of threads
REF=/mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf

while [ "$1" != "" ]
do
    stringtie ${1}.sorted.bam -p $core -G $REF -o ${1}.gtf 

    shift
done
