def maxsoma(lista):
    atual = maior = lista[0]
    for i in range(1, len(lista)):
        if atual + lista[i] > lista[i]:
            atual += lista[i]
            maior = max(maior, atual)
        else:
            atual = lista[i]
    return maior