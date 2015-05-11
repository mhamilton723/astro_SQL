from astropy.io import ascii
from astropy.table import Table,vstack
import numpy

import sys
path=sys.argv[1]
base="$$BASE$$"+"_AB_ext_lephare"
try:
	prefix=sys.argv[2]
except:
	prefix=''
input = [path+prefix+'AGN_'+base, path+prefix+'HY_'+base ,path+prefix+'SF_'+base,path+prefix+'GAL_'+base]
length = len(input)
output = path+prefix+"ALL_"+base

data1 = ascii.read(input[0])
data2 = ascii.read(input[1])
data3 = ascii.read(input[2])
data4 = ascii.read(input[3])

data = vstack([data1,data2,data3,data4])
 
bands = ['sdss_u','sdss_g','sdss_r','sdss_i','sdss_z','galex_nuv','galex_fuv','ukidss_y','ukidss_j','ukidss_h','ukidss_k','wise_w1','wise_w2','wise_w3','wise_w4']

num_bands = len(bands)

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

