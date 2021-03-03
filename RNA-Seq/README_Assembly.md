#Transcriptome Assembly

## Overview
Assemble BAM files and quality trimmed reads into transcriptomes and analyze them. 

## Author
Hang Yin

## Date Created
10/27/2019

## Running
mergeAll.sh 
runTrinity.sh
trinityDeNovo.sh
analyzeTrinity.sh

## Method
Trinity-v2.8.4[1] was used to assemble merged bam file[2] and quality trimmed left reads & right reads into transcriptomes. Then TrinityStats.pl was used to analyze tramscriptomes[2].

References

1. Full-length transcriptome assembly from RNA-Seq data without a reference genome.Grabherr MG, Haas BJ, Yassour M, Levin JZ, Thompson DA, Amit I, Adiconis X, Fan L,Raychowdhury R, Zeng Q, Chen Z, Mauceli E, Hacohen N, Gnirke A, Rhind N, di Palma F,Birren BW, Nusbaum C, Lindblad-Toh K, Friedman N, Regev A.Nature Biotechnology 29, 644–652 (2011)Paper: http://www.nature.com/nbt/journal/v29/n7/full/nbt.1883.html, Code:  http://trinityrnaseq.sf.net 

2. Li, Heng, Bob Handsaker, Alec Wysoker, Tim Fennell, Jue Ruan, Nils Homer, Gabor Marth, Goncalo Abecasis, and Richard Durbin. "The Sequence Alignment/Map Format and SAMtools." Bioinformatics 25.16 (2009): 2078-079. Web.

3. Haas, Brian J et al. “De novo transcript sequence reconstruction from RNA-seq using the Trinity platform for reference generation and analysis.” Nature protocols vol. 8,8 (2013): 1494-512. doi:10.1038/nprot.2013.084
