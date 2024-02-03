def bfs(o, artigos):
    vis = {o}
    queue = [o]
    adj = {o: 0}
    while queue:
        v = queue.pop(0)
        for artigo in artigos:
            if v in artigos[artigo]:
                for autor in artigos[artigo]:
                    if autor not in vis:
                        vis.add(autor)
                        queue.append(autor)
                        adj[autor] = adj[v]+1
                    
                
    return adj
                
def erdos(artigos,n):
    adj = bfs("Paul Erdos", artigos)
    return sorted(filter(lambda x: adj[x] <= n, sorted(adj)), key=lambda x: adj[x])