#!/bin/sh

CORE=6

while [ "$1" != "" ]
do
    samtools view -Su -@ $CORE ${1}.sam | samtools sort - -@ 6 ${1}.sorted

    shift
done
