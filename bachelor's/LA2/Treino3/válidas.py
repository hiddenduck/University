def eValida(soma, lista):
    d = {0}
    
    for i in range(len(lista)):
        l = set()
        for elemento in d:
            if elemento + lista[i] <= soma:
                l.add(elemento+lista[i])
        d = d.union(l)
            
    return soma in d
    
def validas(soma,listas):
    return list(filter(lambda lista: eValida(soma, lista), listas))