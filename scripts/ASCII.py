from astropy.io import ascii
from astropy.table import Table
import numpy
import sys


input = sys.argv[1]
length = len(input)
output = input[0:(length-4)]+"_ascii"

data = ascii.read(input,delimiter=",")
ascii.write(data, output,format='basic')		 
	
