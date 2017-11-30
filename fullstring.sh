#!/bin/bash

# Argument is x of x_1.fastq

export EXPcore=6
export EXPgene=/mnt/nas/public/Homo_sapiens/NCBI/build37.2/Annotation/genes.gtf

for INDEX in $*
do
	export EXP1=$INDEX

    sh ./stringtie.sh
    list="$list${INDEX}.gtf " 

done

export EXPlist=$list
sh ./stringmerge.sh

for INDEX in $*
do
	export EXP1=$INDEX

    sh ./stringout.sh

done
