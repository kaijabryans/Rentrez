
# Object of unique identifies 
ncbi_ids <- c("HQ433692.1", "HQ433694.1", "HQ433691.1")

# Load the rentrez package into R
library(rentrez)

# Create an object from the nuccore database, from the unique ids in the fasta format to ....
Bburg <- entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta")
print(Bburg)

# Split Bburg object to create a new object
Sequences <- strsplit(Bburg, split = "\n\n")
print(Sequences)

# Turn sequences into dataframe
Sequences <- unlist(Sequences)

# Regular Expressions
header <- gsub("(^.*sequence) \\n[ATCG].*","\\1", Sequences)
seq <- gsub("^>.*sequence\\n([ATCG].*)","\\1", Sequences) 
Sequences <- data.frame(Name = header, Sequence = seq)
print(Sequences)

# Removing newline characters from the sequences data
nl <- gsub("\\n+", " ", Sequences$Sequence)

Sequences <- data.frame(Name = header, Sequence = nl)

#Creating .csv file
write.csv(Sequences, "./Sequences.csv")
