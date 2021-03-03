#!/usr/bin/env python3
# get_kegg_ids.py
import requests
# Open the input and output files
blast_output = open("../BLAST/alignPredicted.txt")
stdout = open("kegg.txt", 'w')
stderr = open('kegg.err', 'w')
for blast_line in blast_output:
 # Remove whitespace, then split on tabs
 blast_line = blast_line.rstrip()
 fields = blast_line.split()
 # The swissprot ID is in the 2nd column, evalue in the 8th
 sp = fields[1]
 evalue = fields[7]
 # Print a status so we know how far along we are
 print("Looking at {}, with evalue {}".format(sp, evalue))
 # Do we have a significant-enough e value?
 if float(fields[7]) < float("1e-180"):
    print("Processing: {}".format(sp))
    result = requests.get(
            "http://rest.kegg.jp/conv/genes/uniprot:{}".format(sp))
 # Did our request complete successfully?
    if result.status_code == 200:
        stdout.write(result.text)
 # Flush the output so that we can monitor it as the script runs
        stdout.flush()
    else:
        stderr.write("{} not found, status code: {}\n".format(sp, result.status_code))
        stderr.flush()
