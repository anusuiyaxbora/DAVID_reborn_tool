#!/bin/bash

# process GO files to enable them to be read simply with R

# step 1 make a 2 column table that has GO code and GO description
zcat gene2go.gz \
| grep -w ^9606 \
| cut -f8,3,6 \
| tr ' ' '_' \
| awk '{OFS="\t"}{print $1,$3,$2}' \
| sed 's/Function\t/MF /' \
| sed 's/Component\t/CC /' \
| sed 's/Process\t/BP /' \
| tr '_' ' ' \
| sort -u -T . > geneontologies_human.tsv

# step 2 makea 2 column table that links GO code and entrez ID
zcat gene2go.gz \
| grep -w ^9606 \
| cut -f2,3 \
| sort -u -T . > entrez2go.tsv

# step 3 make a 2 column table that has maps entrez IDs to gene symbols
zcat gene_info.gz \
| grep -w ^9606 \
| cut -f2,3 \
| sort -u -T . > entrez2symbol.tsv
