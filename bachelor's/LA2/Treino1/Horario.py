def horario(ucs,alunos):
    conseguem = []
    for aluno in alunos:
        ha = {}
        n_horas = 0
        consegue = 1

        for uc in alunos[aluno]:
            if(consegue==1):
                if uc in ucs:
                    uc_new = ucs[uc]
                    if uc_new[0] not in ha:
                        ha[uc_new[0]] = set(range(uc_new[1], uc_new[1] + uc_new[2]))
                        n_horas += uc_new[2]
                    else:
                        new = set(range(uc_new[1], uc_new[1] + uc_new[2]))
                        if new.intersection(ha[uc_new[0]]) != set():
                            consegue = 0
                        else:
                            ha[uc_new[0]] = ha[uc_new[0]].add(new)
                            n_horas += uc_new[2]
                else:
                    consegue = 0

        if(consegue==1):
            conseguem.append((aluno, n_horas))


    return sorted(sorted(conseguem, key=lambda x: x[0]), key=lambda x: x[1], reverse=True)