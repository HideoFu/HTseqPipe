#!/bin/bash

# Download from ArrayExpress

cd ..
touch samples.txt

while [ "$1" != "" ]
do
    DIR=${1:0:6}
    echo "ftp://ftp.sra.ebi.ac.uk/vol1/fastq/${DIR}/${1}/${1}.fastq.gz" >> samples.txt 
    shift
done

cat samples.txt | parallel wget {}

while [ "$1" != "" ]
do
    tar zxf ${1}.tar.gz
    mv ${1}.fastq ${1}_1.fastq
    shift
done

rm samples.txt
     
cd ./HISAT
