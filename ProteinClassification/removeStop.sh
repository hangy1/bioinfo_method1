#!/usr/bin/env bash
#removeStop.sh
sed 's/*//g' ../BLAST/Trinity.fasta.transdecoder.pep | head -n 500 > proteins.fasta
