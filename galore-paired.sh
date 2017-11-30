#!/bin/bash

# Input files: *_1.fastq, *_2.fastq
# Output files: *_1_val_1.fq, *_2_val_2.fq

CORE=$EXPcore    # number of CPU cores. exported from 'main.sh' and so on.

mkdir Raw
mkdir Trimmed
mkdir FastQC

trim_galore -o Trimmed --paired ${EXP1}_1.fastq.gz ${EXP1}_2.fastq.gz --fastqc --fastqc_args "--nogroup -t $CORE -o FastQC"

mv ${EXP1}_1.fastq.gz ./Raw
mv ${EXP1}_2.fastq.gz ./Raw
