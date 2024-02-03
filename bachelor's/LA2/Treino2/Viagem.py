def build(rotas):
    adj = {}
    for rota in rotas:
        tamanho = len(rota)
        i = 0
        while i < tamanho-2:
            if rota[i] not in adj:
                adj[rota[i]] = {}
            if rota[i+2] not in adj:
                adj[rota[i+2]] = {}
            adj[rota[i]][rota[i+2]] = rota[i+1]
            adj[rota[i+2]][rota[i]] = rota[i+1]
            i += 2
    return adj

def dijkstra(adj,o):
    dist = {}
    dist[o] = 0
    orla = {o}
    while orla:
        v = min(orla,key=lambda x:dist[x])
        orla.remove(v)
        for d in adj[v]:
            if d not in dist:
                orla.add(d)
                dist[d] = float("inf")
            if dist[v] + adj[v][d] < dist[d]:
                dist[d] = dist[v] + adj[v][d]
    return dist
    
def viagem(rotas,o,d):
    if not rotas:
        return 0
    adj = build(rotas)
    dist = dijkstra(adj, o)
    
    return dist[d]