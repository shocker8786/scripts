import sys,os,re,math

"""
=============test.txt=====================================================
Ssc9_MT 3       T       8       AAAAAAAA        HHHEHHBH        FFHHHHXE
Ssc9_MT 4       T       8       CCCCCCCC        HHHDHHFH        FFHHHHXE
Ssc9_MT 5       A       8       CCCCCCCC        HHHFHHFH        FFHHHHXE
Ssc9_MT 6       C       8       AAAAAAAA        HHHDHHFH        FFHHHHXE
Ssc9_MT 7       T       9       AAAAAAAAA     HHHEHHFHH       FFHHHHXEH
Ssc9_MT 7       T       17      AAAAAAAACCCCCCCC     HHHEHHFHHHHHDHHFH       FFHHHHXEHFFHHHHXE
=========================================================================

usages: cat test.txt|python consen.py .7 testconsus.fa
"""
Threshold = sys.argv[1]

consensusFile = open(sys.argv[2],"w")
consensusFile.write(">MTGenome\n")
for line in sys.stdin:
	listOfeffectiveCoverage = []
	line = line.split()
	chrN,pos,ref,depth,reads,baseQ,mapQ = line[0],line[1],line[2],line[3],line[4],line[5],line[6]
	#print len(line)
	reads = reads.strip()
	baseQ = baseQ.strip()
	mapQ = mapQ.strip()
	#listEffectiveCoverage = []
	nucleotides = ["A","T","G","C"]

	dictNucleotide = {}

	for i in xrange(int(depth)):

		effectiveCoverage = (1 - 10**(-(float(ord(baseQ[i]))/10.0)))*(1-10**(-(float(ord(mapQ[i]))/10.0)))
		#print reads[i]
		nucleotide = reads[i]

		if not dictNucleotide.has_key(nucleotide):

			dictNucleotide[nucleotide]=[effectiveCoverage]
		else:
			dictNucleotide[nucleotide].append(effectiveCoverage)
	#print dictNucleotide
	TotalEffectiveCoverage = 0.0

	for eachNucleotide in dictNucleotide.keys():

		if eachNucleotide in nucleotides:		

			TotalEffectiveCoverage += float(sum(dictNucleotide[nucleotide]))

	count = 0

	for eachKey in dictNucleotide.keys():
		proportionofefectiveCoverageForthenucleotide = float(sum(dictNucleotide[eachKey]))/TotalEffectiveCoverage

		if proportionofefectiveCoverageForthenucleotide >= float(Threshold):

			consensusFile.write(eachKey)
			count += 1
			break;
	if count == 0:

		consensusFile.write("N")
			
