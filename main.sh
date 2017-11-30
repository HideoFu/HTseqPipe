#!/bin/bash

# Argument is x of x_1.fastq

exec > logfile 2>&1

export EXPcore=6
export EXPgene=/mnt/nas/public/Homo_sapiens/NCBI/grch38/Homo_sapiens.GRCh38.90.gtf

while [ "$1" != "" ]
do
	export EXP1=$1

# Switch Paired read 
    if [ -e ./${1}_2.fastq.gz ] ; then
        	sh `dirname $0`/galore-paired.sh
        	sh `dirname $0`/hisat2-paired.sh
    else
        	sh `dirname $0`/galore.sh
        	sh `dirname $0`/hisat2.sh
    fi

    sh `dirname $0`/samtools.sh
    sh `dirname $0`/stringshort.sh # requires EXPgene
    sh `dirname $0`/HTseq.sh

    shift
done

