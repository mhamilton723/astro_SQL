from astropy.io import ascii
from astropy.table import Table
import numpy
import sys


input = sys.argv[1]
length = len(input)
output = input[0:(length-4)]+"_ipac.tbl"

data = ascii.read(input,delimiter=",")
try:
	data2 = Table([data['sdss_dr8objid'],data['RA'],data['DEC']],names=['sdss_dr8objid','ra','dec'])
except:
	data2 = Table([data['sdss_dr8objID'],data['RA'],data['DEC']],names=['sdss_dr8objID','ra','dec'])

ascii.write(data2, output,format='ipac')		 
	
