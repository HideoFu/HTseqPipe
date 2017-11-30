#!/bin/bash

core=6

while [ "$1" != "" ]
do
    in="$in${1}.gtf "

    shift
done

stringtie --merge -p $core -G /mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf -o merged.gtf $in
