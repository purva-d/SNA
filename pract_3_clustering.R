library(igraph)
## generate 2 networks
g1 <- watts.strogatz.game(1, size = 100, nei = 5, p = 0.05)
g2 <- barabasi.game(50, p = 2, directed = FALSE)

## Merging the graphs and simplifying them
g <- graph.union(g1,g2)
g <- simplify(g)

## Using Grivan-Newman algorithm we find if there are any communities
## first checking edge betweenness, merges etc
ebc <- edge.betweenness.community(g, directed = FALSE)

mods <- sapply(0:ecount(g),function(i){
        g2 <- delete.edges(g, ebc$removed.edges[seq(length = i)])
        cl <- clusters(g)$membership
        modularity(g,cl)
})
plot(mods, pch = 20)
g2 <- delete.edges(g, ebc$removed.edges[seq(length = which.max(mods) - 1)])
V(g)$color = clusters(g2)$membership

g$layout <- layout.fruchterman.reingold()
plot(g, vetex.label = NA)

## Using fastgreedy community algorithm
cfg <- fastgreedy.community(g)
g <- simplify(g)
plot(cfg,g)
## custom cluster
plot(structure(list(membership=cutat(cfg, 3)), class="communities"), g , vertex.label = NA)

