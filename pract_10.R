library(e1071)
x<-c(0,0,0,0,1,0)
y<-c(0,1,0,1,0,1)
z<-c(1,0,1,1,1,1)
w<-c(0,1,1,1,0,0)

paste("Hamming distance between x and y is",hamming.distance(x,y))

paste("Hamming distance between y and z is",hamming.distance(y,z))

paste("Hamming distance between z and w is",hamming.distance(z,w))

paste("Hamming distance between y and w is",hamming.distance(y,w))

paste("Hamming distance between x and w is",hamming.distance(x,w))

paste("Hamming distance between x and z is",hamming.distance(x,z))
