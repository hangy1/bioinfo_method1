#!/usr/bin/env bash
#runQuast.sh
#set and create output path directory
Outpath="Quast_O/"
mkdir -p $Outpath

function run_quast {
    nice -n19 python /usr/bin/quast.py --threads 6 --scaffolds --gene-finding Rhodo/scaffolds.fasta --output-dir $Outpath
}
run_quast 1>run_quast.log 2>run_quast.err &
