import sys,re,os
bamOut = open(sys.argv[1],"w")
for lines in sys.stdin:
	if not lines.startswith("@PG"):
		lines = lines.split()
		readName = lines[0]
		newReadName = readName.replace("/2","").replace("/1","")
		lines[0] = newReadName
		newLine = "\t".join(lines)+"\n"
		bamOut.write(newLine)
	#print newLine 
	
		
