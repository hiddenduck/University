getwd() #Verificar a diretoria de trabalho
setwd() # Mudar a diretoria
### shortcut para mudar de direotria -> crt+shift+h
##### aula 2
search()

ls() ## lista os objetos anteriores

x <- 8

where("x")

rm(x) ## remove o X
args(rm) ## ve os argumentos da função remove

###

?c

vetX <- c(2,-3,78)
length(vetX)
class(vetX) ### classe do objeto
mode(vetX)
typeof(vetX) ### indica como o objeto se encontra armazenado no computador

1 : 10 ### sequencia de valores entre 1 e 10
10 : 1 ### ""        ""  ""     ""    10 e 1

seq(0, 9, by = 2) ## sequencia de 0 a 9 com passo de 2
seq(19, 3, by = -3) ### o "by =" é opcional pois ele pode entender por nome ou posição
y <- seq(0, 9, by = 2) ## cria o vetor
(vetY <- seq(1, 1000, 2))

?rep ### repetir
rep(vetX,3) ## repete o vetorX 3 vezes

xx <- rep(vetX, length.out = z)
length (xx)

(Xx <- rep(vetX, length.out = length (z)))
#### resolução de exercícos
#### 1 - Usar ":", "c()" e "seq()"
## a) 
1 : 30
###b)
c (1 : 30, 29 : 1)
###c)
seq(1, 29, by = 2)
####d)
seq(29, 1, by = -2)
###e)
rep (1:5, times = 1:5)
#### constantes lógicas : True e False
A <- TRUE
class(A)
typeof(A)

#### operações "permitidas" &, |, !
!A
A & !A
A | !A

##### "0" representa False e "1" representa True
#### coerção
A + !A #### "+" representa "ou"
A * !A #### "*" representa "e"

0 | 1

0 | 5 ### igual à linguagem C , tudo diferente de "0" É VERDADEIRO
0 & 7

######## operadores relacionais <, >, <=, >=, ==
2 < 3
3 <= 5
-2 > 5

TRUE + FALSE #### o valor que o R usa usa para representar o True é o 1
A + !A

vetX <- c(2,7,0, -9)

(vetY <- seq(8, 17, 3))

vetX < vetY

sum(vetX < vetY)

##### f)
rep(c(TRUE, FALSE, TRUE), times = c(2, 5, 1))

######
ls()
x <- 1 : 10

y <- (x >= 3 & x <= 7)
y
sum(y)
### existe ainda && e ||