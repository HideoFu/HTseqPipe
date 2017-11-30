#!/bin/bash

while [ "$1" != "" ]
do
    fastq-dump --split-files $1
    echo "Done: ${1}"
    shift
done
