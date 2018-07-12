import sys,argparse,subprocess,numpy

#Produces single file containing methylation levels for all shared sites

#Get input files from user
parser = argparse.ArgumentParser()
parser.add_argument('--methylation', nargs='*', help='input methylation files including path')
parser.add_argument('--output', help='Prefix for output shared methylation file including path')
args = parser.parse_args()

temp = []
shared = []
final_result = []
test = []

#Identify sites in files and shared array
def intersection(lst1, lst2):
    lst3 = [value for value in lst1 if value in lst2]
    return lst3

#Pull methylation sites from first file
with open(args.methylation[0]) as input:
    for line in input:
        line = line.split()
        shared.append(line[0])

#Identify shared sites across all files
for file in args.methylation:
    with open(file) as input:
        temp = []
        for line in input:
            line = line.split()
            temp.append(line[0])
        shared = intersection(shared, temp)

#Produce matrix of methylation levels across all shared sites for input files
for file in args.methylation:
    if final_result == []:
        result = []
        result.append('Site')
        name = file.replace('.txt', '')
        result.append(name)
        final_result.append(result)
        with open(file) as input:
            for line in input:
                line = line.split()
                for site in shared:
                    if line[0] == site:
                        result = []
                        result.append(line[0])
                        result.append(line[4])
                        final_result.append(result)
                    else:
                        pass
    else:
        name = file.replace('.txt', '')
        final_result[0].append(name)
        with open(file) as input:
            for line in input:
                line = line.split()
                for siteno, site in enumerate(shared, start=1):
                    if line[0] == site:
                        final_result[siteno].append(line[4])
                    else:
                        pass



#Print methylation matrix to output file
methylation_results = open(args.output+'_shared_sites.txt', 'w')
for item in final_result:
    item = '\t'.join(item)
    methylation_results.write(item+'\n')
methylation_results.close()