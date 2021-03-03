#!/usr/bin/env bash
# sortAll.sh
#set up path of bam directory
bamPath="bam/"
bamsuffix=".bam"
for bamFile in $bamPath*.bam
do
    #remove path from file name and assign it pathRemoved
    pathRemoved="${bamFile/$bamPath/}"
    echo $pathRemoved
    #remove bamsuffix
    fileName="${pathRemoved/$bamsuffix/}"
    echo $fileName
    samtools index $bamFile \
    1>$bamPath/${fileName}.index.log 2>$bamPath/${fileName}.index.err &
done
