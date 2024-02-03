def ladraoAux(capacidade, objectos, ha):
    if capacidade in ha:
        return ha[capacidade]
    
    if capacidade == 0:
        ha[capacidade] = 0
        return 0
        
    r = 0
    newObj = objectos.copy()
    for m in objectos:
        if m[2] <= capacidade:
            newObj.remove(m)
            r = max(r,m[1]+ladrao(capacidade-m[2],newObj))
    
    ha[capacidade] = r
    return r
    
def ladrao(capacidade,objectos):
    d = {}
    d[0] = 0
    resto = {}
    resto[0] = objectos.copy()
    
    for v in range(1, capacidade+1):
        r = 0
        newObj = objectos.copy()
        for nome, valor, peso in objectos:
            if peso <= v and (nome, valor, peso) in resto[v-peso]:
                a = valor+d[v-peso]
                if a > r:
                    r = a
                    newObj = resto[v-peso].copy()
                    newObj.remove((nome, valor, peso))
                    
            d[v] = r
            resto[v] = newObj
            
    return max(d.values()) # 80% -> 100%, pode não chegar ao d[capacidade]