def aux(posicao, passos, probs, direcoes):
    if passos == 0:
        return int(posicao == (0,0))
        
    soma = 0
    for direcao in probs:
        soma += probs[direcao] * aux((posicao[0]+direcoes[direcao][0],posicao[1]+direcoes[direcao][1]), passos-1, probs, direcoes)
    
    return soma

def probabilidadeRec(passos,probs):
    if passos % 2 == 0:
        direcoes = {"U": (0,1), "D": (0,-1), "L": (-1,0), "R": (1,0)}
        return round(aux((0,0), passos, probs, direcoes), 2)
    else:
        return 0

def auxMemo(posicao, passos, probs, direcoes, ha): # 100%
    if (posicao, passos) in ha:
        return ha[posicao, passos]
    
    if passos == 0:
        ha[posicao, passos] = int(posicao == (0,0))
        return ha[posicao, passos]
        
    ha[posicao, passos] = 0
    for direcao in probs:
        ha[posicao, passos] += probs[direcao] * auxMemo((posicao[0]+direcoes[direcao][0],posicao[1]+direcoes[direcao][1]), passos-1, probs, direcoes, ha)

    return ha[posicao, passos]

def probabilidadeMemo(passos,probs):
    if passos % 2 == 0:
        direcoes = {"U": (0,1), "D": (0,-1), "L": (-1,0), "R": (1,0)}
        return round(auxMemo((0,0), passos, probs, direcoes, {}), 2)
    else:
        return 0