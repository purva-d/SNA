library(sna)
library(igraph)

linksData <-read.csv("stockman_zieglar_interlocks.csv",header=T, row.names=1)
## equivalence
eq<-equiv.clust(linksData)
plot(eq)

##Get Structural Equivalence distances
g.se<-sedist(linksData)

##Plot a metric MDS of vertex positions in two dimensions
plot(cmdscale(as.dist(g.se)))

##Blockmodeling
b<-blockmodel(linksData,eq,h=10)
plot(b)

bm<-blockmodel(linksData,eq,h=15)
plot(bm)

## regular equivalence
library(blockmodeling)
g <- graph.data.frame(linksData, directed=FALSE)
mat <- as.matrix(get.adjacency(g)) # Extract the matrix in igraph (if you haven't already)

D<-REGE(M=mat)$E 
plot.mat(mat, clu=cutree(hclust(d=as.dist(1-D),method="ward.D"),k=4))  
#REGE returns similarities, which have to be converted to disimilarities
                         
