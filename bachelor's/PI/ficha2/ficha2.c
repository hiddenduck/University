#include <stdio.h>
#include <math.h>

//1
float multInt1 (int n, float m){
    double r = 0;
    for(int i = 0; i < n; i++, r+=m);
    return r;
}

//2
float multInt2 (int n, float m){
    double r = 0;
    while(n){
        if(n % 2)
            r += m;
        n /= 2;
        m *= 2;
    }
    return r;
}

float multInt3 (int n, float m, int *count){
    double r=0;
    while(n){
        if(n % 2)
            r += m;
        n /= 2;
        m *= 2;
        (*count)++;
    }
    return r;
}

//3
int mdc1 (int a, int b){
    if(b > a)
        mdc1(b,a);
    else{
        int divisor;
        for(int i = 1; i <= b; i++)
            if(a % i == 0 && b % i == 0)
                divisor = i;
        return divisor;
    }
}

//ou (sem recursividade)
int mdc1_2 (int a, int b){
    int menor, r;
    if(a>b) menor=b;
    else menor=a;
    while(menor>0){
        if(a%menor==0 && b%menor==0){
            r=menor;
            menor=0;
        }
        menor--;
    }
    return r;
}

//4
int mdc2(int a, int b){
    
    while(a>0 && b<0){
        if(a > b) a -= b;
        else b -= a;
    }
    return (a+b);
}

int mdc2_1(int a, int b, int *count){
    
    while(a>0 && b<0){
        if(a > b) a -= b;
        else b -= a;
        (*count)++;
    }
    return (a+b);
}

//5
int mdc3(int a, int b){

     while(a>0 && b<0){
        if(a > b) a %= b;
        else b %= a;
    }
    return (a+b);
}

int mdc3_1(int a, int b, int *count){
    
    while(a>0 && b<0){
        if(a > b) a %= b;
        else b %= a;
        (*count)++;
    }
    return (a+b);
}

//6
//a)
int fib1 (int n){
    if(n < 2)
        return n;
    else
        return(fib1 (n-1) + fib1(n-2));
}

//b)
int fib2 (int n){
    int r = 0,
     acc1 = 1,
     acc2 = 0;

    for(int i=1; i <= n;i++){
        r = acc2;
        acc2 += acc1;
        acc1 = r;
    }
    return acc2;
}
