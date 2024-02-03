def dijkstra(mapa,o, tamanhoX, tamanhoY):
    dist ={}
    dist[o] = 0
    orla = {o}
    while orla:
        v = min(orla,key=lambda x:dist[x])
        if v[1] == tamanhoY-1:
            break
        orla.remove(v)
        andar = map(lambda x, y: (x[0]+y[0], x[1]+y[1]), [(0, 1), (0, -1), (1, 0), (-1, 0)], [v] * 4)
        for d in filter(lambda x: 0 <= x[0] < tamanhoX and 0 <= x[1] < tamanhoY and abs(int(mapa[x[1]][x[0]]) - int(mapa[v[1]][v[0]])) <= 2, andar):
            if d not in dist:
                orla.add(d)
                dist[d] = float("inf")
            if dist[v] + abs(int(mapa[d[1]][d[0]]) - int(mapa[v[1]][v[0]])) + 1 < dist[d]:
                dist[d] = dist[v] + abs(int(mapa[d[1]][d[0]]) - int(mapa[v[1]][v[0]])) + 1
    menor = float("Inf")
    for i in range(tamanhoX):
        if (i, tamanhoY-1) in dist and dist[(i, tamanhoY-1)] < menor:
            menor = dist[(i, tamanhoY-1)]

    return menor
    
def travessia(mapa):
    tamanhoX = len(mapa[0])
    tamanhoY = len(mapa)
    menor = float("Inf")
    for i in range(tamanhoX):
        n = dijkstra(mapa, (i,0), tamanhoX, tamanhoY)
        if dijkstra(mapa, (i,0), tamanhoX, tamanhoY) < menor:
            menor = n
            melhor = i
    
    return (melhor, menor)