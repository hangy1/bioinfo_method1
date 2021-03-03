#!/usr/bin/env bash
# sortAll.sh
#set up path of sam directory
samPath="sam/"
samsuffix=".sam"
bamPath="bam/"
mkdir -p $bamPath
for samFile in $samPath*$samsuffix
do
    #remove path from file name and assign it pathRemoved
    pathRemoved="${samFile/$samPath/}"
    echo $pathRemoved
    #remove samsuffix
    fileName="${pathRemoved/$samsuffix/}"
    echo $fileName
    samtools sort \
    $samPath${fileName}.sam \
    -o $bamPath/${fileName}.sorted.bam \
    1>$bamPath/${fileName}.sort.log 2>$bamPath/${fileName}.sort.err &
done
