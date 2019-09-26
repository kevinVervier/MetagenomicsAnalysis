# This script provides example of how to get alpha-diversity metrics from a 

# load packages
library(phyloseq)

# Please insert the name of the Kraken output file (raw counts)
MYDATAFILE = 'EXAMPLE.kraken'

# Please insert the name of the metadata file (first column should be lane ID, second column should be group ID)
MYMETADATAFILE = 'EXAMPLE.metadata'

# read metadata
metadata = read.table(MYMETADATAFILE,header=TRUE)
# this table should contain:
# - a unique ID for metagenomics run (here refered as sangerID)
# - a patient ID
# - a group lable (for instance case or control)
colnames(metadata) = c('sangerID','patient','group')

# read abundance info
dat = read.delim(MYDATAFILE,header = TRUE,stringsAsFactors=FALSE,check.names = FALSE)


ps <- phyloseq(sample_data(metadata),
               otu_table(dat, taxa_are_rows = FALSE))

# Diversity and richness measurements:
richness = estimate_richness(ps)

