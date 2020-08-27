library(igraph)
kite <- graph.famous("Krackhardt_Kite")
plot(kite)
vertexCount <- vcount(kite)
edgeCount <- ecount(kite)
## As the graph is undirected 
density <- (2 * edgeCount)/( vertexCount * (vertexCount - 1))
density
## Reciprocity
dg <- graph.formula(1-+2, 1++4, 2++3, 2-+4, 3-+5)
plot(dg)
reciprocity(dg)

## Transitivity
transitivity(kite, type="local")
## using formula
adjacent.triangles(kite) / (degree(kite) * (degree(kite)-1)/2)

## Centrality
centralization.degree(net, mode="in", normalized=T)
## closeness
closeness(dg, mode="all", weights=NA)
closeness(kite, mode="all", weights=NA)
##degree of Centrality
centralization.degree(dg, mode="in", normalized=T)
##Betweeness Centrality
betweenness(dg, directed=T, weights=NA)
edge.betweenness(dg, directed=T, weights=NA)
centralization.betweenness(dg, directed=T, normalized=T)

##Eigenvector centrality
centralization.evcent(net, directed=T, normalized=T)


