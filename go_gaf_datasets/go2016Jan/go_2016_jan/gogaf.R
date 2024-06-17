library("mgsa")

go <- readGAF("../DAVID_reborn_tool/go_gaf_datasets/go2016Jan/go_2016_jan/goa_human.gaf", evidence=NULL, aspect=c("P", "F", "C"))

head(itemAnnotations(go))
head(setAnnotations(go))
itemIndices(go,c(1:6))
itemIndices(go,42823)

# extract some of the data from the GAF file
goterms <- setAnnotations(go)
genetable <- itemAnnotations(go)
gosets <- go@sets

# collect the gene symbols for each GO
gs <- lapply(1:length(gosets), function(i) {
  prot <- names(itemIndices(go,gosets[[i]]))
  gs <- unique(genetable[which(rownames(genetable) %in% prot),1])
  return(gs)
})
names(gs) <- names(gosets)

# need to get the BP, MF, CC category from the gaf file
x <- readLines("../DAVID_reborn_tool/go_gaf_datasets/go2016Jan/go_2016_jan/goa_human.gaf",)
x <- x[grep("^!",x,invert=TRUE)]
x <- strsplit(x,"\t")
goid <- sapply(x,"[[",5)
category <- sapply(x,"[[",9)
gocat <- unique(data.frame(goid,category))

# need to make names that include the GO ID, category and term description
names(gs) <- lapply(names(gs), function(z) {
  category <- gocat[which(gocat$goid==z),2]
  category <- gsub("F","MF",gsub("C","CC",gsub("P","BP",category)))
  setname <- goterms[which(rownames(goterms)==z),1]
  paste(z,category,setname)
} )

saveRDS(gs,"human_go.Rds")



