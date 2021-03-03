#!/usr/bin/env bash
#alignAll.sh
#set up Paired sequence path
pairedPath="Paired/"
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
samPath="sam/"
#create new directory for SAM output
mkdir -p $samPath
function alignReads {
    for leftInFile in $pairedPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$pairedPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        nice -n19 gsnap \
        -A sam \
        -D . \
        -d AiptasiaGmapDb \
        -s AiptasiaGmapIIT.iit \
        $pairedPath${sampleName}.R1.fastq \
        $pairedPath${sampleName}.R2.fastq \
        1>$samPath/${sampleName}.sam 2>$samPath/${sampleName}.err
done
}
alignReads 1>alignReads.log 2>alignReads.err &

   
