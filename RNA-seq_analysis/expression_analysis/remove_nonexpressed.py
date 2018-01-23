import sys

for line in sys.stdin:
	values = line.split("\t")
	if float(values[1]) == 0 and float(values[2]) == 0:
		pass
	else:
		sys.stdout.write(line)
