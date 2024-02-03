############## 6.4 Exercícios
#1
x <- data.frame()
dim(x)
#2
#### data frame iris
iris
#a)
?summary
####y <- iris
summary(iris)
#b)
iris
?subset
iris$Species
xx <- iris$Species == "versicolor"
sum(xx)
(vers1 <- subset(iris, xx))
(vers1 <- vers1[, -5]) ### ao usar este comando estou a indexar, logo não é correto?
iris[xx,]

#e
(vers2 <- iris[xx,-5])

#c)
l <- nrow(iris)

v <- rep(0, 150); v
for(i in l){
  v[i] <- sum(iris[i, -5]) ### é necessário remover esta coluna por causa do tipo
}
v

#com apply
?apply
### aplicar apply as linhas
apply(iris[xx,-5], 1, sum)
#d)
?mean
?apply
mean(iris)
apply(iris[,-5], 2, mean)
colMeans(iris[,-5])
#e)

comprimento <- nrow(iris[,-5]); comprimento
(sup <- iris[-5] > 5)
(sup5 <- colSums(sup))


df <- data.frame()
df <- data.frame(x = 1:10, Y = letters[1:10])
df
dim(df)

str(df)

ols <- c(17, 22, 22, 25, 28)
mean(ols)