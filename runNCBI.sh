#!/bin/bash

# # donwload via fastq-dump

cd ..
touch samples.txt

for INDEX in $*
do
	echo $INDEX >> samples.txt
	shift
done

cat samples.txt | parallel fastq-dump --split-files {} # Output: *_1.fastq

rm samples.txt
cd ./HISAT

EXPcore=6
EXPgene=/mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf

for INDEX in $*
do
	export EXP1=$INDEX

# Switch Paired read 
    if [ -e ../${INDEX}_2.fastq ] ; then
        	sh ./galore-paired.sh # Output: *_1_val_1.fq, *_2_val_2.fq
        	sh ./hisat2-paired.sh # Output: *.sam
    else
        	sh ./galore.sh # Output: *_trimmed.fq
        	sh ./hisat2.sh # Output: *.sam
    fi

    sh ./samtools.sh # Output: *.sorted.bam
    sh ./stringshort.sh # Output: */
    sh ./HTseq.sh # Output: *_count.txt

    shift
done

