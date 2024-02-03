def procuraRec(pos, mapa):
    if mapa[pos[1]][pos[0]] != ".":
        valorAtual = int(mapa[pos[1]][pos[0]])
    else:
        valorAtual = 0
        
    l = list(filter(lambda x: 0 <= x[0] < len(mapa[0]) and 0 <= x[1] < len(mapa) and mapa[x[1]][x[0]] != '#', [(pos[0], pos[1]+1), (pos[0]+1, pos[1])]))
    
    if len(l)==2:
        resultado = valorAtual + max(procuraRec(l[0], mapa), procuraRec(l[1], mapa))
    elif len(l) == 1:
        resultado = valorAtual + procuraRec(l[0], mapa)
    else:
        resultado = valorAtual
    
    return resultado

def saqueRec(mapa):
    return procuraRec((0,0), mapa)

def procuraMemo(pos, mapa, ha): # 80%
    if pos in ha:
        return ha[pos]
        
    if mapa[pos[1]][pos[0]] != ".":
        valorAtual = int(mapa[pos[1]][pos[0]])
    else:
        valorAtual = 0
        
    l = list(filter(lambda x: 0 <= x[0] < len(mapa[0]) and 0 <= x[1] < len(mapa) and mapa[x[1]][x[0]] != '#', [(pos[0], pos[1]+1), (pos[0]+1, pos[1])]))
    
    if len(l)==2:
        ha[pos] = valorAtual + max(procuraMemo(l[0], mapa, ha), procuraMemo(l[1], mapa, ha))
    elif len(l) == 1:
        ha[pos] = valorAtual + procuraMemo(l[0], mapa, ha)
    else:
        ha[pos] = valorAtual
    
    return ha[pos]

def saqueMemo(mapa):
    return procuraMemo((0,0), mapa, {})

def saque(mapa):
    if not mapa:
        return 0
    tamanhoX = len(mapa[0])
    tamanhoY = len(mapa)
    ha = {}
    
    for x in range(tamanhoX):
        for y in range(tamanhoY):
            if mapa[y][x] == '#':
                ha[(x,y)] = float("-Inf")
            else:
                if mapa[y][x] != ".":
                    valorAtual = int(mapa[y][x])
                else:
                    valorAtual = 0
                l = list(filter(lambda x: 0 <= x[0] and 0 <= x[1], [(x, y-1), (x-1, y)]))
                if len(l)==2:
                    ha[(x,y)] = valorAtual + max(ha[(l[0][0], l[0][1])], ha[(l[1][0], l[1][1])])
                elif len(l) == 1:
                    ha[(x,y)] = valorAtual + ha[(l[0][0], l[0][1])]
                else:
                    ha[(x,y)] = valorAtual
            if x > 0:
                del ha[(x-1, y)]
            if x == tamanhoX-1 and y > 0:
                del ha[(x, y-1)]

    return ha[(tamanhoX-1, tamanhoY-1)]