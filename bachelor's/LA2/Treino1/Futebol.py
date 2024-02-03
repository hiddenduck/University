def tabela(jogos):
    ha ={}

    for tupl in jogos:
        for i in range(2):
            primeiro = tupl[2*i]
            if primeiro not in ha:
                ha[primeiro] = [0,0]
            ha[primeiro][1] += tupl[2*i+1] - tupl[3-2*i]

        if tupl[1] > tupl[3]:
            ha[tupl[0]][0] += 3
        elif tupl[1] == tupl[3]:
            ha[tupl[0]][0] += 1
            ha[tupl[2]][0] += 1
        else:
            ha[tupl[2]][0] += 3
            
    return [(equipa, ha[equipa][0]) for equipa in sorted(sorted(sorted(ha), key=lambda x: ha[x][1], reverse=True), key=lambda y: ha[y][0], reverse=True)]