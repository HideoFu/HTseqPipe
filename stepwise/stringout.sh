#!/bin/bash

core=6

while [ "$1" != "" ]
do
    stringtie ${1}.sorted.bam -eB -o ./${1}/${1}.compared.gtf -p $core -G merged.gtf

    shift
done
