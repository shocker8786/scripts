import sys,math,argparse,subprocess

#Produces sorted bed file in DMRfinder format with adjacent CpG sites combined (i.e. collapsed strands)

#Get input files from user
parser = argparse.ArgumentParser()
parser.add_argument('--methylation', help='CpG input file including path')
parser.add_argument('--output', help='Output merged methylation file including path')
args = parser.parse_args()

combined = []
final_result = []
prevLine = ['none:0', 'none']
cord = ''
cord2 = ''

#Combine strands and save all combined and G sites in combined array
with open(args.methylation) as input:
    for line in input:
        line = line.split()
        if line[1] == 'C':
            prevLine = line
        elif line[1] == 'G':
                cord = str(prevLine[0]).split(':')
                cord2 = str(line[0]).split(':')
                if cord[0] == cord2[0] and int(cord[1]) == int(cord2[1])-1:
                    methreads = int(prevLine[5])+int(line[5])
                    coverage = int(prevLine[6])+int(line[6])
                    methpercent = round(methreads/coverage, 2)
                    newline = (cord[0]+':'+cord[1]+'\t'+prevLine[1]+'\t'+prevLine[2]+'\t'+prevLine[3]+'\t'+str(methpercent)+'\t'+str(methreads)+'\t'+str(coverage)).split()
                    combined.append(newline)
                    prevLine = ['none:0', 'none']
                else:
                    pass
                    combined.append(prevLine)
                    combined.append(line)
                    prevLine = ['none:0', 'none']
        else:
            pass

#write temp file containing combined and G sites
temp = open('temp', 'w')
for line in combined:
    if line[1] != 'none':
        temp.write(line[0]+'\n')
temp.close()

#Find uncombined C sites
command = 'grep -Fwvf temp '+args.methylation 
uncombined = subprocess.check_output(command,shell=True).decode('utf-8').split('\n')
uncombined = filter(None, uncombined)

#Add uncombined C sites to combined list
for line in uncombined:
    line = line.split('\t')
    if line[1] == 'C':
        combined.append(line)
    else:
        pass

#save combined list in bed (DMRfinder) format
for line in combined:
    if line[1] != 'none':
        separated = line[0].split(':')
        if line[1] == 'C':
            second = int(separated[1])+1
            unmethylated = int(line[6])-int(line[5])
            result = separated[0]+'\t'+separated[1]+'\t'+str(second)+'\t'+line[4]+'\t'+line[5]+'\t'+str(unmethylated)
            #result = result.split()
            final_result.append(result)
        elif line[1] == 'G':
            first = int(separated[1])-1
            unmethylated = int(line[6])-int(line[5])
            result = separated[0]+'\t'+str(first)+'\t'+separated[1]+'\t'+line[4]+'\t'+line[5]+'\t'+str(unmethylated)
            #result = result.split()
            final_result.append(result)

#Write temp file containing all sites in bed (DMRfinder) format
final = open('temp', 'w')
for line in final_result:
    final.write(line+'\n')
final.close()

#Sort temp bed file and output as user defined output file
command = 'bedtools sort -i temp > '+args.output
subprocess.run(command,shell=True)

#Cleanup
command = 'rm temp'
subprocess.run(command,shell=True)
