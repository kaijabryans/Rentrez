#Loading Libraries
library(rentrez)

#COVID reference genome from Genbank
covid <- entrez_fetch(db = "nuccore", id = "NC_045512.2", rettype = "fasta")
print(covid)

# Fixing up the genome sequence 
covid_header <- gsub(">.*genome\\n/([ATCG].*)", "\\1", covid) # removing header
covid_genome <- gsub("\\n", "", covid_header) # removing spaces

# Isolate the S protein between 21,563 and 24,384
S_protein <- substr(covid_genome, 21563, 25384)

print(S_protein) #shows sequence

# Comment on Blast results
# This gene seems to be very well conserved amongst all the different SARS-COVID
# strains across the world. It had a 100% match with dozens of different isolates, 
# demonstrating its high conservation. The highly conserved nature of the spike
# protein may be due to it being a functionally important protein for the virus,
# meaning that it is essential or an important factor of its survival. 

