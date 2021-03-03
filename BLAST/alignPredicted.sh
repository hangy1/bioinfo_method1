#!/usr/bin/env bash
#alignPredicted.sh
#this script align output of Transcoder.Predict which is Trinity.fasta.transdecoder.pep against Swissprot
blastp -query Trinity.fasta.transdecoder.pep \
    -db swissprot \
    -outfmt "6 qseqid sacc qlen slen length nident pident evalue stitle" -evalue 1e-10 -num_threads 4 1> alignPredicted.txt \
    2>alignPredicted.err &
#the output file is alignPredicted.txt
