#Versão inicial

def saltos(o,d):
    if o[0]==d[0] and o[1]==d[1]:
        return 0
    
    vis = {o}
    queue = [o]
    pai = {}
    flag = 0
    while queue and flag==0:
        v = queue.pop(0)
        adj = map(lambda x, y: (x[0]+y[0], x[1]+y[1]), [v]*8, [(-2, 1), (-2,-1), (-1, 2), (-1, -2), (1, 2), (1, -2), (2, 1), (2, -1)])
        for a in adj:
            if a not in vis:
                pai[a] = v    
                vis.add(a)
                queue.append(a)
                if(a[0]==d[0] and a[1]==d[1]):
                    flag = 1
                    break
    
    caminho = [d]
    while d in pai:
        d = pai[d]
        caminho.insert(0,d)
        
    return len(caminho)-1