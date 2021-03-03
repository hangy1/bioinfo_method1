#!/usr/bin/env bash
# predictProteins.sh
#integrate BLAST result and domain search result to predict protein and produce fasta file
/usr/local/programs/TransDecoder-5.0.1/TransDecoder.Predict \
    -t ../RNA-Seq/trinity_de-novo/Trinity.fasta \
    --retain_pfam_hits pfam.domtblout \
    --retain_blastp_hits blastp.outfmt6 \
    1>predict.log 2>predict.err &

