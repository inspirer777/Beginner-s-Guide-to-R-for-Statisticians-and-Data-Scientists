#Lecture 1-9-12-99

M<-matrix(1:6,2);M
N<-2*M ;N
N+M
N/M
M^(-1)
N==M
sqrt(M)
M*N  #zarb deraye ba deraye
M %*% N #zarb jabri
M
N
M %*% t(N)#M 2*3 t(N) 3*2
###############################
M<-matrix(c(1,0,-1,10),2);M
N<-matrix(1:4,2);N
M*N
M %*% N
#zarb kronecker
M %x% N
diag(2)%x%N
kronecker(M,N,"+")
##############################
N
solve(N)
N%*% solve(N)
#Mx=c
#x<-solve(m,c)
M
solve(M)
M<-matrix(c(0,0,-1,10),2);M

det(N)
t(N)
eigen(N)
svd(M)
############################Array


?array()


array(data = NA, dim = length(data), dimnames = NULL)

A<-array(1:24,dim = c(3,4,2))
A
x<-c("r1","r2","r3")
y<-c("c1","c2","c3","c4")
z<-c("b1","b2")
dimnames(A)<-list(x,y,z)
A


B<-1:6
dim(B)<-c(1,3,2)
B

A
A[,,1]
A[,,2]
A[,2,1]

A[1:2,2,1]
A*2
log(A)
sum(A)
##############################
data("iris")
View(iris)

