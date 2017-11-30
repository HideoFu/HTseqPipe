#!/bin/bash

# step 4 of full StringTie Pipeline

core=$EXPcore    # number of threads. exported from parent process.

cd ..

stringtie ${EXP1}.sorted.bam -eB -o ./merge${EXP1}/${EXP1}.compared.gtf -p $core -G merged.gtf

cd ./HISAT
