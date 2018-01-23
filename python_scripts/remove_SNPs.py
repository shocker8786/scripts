import sys,math,argparse,subprocess

#Get input files from user
parser = argparse.ArgumentParser()
parser.add_argument('--snps', help='BS-SNPer SNP.out file')
parser.add_argument('--methylation', help='BSseeker1 CGmap file')
parser.add_argument('--genome', help='Reference genome fasta file')
parser.add_argument('--snp_output', help='Prefix for SNP output files including path')
parser.add_argument('--meth_output', help='Prefix for methylation output files including path')
args = parser.parse_args()
genome = args.genome
snp_output = args.snp_output
meth_output = args.meth_output

result = []
sites = []
meth_sites = []

#Reverse Complement Function
def ReverseComplement(seq):
    	seq_dict = {'A':'T','T':'A','G':'C','C':'G'}
    	return "".join([seq_dict[base] for base in reversed(seq)])

#Get list of SNP sites and Chromosomal Context
with open(args.snps) as SNPs:
	next(SNPs)
	for line in SNPs:
		line = line.split()
		if line[0] == 'SNP' and line[1] == 'finished':
			break
		elif line[6] == 'PASS' and line[3] == 'C':
			command = 'samtools faidx '+genome+' '+str(line[0])+':'+str(line[1])+'-'+str(int(line[1])+int(2))
			pattern = subprocess.check_output(command,shell=True).decode('utf-8') + line[3]
			result.append(pattern.strip('>').split())
		elif line[6] == 'PASS' and line[3] == 'G':
			command = 'samtools faidx '+genome+' '+str(line[0])+':'+str(int(line[1])-int(2))+'-'+str(line[1])
			pattern = subprocess.check_output(command,shell=True).decode('utf-8') + line[3]
			MinusSeq = pattern.strip('>').split()
			Seq = MinusSeq[1]
			Location = MinusSeq[0]
			FinalSeq = Location +'\t'+ ReverseComplement(Seq)+'\t' + MinusSeq[2]
			result.append(FinalSeq.split())
		elif line[6] == 'PASS' and line[3] != 'C' and line[3] != 'G':
			command = 'samtools faidx '+genome+' '+str(line[0])+':'+str(int(line[1])-int(2))+'-'+str(int(line[1])+int(2))
			pattern = subprocess.check_output(command,shell=True).decode('utf-8') + line[3]
			result.append(pattern.strip('>').split())
		else:
			pass

test = open(snp_output+'_snp_context.txt','w')
for item in result:
	temp = '\t'.join(item)+'\n'
	test.write(temp)
test.close()

#Identify CpG vs non_CpG SNPs
for line in result:
	if line[1].startswith("CG") and line[2] == 'C':
		chromosome = line[0].split(':')
		base = chromosome[1].split('-')
		FinalSite = chromosome[0]+':'+base[0]+'\n'
		NextBase = chromosome[0]+':'+str(int(base[0])+int(1))+'\n'
		sites.append(FinalSite)
		sites.append(NextBase)
	elif line[1].startswith("CG") and line[2] == 'G':
		chromosome = line[0].split(':')
		base = chromosome[1].split('-')
		FinalSite = chromosome[0]+':'+base[1]+'\n'
		NextBase = chromosome[0]+':'+str(int(base[1])-int(1))+'\n'
		sites.append(FinalSite)
		sites.append(NextBase)
	elif not line[1].startswith("CG") and line[2] == 'C':
		chromosome = line[0].split(':')
		base = chromosome[1].split('-')
		FinalSite = chromosome[0]+':'+base[0]+'\n'
		NextBase = chromosome[0]+':'+str(int(base[0])+int(1))+'\n'
		LastBase = chromosome[0]+':'+str(int(base[0])+int(2))+'\n'
		sites.append(FinalSite)
		sites.append(NextBase)
		sites.append(LastBase)
	elif not line[1].startswith("CG") and line[2] == 'G':
		chromosome = line[0].split(':')
		base = chromosome[1].split('-')
		FinalSite = chromosome[0]+':'+base[1]+'\n'
		NextBase = chromosome[0]+':'+str(int(base[1])-int(1))+'\n'
		LastBase = chromosome[0]+':'+str(int(base[1])-int(2))+'\n'
		sites.append(FinalSite)
		sites.append(NextBase)
		sites.append(LastBase)
	else:
		chromosome = line[0].split(':')
		base = chromosome[1].split('-')
		Site1 = chromosome[0]+':'+base[1]+'\n'
		Site2 = chromosome[0]+':'+str(int(base[0])+int(1))+'\n'
		Site3 = chromosome[0]+':'+str(int(base[0])+int(2))+'\n'
		Site4 = chromosome[0]+':'+str(int(base[0])+int(3))+'\n'
		Site5 = chromosome[0]+':'+str(int(base[0])+int(4))+'\n'
		sites.append(Site1)
		sites.append(Site2)
		sites.append(Site3)
		sites.append(Site4)
		sites.append(Site5)

#write chromosome:site file for SNP removal with grep	
snp_sites = open(snp_output+'_snp_sites.txt','w')
for item in sites:
	snp_sites.write(item)
snp_sites.close()


#Remove sites from Meth
with open(args.methylation) as methylation:
	for x in methylation:
		meth = x.split()
		if int(meth[7]) >= 10:
			FinalMeth = meth[0]+':'+meth[2]+'\t'+meth[1]+'\t'+meth[3]+'\t'+meth[4]+'\t'+meth[5]+'\t'+meth[6]+'\t'+meth[7]+'\n'
			meth_sites.append(FinalMeth)

methylation_sites = open(meth_output+'_meth_sites.txt','w')
for item in meth_sites:
	methylation_sites.write(item)
methylation_sites.close()

command = 'grep -Fwvf '+snp_output+'_snp_sites.txt '+meth_output+'_meth_sites.txt > '+meth_output+'_meth_snps_removed.txt'
subprocess.run(command,shell=True)

command = 'grep -Fwf '+snp_output+'_snp_sites.txt '+meth_output+'_meth_sites.txt > '+meth_output+'_sites_removed.txt'
subprocess.run(command,shell=True)
