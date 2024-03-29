##### Aula 3
?adf.test
??adf.test
help.search(adf.test)
help(adf.test, try.all.packages = TRUE)
### Para usar o que est� em baixo, baixar o package
library(tseries) ### carrega na mem�ria ativa
?adf.test

##############

### propriedade de vetorizza��o  -> opera componente a componente 

##### recicla os vetores at� ao tamanho suficiente para operar componente a componente

##### sequ�ncia de Fibonacci

fib <- c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55)

cat("o valor de �", pi, "\n") ### funciona melhor que o print

options(digits = 9)
options(digits = 7) ### digitos padr�o

print(paste("o valor de pi �", pi)) ### igual ao cat, � preciso duas fun��es
message("o valor de pi �", pi, "\n") ### exatamente igual ao cat

fib > pi ### compara cada vetor com pi e devolve se � maior ou n�o

#### coer��o de tipos -> coer��o implicita
v <- c(2, 6, "abc")
mode(v) ### ele obriga o 2 e 6 a ser character
mode(2)
as.character(2) ### coer��o explicita, manda considerar o 2 (num�rico) caracter 

#### ordena��o nos tipos: logical < integer < double < complex < character
#### a coer��o pode ser feita quando uma classe � meor que a outra
#### Exemplo: logical -> integer (double)

#### 

sum(fib > pi) ### conta quantos vetores s�o maiores que pi, isso acontece porque logical < int

##### obter o subconjunto dos elementos de fib que s�o maiores que pi

fib[fib > pi]

###### os �ndices de posi��o dos elementos de fib que s�o maiores que pi

which(fib > pi) ### entra um parametro logico, diz que os elementos a partir da posi��o 5 s�o maiores que pi

names(fib) ### n�o tem nomes
?paste
names(fib) <- paste("fib",1:10)
names(fib) <- paste0("fib",1:10) ### o n�mero fica colado

fib

fib[c("fib2", "fib10")]

fib[-c(2, 10)] ## tudo exceto os elementos da posi��o 2 e 10

#### & em vez de && e | em vez de || para opera��es elemento a elemento

if (fib > pi){message("if � vetorizavel \n")} else {message("n�o funciona \n")} ### como fib > pi � um vetor o if n�o funciona, para isso temos de escolher um elemento como em baixo

if(fib[5] > pi) {message("if funciona \n")} else {message("n�o funciona \n")}

#### alternativa -> ifelse()

ifelse (fib > pi, print("o elemento � sup a pi \n"), print("o elemento � inf ou igual a pi"))
ifelse (fib > pi, "o elemento � sup a pi \n", "o elemento � inf ou igual a pi") ### alternativa mais clean para usar o ifelse

ifelse (fib > pi, 1, 0)

if (fib > pi) 1 else 0 #### s� faz o primeiro por causa do comprimento do fib

######################
### fun��o readline para ler input na consola inserido pelo utilizador
cat("Escreva um n�mero entre 1 e 50")
input_read <- readline() #### l� o que � escrito como strings e characters

input_read ### diz o que foi escrito

################ fun��o readline para ler input num�rico na consola inserido pelo utilizador
cat("Escreva um n�mero entre 1 e 50")
input_scan <- scan()

input_scan

################# Exerc�cios
###2
#a)
tmp <- c(4, 6, 3)
rep(tmp,10)
#b)
c(rep(tmp, 10), 4)
#ou
rep(tmp, l=31)
#c)
rep(tmp, times=c(10, 20, 30))

### o n�mero de ocorrencias est� de 4 est� omisso
rep(tmp, times=c(NA, 20, 30)) ### n�o funciona com observa��es omissas
#### Na � um missing value
v <- c(NA, 20, 30)
length(v) ### o NA conta 
sort(v) ### faz o ordena��o ignorando o NA
sort(v, decreasing = T)### decrescente, Na n�o � considerado elemento novamente
fib < v
#### devolve NA quando for usado, NA inviabliza compara��es
is.na(v) #### testa se cada elementos � ou n�o NA
!is.na(v) #### testa se cada elementos � ou n�o NA
v[!is.na(v)] #### devolve apenas os elementos do vetor que n�o s�o NA
### logo se tencionamos fazer compara��es devemos remover o NA
#### omitir o primeiro argumentos, por 0
rep(tmp, times=c(0, 20, 30))
### o n�mero de ocorrencias de 4 � aleat�rio
#n�meros aleat�rios inteiros
sample(1:40) ### escolhe 40 do conjunto {1,2,..4.,40} sem reposi��o e aleat�riamente
sample(1:40, 2) ### dois n�meros aleat�rios sem reposi��o
sample(1:40,2, replace = TRUE) ### agora tem reposi��o porque tem replace = T
rep(tmp, times = c(sample(1:40,1),20,30))

set.seed(56) ### todos os que colocarem a mesma seed, v�o ter o mesmo resultado
vv <- rep(tmp, times = c(sample(1:40,1),20,30))
sum(vv == 4)
?sample
#####
#3 obter padr�o e reproduzi-las com o menor c�digo poss�vel
#a)
3^(0:31)
#ou
x <- 0:31
a_3 <- 3^x
length(a_3)
a_3[32] == 3^31
##4|exerc�cio 4 : 10^3 + 4*10^2 + 11^3 + 4*11^2 + ...
#a)

i <- 10:100

sum(i^3 + 4*i^2)
#b)

j <- 1:25
sum((2^j)/j + (3^j)/j^2)

#### exerc�cio 8

set.seed(50) ### mesmos valores
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)

xVec[1:10]
yVec[167:187]

#### definir o vetor (y2 - x1, y3 - x2, ...., y250 - x249)
(n <- length(xVec))
z <- yVec[2:n] - xVec[1:(n-1)]
zz <- yVec[-1] - xVec[-n]
sum(z == zz) ### testa se os dois vetores s�o iguais
#isto
z[1]
#� igual
yVec[2] - xVec[1]
#isto
z[188]
#� igual
yVec[189] - xVec[188]
##############3
####8c) (x1 + 2x2 - x3, x2 + 2x3 - x4,...,xn-2 + 2xn-1 - xn)

z3 <- xVec[-c(n-1, n)] + 2*xVec[-c(1, n)] - xVec[-c(1,2)] ### para n-2 tirar o ultimo e o penultimo, n -1 tirar o ultimo e o primeiro e x3 tirar os 2 primeiros

### terceira entrada: x3 + 2x4 - x5
xVec[3] + 2*xVec[4] - xVec[5]
# o de cima � igual ao de baixo
z3[3]
###
##(b) Qual a posi��o (�ndice de posi��o) dos valores que s�o > 600 em yVec? [use duas formas diferentes:
##sem usar a fun��o which() e usando a fun��o which()
which(yVec > 600)

yVec[yVec > 600] ### deovlve os elementos de yVec que s�o maiores que 600

(1:n)[yVec > 600] ### devolve os �ndices que correspodem aos elementos de yVec que s�o maiores que 600, faz o mesmo que o which
