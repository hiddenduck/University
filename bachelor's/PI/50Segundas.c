#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <math.h>
#include <string.h>
#include <limits.h>

typedef struct lligada {
    int valor;
    struct lligada *prox;
}   *LInt;

LInt newLInt (int v, LInt t){
    LInt new = (LInt) malloc (sizeof (struct lligada));
    
    if (new!=NULL) {
        new->valor = v;
        new->prox  = t;
    }
    return new;
}

//1
int length (LInt l){
    int len = 0;
    while(l!=NULL){
        len++;
        l = l->prox;
    }
    return len;
}

//2
void freeL (LInt l){
    LInt aux = l;
    while(l!=NULL){
        l = l->prox;
        free(aux);
        aux = l;
    }
}

//3
void imprimeL (LInt l){
    while(l!=NULL){
        printf("%d\n", l->valor);
        l = l->prox;
    }
}

//4
LInt reverseL (LInt l){
    LInt before = NULL;
    LInt start    = l;
    LInt after;
    while(l != NULL){
        after = l->prox;
        l->prox = before;
        before = l;
        l = after;
    }
    start = before;
    return start;
}

//5
void insertOrd (LInt *l, int x){
	LInt nova;
	nova = malloc(sizeof(struct lligada));
    assert(nova!=NULL);
	nova->valor = x;
	while(*l != NULL && (*l)->valor < x)
		l = &((*l)->prox);
	
	nova->prox = *l;
	*l = nova;
}

//6
int removeOneOrd (LInt *l, int x){
    LInt inicio = (*l), ant = *l;
    int r = 0;
    while(l != NULL && r==0){
        if((*l)->valor == x){
            ant->prox = (*l)->prox;
            free(*l);
            r = 1;
        } 
        ant = *l;
        l = &((*l)->prox); 
    }
    if(r==1)
        inicio = 0;
    
    return inicio;
}

//7
void merge (LInt *r, LInt a, LInt b){
    while(a!=NULL && b!=NULL){
        if(a->valor > b->valor)
            *r = b;
        else
            *r = a;
        *r = (*r)->prox;
    }

    while(a!=NULL){
        *r = a;
        *r = (*r)->prox;
    }
    while(b!=NULL){
        *r = b;
        *r = (*r)->prox;
    }
}

//8
void splitQS (LInt l, int x, LInt *mx, LInt *Mx){
    while(l!=NULL){
        if(l->valor < x){
            *mx = l;
            mx = &((*mx)->prox);
        }else{
            *Mx = l;
            Mx = &((*Mx)->prox);
        }
        l = l->prox;
    }
    *mx = NULL; *Mx = NULL;
}

//9
LInt parteAmeio (LInt *l){
    LInt nova, *prox = &nova;
    int comp = length(*l)/2;
    while(l!=NULL && comp!=0){
        *prox = *l;
        prox = &((*prox)->prox);
        *l = (*l)->prox;
        comp--;
    }
    *prox = NULL;
    return nova;
}

//10
int removeAll (LInt *l, int x){
    int cont = 0;
    LInt temp;
    while(*l!=NULL){
        if((*l)->valor == x){
            temp = *l;
            *l = (*l)->prox;
            free(temp);
            cont++;
        }
        else
            l = &((*l)->prox);
    }

    return cont;
}

//11
int removeDups (LInt *l){
    int cont = 0;
    LInt temp, ret;
    while(*l!=NULL){
        ret = *l;
        l = &((*l)->prox);
        while(*l!=NULL){
            if((*l)->valor == ret->valor){
                temp = *l;
                *l = (*l)->prox;
                free(temp);
                cont++;
            }else
                l = &((*l)->prox);
        }
        l = &ret;
        l = &((*l)->prox);
    }
    return cont;
}

//12
int removeMaiorL (LInt *l){
    int max = (*l)->valor;
    LInt maior = *l, anterior, maiorAnt = NULL, lista=*l;
    while(lista!=NULL){
        if(max < lista->valor){
            maiorAnt = anterior;
            max = lista->valor;
            maior = lista;
        }
        anterior = lista;
        lista = lista->prox;
    }
    if(maiorAnt!=NULL)
        maiorAnt->prox = maior->prox;
    else
        *l = (*l)->prox;
    free(maior);
    return max;
}

//13
void init (LInt *l){
    LInt temp;
    while(*l!=NULL){
        if((*l)->prox != NULL)
            l = &((*l)->prox);
        else{
            temp = *l;
            *l = (*l)->prox;
            free(temp);
        }
    }
}

