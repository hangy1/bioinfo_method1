#Short Read Alignment
#trimAll.sh
#alignAll.sh
#sortAll.sh
#indexAll.sh

## Overview
The 4 shell scripts above trim, align, sort and add index to reads of AiptasiaMiseq.  

## Author
Hang Yin

## Date Created
10/22/2019

## Running 
trimAll.sh
alignAll.s
sortAll.sh
indexAll.sh

## Method
Left reads and Right reads of AiptasiaMiseq were quality trimmed by using trimmomatic-0.36[1], with paired-end reads, thread:1, trim method: phread33. Then paired reads were aligned by program GSNAP[2] and produced the sam format files, alignments were sorted and indexed with SAMtools[3] and generated bam.bai format files.  

References
1.  Bolger, Anthony M., Marc Lohse, and Bjoern Usadel. "Trimmomatic: A Flexible Trimmer for Illumina Sequence Data." Bioinformatics 30.15 (2014): 2114-120. Web.
2.  Wu, Thomas D, Jens Reeder, Michael Lawrence, Gabe Becker, and Matthew J Brauer. "GMAP and GSNAP for Genomic Sequence Alignment: Enhancements to Speed, Accuracy, and Functionality." Methods in Molecular Biology (Clifton, N.J.) 1418 (2016): 283-334. Web.
3.  Li, Heng, Bob Handsaker, Alec Wysoker, Tim Fennell, Jue Ruan, Nils Homer, Gabor Marth, Goncalo Abecasis, and Richard Durbin. "The Sequence Alignment/Map Format and SAMtools." Bioinformatics 25.16 (2009): 2078-079. Web.

