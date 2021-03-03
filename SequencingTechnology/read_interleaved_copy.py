#!/usr/bin/env python3
#

#Import SeqIO
from Bio import SeqIO

#make fastq file iterable
my_left_reads = SeqIO.parse("/scratch/AiptasiaMiSeq/fastq/Aip02.R1.fastq", "fastq")
my_right_reads = SeqIO.parse("/scratch/AiptasiaMiSeq/fastq/Aip02.R2.fastq", "fastq")
#create two empty list to append items in left and right reads
l_read = []
r_read = []
for read in my_left_reads:
    l_read.append(read)
for read in my_right_reads:
    r_read.append(read)
#create another list that combine l_read, r_read lists together
lr_read = []
for left, right in zip(l_read, r_read):
    lr_read.append(left)
    lr_read.append(right)
#write output file
with open ("interleaved.fasta","w") as output:
    SeqIO.write(lr_read, output, "fasta")
