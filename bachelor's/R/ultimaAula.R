### numa lista os elementos podem ser de tipos diferentes
# uma lista pode ser chamada de vetor recursivo

lista1 <- list(list(1,2), c(3,4))
str(lista1)
## View(lista1) para ver a lista ou clicar na lupa

length(lista1)

lista2 <- c(list(1,2), c(3,4))
str(lista2)

# ao usar c(), combinamos uma lista com um vetor originando uma �nica lista

### um data frame � uma lista de vetores com nome

df <- data.frame(x = 1:2, y = letters[1:2], stringsAsFactors = T)

attributes(df)
typeof(attributes(df))

# o objeto nulo n�o tem atributos

### � poss�vel definir um data frame com elementos/colunas/componentes da classe data frame ou list

### acrescentar uma coluna a df
df
df$z <- list(1:2, 3:5); df
str(df)
View(df)

df$y <- factor(df$y) ## transforma char/strings em fatores
# � poss�vel ter colunas que s�o listas nos data frames

??tibble

#############
unlist(lista1) ### devolve o vetor, reverte, passa lista a vetor
as.vector(lista1)## n�o funciona

### Se n�o pusermos nomes no data frame, ele coloca automaticamente
dframe <- data.frame(1:2, 3:4)
names(dframe)
### as linhas n�o precisam de nome
## se a linhas n�o tiverem nome n�o podemos fazer filtragem de linhas pelo nome

### a classe de uma linha de um data frame � data frame mas as colunas n�o acontece isso

?airquality ### medidas da qualidade do ar em Nova Iorque de maio a setembro de 1973

airquality[34:67,]
class(airquality[34:67,]) ### classe da linha -> data frame, ou seja, preserva a classe do objeto

class(airquality[,3:4]) ### aparece data.frame tamb�m

class(airquality[,3]) # como temos uma coluna �nica a classe do objeto n�o � preservada

## se queremos preservar a classe do objeto numa coluna �nica

class(airquality[,3,drop = F]) ### classe presevada para uma coluna �nica

A <- matrix(1:9, 3)
t(A)

t(df) ### n�o faz sentido, as colunas e as linhas t�m um significado pr�prio que n�o t�m nas matrizes

### Como remover uma coluna num data frame
## atribuir o objeto nulo a uma coluna
# o objeto nulo � diferente do NA, NULL != NA
###
typeof(NULL)
v <- c()
v
length(v)
###################
df
#### remover z

df$z <- NULL
df
###########################################
summary(airquality)

## colunas que s�o NA
air <- airquality[is.na(airquality$Ozone),]
dim(air)

head(air)
### sem coluna do ozono
air <- air[, -1]
head(air)

getwd()
setwd() ## colocar destino entre "" 
write.csv(air, "air.csv") ## exporta para um csv

dados <- read.table(file.choose())

head(dados)
### como n�o sabe os nomes assume que limite e acidentes eram os nomes
### Forma certa:
dados <- read.table("trafego.txt", header = T)

head(dados)

str(dados)
##############
sink("escrever.txt") ### cria ficheiro txt na diretoria, o que for efetuado asseguir � imprimido no ficheiro, em vez de imprimir na consola

summary(air)

sink()
### usar sink para reverter
summary(air)

#########################################3

#### Representa��o gr�fica de dados
### fun��es b�sicas para gr�ficos
## Representa��o de um conjunto de dados depende do tipo de vari�veis em estudo
## qualitativas, categ�ricas (fatores); quantitativas

str(airquality)

plot(airquality$Temp, airquality$Solar.R, xlab = "Temperatura do ar", ylab = "Radia��o solar", main = "Temperatura e Radia��o Solar")

plot(airquality$Ozone ~ airquality$Wind)
########### uma vari�vel quantitativa e uma vari�vel qualitativa
#### passar uma vari�vel num�rica a fator (coer��o)

airquality$mes <- factor(airquality$Month)

head(airquality)

str(airquality)

table(airquality$mes)
table(airquality$Month)
levels(airquality$mes)
levels(airquality$Month) ## n�o � fator logo -> NULL

boxplot(airquality$Ozone ~ airquality$mes) # vai fazer um boxplot para cada mes
### a variavel qualitativa est� como fator
### Por�m, n�o � obrigatorio estar, airquality$Month n�o est� com o fator e funciona
boxplot(airquality$Ozone ~ airquality$Month)
boxplot(Ozone ~ Month, data = airquality)
## posi��o horizontal
boxplot(Ozone ~ Month, data = airquality, horizontal = T)

######### histogramas
### vari�veis quantitativas
?hist
hist(airquality$Ozone) ## representa��o empirica da distribui��o dos dados

### diagrama de barras (qualitativo)
table(airquality$Month) ### entra um vetor que d� a altura das barras
barplot(table(airquality$Month), xlab = "Meses", ylab = "Freq", main = "Distribui��o")

### package ggplot2
#install.packages("ggplot2")
#ou ir ao meno -> Packages -> Install -> procurar o nome

search() ## ver packages
library(ggplot2) ## carregar o package
search() ### procura no package que carregamos em �ltimo lugar

##??movies
?mtcars
mtcars
head(mtcars)

str(mtcars) ### todas as variaveis s�o numericas e n�o categ�ricas

ggplot(mtcars, aes(x = mpg, y = factor(cyl))) +
  geom_point()

### usar factor para tornar variaveis nmericas em categ�ricas
### ao considerar como factor torna o gr�fico mais bonito, isto �, com melhor aspeto

ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(cyl))) +
  geom_point()
### consumo a depender do peso
### a cor vai ser em rela��o ao factor dos cilindros

g <- ggplot(mtcars, aes(x = wt, y = mpg))

g + geom_point(aes(colour = factor(cyl)), size = 4)+ 
  xlab("peso")+ 
  ylab("milhas")+ 
  ggtitle("diagrama")


?geom_point

ggplot(mtcars, aes(x = mpg))+
  geom_histogram(binwidth = 2.3)

ggplot(mtcars, aes(x = mpg))+
  geom_boxplot()
## possui outliers, isto �, observa��es que s�o descrepantes relativamente ao grosso das observa��es
## podemos exportar em "export" na aba dos plots