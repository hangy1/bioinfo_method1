#!/usr/bin/env Rscript
# mergeAll.R


# Load BLAST results as a table using tab (\t) as separator.
# There is no header with column names, so set header=FALSE
# Set column names to match fields selected in BLAST
blast <- read.table("../BLAST/alignPredicted.txt", sep="\t", header=FALSE)
colnames(blast) <- c("qseqid", "sacc", "qlen", "slen",
                     "length", "nident", "pident", "evalue", "stitle")
# Calculate the coverage as nident/slen
blast$cov <- blast$nident/blast$slen
# Select only blast rows where coverage is greater than .9
blast <- subset(blast, cov > .9, select=-c(stitle))

#load kegg.txt
kegg <- read.table("kegg.txt", sep = "\t", header = FALSE)
# Set the column names for kegg
colnames(kegg) <- c("sacc", "kegg")
# Remove the up: prefix from the accession number so it will match the BLAST
# subject accession (sacc)
kegg$sacc <- gsub("up:", "", kegg$sacc)
# Merge the tables. Since one column name in common, just give
# the two tables as parameters to merge.
blast_kegg <- merge(blast, kegg)

#load ko.txt
ko <- read.table("ko.txt", sep = "\t", header = FALSE)
#set column names for ko
colnames(ko) <- c("kegg", "koID")
#merge the tables, add koID col to the table
MergeKo <- merge(blast_kegg, ko)

#load path.txt
path <- read.table("path.txt", sep = "\t", header = FALSE)
#set column names for path
colnames(path) <- c("koID", "pathID")
#merge the tables, add pathID col to the table
mergePath <- merge(MergeKo, path)

#load ko which contains path description
pathDes <- read.table("ko", sep = "\t", header = FALSE)
#set column names for ko
colnames(pathDes) <- c("pathID","path_description")
#merge tables, add path_description to the table
mergePathDes <- merge(mergePath, pathDes)

#load go_sp.txt
go <- read.csv("sp_go.txt", sep="\t", header=FALSE)
#column names in go
colnames(go) <- c("sacc", "GO")
#final merge and save the result
mergeGo <- merge(mergePathDes, go)

#save to csv format outut and print first several lines of result.
head(mergeGo)
write.csv(mergeGo,"Merge_All.csv")


