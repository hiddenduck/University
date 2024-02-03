#include <stdio.h>
#include <math.h>

typedef struct aluno {
int numero;
char nome[100];
int miniT [6];
float teste;
} Aluno;

void imprimeAluno (Aluno *a){
    int i;
    printf ("%-5d %s (%d", a->numero, a->nome, a->miniT[0]);
    for(i=1; i<6; i++) printf (", %d", a->miniT[i]);
    printf (") %5.2f %d\n", a->teste, nota(*a));
}

//1
int nota (Aluno a){
    int i, notaF = 0;
    float somaMiniT = 0;
    for(i=0; i<6; i++) 
        somaMiniT += a.miniT[i];
    
    somaMiniT = (somaMiniT * 20) / 12;

    if(somaMiniT >= 8 && a.teste >= 8){
        notaF = round (somaMiniT * 0.3 + a.teste * 0.7);
    }

    return notaF;
}

//2
int procuraNum (int num, Aluno t[], int N){
    int i, numero = -1;
    for(i=0; i<N && num > t[i].numero; i++);

    if(i<N && t[i].numero == num) numero = i; 
    return numero;
}

//3
void ordenaPorNum (Aluno t [], int N){
    int i, j, min;
    Aluno tmp;
    for(i=0; i<N-1; i++){
        min = i;
        for(j=i+1; j<N; j++)
            if(t[j].numero<t[min].numero)
                min = j;
        
        tmp = t[i];
        t[i] = t[min];
        t[min] = tmp;
    }
}

//4
void criaIndPorNum (Aluno t [], int N, int ind[]){
  int i, j, min;
  int tmp;

  for(i=0; i<N; i++)
    ind[i] = i;

  for(i=0; i<N; i++){
    min = i;
    for(j=i+1; j<N; j++)
      if(t[ind[j]].numero < t[ind[min]].numero)
        min = j;    

    tmp = ind[i];
    ind[i] = ind[min];
    ind[min] = tmp;
  }

}

//ou BubbleSort (?!)
int bubbleInd(Aluno t [], int N, int ind[]){
  int i, maxIndTroca=0;
  int tmp;

  for(i=1; i<N; i++)
    if(t[ind[i]].numero < t[ind[i-1]].numero){
      tmp = ind[i-1];
      ind[i-1] = ind[i];
      ind[i] = tmp;
      maxIndTroca = i;
    }

  return maxIndTroca;
}

void criaIndPorNum2 (Aluno t [], int N, int ind[]){

  int i;
  for(i=0; i<N; i++)
    ind[i] = i;

  while(N = bubbleInd(t,N,ind));
  
}

//5
void imprimeTurmaInd (int ind[], Aluno t[], int N){
    int i;
    for (i=0; i<7; imprimeAluno (t + ind[i++]));
    
}

//6
int procuraNumInd (int num, int ind[], Aluno t[], int N){
    int i, numero = -1;
    for(i=0; i<N && num > t[ind[i]].numero; i++);

    if(i<N && t[ind[i]].numero == num) numero = i; 
    return numero;
}

//7