//14
void appendL (LInt *l, int x){
    while(*l!=NULL)
        l = &((*l)->prox);
    *l = malloc(sizeof(struct lligada));
    assert(*l!=NULL);
    (*l)->valor = x; (*l)->prox = NULL;
}

//15
void concatL (LInt *a, LInt b){
    while(*a!=NULL)
        a = &((*a)->prox);
    *a = b;
}

//16
LInt cloneL (LInt l){
    LInt nova, *sitio = &nova; 
    while(l!=NULL){
        *sitio = malloc(sizeof(struct lligada));
        assert(*sitio!=NULL);
        (*sitio)->valor = l->valor;
        sitio = &((*sitio)->prox);
        l = l->prox;
    }
    *sitio = NULL;
    return nova;
}

//17
LInt cloneRev (LInt l){
    LInt new = cloneL(l);
    new = reverseL(new);
    return new;
}

//18
int maximo (LInt l){
    int max = l->valor;
    while(l!=NULL){
        if(l->valor > max)
            max = l->valor;
        l = l->prox;
    }
    
    return max;
}

//19
int take (int n, LInt *l){
    int comprimento = n;
    while(*l!=NULL && n!=0){
        l = &((*l)->prox);
        n--;
    }
    if(n==0){
        LInt temp;
        while(*l!=NULL){
            temp = *l;
            *l = (*l)->prox;
            free(temp);
        }
    }

    return comprimento - n;
}

//20
int drop (int n, LInt *l){
    int removidos = n;
    LInt temp;
    while(*l!=NULL && n!=0){
        temp = *l;
        *l = (*l)->prox;
        free(temp);
        n--;
    }

    return removidos - n;
}

//21
LInt NForward (LInt l, int N){
    while(N!=0){
        l = l->prox;
        N--;
    }

    return l;
}

//22
int listToArray (LInt l, int v[], int N){
    int i;
    for(i=0; l!=NULL && i<N; i++, l = l->prox)
        v[i] = l->valor;
    
    return i;
}

//23
LInt arrayToList (int v[], int N){
    LInt nova, *sitio = &nova;
    int i;
    for(i=0; i<N; i++){
        *sitio = malloc(sizeof(struct lligada));
        assert(*sitio!=NULL);
        (*sitio)->valor = v[i];
        sitio = &((*sitio)->prox);
    }
    *sitio = NULL;
    return nova;
}

//24
LInt somasAcL (LInt l){
    int acc = 0;
    LInt nova, *sitio = &nova;
    while(l!=NULL){
        *sitio = malloc(sizeof(struct lligada));
        assert(*sitio!=NULL);
        acc += l->valor;
        (*sitio)->valor = acc;
        l = l->prox;
        sitio = &((*sitio)->prox);
    }
    *sitio = NULL;
    return nova;
}

//25
void remreps (LInt l){
    LInt *sitio, temp;
    while(l!=NULL){
        sitio = &l;
        if(l->prox != NULL){
            sitio = &((*sitio)->prox);
            while(*sitio!=NULL && (*sitio)->valor == l->valor){
                temp = *sitio;
                *sitio = (*sitio)->prox;
                free(temp);
            }
        }
        if(l!=NULL)
            l = l->prox;
    }
}


//26
LInt rotateL (LInt l){
    LInt newL = l;
    if(l != NULL && l->prox != NULL){
        LInt start = l;
        l = l->prox;
        newL = l;
        start->prox = NULL;
        while(l->prox != NULL)
            l = l->prox;
        l->prox = start;
    }
    return newL;
}

//27
LInt parte (LInt l){
    LInt new = NULL, *sitio=&new;
    while(l!=NULL && l->prox!=NULL){
        if(new==NULL)
            new = *sitio = l->prox;
        else{
            *sitio = l->prox;
            l = l->prox = l->prox->prox;
            (*sitio)->prox = NULL; 
            sitio = &((*sitio)->prox);
        }
    }

    return new;    
}

// Árvores Binárias
typedef struct nodo {
    int valor;
    struct nodo *esq, *dir;
} *ABin;

ABin newABin (int r, ABin e, ABin d){
	ABin new = (ABin) malloc (sizeof (struct nodo));

	if (new!=NULL){
		new->valor = r;
		new->esq   = e;
		new->dir   = d;
	}
	return new;
}

