#!/usr/bin/env python3
#don't forget to write comments

import re
from Bio import SeqIO
from Bio.Seq import Seq 
from Bio.SeqRecord import SeqRecord

#extract full chromosomes from fasta file

for record in SeqIO.parse("/scratch/Drosophila/dmel-all-chromosome-r6.17.fasta", "fasta"):    
    if re.match('^\d{1}\D*$', record.id):
        dna_seq = record.seq         

#transcribe DNA to RNA and convert it to a string
rna_seq = str(dna_seq.transcribe())

#obtain sequences from start and stop codon and make sure we have even multiples of 3 bases
orf = re.search('AUG([AUGC]{3})+?(UAA|UAG|UGA)', rna_seq).group()
orf_for_translate = Seq(orf)
protein = orf_for_translate.translate()
print(protein)

