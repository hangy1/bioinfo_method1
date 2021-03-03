#!/usr/bin/env bash
# trim.sh
#set both paired and unpaired output path
pairedOutPath="Paired/"
unpairedOutPath="Unpaired/"
mkdir -p $pairedOutPath
mkdir -p $unpairedOutPath
# Loop through all the left-read fastq files in $fastqPath
function trim {
        nice -n19 java -jar /usr/local/programs/Trimmomatic-0.36/trimmomatic-0.36.jar PE \
        -threads 1 -phred33 \
        SRR522244_1.fastq SRR522244_2.fastq \
        $pairedOutPath/SRR522244_1_paired.fastq \
        $unpairedOutPath/SRR522244_1_unpaired.fastq \
        $pairedOutPath/SRR522244_2_paired.fastq \
        $pairedOutPath/SRR522244_2_unpaired.fastq \
        HEADCROP:0 \
        ILLUMINACLIP:/usr/local/programs/Trimmomatic-0.36/adapters/TruSeq3-PE.fa:2:30:10 \
        LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
}
trim 1>trim.log 2>trim.err &
