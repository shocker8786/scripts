import sys
for line in sys.stdin:
	line = line.split()
	if len(line) == 5:
		if line[0] == 'A' and line[1] == 'A':
			first = 'I'
		elif line[0] == 'A' and line[1] == 'G':
			first = 'M'
		elif line[0] == 'G':
			first = 'V'
		else:
			pass
		if line[2] == 'A' and line[3] == 'A':
			second = 'N'
		elif line[2] == 'A' and line[3] == 'G':
			second = 'S'
		elif line[2] == 'G' and line[3] == 'A':
			second = 'D'
		elif line[2] == 'G' and line[3] == 'G':
			second = 'G'
		else:
			pass
		if line[4] == 'A':
			third = 'I'
			final = first,second,third
			print "\t".join(final)
		elif line[4] == 'G':
			third = 'V'
			final = first,second,third
			print "\t".join(final)
		else:
			pass
	else:
		pass
