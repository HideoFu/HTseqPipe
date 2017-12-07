#!/bin/sh

# Input file: *.sam
# Output file: *.sorte.bam

CORE=$EXPcore    # number of threads. exported from 'main.sh'.

samtools --version

samtools view -Su -@ $CORE ${EXP1}.sam | samtools sort - -@ $CORE -o ${EXP1}.sorted.bam -T ${EXP1}.temp
