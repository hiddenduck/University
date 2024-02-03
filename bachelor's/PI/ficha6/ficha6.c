#include <stdio.h>
#include <stdlib.h>

#define MAX 10 // exemplo: 10

//1 Static Stacks
typedef struct staticStack {
    int sp;
    int values [MAX];
} STACK, *SStack;

//a)
void SinitStack (SStack s){
    s->sp = 0;
}

//b)
int SisEmpty (SStack s){
    return (s->sp==0);
}

//c)
int Spush (SStack s, int x){
    int r=1;
    if(s->sp<MAX){
        r=0;
        s->values[s->sp++] = x;
    }

    return r;
}

//d)
int Spop (SStack s, int *x){
    int r=1;
    if(s->sp>0){
        r=0;
        *x = s->values[--s->sp];
    }

    return r;
}

//e)
int Stop (SStack s, int *x){
    int r=1;
    if(s->sp>0){
        r=0;
        *x = s->values[s->sp-1];
    }

    return r;
}

//2 Static Queues
typedef struct staticQueue {
    int front;
    int length;
    int values [MAX];
} QUEUE, *SQueue;

//a)
void SinitQueue (SQueue q){
    q->length = 0;
    q->front = 0;
}

//b)
int SisEmptyQ (SQueue q){
    return (q->length==0);
}

//c)
int Senqueue (SQueue q, int x){
    int r=1;
    if(q->length<MAX){
        r=0;
        q->values[(q->front + q->length)%MAX] = x;
        q->length++;
    }

    return r;
}

//d)
int Sdequeue (SQueue q, int *x){
    int r=1;
    if(q->length>0){
        r=0;
        *x = q->values[q->front++];
        q->front %= MAX;
        q->length--;
    }
    
    return r;
}

//e)
int Sfront (SQueue q, int *x){
    int r=1;

    if(q->length>0){
        r=0;
        *x=q->values[q->front];
    }

    return r;
}

//3

//Dynamic Stacks
typedef struct dinStack {
    int sp;
    int size;
    int *values;
} *DStack;

void DinitStack (DStack s){
    s->sp = 0;
    s->size = MAX;
    s->values = malloc(sizeof(int)*s->size);
}

int DisEmpty (DStack s){
    return (s->sp==0);
}

int dupStack (DStack s){
    int r=1, i;
    int *temp = malloc(sizeof(int)*2*s->size);
    if(temp!=NULL){
        r=0;
        for(i=0; i<s->size; i++)
            temp[i] = s->values[i];
        free(s->values);
        s->values = temp;
        s->size *= 2;
    }

    return r;
}

int Dpush (DStack s, int x){
    int r=0;
    if(s->sp==s->size)
        r = dupStack(s);
    if(r==0)
        s->values[s->sp++] = x;
    return r;
}

int Dpush2 (DStack s, int x){
    int r=0;
    if(s->sp==s->size){
        s->values = realloc(s->values, sizeof(int)*2*s->size);
        s->size *= 2;
    }
    s->values[s->sp++] = x;
    return r;
}

int Dpop (DStack s, int *x){
    int r=1;
    if(s->sp>0){
        r=0;
        *x = s->values[s->sp--];
    }

    return r;
}

int Dtop (DStack s, int *x){
    int r=1;
    if(s->sp>0){
        r=0;
        *x = s->values[s->sp-1];
    }
}

//Dynamic Queues
typedef struct dinQueue {
    int size;
    int front;
    int length;
    int *values;
} *DQueue;

void DinitQueue (DQueue q){
    q->size = MAX;
    q->front = 0;
    q->length = 0;
    q->values = malloc(sizeof(int)*q->size);
}

int DisEmptyQ (DQueue q){
    return (q->length==0);
}

int dupQueue (DQueue q){
    int r=1, i;
    int *temp = malloc(sizeof(int)*2*q->size);
    if(temp != NULL){
        r=0;
        for(i=0; i<q->length; i++)
            temp[i] = q->values[i];
        free(q->values);
        q->values = temp;
        q->size *= 2;
    }

    return r;
}

int Denqueue (DQueue q, int x){
    int r=0;
    if(q->length == q->size)
        r = dupQueue(q);
    if(r==0){
        q->values[(q->front + q->length)%(q->size)] = x;
        q->length++;
    }

    return r;
}

int Ddequeue (DQueue q, int *x){
    int r=1;
    if(q->length > 0){
        r=0;
        *x = q->values[q->front++];
        q->front %= q->size;
        q->length--;
    }

    return r;
}

int Dfront (DQueue q, int *x){
    int r=1;
    if(q->length>0){
        r=0;
        *x = q->values[q->front];
    }

    return r;
}

