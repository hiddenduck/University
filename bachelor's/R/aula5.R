f <- function(){
  print("função 1")
}

class(f)

f
f() ### invocação da função

g <- function(i) i^2

g(-2)

h <- function(x, y) x^2

h(8)
h(8, 9) ### mesma coisa

### se for 
h <- function(x,y) y^2
h(8) ### erro

h <- function(x, y=9) y^2
h(8) ### se não disser qual é o valor ele usar o valor padrão e não dá erro

h(8)

##funcoes de ordem superior :: funcoes cujos argumentos sao funcoes
?Filter
### o Filter tem dois argumentos:
## primeiro argumento funcao; segundo argumento vetor
### primeiro argumento é uma função unária, ou seja, apenas um argumento
#### a funcao que entra no primeiro argumento é um predicado ---> devolve TRUE ou False
### todos os inteiros de 1 a 100 que não são divisiveis por 2 nem são divisiveis por 3 nem são divisiveis por 7

g <- function(i) {
  i %% c(2, 3, 7) != 0
}

g(5)

g(100)
g(1:5) ## não é vetorizavel, é unária

Filter(g, 1:100) ###aplica a cada elemento do segundo argumento, a função do primeiro argumento

### for é possível ser usado em R
?'for'

for(i in 1:100){
  a <- g(i); a
  print(a)
}

###################
#### exercícios 3.4

#### argumento: vetor de comprimento n
### cada entrada do vetor de input elevada ao seu indice
#### output vetor com o mesmo comprimento do input

funl <- function(x){
  n <- length(x)
  x^(1:n)
}

(v <- c(2, 4, 6))
v^(1:3)

funl(v)

fun2 <- function(x){
  n <- length(x)
  x^(1:n)/(1:n)
}

funl(seq(-4, 1, 0.5))
fun2(seq(-4, 1, 0.5))

#####
################
##Ex2
####### argumentos x e y vetores com o mesmo comprimento n
### testar se os vetores tem o memso comprimento -> se nao error strerror
### usar a função stop() para interrompar a tarefa
#### y2 - x1; y3 - x2; ......; yn - x(n-1)
##### devolve um vetor com comprimento n-1

f <- function(x, y){
  n <- length(x); m <- length(y)
  if (n != m) stop("os vetores devem ter o mesmo comprimento")
  y[2:n] - x[1:(n-1)]
}

x <- 2:4
y <- 3:5
z <- 1:2

f(x, y)
f(x, z) ##erro
###f exatamento igual mas com message:
f1 <- function(x, y){
  n <- length(x); m <- length(y)
  if (n != m) message("os vetores devem ter o mesmo comprimento")
  y[2:n] - x[1:(n-1)]
}

###f exatamento igual mas com warning:
f2 <- function(x, y){
  n <- length(x); m <- length(y)
  if (n != m) warning("os vetores devem ter o mesmo comprimento")
  y[2:n] - x[1:(n-1)]
}
###############################33
#### ex 3 b
### usar as n-1 primeiras entradas do vetor de input e fazer 
### somar_i exp(-x_{i+1})/(xi + 10)
v <- 1:3
m <- length(v)
exp(-v[2:n])/(v[1:(n-1)] + 10)
exp(-2)/11 + exp (-3)/12
v(1)
exp(1)

f3b <- function (x){
  n <- length(x)
  if (n < 2) stop("o vetor deve ter comprimento igual ou superior a 2")
  sum(exp(-x[2:n])/(x[1:(n-1)] + 10))
}
f3b(1,2,3)

#######

### teste para divisor de um número inteiro
#### verificar se o numero é inteiro
## a é divisor de n

is.divisor <- function(a, n){
  if (a %% 1 != 0 || nn %% 1 != 0) stop ("argumentos devem ser inteiros")
  n %% a == 0
}
is.divisor(2, 4)
is.divisor(3, 4)

is.divisor(2.8, 4)
is.divisor(1:2 ,4) ### a razao do warning esta em if... else não ser uma função

