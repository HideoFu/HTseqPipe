#!/bin/bash

# Step 3 of full StringTie Pipeline

core=$EXPcore    # number of threads. exported from parent process.
REF=$EXPgene   #reference genome. exported from parent process.
list=$EXPlist    # list of gtf files to be merged.

cd ..

stringtie --merge -p $core -G $REF -o merged.gtf $list

cd ./HISAT
