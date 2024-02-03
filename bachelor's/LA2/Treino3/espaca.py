def aux(nova, frase, palavras):
    l = [""]
    for palavra in palavras:
        if frase.find(nova+palavra) == 0:
            l.append(palavra + " " + aux(nova+palavra, frase, palavras))

    return max(l, key=lambda x: len(x))

def espacaRec(frase,palavras):
    return aux("", frase, palavras)[:-1]
    
def auxMemo(nova, frase, palavras, ha):
    if nova in ha:
        return ha[nova]

    l = [""]
    for palavra in palavras:
        if frase.find(nova + palavra) == 0:
            ha[nova + " " + palavra] = palavra + " " + auxMemo(nova + palavra, frase, palavras, ha)
            l.append(ha[nova + " " + palavra])

    ha[nova] = max(l, key=lambda x: len(x))
    return ha[nova]

def espacaMemo(frase, palavras):
    return auxMemo("", frase, palavras, {})[:-1]

def espaca(frase, palavras):
    ha = {0: ""}
    maior = 0
    for i in range(1, len(frase)+1):
        for palavra in palavras:
            if i-len(palavra) in ha and frase[i-len(palavra):].find(palavra) == 0:
                ha[i] = ha[i-len(palavra)] + ("" if ha[i-len(palavra)] == "" else " ") + palavra
                maior = i    
    
    return ha[maior]