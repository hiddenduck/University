### numa lista os elementos podem ser de tipos diferentes
# uma lista pode ser chamada de vetor recursivo

lista1 <- list(list(1,2), c(3,4))
str(lista1)
## View(lista1) para ver a lista ou clicar na lupa

length(lista1)

lista2 <- c(list(1,2), c(3,4))
str(lista2)

# ao usar c(), combinamos uma lista com um vetor originando uma única lista

### um data frame é uma lista de vetores com nome

df <- data.frame(x = 1:2, y = letters[1:2], stringsAsFactors = T)

attributes(df)
typeof(attributes(df))

# o objeto nulo não tem atributos

### é possível definir um data frame com elementos/colunas/componentes da classe data frame ou list

### acrescentar uma coluna a df
df
df$z <- list(1:2, 3:5); df
str(df)
View(df)

df$y <- factor(df$y) ## transforma char/strings em fatores
# é possível ter colunas que são listas nos data frames

??tibble

#############
unlist(lista1) ### devolve o vetor, reverte, passa lista a vetor
as.vector(lista1)## não funciona

### Se não pusermos nomes no data frame, ele coloca automaticamente
dframe <- data.frame(1:2, 3:4)
names(dframe)
### as linhas não precisam de nome
## se a linhas não tiverem nome não podemos fazer filtragem de linhas pelo nome

### a classe de uma linha de um data frame é data frame mas as colunas não acontece isso

?airquality ### medidas da qualidade do ar em Nova Iorque de maio a setembro de 1973

airquality[34:67,]
class(airquality[34:67,]) ### classe da linha -> data frame, ou seja, preserva a classe do objeto

class(airquality[,3:4]) ### aparece data.frame também

class(airquality[,3]) # como temos uma coluna única a classe do objeto não é preservada

## se queremos preservar a classe do objeto numa coluna única

class(airquality[,3,drop = F]) ### classe presevada para uma coluna única

A <- matrix(1:9, 3)
t(A)

t(df) ### não faz sentido, as colunas e as linhas têm um significado próprio que não têm nas matrizes

### Como remover uma coluna num data frame
## atribuir o objeto nulo a uma coluna
# o objeto nulo é diferente do NA, NULL != NA
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

## colunas que são NA
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
### como não sabe os nomes assume que limite e acidentes eram os nomes
### Forma certa:
dados <- read.table("trafego.txt", header = T)

head(dados)

str(dados)
##############
sink("escrever.txt") ### cria ficheiro txt na diretoria, o que for efetuado asseguir é imprimido no ficheiro, em vez de imprimir na consola

summary(air)

sink()
### usar sink para reverter
summary(air)

#########################################3

#### Representação gráfica de dados
### funções básicas para gráficos
## Representação de um conjunto de dados depende do tipo de variáveis em estudo
## qualitativas, categóricas (fatores); quantitativas

str(airquality)

plot(airquality$Temp, airquality$Solar.R, xlab = "Temperatura do ar", ylab = "Radiação solar", main = "Temperatura e Radiação Solar")

plot(airquality$Ozone ~ airquality$Wind)
########### uma variável quantitativa e uma variável qualitativa
#### passar uma variável numérica a fator (coerção)

airquality$mes <- factor(airquality$Month)

head(airquality)

str(airquality)

table(airquality$mes)
table(airquality$Month)
levels(airquality$mes)
levels(airquality$Month) ## não é fator logo -> NULL

boxplot(airquality$Ozone ~ airquality$mes) # vai fazer um boxplot para cada mes
### a variavel qualitativa está como fator
### Porém, não é obrigatorio estar, airquality$Month não está com o fator e funciona
boxplot(airquality$Ozone ~ airquality$Month)
boxplot(Ozone ~ Month, data = airquality)
## posição horizontal
boxplot(Ozone ~ Month, data = airquality, horizontal = T)

######### histogramas
### variáveis quantitativas
?hist
hist(airquality$Ozone) ## representação empirica da distribuição dos dados

### diagrama de barras (qualitativo)
table(airquality$Month) ### entra um vetor que dá a altura das barras
barplot(table(airquality$Month), xlab = "Meses", ylab = "Freq", main = "Distribuição")

### package ggplot2
#install.packages("ggplot2")
#ou ir ao meno -> Packages -> Install -> procurar o nome

search() ## ver packages
library(ggplot2) ## carregar o package
search() ### procura no package que carregamos em último lugar

##??movies
?mtcars
mtcars
head(mtcars)

str(mtcars) ### todas as variaveis são numericas e não categóricas

ggplot(mtcars, aes(x = mpg, y = factor(cyl))) +
  geom_point()

### usar factor para tornar variaveis nmericas em categóricas
### ao considerar como factor torna o gráfico mais bonito, isto é, com melhor aspeto

ggplot(mtcars, aes(x = wt, y = mpg, colour = factor(cyl))) +
  geom_point()
### consumo a depender do peso
### a cor vai ser em relação ao factor dos cilindros

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
## possui outliers, isto é, observações que são descrepantes relativamente ao grosso das observações
## podemos exportar em "export" na aba dos plots