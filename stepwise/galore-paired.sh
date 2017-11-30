#!/bin/bash

CORE=6

while [ "$1" != "" ]
do
    trim_galore -o Trimmed --paired ${1}_1.fastq ${1}_2.fastq --fastqc --fastqc_args "--nogroup -t $CORE -o FastQC"

    mv ${1}_1.fastq ./Raw
    mv ${1}_2.fastq ./Raw

    shift
done
