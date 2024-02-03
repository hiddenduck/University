def hacker(log):
    ha = {}
    for entry in log:
        if entry[1] not in ha:
            ha[entry[1]] = list(entry[0])
        else:
            for ind in range(len(entry[0])):
                if entry[0][ind] != '*':
                    (ha[entry[1]])[ind] = entry[0][ind]

    return sorted(sorted(map(lambda x: ("".join(ha[x]), x), ha), key=lambda x: x[1]), key=lambda x: ha[x[1]].count('*'))