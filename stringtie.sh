#!/bin/bash

# Step 2 of full StringTie Pipeline.

core=$EXPcore  #number of threads. exported from parent process
REF=$EXPgene    # reference genome. exported from parent process.

cd ..

stringtie ${EXP1}.sorted.bam -p $core -G $REF -o ${EXP1}.gtf 

cd ./HISAT
