# Transform a GO GOA file to an R list.

# data downloaded from https://release.geneontology.org/2016-04-01/
# FILES: goa_human.gaf.gz go_201604-termdb.obo-xml.gz

x <- readLines("goa_human.gaf.gz")
x <- x[grep("!",x,invert=TRUE)]
x <- strsplit(x,"\t")
x <- lapply(x,function(y) { y[c(3,5)] } )
x <- do.call(rbind,x) 
gos <- unique(x[,2])

library("parallel")
golist <- mclapply(gos,function(go) {
  unique(x[which(x[,2]==go),1])
},mc.cores=8 )

# the gene ontologies are sorted into a list, but we also need the names.
names(golist) <- gos
str(head(golist))
length(golist)

# need to attach the names from another file - get the GO class BP/MF/CC
library("XML")
tbl <- xmlToList("go_201604-termdb.obo-xml.gz")
gotbl <- lapply(3:length(tbl), function(i) { unlist(tbl[i]$term[c(1:3)]) } )
str(head(gotbl))
gotbl <- as.data.frame(do.call(rbind,gotbl))
str(gotbl)
gotbl$namespace <- gsub("biological_process","BP",gotbl$namespace)
gotbl$namespace <- gsub("molecular_function","MF",gotbl$namespace)
gotbl$namespace <- gsub("cellular_component","CC",gotbl$namespace)
gotbl$name <- paste(gotbl$namespace, gotbl$name)
head(gotbl)

names(golist) <- paste(names(golist) , gotbl[match(names(golist),gotbl$id),2] )
str(head(golist))

golist_mf <- golist[grep(" MF ",names(golist))]
golist_cc <- golist[grep(" CC ",names(golist))]
golist_bp <- golist[grep(" BP ",names(golist))]
lapply(list(golist_mf,golist_cc,golist_bp),length)

# save the gene lists as an R data file
saveRDS(object=golist,file="GOcombined.rds")
saveRDS(object=golist_mf,file="GOmf.rds")
saveRDS(object=golist_cc,file="GOcc.rds")
saveRDS(object=golist_bp,file="GObp.rds")

# read
#golist <- readRDS("GOsets.rds")
