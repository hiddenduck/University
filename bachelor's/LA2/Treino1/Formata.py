def formata(codigo):
    codigo_formatado = ""
    espacos = 0
    
    for c in codigo:
        if   codigo_formatado == "" or c != " " or codigo_formatado[-1] != " ":
            if c == "}":
                codigo_formatado = codigo_formatado[:-2]
                codigo_formatado += "}"
            else:
                codigo_formatado += c
        
        if c == ";" or c == "{" or c == "}":
            codigo_formatado += "\n"
            if c == "}":
                espacos -= 2
            elif c == "{":
                espacos += 2
            codigo_formatado += " " * espacos

    return codigo_formatado[:-1]