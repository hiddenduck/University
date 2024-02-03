rm(list = ls()) ## remove todos os objetos do ambiente global, retira-os da memória
#Exercicio12
x <- 1
x[3] <- 3 # atribuir à variavel x, o valar de 3 no terceiro elemento
y <- c() # define a variavel y como um vetor
y[2] <- 2 # atribuir à variavel y, o valor de 2 no segundo elemento
y[3] <- y[1] 
y[2] <- y[4]
z[1] <- 0 ### não existe variavel z, portanto ao atribuimos o valor de zero ao seu primeiro elemento dá erro

#9
#e)
set.seed(50)
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)
typeof(xVec)

sum(yVec > 200 & yVec < max(yVec))
sum(yVec > 200 && yVec < max(yVec)) # não funciona aqui, porque estamos a usar a proriedade vetorizalvel do R
sum(yVec > 200) - 1

yVec[c(T,F,F)] # pega no primeiro e não os dois seguintes ( em sequencia)
#exemplo
2 3 4 7 9 15 25
T F F T F F  T
#ou
yVec[seq(1, length(yVec), by=3)]

#10
int100 <- 1:100
### quero os inteiros que são divisiveis por ,pelo menos, 2, 3 ou 7
div_237 <- int100[(int100 %% 2 == 0) | (int100%%3 ==0) | (int100%%7 == 0)]

###
int100[-div_237]

##9 g)
xVec[order(yVec)]

### sort() e order()
y <- c(2,-5,8,9,2,9)
y
order(y) #ordena e devolve o indice de cada número (posição)

sort(y) # devolve o vetor y ordenado por ordem crescente

?order
y <- c(NA, y)
length(y)
order(y)
sort(y)
### mesmo que o NA não apareça no sort, os indices são contamos com o NA
y[order(y)] ## faz o mesmo que o sort mas mete o NA

#11
queue <- c("sara", "rui", "ana", "luis")
#a)
queue <- c(queue,"beatriz")
#b)
queue <- queue[-1]
#c
queue <- c("paulo",queue)
#d
queue <- queue[-5] ## a beatriz esta na posiçãp 5
#e
pos_ana <- which(queue=="ana")
queue <- queue[-pos_ana]
#f)
which(queue == "rui")
#para colocar numa posição especifica, substituindo alguem que esteja lá:
queue[10] <- "joaquim"; queue ### usa-se o ponto e virgula entre duas expressões

# colocar um elemento no segundo lugar sem trocar com outra pessoa, coloca o Paulo na posição 2
c(queue[1], "Paulo", queue[-1])

#####
?'%in%'
v <- c(2, 8, NA, -4)
6 %in% v
NA %in% v

which(is.na(v))

v <- v[!is.na(v)]

na.omit(v)

#####
###if ... else estruturas de decisão
?'if'
## ?if - não funciona, precisa do ''
x <- 6
if (x < 7) 4

x <- 19
if(x < 7) 4
if (x < 7) 4 else 5

nota <- sample(1:20, 1)
nota
### nota qualquer de 1 a 20
if (nota <= 5) message("nota inferior a 6") else message("nota superior a 5")

if (nota <= 5) "nota inferior a 6" else "nota superior a 5"

###### varios if ... else aninhados

nota <- sample(1:20, 1)
if (nota <= 5){
x1 <- "menos que 6"; x1
} else {
  if (nota > 5 && nota < 10)
    x2 <- "suficiente"; x2
} else {
  if (nota >= 10){
    x3 <- "suficente"; x3
  }
}
