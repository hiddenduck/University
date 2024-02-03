def aloca(prefs):
    projetos = []
    naloc = []
    for aluno in sorted(prefs):
        r = 0
        for projeto in prefs[aluno]:
            if projeto not in projetos and r == 0:
                projetos.append(projeto)
                r = 1
        if r == 0:
            naloc.append(aluno)
    
    return naloc