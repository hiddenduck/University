##### Aula 3
?adf.test
??adf.test
help.search(adf.test)
help(adf.test, try.all.packages = TRUE)
### Para usar o que está em baixo, baixar o package
library(tseries) ### carrega na memória ativa
?adf.test

##############

### propriedade de vetorizzação  -> opera componente a componente 

##### recicla os vetores até ao tamanho suficiente para operar componente a componente

##### sequência de Fibonacci

fib <- c(1, 1, 2, 3, 5, 8, 13, 21, 34, 55)

cat("o valor de é", pi, "\n") ### funciona melhor que o print

options(digits = 9)
options(digits = 7) ### digitos padrão

print(paste("o valor de pi é", pi)) ### igual ao cat, é preciso duas funções
message("o valor de pi é", pi, "\n") ### exatamente igual ao cat

fib > pi ### compara cada vetor com pi e devolve se é maior ou não

#### coerção de tipos -> coerção implicita
v <- c(2, 6, "abc")
mode(v) ### ele obriga o 2 e 6 a ser character
mode(2)
as.character(2) ### coerção explicita, manda considerar o 2 (numérico) caracter 

#### ordenação nos tipos: logical < integer < double < complex < character
#### a coerção pode ser feita quando uma classe é meor que a outra
#### Exemplo: logical -> integer (double)

#### 

sum(fib > pi) ### conta quantos vetores são maiores que pi, isso acontece porque logical < int

##### obter o subconjunto dos elementos de fib que são maiores que pi

fib[fib > pi]

###### os índices de posição dos elementos de fib que são maiores que pi

which(fib > pi) ### entra um parametro logico, diz que os elementos a partir da posição 5 são maiores que pi

names(fib) ### não tem nomes
?paste
names(fib) <- paste("fib",1:10)
names(fib) <- paste0("fib",1:10) ### o número fica colado

fib

fib[c("fib2", "fib10")]

fib[-c(2, 10)] ## tudo exceto os elementos da posição 2 e 10

#### & em vez de && e | em vez de || para operações elemento a elemento

if (fib > pi){message("if é vetorizavel \n")} else {message("não funciona \n")} ### como fib > pi é um vetor o if não funciona, para isso temos de escolher um elemento como em baixo

if(fib[5] > pi) {message("if funciona \n")} else {message("não funciona \n")}

#### alternativa -> ifelse()

ifelse (fib > pi, print("o elemento é sup a pi \n"), print("o elemento é inf ou igual a pi"))
ifelse (fib > pi, "o elemento é sup a pi \n", "o elemento é inf ou igual a pi") ### alternativa mais clean para usar o ifelse

ifelse (fib > pi, 1, 0)

if (fib > pi) 1 else 0 #### só faz o primeiro por causa do comprimento do fib

######################
### função readline para ler input na consola inserido pelo utilizador
cat("Escreva um número entre 1 e 50")
input_read <- readline() #### lê o que é escrito como strings e characters

input_read ### diz o que foi escrito

################ função readline para ler input numérico na consola inserido pelo utilizador
cat("Escreva um número entre 1 e 50")
input_scan <- scan()

input_scan

################# Exercícios
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

### o número de ocorrencias está de 4 está omisso
rep(tmp, times=c(NA, 20, 30)) ### não funciona com observações omissas
#### Na é um missing value
v <- c(NA, 20, 30)
length(v) ### o NA conta 
sort(v) ### faz o ordenação ignorando o NA
sort(v, decreasing = T)### decrescente, Na não é considerado elemento novamente
fib < v
#### devolve NA quando for usado, NA inviabliza comparações
is.na(v) #### testa se cada elementos é ou não NA
!is.na(v) #### testa se cada elementos é ou não NA
v[!is.na(v)] #### devolve apenas os elementos do vetor que não são NA
### logo se tencionamos fazer comparações devemos remover o NA
#### omitir o primeiro argumentos, por 0
rep(tmp, times=c(0, 20, 30))
### o número de ocorrencias de 4 é aleatório
#números aleatórios inteiros
sample(1:40) ### escolhe 40 do conjunto {1,2,..4.,40} sem reposição e aleatóriamente
sample(1:40, 2) ### dois números aleatórios sem reposição
sample(1:40,2, replace = TRUE) ### agora tem reposição porque tem replace = T
rep(tmp, times = c(sample(1:40,1),20,30))

set.seed(56) ### todos os que colocarem a mesma seed, vão ter o mesmo resultado
vv <- rep(tmp, times = c(sample(1:40,1),20,30))
sum(vv == 4)
?sample
#####
#3 obter padrão e reproduzi-las com o menor código possível
#a)
3^(0:31)
#ou
x <- 0:31
a_3 <- 3^x
length(a_3)
a_3[32] == 3^31
##4|exercício 4 : 10^3 + 4*10^2 + 11^3 + 4*11^2 + ...
#a)

i <- 10:100

sum(i^3 + 4*i^2)
#b)

j <- 1:25
sum((2^j)/j + (3^j)/j^2)

#### exercício 8

set.seed(50) ### mesmos valores
xVec <- sample(0:999, 250, replace=T)
yVec <- sample(0:999, 250, replace=T)

xVec[1:10]
yVec[167:187]

#### definir o vetor (y2 - x1, y3 - x2, ...., y250 - x249)
(n <- length(xVec))
z <- yVec[2:n] - xVec[1:(n-1)]
zz <- yVec[-1] - xVec[-n]
sum(z == zz) ### testa se os dois vetores são iguais
#isto
z[1]
#é igual
yVec[2] - xVec[1]
#isto
z[188]
#é igual
yVec[189] - xVec[188]
##############3
####8c) (x1 + 2x2 - x3, x2 + 2x3 - x4,...,xn-2 + 2xn-1 - xn)

z3 <- xVec[-c(n-1, n)] + 2*xVec[-c(1, n)] - xVec[-c(1,2)] ### para n-2 tirar o ultimo e o penultimo, n -1 tirar o ultimo e o primeiro e x3 tirar os 2 primeiros

### terceira entrada: x3 + 2x4 - x5
xVec[3] + 2*xVec[4] - xVec[5]
# o de cima é igual ao de baixo
z3[3]
###
##(b) Qual a posição (índice de posição) dos valores que são > 600 em yVec? [use duas formas diferentes:
##sem usar a função which() e usando a função which()
which(yVec > 600)

yVec[yVec > 600] ### deovlve os elementos de yVec que são maiores que 600

(1:n)[yVec > 600] ### devolve os índices que correspodem aos elementos de yVec que são maiores que 600, faz o mesmo que o which
