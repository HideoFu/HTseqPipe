#!/bin/bash

# Input file: *_1.fastq.gz
# Output file: *_trimmed.fq

CORE=$EXPcore    # number of threads. exported from 'main.sh' and so on.

mkdir Raw
mkdir Trimmed
mkdir FastQC

trim_galore -o Trimmed ${EXP1}_1.fastq.gz --dont-gzip --fastqc --fastqc_args "--nogroup -t $CORE -o FastQC"

mv ${EXP1}_1.fastq ./Raw
