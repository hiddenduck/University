def cruzamentos(ruas):
    cruza = {}
    
    for rua in ruas:
        if(rua[0] not in cruza):
            cruza[rua[0]] = 0
        cruza[rua[0]] +=1
        
        if(rua[0]!=rua[-1]):
            if(rua[-1] not in cruza):
                cruza[rua[-1]] = 0
            cruza[rua[-1]] += 1
    
    lista = sorted(cruza.items(), key=lambda x: x[0])
    return sorted(lista, key=lambda x: x[1])