//28
int altura (ABin arv){
    int r = 0;
    if(arv!=NULL)
        r = (altura(arv->esq) > altura(arv->dir)) ? (1 + altura(arv->esq)) : (1 + altura(arv->dir));
    return r;
}

//29
ABin cloneAB (ABin arv){
    ABin new = NULL;
    if(arv != NULL){
        new = malloc(sizeof(struct nodo));
        if(new != NULL){
            new->valor = arv->valor;
            new->esq = cloneAB(arv->esq);
            new->dir = cloneAB(arv->dir);
        }
    }
    return new;
}

//30
void mirror (ABin *arv){
    if(*arv!=NULL){
        ABin temp = (*arv)->dir;
        (*arv)->dir = (*arv)->esq;
        (*arv)->esq = temp;
        mirror(&((*arv)->esq));
        mirror(&((*arv)->dir));
    }
}

//31
void inorder (ABin arv, LInt *l){
    if(arv!=NULL){
        inorder(arv->esq, l);
        while(*l!=NULL)
            l = &((*l)->prox);
        *l = malloc(sizeof(struct nodo));
        (*l)->valor = arv->valor;
        inorder(arv->dir, &((*l)->prox));
    }else
        *l = NULL;
}

//32
void preorder (ABin arv, LInt *l){
    if(arv!=NULL){
        *l = malloc(sizeof(struct nodo));
        (*l)->valor = arv->valor;
        preorder(arv->esq, &((*l)->prox));
        while(*l!=NULL)
            l = &((*l)->prox);
        preorder(arv->dir, l);
    }else
        *l = NULL;
}

//33
void posorder (ABin arv, LInt *l){
    if(arv!=NULL){
        posorder(arv->esq, l);
        while(*l!=NULL)
            l = &((*l)->prox);
        posorder(arv->dir, l);
        while(*l!=NULL)
            l = &((*l)->prox);
        *l = calloc(1, sizeof(struct nodo));
        (*l)->valor = arv->valor;
    }else
        *l = NULL;
}

//34
int depth (ABin a, int x){
    int r = -1;
    if(a!=NULL){
        if(a->valor == x)
            r = 1;
        else{
            int rEsq = depth(a->esq, x);
            int rDir = depth(a->dir, x);
            if(rEsq==-1 && rDir==-1)
                r = -1;
            else if(rEsq==-1)
                r = 1 + rDir;
            else if(rDir==-1)
                r = 1 + rEsq;
            else
                r = (rEsq < rDir) ? 1 + rEsq : 1 + rDir;
        }
    }

    return r;
}

//35
int freeAB (ABin a){
    int r = 0;
    if(a!=NULL){
        r += freeAB(a->esq);
        r += freeAB(a->dir);
        free(a);
        r++;
    }

    return r;
}

//36
int pruneAB (ABin *a, int l){
    int r = 0;
    if(*a!=NULL){
        if(l==0){
            ABin temp = *a;
            *a = NULL;
            r += freeAB(temp);
        }else{
            r += pruneAB(&((*a)->dir), l-1);
            r += pruneAB(&((*a)->esq), l-1);
        }
    }

    return r;
}

//37
int iguaisAB (ABin a, ABin b){
    int r = 0;
    if(a==NULL && b==NULL){
        r = 1;
    }else if(a!=NULL && b!=NULL){
        r = a->valor == b->valor;
        if(r!=0){
            r = r && iguaisAB(a->esq, b->esq);
            r = r && iguaisAB(a->dir, b->dir);
        }
    }
    
    return r;
}

//38
LInt nivelL (ABin a, int n){
    LInt new = NULL, esq, dir;
    if(a!=NULL && n>=1){
        if(n==1){
            new = malloc(sizeof(struct lligada));
            new->valor = a->valor;
            new->prox = NULL;
        }else{
            esq = nivelL(a->esq, n-1);
            dir = nivelL(a->dir, n-1);
            if(esq!=NULL){
                new = esq;
                while(esq->prox!=NULL)
                    esq = esq->prox;
                esq->prox = dir;
            }else
                new = dir;
        }
    }

    return new; 
}

//39
int nivelV (ABin a, int n, int v[]){
    int r=0, esq, dir;
    if(a!=NULL && n>=1){
        if(n==1){
            *v = a->valor;
            r++;
        }
        else{
            esq = nivelV(a->esq, n-1, v);
            dir = nivelV(a->dir, n-1, v+esq);
            r += esq + dir;
        }
    }

    return r;
}

