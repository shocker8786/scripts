import sys,re,os
from subprocess import check_output
 
#Modify these variables based on genome name, desired length of RAD tag, and RE site.
str_genome = "Sus_scrofa"
int_len = 10
int_lenREsite = 4
###
 
try:
    li_tsv = [line.strip() for line in open(sys.argv[1])]  # Open target file, strip newline characters from lines, define as list.
except IndexError:  # Check if arguments were given
    sys.stdout.write("No arguments received. Please check your input:\n")
    sys.stdout.write("\t$ python.py input.tsv\n")
    sys.exit()
except IOError:  # Check if file is unabled to be opened.
    sys.stdout.write("Cannot open target file. Please check your input:\n")
    sys.stdout.write("\t$ python.py input.tsv\n")
    sys.exit()
 
lili_allContigs = []
li_contig = []
 
for i in range(len(li_tsv)):
    if li_tsv[i] == "---":
        lili_allContigs.append(li_contig)
        li_contig = []
    else:
        li_contig.append(li_tsv[i])
 
int_numREsites = 0
for i in range(len(lili_allContigs)):
    str_chr = (lili_allContigs[i][4].split(" "))[1]
    str_RE = (lili_allContigs[i][0].split(" "))[1]
    try:
        li_matches = ((lili_allContigs[i][2].split(" "))[1]).split(";")
    except IndexError:
        li_matches = []
    sys.stderr.write("On %s\n" % str_chr)
    for j in range(len(li_matches)):
        if j % 1000 == 0:
            sys.stderr.write("On site %s\n" % j)
        int_beg = int(li_matches[j]) + 1 - int_len
        if int_beg <= 1:
            int_beg = 1
        str_argGen = "-g" + str_genome
        str_argChr = "-c" + str_chr
        str_argBeg = "-b%s" % int_beg
        str_argLen = "-l%s" % (int_len + int_len + int_lenREsite)
        output = check_output(["get_genome_seq", str_argGen, str_argChr, str_argBeg, str_argLen])
        li_output = output.split("\n")
        str_seq = (li_output[1].split(" "))[1]
        str_IDChr = (li_output[4].split(" "))[1]
        #Get upstream of the RE site
        str_IDBegU = str(int_beg)
        str_IDEndU = str(int_beg + int_len + int_lenREsite)
        str_fastaID = ">" + str_IDChr + "_" + str_IDBegU + "_" + str_IDEndU + "_" + str_RE + "_U"
        sys.stdout.write(str_fastaID + "\n")
        sys.stdout.write(str_seq[0:int_len + int_lenREsite] + "\n")
        #Get downstream of the RE site
        str_IDBegD = str(int_beg + int_len)
        str_IDEndD = str(int_beg + int_len + int_len + int_lenREsite)
        str_fastaID = ">" + str_IDChr + "_" + str_IDBegD + "_" + str_IDEndD + "_" + str_RE + "_D"
        sys.stdout.write(str_fastaID + "\n")
        sys.stdout.write(str_seq[int_len:] + "\n")
        int_numREsites = int_numREsites + 1
sys.stderr.write("Number of restriction sites: %s\n" % int_numREsites)
