import sys,math,fileinput

filtered = []

with fileinput.input() as data:
    filtered.append(data[0].split())
#    next(data)
    for line in data:
        line = line.split()
        numbers = [float(x) for x in line[1:]]
        if sum(numbers) > 0:
            filtered.append(line)
        else:
            pass

for line in filtered:
    print(*line, sep='\t')