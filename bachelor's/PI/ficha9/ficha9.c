#include <stdio.h>
#include <stdlib.h>

typedef struct nodo{
    int valor;
    struct nodo *esq, *dir;
} *ABin;

ABin newABin (int r, ABin e, ABin d){
    ABin a = malloc(sizeof(struct nodo));
    if(a!=NULL){
        a->valor = r;
        a->esq = e;
        a->dir = d;
    }

    return a;
}

//1
int max(int x, int y){
    return (x>y) ? x : y;
}

int altura (ABin a){
    int r = 0;
    if(a!=NULL)
        r = 1 + max(altura(a->esq), altura(a->dir));
    return r;
}

int nFolhas (ABin a){
    int r = 0;
    if(a != NULL){
        if(a->dir == NULL && a->esq == NULL)
            r = 1;
        else 
            r = nFolhas(a->dir) + nFolhas(a->esq);
        }
    return r;
}

ABin maisEsquerda(ABin a){
    ABin r = a;
    while(a!=NULL){
        r = a;
        a = a->esq;
    }
    return r;
}

ABin maisEsquerda2(ABin a){ // verificar a != NULL em cada ciclo é desnecessário
    while(a!=NULL && a->esq!=NULL)
        a = a->esq;
    return a;
}

ABin maisEsquerda3 (ABin a){
    if(a != NULL)
        while(a->esq != NULL)
            a = a->esq;
    return a;
}

void imprimeNivel(ABin a, int l){
    if(a!=NULL && l>=0){
        if(l==0)
            printf("%d ", a->valor);
        else{
            imprimeNivel(a->esq, l-1);
            imprimeNivel(a->dir, l-1);
        }
    }
}

int procuraE (ABin a, int x){
    int r = 0;
    if(a!=NULL){
        if(a->valor!=x)
            r = procuraE(a->dir, x) || procuraE(a->esq, x);
        else
            r = 1;
    }

    return r;
}

int procuraE2 (ABin a, int x){
    return (a!= NULL && (a->valor==x || procuraE2(a->esq, x) || procuraE2(a->dir, x)));
}

//2 Árvores de procura BST (Binary Search Tree)
struct nodo *procuraRecursivo (ABin a, int x){
    ABin n = NULL;
    if(a!=NULL){
        if(a->valor == x)
            n = a;
        else if(a->valor > x)
            n = procura(a->esq, x);
        else
            n = procura(a->dir, x);
    }

    return n;
}

struct nodo *procura (ABin a, int x){
    while(a != NULL && a->valor != x){
        if(a->valor > x)
            a = a->esq;
        else
            a = a->dir;
    }

    return a;
}

int nivel (ABin a, int x){
    int r;
    for(r=0; a!=NULL && a->valor != x; r++){
        if(a->valor > x)
            a = a->esq;
        else
            a = a->dir;
    }

    return (a!=NULL) ? r : -1;
}

// inorder left -> root -> right
void imprimeAte (ABin a, int x){
    if(a!=NULL){
        imprimeAte(a->esq, x);
        if(a->valor<x){
            printf("%d ", a->valor);
            imprimeAte(a->dir, x);
            }
    }
}
