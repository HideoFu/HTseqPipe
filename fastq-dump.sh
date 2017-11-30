#!/bin/bash

# call from run.sh
cd ..
fastq-dump --split-files $EXP1
cd ./HISAT
