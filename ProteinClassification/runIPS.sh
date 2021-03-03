#!/usr/bin/env bash
#runIPS.sh
function runIPS {
    nice -n19 /usr/local/programs/interproscan-5.33-72.0/interproscan.sh \
        -i proteins.fasta -f tsv -o proteins.tsv
}
runIPS 1>runIPS.log 2>runIPS.err &
