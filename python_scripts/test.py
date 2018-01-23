import sys,math,argparse,subprocess

#command = 'samtools faidx /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa 1:465499-465501'
#pattern = subprocess.check_output(command,shell=True).decode('utf-8')
#test = pattern.strip('>').split()
#print(test)
#print(pattern)

methylation = ['a', 'b', 'c', 'd', 'e']
sites = ['c','f','g','e','h']

for meth in methylation:
	for site in sites:
		if site == meth:
			methylation.remove(meth)

test = open('output.txt','w')
for item in methylation:
	print>>test, item
#file.close()
#print(*sites, sep='\t')
#class nonCpG_SeqLogo:

#	def __init__(self):
#		self.infile = sys.argv[1]
#		self.pos_outfile = open(sys.argv[2],"w")
#		self.neg_outfile = open(sys.argv[3],"w")

#	def read_CGmap(self):
#		CHGmap = open(self.infile,"r")
#		size = 3
#		for mCHG in CHGmap:
#			mCHG = mCHG.strip().split("\t")
#			if mCHG[1] == "C":
#				try:
#					command = 'samtools faidx /home/a-m/kschach2/porcine_assembly/Sus_scrofa.Sscrofa11.1.dna.toplevel.fa 1:465499-465501'
#					pattern = subprocess.check_output(command,shell=True)
#					self.pos_outfile.write(pattern.strip()+'\n')
#					print(pattern)

#parser = argparse.ArgumentParser()
#parser.add_argument('--snps', help='BS-SNPer SNP.out file')
#parser.add_argument('--methylation', help='BSseeker1 CGmap file')
#parser.add_argument('--genome', help='Reference genome fasta file')
#args = parser.parse_args()
#genome = args.genome
#with open(args.snps) as SNPs:
#	next(SNPs)
#	for line in SNPs:
#		line = line.split()
#		chromosome,site,strand,result = line[0],line[1],line[3],line[6]
#		if result == 'PASS':
#			true_snp = (chromosome,site,strand,result)
#			if strand == 'C':
#				print(true_snp[0])
#				try:
#					command = 'samtools faidx '+genome+' '+chromosome+':'+site+'-50000'
#					pattern = subprocess32.check_output(command,shell=True)
#					self.pos_outfile.write(pattern.strip()+'\n')
#					print(pattern)
#				except:
#					pass
#				except:
#					pass
#				else:
#					minus = (chromosome,site,strand,result)
#					print(minus)
				
#with open(args.methylation) as Meth:
#	for line in Meth:
#		line = line.split()
#		chromosome,site = line[0],line[1]
#		print(chromosome,site)
#for line in sys.stdin:
#	line = line.split()
#	chromosome,site = line[0],line[1]
#	print(chromosome,site)
#	distance,sequence = line[0],line[1]
#	if int(distance) < 0:
#		distance = math.fabs(int(distance))
#		section = ("N" * int(distance)) + sequence[0:15 - int(distance)]
#		final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10],section[11],section[12]
#		print "\t".join(final)
#	else:
#		section = sequence[int(distance):int(distance) + 15]
#		if len(section) < 1:
#			pass
#		elif len(section) < 2:
 #                       final = section[0]
#			print "\t".join(final)
#		elif len(section) < 3:
#			final = section[0],section[1]
#			print "\t".join(final)
#		elif len(section) < 4:
#			final = section[0],section[1],section[2]
#			print "\t".join(final)
#		elif len(section) < 5:
#			final = section[0],section[1],section[2],section[3]
#			print "\t".join(final)
#		elif len(section) < 6:
#			final = section[0],section[1],section[2],section[3],section[4]
#			print "\t".join(final)
#		elif len(section) < 7:
#			final = section[0],section[1],section[2],section[3],section[4],section[5]
#			print "\t".join(final)
#		elif len(section) < 8:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6]
#			print "\t".join(final)
#		elif len(section) < 9:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7]
#			print "\t".join(final)
#		elif len(section) < 10:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8]
#			print "\t".join(final)
#		elif len(section) < 11:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9]
#			print "\t".join(final)
#		elif len(section) < 12:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10]
#			print "\t".join(final)
#		elif len(section) < 13:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10],section[11]
#			print "\t".join(final)
#		else:
#			final = section[0],section[1],section[2],section[3],section[4],section[5],section[6],section[7],section[8],section[9],section[10],section[11],section[12]
#			print "\t".join(final)
