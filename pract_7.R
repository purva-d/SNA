library(igraph)
relations <- read.csv(".//Datasets//pract_7//from_to_relationship.csv",
                      header = T)
relations <- relations[1:50,c(1,2)]
View(relations)
g <- graph.data.frame(relations)
V(g)$type <- bipartite_mapping(g)$type

## 2 mode to 1 mode network
bipartite_matrix <- as_incidence_matrix(g)
bipartite_matrix
t(bipartite_matrix)

##company matrix
company_matrix_prod <- t(bipartite_matrix) %*% bipartite_matrix 
## crossprod() does same and scales better, but this is better to 
##learn at first at first so you understand the method
diag(company_matrix_prod) <- 0
company_matrix_prod

##person matrix
person_matrix_prod <- bipartite_matrix %*% t(bipartite_matrix)
diag(person_matrix_prod) <- 0
person_matrix_prod

## person overlap
director_overlap <- graph_from_adjacency_matrix(person_matrix_prod, 
                                             mode = "undirected", 
                                             weighted = TRUE)
View(director_overlap)

## company overlap
companys_overlap <- graph_from_adjacency_matrix(company_matrix_prod, 
                                              mode = "undirected", 
                                              weighted = TRUE)
companys_overlap

E(director_overlap)$weight
E(companys_overlap)$weight

## Jaccard
library(ade4) # If you have not already done so
library(igraph)
relations <- read.csv("C://Users//DELL//Documents//Msc_Part_2//SNA//dataset_2mode//from_to_relationship_company.csv",header = T)
relations <- relations[1:50,c(1,2)]
g <- graph.data.frame(relations)
V(g)$type <- bipartite_mapping(g)$type
bipartite_matrix <- as_incidence_matrix(g)  # Extract the matrix

director_jaccard <- dist.binary(bipartite_matrix, method=1, upper=TRUE, diag = FALSE) # Method #1 is "Jaccard Index"
company_jaccard <- dist.binary(t(bipartite_matrix), method=1, upper=TRUE, diag = FALSE) 

director_jaccard <- as.matrix(director_jaccard)   
diag(director_jaccard)<-0

# director_jaccard          # Look at the matrix before you binarize
jaccard_director <- ifelse(director_jaccard>0.8164966, 1, 0)     # Binarize

# jaccard_director      # Take a look at the matrix if you like.

jacc_director <- graph_from_adjacency_matrix(jaccard_director,mode = "undirected")
plot(jacc_director)

V(jacc_director)$size <- degree(jacc_director)
V(jacc_director)$label.cex <- degree(jacc_director) * 0.3
plot(jacc_director, layout = layout_with_graphopt)

jacc_director <- simplify(jacc_director, 
                          edge.attr.comb = list(weight = "sum", 
                                                function(x)length(x)))

sample.layout <- layout.kamada.kawai(jacc_director)
plot.igraph(jacc_director, layout = sample.layout)

##--------------------------------------------------------------
company_jaccard <- dist.binary(t(bipartite_matrix), method=1, upper=TRUE, diag = FALSE) 
company_jaccard <- as.matrix(company_jaccard)   
diag(company_jaccard)<-0

# director_jaccard          # Look at the matrix before you binarize
jaccard_company <- ifelse(company_jaccard>0.8944272, 1, 0)     # Binarize

# jaccard_director      # Take a look at the matrix if you like.

jacc_company <- graph_from_adjacency_matrix(jaccard_company,mode = "undirected")
plot(jacc_company)

V(jacc_director)$size <- degree(jacc_director)
V(jacc_director)$label.cex <- degree(jacc_director) * 0.1
plot(jacc_director, layout = layout_with_graphopt)

jacc_director <- simplify(jacc_director, 
                          edge.attr.comb = list(weight = "sum", 
                                                function(x)length(x)))

sample.layout <- layout.kamada.kawai(jacc_director)
plot.igraph(jacc_director, layout = sample.layout)