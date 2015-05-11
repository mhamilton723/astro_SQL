from astropy.io import ascii
from astropy.table import Table
import numpy

import sys
input = sys.argv[1]
length = len(input)
output = input[0:length]+'_lepharew3w4'

data = ascii.read(input)
 
bands       = ['sdss_u','sdss_g','sdss_r','sdss_i','sdss_z','galex_nuv','galex_fuv','ukidss_y','ukidss_j','ukidss_h','ukidss_k','wise_w1','wise_w2','wise_w3','wise_w4']

num_bands = len(bands)

context = numpy.ones((len(data['z_spec']),1))*32767
context=context.astype(int)

data2=[
	data['sdss_dr8objid'],
	data[bands[0]+'_mag'],data[bands[0]+'_err'],
	data[bands[1]+'_mag'],data[bands[1]+'_err'],
	data[bands[2]+'_mag'],data[bands[2]+'_err'],
	data[bands[3]+'_mag'],data[bands[3]+'_err'],
	data[bands[4]+'_mag'],data[bands[4]+'_err'],
	data[bands[5]+'_mag'],data[bands[5]+'_err'],
	data[bands[6]+'_mag'],data[bands[6]+'_err'],
	data[bands[7]+'_mag'],data[bands[7]+'_err'],
	data[bands[8]+'_mag'],data[bands[8]+'_err'],
	data[bands[9]+'_mag'],data[bands[9]+'_err'],
	data[bands[10]+'_mag'],data[bands[10]+'_err'],
	data[bands[11]+'_mag'],data[bands[11]+'_err'],
	data[bands[12]+'_mag'],data[bands[12]+'_err'],
	data[bands[13]+'_mag'],data[bands[13]+'_err'],
	data[bands[14]+'_mag'],data[bands[14]+'_err'],
	context,
	data['z_spec']
	]
			

ascii.write(data2, output, format='tab')		 
	
