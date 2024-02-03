#include <stdio.h>
#include <string.h>

// 1 - Funções sobre strings
//1
int isVowel (char c){
    int r=0;
    if(c=='a' || c=='A' || c=='e' || c=='E' || c=='i' || c=='I' || c=='o' || c=='O' || c=='u' || c=='U')
        r=1; 
    return r;
}

int isVowel2 (char c){
    char vogais[] = "aeiouAEIOU";
    int r = 0;
    for(int j=0; j<10; j++){
            if(c==vogais[j]){
                r = 1;
                j = 10;
            }
    }
    return r;
}

int contaVogais (char *s){
    int soma=0, i;
    
    for(i=0; s[i]!='\0'; i++)
        if(isVowel(s[i])) 
            soma++;
    
    return soma;
}

//2
int retiraVogaisRep (char *s){
    char aux[strlen(s)+1];
    int r,w;

    for(r=0, w=0; s[r]!='\0'; r++){
        if(s[r]!=s[r+1] || !(isVowel(s[r]))) // isVowel do 1º exercício
            aux[w++] = s[r];
    }

    aux[w] = '\0';
    strcpy(s, aux);
    return (r-w);
}

int retiraVogaisRep2 (char *s){
    int r,w;

    for(r=0, w=0; s[r]!='\0'; r++){
        if(s[r]!=s[r+1] || !(isVowel(s[r]))) // isVowel do 1º exercício
            s[w++] = s[r];
    }

    s[w] = '\0';
    return (r-w);
}

//3
int duplicaVogais (char *s){
    int nVogais = contaVogais(s);
    char aux[strlen(s)+nVogais+1];
    int r, w;

    for(r=0, w=0; s[r]!='\0'; r++){
        aux[w++] = s[r];
        if(isVowel(s[r])) // isVowel do 1º exercício
            aux[w++] = s[r];
    }

    aux[w] = '\0';
    strcpy(s, aux);
    return (nVogais);
}

int duplicaVogais2 (char *s){
    int vogaisrepetidas = contaVogais(s);
    int i = strlen(s) - 1, j = i + vogaisrepetidas;
    s[j+1] = '\0'; 
    while(i>=0){
        if(isVowel(s[i]))
            s[j--] = s[i];
        s[j--] = s[i--];
    }

    return vogaisrepetidas;
}

// 2 - Arrays ordenados
//1
int ordenado (int a[], int N){
    int r = 0, i;

    for(i=0; i<N-1 && a[i]<=a[i+1]; i++);
    if(i==N-1) r = 1;

    return r;
}

//2
void merge (int a[], int na, int b[], int nb, int r[]){
  int i=0, j=0, w=0;

  while(i<na && j<nb){
    if(a[i]<b[j])
      r[w++] = a[i++];
    else
      r[w++] = b[j++]; 
  }

  while(i<na)
    r[w++] = a[i++];
  while(j<nb)
    r[w++] = b[j++];
}

//3
int partition (int v[], int N, int x){
    int r, i, j, aux[N];

	for(r=i=0, j=N-1; i<N; i++){
	  if(v[i] <= x)
            aux[r++] = v[i];
          else
            aux[j--] = v[i];
    }
  for(i=0; i<N; i++)
    v[i] = aux[i];

	return r;
}

void swap (int v[], int i, int j){
    int t;
    t = v[i];
    v[i] = v[j];
    v[j] = t;
}

int partition2 (int v[], int N, int x){
	int r, i;

	for(r=i=0; i<N; i++)
	  if(v[i] <= x) 
            swap (v, r++, i);

	return r;
}
