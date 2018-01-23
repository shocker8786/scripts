import sys,math
for line in sys.stdin:
	line = line.split()
	distance,sequence = line[0],line[1]
	if int(distance) < 0:
		distance = math.fabs(int(distance))
		section = ("N" * int(distance)) + sequence[0:15 - int(distance)]
		final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10],section[11],section[12]
		print "\t".join(final)
	else:
		section = sequence[int(distance):int(distance) + 15]
		if len(section) < 1:
			pass
		elif len(section) < 2:
                        final = section[0]
			print "\t".join(final)
		elif len(section) < 3:
			final = section[0],section[1]
			print "\t".join(final)
		elif len(section) < 4:
			final = section[0],section[1],section[2]
			print "\t".join(final)
		elif len(section) < 5:
			final = section[0],section[1],section[2],section[3]
			print "\t".join(final)
		elif len(section) < 6:
			final = section[0],section[1],section[2],section[3],section[4]
			print "\t".join(final)
		elif len(section) < 7:
			final = section[0],section[1],section[2],section[3],section[4],section[5]
			print "\t".join(final)
		elif len(section) < 8:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6]
			print "\t".join(final)
		elif len(section) < 9:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7]
			print "\t".join(final)
		elif len(section) < 10:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8]
			print "\t".join(final)
		elif len(section) < 11:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9]
			print "\t".join(final)
		elif len(section) < 12:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10]
			print "\t".join(final)
		elif len(section) < 13:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10],section[11]
			print "\t".join(final)
		else:
			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10],section[11],section[12]
			print "\t".join(final)
