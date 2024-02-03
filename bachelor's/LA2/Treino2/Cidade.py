def build(arestas): 
    adj = {} 
    for v in arestas: 
        if v[0] not in adj: 
            adj[v[0]] = {}
        if v[-1] not in adj: 
            adj[v[-1]] = {} 
        adj[v[0]][v[-1]] = len(v)
        adj[v[-1]][v[0]] = len(v)
        
    return adj



def tamanho(ruas):
    adj = build(sorted(ruas, key=lambda x: len(x), reverse=True))
    dist = {}
    for o in adj:
        dist[o] = {}
        for d in adj:
            if o == d:
                dist[o][d] = 0
            elif d in adj[o]:
                dist[o][d] = adj[o][d]
            else:
                dist[o][d] = float("inf")
    for k in adj:
        for o in adj:
            for d in adj:
                if dist[o][k] + dist[k][d] < dist[o][d]:
                    dist[o][d] = dist[o][k] + dist[k][d]

    return max(map(lambda x: max(x[1].items()), dist.items()))[1]