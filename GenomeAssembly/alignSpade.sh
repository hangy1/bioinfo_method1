#!/usr/bin/env bash
#alignSpade.sh

#set and create output path
OutPath="Rhodo/"
mkdir -p $OutPath
#input files includes left and right reads
function alignSpade {
        nice -n19 python3 /usr/local/programs/SPAdes-3.10.0-Linux/bin/spades.py \
        --threads 6 \
        -1 Paired/SRR522244_1_paired.fastq -2 Paired/SRR522244_2_paired.fastq -o $OutPath
}
alignSpade 1>alignSpade.log 2>alignSpade.err &

