from astropy.io import ascii
from astropy.table import Table
import numpy
import sys

try:
    input = sys.argv[1]
except:
    input = 'table.dat'

data = ascii.read(input)

i=0
while data[i][-1]!=0:
    i=i+1

f = open(sys.argv[2], 'w')
if i<len(data):
    for j in range(0,4):
        f.write(data[i][j]+'\n')
else:
    f.write('done')
