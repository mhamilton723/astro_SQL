from astropy.io import ascii
from astropy.table import Table
import random
import numpy

import sys
input = sys.argv[1]
target = sys.argv[2]

length = len(input)
output = input[0:length]+'_subsample'

raw_data = ascii.read(input)
 
bands       = ['sdss_u','sdss_g','sdss_r','sdss_i','sdss_z','galex_nuv','galex_fuv','ukidss_y','ukidss_j','ukidss_h','ukidss_k','wise_w1','wise_w2','wise_w3','wise_w4']

num_bands = len(bands)




dlength=len(raw_data)
prop=float(target)/float(dlength)
data=ascii.read(input,data_end=2)
for i in range(2,dlength):
	rand=random.random()
	if rand<prop:
			try:
				data.add_row(raw_data[i])
			except:
				print("ERROR")
				print(raw_data[i])


context = numpy.ones((len(data['z_spec']),1))*8191
context = context.astype(int)
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
	context,
	data['z_spec']
	]
			


	
#ascii.write(data2, output, format='tab')
data.rename_column('sdss_dr8objid', '#sdss_dr8objid')
ascii.write(data2, output, format='fixed_width', bookend=False,delimiter=None)

