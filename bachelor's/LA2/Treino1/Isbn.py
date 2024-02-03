def isbn(livros):
    invalidos = []

    for livro in sorted(livros):
        invalido = 1
        if (len(livros[livro]) == 13):
            if sum(map(lambda x, y: x * y, map(int, livros[livro]), [1, 3] * 7))%10 == 0:
                invalido = 0

        if (invalido == 1):
            invalidos.append(livro)

    return invalidos