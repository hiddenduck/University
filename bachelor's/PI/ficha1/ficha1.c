#include <stdio.h>
#include <stdlib.h>

/*Exercicio 1.1
int x,y;
x = 3;
y = x+1;
x = x *y;
y = x + y;
printf("%d %d\n", x, y);

1: declara as vars x e y
	x: ??
	y: ??


2: x : 3
   y : 

3: (x+1 == 3+1 == 4)
    y : 4
    x : 3

4: (x*y == 12)
	x : 12
	y : 4

5: (x+y == 16)
	y : 16

printf .... 12 16
Exercicio 1.2

devolve 0 e lixo para completar o y
Exercicio 1.3
char a, b, c;
a = ’A’; b = ’ ’; c = ’0’;
printf ("%c %d\n", a, a);
a = a+1; c = c+2;
printf ("%c %d %c %d\n", a, a, c, c);
c = a + b;
printf ("%c %d\n", c, c);


primeiro printf -> imprime o respetivo caracter da variavel e o inteiro(código ASCII da variavel)
segundo printf -> B 66 2 50
terceiro printf -> b 98

Exercicio 1.4
output -> 100 200

Exercicio 2
a)Output: 3 5
o x é inferior ao y logo não entra no if
b)Output: 11 66

c)Output: _#_#_#_#_#_#_#_#_#_#
int i;
for (i=0; (i<20) ; i++)
if (i%2 == 0) putchar ('_');
else putchar ('#');

putchar('\n');
//Outra maneira de fazer, mas com o While
i = 0;
while (i < 20){
	if(i%2 == 0) putchar('_');
	else putchar('#');
	i++;
}
d)Output:

1
01
11
001
101
011
111
0001
1001
0101
1101
0011
1011
0111
1111
*/

//3
//3.1
void quadrado (int n){
    for (int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            putchar('#');
        }
        putchar('\n');
    }  
}

//3.2
void quadrado2 (int n){
    for (int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            if(((i + j) % 2)== 0)
                putchar('#');
            else
                putchar('_');
        }
        putchar('\n');
    }  
}

//4
void circulo (int r){
    int c;
    for(int i = 0; i <= 2*r; i++){
        for(int j = 0; j <= 2*r; j++){
            if(pow((i-r),2) + pow((j-r),2) <= r*r){
                putchar('#');
		c++;
	    }else
                putchar(' ');
        }
        putchar('\n');
    }
	return c;
}

