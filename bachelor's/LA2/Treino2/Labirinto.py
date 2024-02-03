def caminho(mapa):
    o = (0,0)
    tamanho = len(mapa)
    destino = (tamanho-1, tamanho-1)
    pai = {}
    vis = {o}
    queue = [o]
    flag = 0
    while queue and flag==0:
        v = queue.pop(0)
        for d in filter(lambda x: 0 <= x[0] < tamanho and 0 <= x[1] < tamanho and mapa[x[1]][x[0]] != "#", map(lambda x, y: (x[0]+y[0], x[1]+y[1]), [(0, 1), (0, -1), (1, 0), (-1, 0)], [v]*4)):
            if d not in vis:
                vis.add(d)
                pai[d] = v
                queue.append(d)
                if d[0] == destino[0] and d[1] == destino[1]:
                    flag = 1
                    break
    
    
    caminho = ""
    if flag == 1:
        anda = {"N": (0,-1), "S": (0,1), "E": (1,0), "O": (-1,0)} # A ordem está trocada 
        while d in pai:
            caminho += "".join(filter(lambda x: (pai[d][0] + anda[x][0], pai[d][1] + anda[x][1]) == d, anda))
            d = pai[d]
    
    return caminho[::-1]