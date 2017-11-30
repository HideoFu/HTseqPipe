#!/bin/sh

#　引数は "ERR266335" など

f=17 # -f は先頭削除bp数 +1
l=30 # 最小フラグメント長
t=20 # クオリティ値閾値

while [ "$1" != "" ]
do
	fastx_trimmer -f $f -i ${1}_1.fastq -o ${1}_1_trim.fastq
	fastx_trimmer -f $f -i ${1}_2.fastq -o ${1}_2_trim.fastq

	shift
done
