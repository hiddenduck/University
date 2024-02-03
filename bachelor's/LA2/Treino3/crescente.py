def aux(x, lista, ha):
    if x in ha:
        return ha[x]
        
    if not lista:
       ha[x] = 0
    else:
        ha[x] = int(x <= lista[0]) + aux(lista[0], lista[1:], ha) # if x <= lista[0]: 1+aux(lista[0], lista[1:], ha) else: aux(lista[0], lista[1:], ha)
    
    return ha[x]


def crescenteRec(lista):
    maior = 0
    for x in lista:
        maior = max(maior, aux(x, lista, {}))
    return maior
    
def crescente(lista):
    if not lista:
        return 0
    
    ha = {}
    for i, x in enumerate(lista):
        if i not in ha:
                    ha[i] = 1
        for j in range(0, i):
            if lista[j] <= x:
                if j not in ha:
                    ha[j] = 1
                ha[i] = max(ha[i], ha[j]+1)
    
    return max(ha.values())     