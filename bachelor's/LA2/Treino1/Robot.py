def robot(comandos):
    andar = {"N": (0,1), "S": (0,-1), "O": (-1,0), "E": (1,0)}
    somar = lambda x,y: (x[0]+y[0], x[1]+y[1])
    direcoes = {"N": "OE", "S": "EO", "O": "SN", "E": "NS"}
    direcao = "N"
    posicao = (0,0)
    rectangulos = []
    rectangulo = [0,0,0,0] # minX, minY, maxX, maxY
    
    for comando in comandos:
        if comando == 'A':
            posicao = somar(posicao, andar[direcao])
            rectangulo[0] = min(rectangulo[0], posicao[0])
            rectangulo[1] = min(rectangulo[1], posicao[1])
            rectangulo[2] = max(rectangulo[2], posicao[0])
            rectangulo[3] = max(rectangulo[3], posicao[1])
        elif comando == 'E':
            direcao = direcoes[direcao][0]
        elif comando == 'D':
            direcao = direcoes[direcao][1]
        elif comando == "H":
            posicao = (0,0)
            rectangulos.append(tuple(rectangulo))
            rectangulo = [0,0,0,0]
            direcao = "N"

    return rectangulos