##A network as a graph
library(igraph)
ng<-graph.formula(Garth-+Angela,Bill-+Elena,
                  Elena++Frank,Carol-+Andy,Carol-+Elena,Carol++Dan,
                  Carol++Bill,Dan++Bill,
                  Elena-+Daphne,Daphne++Garth)
plot(ng)

