#!/bin/bash

# Download from ArrayExpress

cd ..
touch samples.txt

for INDEX in $*
do
    DIR=${1:0:6}
    echo "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${DIR}/${INDEX}/${INDEX}.fastq.gz" >> samples.txt
    shift
done

cat samples.txt | parallel wget {}

for INDEX in $*
do
    tar zxf ${INDEX}.tar.gz
    mv ${INDEX}.fastq ${INDEX}_1.fastq
    shift
done

rm samples.txt

cd ./HISAT


# Processing

EXPcore=6
EXPgene=/mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf

while [ "$INDEX" != "" ]
do
	export EXP1=$INDEX

# Switch Paired read 
    if [ -e ../${INDEX}_2.fastq ] ; then
        	sh ./galore-paired.sh
        	sh ./hisat2-paired.sh
    else
        	sh ./galore.sh
        	sh ./hisat2.sh
    fi

    sh ./samtools.sh
    sh ./stringshort.sh
    sh ./HTseq.sh

    shift
done

