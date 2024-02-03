def aux(capacidade, produtos, ha): # Parecido ao exercicio Trocar 
    if capacidade in ha:
        return ha[capacidade]
    
    if capacidade <= 0:
        ha[capacidade] = 0
        return 0
        
    r = 0
    for nome, valor, peso in produtos:
        if peso <= capacidade:
            r = max(r, valor + aux(capacidade-peso, produtos, ha))
            
    ha[capacidade] = r
    return r
    
def vendedor(capacidade,produtos): # Parecido ao exemplo dos slides
    d = {}
    d[0] = 0
    c = {}
    
    for v in range(1, capacidade+1):
        r = 0
        for nome, valor, peso in produtos:
            if peso <= v:
                a = valor + d[v-peso]
                if a > r:
                    r = a
                    c[v] = (nome, valor, peso)
        
        d[v] = r
            

    temp = capacidade
    l = []
    flag = 1
    while capacidade > 0 and flag: # Parecido ao ladrao pode não chegar ao capacidade, preciso de parar antes
        if capacidade in c:
            l.append(c[capacidade][0])
            capacidade -= c[capacidade][2]
        else:
            flag = 0
    
    return d[temp], sorted(l) 