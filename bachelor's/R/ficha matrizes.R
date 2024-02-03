#1
#a)
?matrix
(A <- matrix ( 1 : 12 , nrow=3, ncol =4))
(B <- matrix(1:12, nrow=3, ncol=4, byrow =T))

(somadeAeB <- A + B)
(transpostaA <- t(A))

(produtomatricialAeTA <- A %*% transpostaA)

#b)
A
A[2,3]
A[2,]
A[,1]

#c)
A[,1] <- 0; A
B[B %% 2 == 0] <- 0; B

#2
#a)
(nul6 <- matrix (0, nrow=6, ncol=6))
m <- col(nul6)-row(nul6); m
m[m != 1 & m != -1] <- 0; m
(m <- abs(m))
#b)
M <- m
diag(M)
(diag(M) <- 1:6)
M
#c)
SM <- M[seq(1, nrow(M), 2), seq(2, ncol(M),2)]; SM
#d)
(par <- which(M %% 2 == 0, arr.ind=T))
?which
#3
#a)
?outer
(A <- outer(0:4,0:4,"+"))
(B <- outer(0:4,0:4))
#b)
B
?apply
apply(B, 2, mean) # colunas
apply(B, 1, mean) # linhas
rowMeans(B)
colMeans(B)

colSums(A) #soma colunas de A
rowSums(B) #soma linhas de B
apply(A, 2, sum) # soma colunas de A
apply(B, 1, sum) # soma linhas de B
#c)
?outer
(C <- outer(seq(0, 20, 5), seq(0, 20, 5), "-"))

which(C>10, arr.ind=TRUE); C

D <- C
D[D > 10] <- 75; D

#4
set.seed(987654321)
v <- sample(1:10,60,replace=T); v
mat<-matrix(v,nrow=6); mat

#a)
conta4 <- function(x) sum(x > 4)
conta4(v)
mat
conta4(mat[1,]) # maior que 4 na linha 1

maior4 <- c() # não é muito eficiente
maior4 <- rep(0,6); maior4

for(i in 1:6){
  maior4[i] <- conta4(mat[i,])
}

maior4

#ou

apply(mat, 1, conta4)

#b)
contamax4 <- function(x) max(x)
max4 <- rep(0,10)

for(i in 1:10){
  max4[i] <- max(mat[,i])
}

max4
#ou
apply(mat, 2, max)

#c)
verifica <- function(x){
  sum(x == 7) == 2
}
mat
(aplica <- apply(mat, 1, verifica))

which(aplica)

#d)
mat
v1 <- colSums(mat)

which(outer(v1,v1,"+") > 75, arr.ind= T)

#5
#a)
i <- 1:20
j <- 1:5
sum(i^4/(3+j))
#b)
sum((1:20)^4/(3+(1:20)*(1:5)))
#c)
f <- function(i,j) {(i >= j) * (i^4/(3+i*j))}

outer(1:10, 1:10, f)

sum(outer(1:10, 1:10, f))

#6
#a)
set.seed(7896)
?runif

x <- runif(10, min=-2, max = 9); x
y <- runif(5, min=-1, max = 10); y

outer(y, x, "<")


#b)
f1 <- function (xVec,yVec){
  z <- colSums(outer(yVec, xVec, "<"))
  z
}

f1(x,y)

### funções sapply()
### primeiro argumento: vetor ou lista
### segundo argumento: função

#### aplica a cada elemento do vetor do primeiro argumento a função definida no segundo argumento

sapply(1:10, function(x) x > 4)

x; y

ff <- function(y) y < x

saplica <- sapply(y, ff) ## resultados por linhas

rowSums(saplica)

f2 <- function(xVec, yVec){
  z <- rowSums(sapply(yVec, function(yVec) yVec < xVec))
  z
}

f2(x,y)



set.seed(567)

(xx <- sample(-6:7, 7, replace= T))
(yy <- sample(-8:10, 2, replace=T))

f1(xx, yy)
f2(xx, yy)

#### CICLO FOR
x; y

z <- c()

for(i in 1: length(x)){
  z[i] <- sum(y < x[i])
}
z

f3 <- function(xVec, yVec){
  n <- length(xVec)
  z <- rep(0, n)
  for(i in 1: n){
    z[i] <- sum(yVec < xVec[i])
  }
  z
}

f3(x, y)