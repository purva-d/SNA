library(igraph)
mat<-matrix(c(1,1,1,1,1,0,0,0,0,1,1,1,0,1,0,0,0,0,0,
              1,1,0,1,0,0,0,1,1,0,0,0,1,0,1,1),7,5)
print(mat)
##calculate svd
svd(mat)