###algoritmo
### método para resolver uma classe de problemas
### exemplo: verificar se um número é primo

### teste primo --- devolver TRUE se for primo, False se não for

### deve ser especificado de forma não ambigua [sequencia de construções precisas]

### deve terminar sempre, ou seja, executável num número finito de passos

### um número é primo se não pode ser escrito como o produto de dois inteiros positivos

### p primo, p não pode ser escrito como num com n < p e m < p
### qualquer numero n composto pode ser escrito como um produto de primos (de forma unica, a menos da)

### se n é composto, então n tem um divisor primo <= sqrt(n)

is.primo <- TRUE

n <- 65

for(i in 2:(n/2)){
  if (n %% i == 0) is.primo <- FALSE
}
is.primo

primo <- function(n){
  if (n < 1) stop("n deve ser maior que 1")
  is.primo <- TRUE
  if (n==1) is.primo <- FALSE
  if (n == 2) is.primo <- TRUE
  else
    for(i in 2:(n/2)){
      if (n %% i == 0) is.primo <- FALSE
    }
  is.primo
}
primo(-2)
primo(1)
primo(89)
primo(101)
#### n/2 é sempre superior a sqrt(n) se n > 4

#### construtor while()

#### cáculo do mdc(a, b)

#### mdc(a, 0) é a
### passo 1 : se b = 0, mdc(a, b) = a
### passo 2 : se b != 0, calcula-se o resto da divisão de a por b
### a passa a ter o conteudo de b
### b passa a ter o conteudo de r
### repete-se o passo 1

a <- 76
b <- 54

while(b != 0){
  r <- a %% b; #print(r)
  a <- b; #print(a)
  b <- r;#print(b)
}
a ## máximo divisor comum

76 %% 54
54 %% 22
22 %% 10
10 %% 2

#### R suporta uma programação "orientada a vetores"
##### funções da família apply
########################
### matrizes
(M <- matrix(1:10, ncol=5))
dim(M)
M[1, 4]
### 4 defina uma matriz 6x10 de inteiros aleatórios de 1 a 10
#a)
set.seed(987654321)
v <- sample(1:10,60,replace=T)
mat <- matrix(v, nrow=6)
(mat <- matrix(v, nrow=6))
dim(mat) # 6x10 = 6 linhas e 10 colunas
class(mat)
dim(v)
length(mat)

(M <- matrix(v))
dim(M)
#(a) Quantas entradas em cada linha de mat são maiores que 4?
conta4 <- function(x) sum(x > 4)
conta4(v)

conta4(mat[1,]) ### aplica a função à primeira linha da matriz
conta4(mat[2,]) ### aplica à segunda linha
###### apicar a todas as linhas da matriz:
maior4 <- c(rep(0, 6))
for(i in 1:6){
  maior4[i] <- conta4 (mat[i,])
}
maior4
### aplicar a função conta4 a cada linha da matriz
### aplicar a todas a linhas da matriz com a função apply
?apply
apply(mat, 1, conta4) # 1 corresponde a linhas

apply(mat, 2, conta4) # 2 corresponde a colunas

#Que linhas tem exatamente duas ocorrencias do numero 7?
g <- function(x){
  sum (x==7) ==2
}
g(mat[1,]) ### verifica se tem exatamente 2 occorrencias do numero 7
g(mat[2,])
apply(mat, 1, g)### nenhuma tem duas ocorrencias
which(apply(mat, 1, g))
?which
mat
which(mat == 7, arr.ind = T) # indica as posições onde se encontra o 7
########3
?outer
x <- c(1,2,3,4)
y <- c(0,-1,2)
z <- 9:78
length(z)
outer(x,y)
dim(outer (x,z))

### restos possíveis da divisão por 9 vai de 0 até 8
outer(0:4, 0:4, "+")
outer(1:4, 0:4)
#########3
#a)
sum((1:20)^4) * sum(1/(3 + 1:5))
sum(((1:20)^4)/(3+ outer(1:20,1:5)))
#ou
fa <- function(i,j) i^4/(3+j)
ma <- outer(1:20, 1:5, fa)
sum(ma)
#b)
fb <- function(i, j) i^4/(3+i*j)
mb <- outer(1:20, 1:5, fb)
sum(mb)
#c)
(1:10)^4/(3 + (1:10))
f <- function(i, j) (i >= j) * i^4/(3 + i*j)
f(2,1)
f(2,2)
f(2,3)
2^4/(3 + 2 * 1)
### estruturas de dados mais avançadas
