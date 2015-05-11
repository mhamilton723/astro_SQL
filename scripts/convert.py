from astropy.io import ascii
from astropy.table import Table
import numpy

import sys
input = sys.argv[1]
length = len(input)
output = input[0:(length-4)]+'_AB_ext'

data = ascii.read(input,fill_values=[("", "-99"),("null","-99"),("--","-99")])

bands       = ['sdss_u','sdss_g','sdss_r','sdss_i','sdss_z','galex_nuv','galex_fuv','ukidss_y','ukidss_j','ukidss_h','ukidss_k','wise_w1','wise_w2','wise_w3','wise_w4']
wavelengths = [3.56E+03,4.70E+03,6.18E+03,7.49E+03,8.95E+03,2.30E+03,   1.54E+03,   1.03E+04,  1.25E+04,  1.64E+04,  2.21E+04,  3.37E+04, 4.62E+04,  1.21E+05,2.22E+05 ]  
ABoffset    = [-0.04,   0,       0,       0,        .02,    0,          0 ,         0.610,     0.912,     1.348,     1.868,     2.661,    3.301,     5.135,   6.610    ]           
R			= [4.39,    3.30,    2.31,    1.71,    1.29,    7.24,       4.89,       1.211,      .889,      .578,      .360,         .18,      .16,      0,        0    ]
limit 		= [-999,   -999,     -999,    -999,    -999,    20.5,      20.5,        21.11,    20.912,    20.184,     20.268,    19.569,    19.2719,  16.7417,   14.6526]  
fill=-99 
err_fill=-1

band_data = Table([bands, wavelengths,ABoffset,R], names=['bands', 'wavelengths','ABoffset','R'])
num_data = len(data)
num_bands = len(bands)
#data.fill_value=-999

wise_bands       = ['wise_w1','wise_w2','wise_w3','wise_w4']		
for i in range(0,num_data):
	for j in range(0,len(wise_bands)):
		try:
			snr = data[wise_bands[j]+'_snr'][i]
			error = (data['wise_sigra'][i]**2+data['wise_sigdec'][i]**2)**(.5)
			
			if snr<5:
				data[wise_bands[j]+'_mag'][i] = fill
				data[wise_bands[j]+'_err'][i] = fill
			
			if error>.5:
				for k in range(0,len(wise_bands)):
					data[wise_bands[k]+'_mag'][i] = fill
					data[wise_bands[k]+'_err'][i] = fill
			
		except:
			1


for j in range(0,num_bands):
	data[bands[j]+'_mag'].mask=False
	data[bands[j]+'_err'].mask=False
	for i in range(0,num_data):
		mag = data[bands[j]+'_mag'][i]
		if data[bands[j]+'_mag'][i] < -90:
			#data[bands[j]+'_mag'][i]=limit[j]
			#data[bands[j]+'_err'][i]=err_fill		
			data[bands[j]+'_mag'][i]=fill
			data[bands[j]+'_err'][i]=fill	
		else:	
			eBV=data['extinction_u'][i]/5.155
			data[bands[j]+'_mag'][i] = mag + ABoffset[j] + eBV*R[j] 
		
	
ascii.write(data.filled(), output, format='tab')		 
	
