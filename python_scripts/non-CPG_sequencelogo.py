## Martijn Derks
## Read CGmap and make sequencelogo from non-CPG methylation
import sys
import subprocess32

class nonCpG_SeqLogo:

	def __init__(self):
		self.infile = sys.argv[1]
		self.pos_outfile = open(sys.argv[2],"w")
		self.neg_outfile = open(sys.argv[3],"w")		

	def read_CGmap(self):
		CHGmap = open(self.infile,"r")
		size = 3
		for mCHG in CHGmap:
			mCHG = mCHG.strip().split("\t")
			if mCHG[1] == "C":
				try:
					command = "samtools faidx /lustre/nobackup/WUR/ABGC/schac001/RRBS/kyle_results/PigWUR/CGmaps/reference.fa "+mCHG[0]+"_sus_scrofa:"+str(int(mCHG[2])-size)+"-"+str(int(mCHG[2])+(int(size))+2)
					pattern = subprocess32.check_output(command,shell=True)
					self.pos_outfile.write(pattern.strip()+"\n")
				except:
					pass
			else:
				try:
					command = "samtools faidx /lustre/nobackup/WUR/ABGC/schac001/RRBS/kyle_results/PigWUR/CGmaps/reference.fa "+mCHG[0]+"_sus_scrofa:"+str(int(mCHG[2])-2-size)+"-"+str(int(mCHG[2])+(int(size)))
					pattern = subprocess32.check_output(command,shell=True)
                	                #self.neg_outfile.write(pattern.strip())
					Sseq = pattern.strip().split("\n")
					Seq = Sseq[1]
					Name = Sseq[0]
					self.neg_outfile.write(Name+"\n"+self.ReverseComplement1(Seq)+"\n")
				except:
					pass

	def ReverseComplement1(self, seq):
    		seq_dict = {'A':'T','T':'A','G':'C','C':'G'}
    		return "".join([seq_dict[base] for base in reversed(seq)])

N=nonCpG_SeqLogo()
N.read_CGmap()
