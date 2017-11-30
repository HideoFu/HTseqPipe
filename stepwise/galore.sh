#!/bin/bash

CORE=6

while [ "$1" != "" ]
do
    trim_galore -o Trimmed ${1}.fastq --fastqc --fastqc_args "--nogroup -t $CORE -o FastQC"

    mv ${1}.fastq ./Raw
    shift
done
