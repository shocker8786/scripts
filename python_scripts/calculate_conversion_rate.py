import sys,math,argparse,subprocess

#Get input file from user
parser = argparse.ArgumentParser()
parser.add_argument('--methylation', help='BSseeker2 CGmap file')
parser.add_argument('--output', help='Prefix for output files including path')
args = parser.parse_args()
meth = args.methylation
output = args.output

command = 'grep MT '+meth+'|awk \'($8>=1)\' > '+output+'_MT.txt'
subprocess.run(command,shell=True)

command = 'ls '+output+'_MT.txt| while read filename ; do awk \'{sum+=$8} END { print sum}\' $filename ; done'
covered = subprocess.check_output(command,shell=True)

command = 'ls '+output+'_MT.txt| while read filename ; do awk \'{sum+=$7} END { print sum}\' $filename ; done'
unconverted = subprocess.check_output(command,shell=True)

conversion_rate = open(output+'_conversion_rate.txt','w')
rate = str((int(1)-(int(unconverted)/int(covered)))*100)+'%'
conversion_rate.write(rate)
conversion_rate.close()

