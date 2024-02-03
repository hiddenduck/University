def bfs(o, vizinhos):
    vis = {o}
    queue = [o]
    while queue:
        v = queue.pop(0)
        for vizinho in vizinhos:
            if v in vizinho:
                for country in vizinho:
                    if country not in vis:
                        vis.add(country)
                        queue.append(country)

    return len(vis)


def maior(vizinhos):
    maior = 0
    for vizinho in vizinhos:
        if vizinho:
            maior = max(maior, bfs(vizinho[0], vizinhos))

    return maior