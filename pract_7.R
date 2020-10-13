company <- read.csv(".//Datasets//pract_7//companies_cac40.csv",header = T)
directors <- read.csv(".//Datasets//pract_7//directors_cac40.csv",header = T)
relations <- read.csv(".//Datasets//pract_7//from_to_relationship.csv",header = T)

directors_list <- directors$id
comapany_list <- company$id

directors_list <- head(directors_list,50)
comapany_list <- head(comapany_list,50)
relations_list <- relations[1:10,c(1,2)]
plot(testNew, vertex.label.cex = 0.8, vertex.label.color ="black")
############################

relations_1 <- read.csv(file.choose(),header = T)
testNew <- graph.data.frame(relations_list)
V(testNew)$type <- bipartite_mapping(testNew)$type
V(testNew)$color <- ifelse(V(testNew)$type, "lightblue", "salmon")
V(testNew)$shape <- ifelse(V(testNew)$type, "circle", "square")
E(testNew)$color <- "lightgray"
plot(testNew, vertex.label.cex = 0.8, vertex.label.color ="black")

