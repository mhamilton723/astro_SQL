from astropy.io import ascii
from astropy.table import Table
import numpy
import sys

input = sys.argv[1]
length = len(input)
output = input[0:(length-4)]+".csv"

data = ascii.read(input,format='ipac')
#data = ascii.read(input)
ascii.write(data,output,format='basic')	