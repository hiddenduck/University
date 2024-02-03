def area(p,mapa):
    vis = {p}
    queue = [p]
    tamanho = len(mapa);
    contador = 1
    while queue:
        v = queue.pop(0)
        x = v[0]
        y = v[1]
        if x<tamanho and y<tamanho:
            for anda in filter(lambda x: x[0]>=0 and x[0]<tamanho and x[1]>=0 and x[1]<tamanho and mapa[x[1]][x[0]] != '*' and (x[0], x[1]) not in vis, [(x+1, y), (x-1, y), (x, y+1), (x, y-1)]):
                vis.add((anda[0], anda[1]))
                queue.append((anda[0], anda[1]))
                contador += 1
         
    return contador