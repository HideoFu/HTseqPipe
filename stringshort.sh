#!/bin/bash

core=$EXPcore    # number of threads. exported from parent process (ex. 'main.sh')

REF=$EXPgene

mkdir $EXP1

stringtie ${EXP1}.sorted.bam -eB -o ./${EXP1}/${EXP1}.compared.gtf -p $core -G $REF
