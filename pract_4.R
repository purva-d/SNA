library(igraph)
## Use tab separated values
nmatt <- as.matrix(read.table(text = 
                                "Node	A	B	C	D	E	F
A	2	4	0	0	2	1
B	0	0	5	1	0	0
C	6	3	0	2	0	5
D	4	1	0	0	3	1
E	2	7	1	0	0	0
F	0	0	0	2	0	0",header = T))
nms <- nmatt[,1 ]
matt <- nmatt[, -1]
## Setting up the matrix
colnames(matt) <- rownames(matt) <- nms
matt[is.na(matt)] <- 0
matt
## Converting matrix into graph
g <- graph.adjacency(matt, weighted=TRUE)
plot(g)
s.paths <- shortest.paths(g, algorithm = "dijkstra")
s.paths
## Shortest path between 2 vertices
shortest.paths(g, v="C", to="A")
## Plot the graph with weights
plot(g, edge.label=E(g)$weight)

--------------------------------------------
##Calculating density of the graph
graph.density(g, loops=TRUE)
graph.density(simplify(g), loops=TRUE)