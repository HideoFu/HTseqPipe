#!/bin/bash

core=6
REF=/mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf

while [ "$1" != "" ]
do
    stringtie ${1}.sorted.bam -eB -o ./${1}/${1}.compared.gtf -p $core -G $REF

    shift
done
