import sys
for line in sys.stdin:
	line = line.strip()
	if line[0:3] == 'HWI':
		line = '@' + line
		print line
	elif not line.strip():
		line = '+'
		print line
	else:
		print line
