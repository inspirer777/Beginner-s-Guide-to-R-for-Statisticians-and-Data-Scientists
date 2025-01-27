x<-1:6
matrix(x,nrow=2,byrow = FALSE)
matrix(x,nrow=2,byrow = TRUE)
A=matrix(x,2,3)
length(A)
M=matrix(nrow = 2,ncol = 3)
M[1,1]<-23
M[1,2]=4
matrix(x,2)
matrix(2,3,3)
matrix(scan(),2,byrow = T)
M=matrix(1:6,1)
x<-1:6
x
is.matrix(M)
is.matrix(x)

matrix(x,2,3,dimnames = list(c("r1","r2"),c("c1","c2","c3")))
m=matrix(x,2)
rownames(m)<-c("r1","r2")
colnames(m)<-c("c1","c2","c3")
m
rownames(m)
colnames(m)
dim(m)
nrow(m)
ncol(m)
dim(m)<-c(3,2)
m
x<-1:10
dim(x)=c(2,5)
x
y<-1:3
z<-c(100,500,1000)
cbind(y,z)
rbind(y,z)
m
cbind(m,y,z)
rbind(m,y,z)
rbind(1:5,1)
cbind(m,0)
####################dig()
diag(1:3)
M=matrix(1:9,3);M

diag(M)
diag(3)
M
M[2,2]
M[1,3]
M[1,]
M[,1]
M[,3]
M[-1,]
M[,-3]
M[,-c(2,3)]
M
fix(M)
M
edit(M)
M
