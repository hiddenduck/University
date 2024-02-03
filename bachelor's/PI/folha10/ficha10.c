#include <stdio.h>
#include <stdlib.h>

typedef struct nodo {
    int valor;
    struct nodo *esq, *dir;
} * ABin;

ABin newABin (int x, ABin esq, ABin dir){
    ABin new = malloc(sizeof(struct nodo));
    if(new!=NULL){
        new->valor = x;
        new->esq = esq;
        new->dir = dir;
    }
    return new;
}

//1
ABin removeMenor (ABin *a){
    ABin esquerda = NULL;
    if(*a!=NULL){
        while((*a)->esq!=NULL)
            a = &((*a)->esq);
        esquerda = *a;
        *a = (*a)->dir;
    }

    return esquerda;
}

void removeRaiz (ABin *a){
    ABin newr;
    if((*a)->dir != NULL){
        newr = removeMenor(&(*a)->dir);
        newr->esq = (*a)->esq;
        newr->dir = (*a)->dir;
    }else
        newr = (*a)->esq; 
    
    free(*a);
    *a = newr;
}

int removeElem (ABin *a, int x){
    int r = 1;
    while(*a!=NULL && (*a)->valor != x){
        if((*a)->valor < x)
            a = &((*a)->dir);
        else
            a = &((*a)->esq);
    }
    if(*a!=NULL){
        r = 0;
        removeRaiz(a); 
    }

    return r;
}

//2
void rodaDireita (ABin *a){
    ABin aux = *a;
    *a = (*a)->esq;
    aux->esq = (*a)->dir;
    (*a)->dir = aux;
}

void rodaEsquerda (ABin *a){
    ABin aux = *a;
    *a = (*a)->dir;
    aux->dir = (*a)->esq;
    (*a)->esq = aux;
}

void promoveMenor (ABin *a){
    if(*a!=NULL && (*a)->esq!=NULL){
        promoveMenor(&((*a)->esq));
        rodaDireita(a);
    }
}

void promoveMaior (ABin *a){
    if(*a!= NULL && (*a)->dir!=NULL){
        promoveMaior(&((*a)->dir));
        rodaEsquerda(a);
    }   
}

ABin removeMenor2 (ABin *a){
    ABin menor;
    promoveMenor(a);
    menor = *a;
    *a = (*a)->dir;
    return menor;
}

//3
int constroiEspinhaAux (ABin *a, ABin *ult){
    int r = 0;
    if(*a!=NULL){
        r = constroiEspinhaAux(&((*a)->esq), ult);
        if((*a)->esq!=NULL)
            rodaDireita(a);
        r = r + 1 + constroiEspinhaAux(&((*a)->dir), ult);
    }

    return r;
}

int constroiEspinha (ABin *a){
    return (constroiEspinhaAux(a, NULL));
}

int constroiEspinha2 (ABin *a){
    int r = 0;
    while(*a!=NULL){
        promoveMenor(a);
        a = &((*a)->dir);
        r++;
    }
    return r;
}
