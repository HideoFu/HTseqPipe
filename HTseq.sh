#!/bin/bash

# Input file: *.sorted.bam
# Output file: *_count.txt

ANNOTATION="$EXPgene"    # reference genome. exported from parent process.

htseq-count -f bam -r pos ${EXP1}.sorted.bam $ANNOTATION > ${EXP1}_count.txt
