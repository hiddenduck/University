#include <stdio.h>
#include <stdlib.h>

void triangulo(int n){
    for(int i = 0; i < n; i++){
        for(int j = 0; j < n; j++){
            if (j <= i)
            putchar('#');
        }
            putchar('\n');
    }
    for(int l = 1; l < n; l++){
        for(int m = 0; m < n; m++){
            if(m >= l)
            putchar('#');
        }
        putchar('\n');
    }
}