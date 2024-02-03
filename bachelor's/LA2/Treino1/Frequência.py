def frequencia(texto):
    
    ha = {}
    for nome in texto.split():
        if nome not in ha:
            ha[nome] = 0
        ha[nome] = ha[nome] + 1

    return sorted(sorted(ha), key=lambda x: ha[x], reverse = True)
