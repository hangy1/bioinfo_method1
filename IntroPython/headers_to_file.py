#!/usr/bin/env python3

# headers_to_file.py
# This program reads a fasta file and prints the first fifty headers to dmel_headers.txt.

import re

#set the file path to the Drosophila genome

dmel_DroGenome_path = '/scratch/Drosophila/dmel-all-chromosome-r6.17.fasta'

all_headers = []
line_count = 0

with open(dmel_DroGenome_path,'r') as dmel_DroGenome:
    for line in dmel_DroGenome:
        if re.match('^>', line) and line_count < 50:
            all_headers.append(line)
            line_count = line_count +1
with open ("dmel_headers.txt",'w') as out:
    for line in all_headers:
        line_to_write = line
        out.write(line_to_write)
    
            
            

            
