#!/usr/bin/env python3
#count_aip_kmers.py:count 6-mers within the sequence line


import re
import os

#make fasta file readable
Aip_seq = open ('/Users/hangyin/BINF6308/LoopsAndDecisions/Aip02.R1.fastq', 'r')

line = ' '
new_seq = ' '
while line:
    line = Aip_seq.readline()
    line = line.rstrip(os.linesep)
    if re.match('^[ATGCN]+$', line):
        new_seq = re.findall('^[ATGC]+$', line)[0]      
        
kmer_length = 6
kmer_dictionary = {}
end = len(new_seq) - kmer_length + 1

for start in range (0, end):
    kmer = new_seq[start:start+kmer_length]

    if kmer in kmer_dictionary:
        kmer_dictionary[kmer] = kmer_dictionary[kmer] +1
    else:
        kmer_dictionary[kmer] = 1
t = "\t"
KmerCount_out = []
for kmer in kmer_dictionary:
    count = kmer_dictionary[kmer]
    KmerCount = (kmer, str(count))
    KmerCount_format = t.join(KmerCount) + "\n"
    KmerCount_out.append(KmerCount_format)

    
with open("aip_kmers.txt", 'w') as out:
    for line in KmerCount_out:
        line_to_write = line
        out.write(line_to_write)    
                          
    
    



        
    
        
        
