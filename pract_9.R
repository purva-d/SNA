##company <- read.csv(".//Datasets//pract_7//companies_cac40.csv",header = T)
##directors <- read.csv(".//Datasets//pract_7//directors_cac40.csv",header = T)
relations <- read.csv(".//Datasets//pract_7//from_to_relationship.csv",header = T)

relations_list <- relations[1:50,c(1,2)]

##
relations_2 <- read.csv(relations_list,header = T)
  testNew <- graph.data.frame(relations_2)
 V(testNew)$type <- bipartite_mapping(testNew)$type
 V(testNew)$color <- ifelse(V(testNew)$type, "lightblue", "salmon")
  V(testNew)$shape <- ifelse(V(testNew)$type, "circle", "square")
  E(testNew)$color <- "lightgray"
 plot(testNew, vertex.label.cex = 0.6, vertex.label.color ="black",layout=layout_with_fr)
test.layout <- layout_(testNew,with_dh(weight.edge.lengths = edge_density(testNew)/1000))
plot(testNew, vertex.label.cex = 0.6, vertex.label.color ="black",layout=test.layout)
plot(testNew, layout = layout_with_graphopt)

plot(testNew, layout=layout.bipartite, vertex.size=7,vertex.label.cex=0.6)