//40
int dumpAbin (ABin a, int v[], int N){
    int r = 0, esq, dir;
    if(a!=NULL && N>0){
        esq = dumpAbin(a->esq, v, N);
        if(esq < N){
            v[esq] = a->valor;
            dir = dumpAbin(a->dir, v+1+esq, N-1-esq);
            r += 1 + esq + dir;
        }else
            r = N;
    }

    return r;
}

//41
ABin somasAcA (ABin a){
    ABin new = NULL;
    if(a!=NULL){
        ABin esq = somasAcA(a->esq);
        ABin dir = somasAcA(a->dir);
        new = malloc(sizeof(struct nodo));
        new->dir = dir;
        new->esq = esq; 
        if(esq!=NULL && dir!=NULL)
            new->valor = a->valor + esq->valor + dir->valor;
        else if(esq!=NULL)
            new->valor = a->valor + esq->valor;
        else if(dir!=NULL)
            new->valor = a->valor + dir->valor;
        else
            new->valor = a->valor;
    }

    return new;
}

//42
int contaFolhas (ABin a){
    int r = 0;
    if(a!=NULL){
        if(a->esq==NULL && a->dir==NULL)
            r++;
        else
            r += contaFolhas(a->esq) + contaFolhas(a->dir);
    }

    return r;
}

//43
ABin cloneMirror (ABin a){
    ABin new = NULL;
    if(a!=NULL){
        new = malloc(sizeof(struct nodo));
        new->valor = a->valor;
        new->esq = cloneMirror(a->dir);
        new->dir = cloneMirror(a->esq);
    }

    return new;
}

//44
int addOrd (ABin *a, int x){
    int r = 1;
    while(*a!=NULL && (*a)->valor!=x){
        if((*a)->valor > x)
            a = &((*a)->esq);
        else
            a = &((*a)->dir);
    }

    if(*a==NULL){
        r = 0;
        *a = malloc(sizeof(struct nodo));
        (*a)->valor = x;
        (*a)->dir = (*a)->esq = NULL;
    }

    return r;
}

//45
int lookupAB (ABin a, int x) {
    int r = 0;
    while(a!=NULL && a->valor!=x){
        if(a->valor > x)
            a = a->esq;
        else
            a = a->dir;
    }

    if(a!=NULL)
        r = 1;

    return r;
}

//46
int depthOrd (ABin a, int x){
    int r = 1;
    while(a!=NULL && a->valor!=x){
        if(a->valor > x){
            r++;
            a = a->esq;
        }
        else{
            r++;
            a = a->dir;
        }
    }

    if(a==NULL)
        r = -1;

    return r;
}

//47
int maiorAB (ABin arv){
    while(arv->dir!=NULL)
        arv = arv->dir;

    return arv->valor;
}

//48
void removeMaiorA (ABin *arv){
    if(*arv!=NULL){
        while((*arv)->dir != NULL)
            arv = &((*arv)->dir);
         ABin temp = *arv;
         *arv = (*arv)->esq;
         free(temp);
    }
}

//49
int quantosMaiores (ABin a, int x){
    int r = 0;
    if(a!=NULL){
        if(a->valor <= x)
            r += quantosMaiores(a->dir, x);
        else
            r += 1 + quantosMaiores(a->esq, x) + quantosMaiores(a->dir, x);
    }

    return r;
}

//50
void listToBTreeAux (int m, LInt l, ABin *a){
    if(l!=NULL && m>0){
        int n = 0;
        LInt start = l;
        while(n > 0)
            l = l->prox;
        *a = malloc(sizeof(struct lligada));
        (*a)->valor = l->valor;
        listToBTreeAux(m/2, start, &((*a)->esq));
        listToBTreeAux(m-m/2, l->prox, &((*a)->dir));
    }else
        *a = NULL;
}

void listToBTree (LInt l, ABin *a){
    int tamanho = length(l);
    listToBTreeAux(tamanho, l, a);
}

//51
int deProcuraAux (int valor, int bool, ABin a){
    return a==NULL || (a!=NULL && (bool) ? a->valor < valor && deProcuraAux(valor, bool, a->esq) && deProcuraAux(valor, bool, a->dir) : a->valor > valor && deProcuraAux(valor, bool, a->esq) && deProcuraAux(valor, bool, a->dir));
}

int deProcura (ABin a){
    return a==NULL || (a!=NULL && deProcuraAux(a->valor, 1, a->esq) && deProcuraAux(a->valor, 0, a->dir) && deProcura(a->esq) && deProcura(a->dir));
}