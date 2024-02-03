### listas
### estruturas de dados unidimensionais
### podem-se armazenar noscomponentes de uma lista
## estruturas de dados de diferentes classes e tipos


vetor_nomes <- c("maria", "ana", "joaquim")
vetor_num <- seq(8,9, length.out = 10)
?matrix
matrix <- matrix (seq(100,101, length.out = 20), ncol = 5)
dados <- iris
head(dados)

lst <- list(vetor_nomes, vetor_num, matrix, dados)

length(lst)
lst[1]
lst[[1]]
class (lst[1]) ### a classe é sempre lista
### para ver do elemento temos de usar 2 parenteses retos
lst[[1]]; class(lst[[1]])

View(lst)
View(dados)

lst1 <- list(nomes = vetor_nomes, numeros = vetor_num, array = matrix, df = dados)

lst1$nomes ### é equivalente a 2 parenteses retos

class(lst[[4]])
class(lst[[3]])

lst[[3]] [1,3]
names(lst1)
names(lst)
###################################
#Exercicios Listas
?str()
myLst <- function(n){
  x <- rnorm(n)
  medx <- mean(x)
  y <- sign(medx) * rexp(n, abs(1/medx))
  k <- sum(abs(y) > abs(x))
  list(VetX = x, VetY = y, Conta = k)
}
myLst(5)
?sign
sign(-2)
sign(10)
sign(0)

#### utilização de diversas funções da familia apply com listas
### lapply: sapply e replicate
### calcule myLst(20), 5 vezes: tem que fazer 5 execuções
rep(myLst(20),5)### não funciona

out1 <- lapply(rep(20,5), myLst); out1
class(out1)

out2 <- sapply(rep(20, 5), myLst); out2
class(out2)
typeof(out2)

out3 <- replicate(5, myLst(20)); out3
class(out3)
typeof(out3)

##### importação de ficheiros de dados
### dados no formato csv

dataset <- read.csv(file.choose())

head(dataset)
str(dataset)
levels(dataset$Income.Group)
as.numeric(levels(dataset$Income.Group))
table(as.numeric(levels(dataset$Income.Group)))

### se não estiver na classe factor, tem que passar esta classe

dataset$Income.Group <- as.factor(dataset$Income.Group)
levels(dataset$Income.Group)
table(as.numeric((dataset$Income.Group)))

### antes de importar os dados mudamos a diretoria
### para a diretoria onde  se encontram os dados

getwd()
setwd("") ### "texto" dentro
### mudamos o diretorio para o local do ficheiro e damos read
ds <- read.csv("DemographicData.csv")
str(ds)

#### queremos apenas os casos cujo Income.Group seja "High income"

ds1 <- ds[ ds$Income.Group == "High income",]
### exportar o ds1 para um ficheiro csv
## se o ficheiro existir, ele faz overwriting
write.csv(ds1, "dataset.csv")

############## função tapply() e a função aggregate()
##### interessa calcular a média dos utilizadores de internet (por 100 habitantes)
### em cada nível de Income.Group
?tapply
tapply(ds$Internet.users, ds$Income.Group, mean)

class(tapply(ds$Internet.users, ds$Income.Group, mean))
dim(tapply(ds$Internet.users, ds$Income.Group, mean))
typeof(tapply(ds$Internet.users, ds$Income.Group, mean))

### se se pretender a média de utilizadores de internet e a média de nascimentos (por 1000 habitantes)
## precisamos da função aggregate
names(ds)
class(ds[,3:4])
aggregate(ds[,3:4], by = list(ds$Income.Group), mean)
class(aggregate(ds[,3:4], by = list(ds$Income.Group), mean))

###### conjunto de dados crabs
library(MASS)
head(crabs)
dim(crabs)
?crabs

sumario <- aggregate(crabs[,4:8], by = list(crabs$sp, crabs$sex), summary)
class(sumario)
dim(sumario)

