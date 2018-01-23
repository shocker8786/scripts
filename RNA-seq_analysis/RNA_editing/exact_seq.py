import sys,math
for line in sys.stdin:
	line = line.split()
	distance,sequence = line[0],line[1]
	if int(distance) < 0:
		distance = math.fabs(int(distance))
		section = ("N" * int(distance)) + sequence[0:15 - int(distance)]
		final = section[0],section[2],section[6],section[7],section[12]
		print "\t".join(final)
	else:
		section = sequence[int(distance):int(distance) + 15]
		if len(section) < 1:
			pass
		elif len(section) < 3:
			print section[0]
		elif len(section) < 7:
			final = section[0],section[2]
			print "\t".join(final)
		elif len(section) < 8:
			final = section[0],section[2],section[6]
			print "\t".join(final)
		elif len(section) < 13:
			final = section[0],section[2],section[6],section[7]
			print "\t".join(final)
		else:
			final = section[0],section[2],section[6],section[7],section[12]
			print "\t".join(final)
