#!/bin/sh

# Input file: *.sam
# Output file: *.sorte.bam

CORE=$EXPcore    # number of threads. exported from 'main.sh'.

samtools view -Su -@ $CORE ${EXP1}.sam | samtools sort - -@ $CORE ${EXP1}.sorted