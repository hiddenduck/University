#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef struct celula {
    char *palavra;
    int ocorr;
    struct celula * prox;
} * Palavras;

//1
void libertaListaRecursiva (Palavras l){
    if(l != NULL){
        libertaListaRecursiva(l);
        free(l->palavra);
        free(l);
    }
}

void libertaLista (Palavras l){
    Palavras aux = l;
    while(l != NULL){
        l = l->prox;
        free(aux->palavra);
        free(aux);
        aux = l;
    }
}

//2
int quantasP (Palavras l){
    int contador = 0;
    while(l != NULL){
        l = l->prox;
        contador++;
    }
    return contador;
}

//3
void listaPal (Palavras l){
    while(l != NULL){
        printf("A palavra %s tem %d ocorrencias.\n", l->palavra, l->ocorr);
        l = l->prox;
    }
}

//4
char * ultima (Palavras l){
    char* ult;
    if(l != NULL){
        while(l->prox != NULL)
            l = l->prox;
        ult = l->palavra;
    }

    return ult;
}

//5
Palavras acrescentaInicio (Palavras l, char *p){
    Palavras nova = malloc(sizeof(struct celula));
    nova->palavra = strdup(p);
    nova->ocorr   = 1;
    nova->prox    = l;
    return nova; 
}

//6
Palavras acrescentaFim (Palavras l, char *p){
    Palavras inicio = l;
    Palavras nova = acrescentaInicio(NULL, p); // Usar o acrescenta no inicio para criar uma nova Palavras
    if(l->prox == NULL)
        inicio = nova;
    else{
        while(l->prox != NULL)
            l = l->prox;
        l->prox = nova;
    }
    return inicio;
}

//7 
//Se encontrar alguma palavra igual soma nas ocorrências, ao contrário do exercício anterior.

Palavras acrescentaNoInicio (Palavras l, char *p){
    Palavras inicio = l;
    while(l!=NULL && (strcmp(l->palavra, p)!=0))
        l = l->prox;
    if(l == NULL)
        inicio = acrescentaInicio(inicio, p);
    else
        l->ocorr++;

    return inicio;
}

Palavras acrescentaNoFim (Palavras l, char *p){
    Palavras inicio = l;
    if(l!=NULL){
        while(l->prox!=NULL && strcmp(l->palavra, p)!=0)
            l = l->prox;
        if(strcmp(l->palavra, p)==0)
            l->ocorr++;
        else{
            Palavras fim = acrescentaInicio(NULL, p);
            l->prox = fim;
        }
    }else
        inicio = acrescentaNoInicio(NULL, p);
    
    return inicio;
}

Palavras acrescentaPorOrdemAlfabetica (Palavras l, char *p){
    Palavras adiciona = acrescentaInicio(NULL, p);
    Palavras inicio = l;
    if(l!=NULL){
        if(strcmp(l->palavra, p)==0)
            l->ocorr++;
        else{
            while(l->prox != NULL && strcmp(l->prox->palavra, p)<0)
                l = l->prox;
            if(l->prox==NULL)
                l->prox = adiciona;
            else if(strcmp(l->prox->palavra, p)==0)
                l->ocorr++;
            else{
                adiciona->prox = l->prox;
                l->prox = adiciona;
            }
        }
    }else
        inicio = adiciona;

    return inicio;
}

//8
struct celula * maisFreq (Palavras l){ // struct celula * == Palavras
    Palavras max = l;
    while(l != NULL){
        if(l->ocorr > max->ocorr) // O primeiro ciclo contém um if desnecessário, mas parece não haver maneira de contornar.
            max = l;
        l = l->prox;
    }

    return max;
}