### cbind()
### rbind()

set.seed(456)
(col1 <- sample(-8:7, 10, replace = T))
(col2 <- sample(-8:7, 10, replace = T))
(col3 <- sample(-8:7, 10, replace = T))
(col4 <- sample(-8:7, 10, replace = T))
(col5 <- sample(-8:7, 10, replace = T))

mat <- cbind(col1, col2, col3, col4, col5)

is.matrix(mat)
is.array(mat)
is.vector(mat)
is.vector(col4)
is.array(col4)

dim(mat)
dim(col4)

#a)

#### produto matricial
A
t(A)
A %*% t(A)


