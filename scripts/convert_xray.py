from astropy.io import ascii
from astropy.table import Table
import numpy

import sys
input = sys.argv[1]
length = len(input)

try:
	data = ascii.read(input,fill_values=[("", "-99"),("null","-99"),("--","-99"),("999999","-99")])
	output = input[0:(length-4)]+'_AB_ext'
	print "Convert_xray.py did not need to append .csv to "+input
except:
	data = ascii.read(input+'.csv',fill_values=[("", "-99"),("null","-99"),("--","-99")])
	output = input[0:(length)]+'_AB_ext'
	print "Convert_xray.py needed to append .csv to "+input

bands       = ['sdss_u','sdss_g','sdss_r','sdss_i','sdss_z','galex_nuv','galex_fuv','ukidss_y','ukidss_j','ukidss_h','ukidss_k','wise_w1','wise_w2','wise_w3','wise_w4']
wavelengths = [3.56E+03,4.70E+03,6.18E+03,7.49E+03,8.95E+03,2.30E+03,   1.54E+03,   1.03E+04,  1.25E+04,  1.64E+04,  2.21E+04,  3.37E+04, 4.62E+04,  1.21E+05,2.22E+05 ]  
ABoffset    = [-0.04,   0,       0,       0,        .02,    0,          0 ,         0.610,     0.912,     1.348,     1.868,     2.661,    3.301,     5.135,   6.610    ]           
R			= [4.39,    3.30,    2.31,    1.71,    1.29,    7.24,       4.89,       1.211,      .889,      .578,      .360,         .18,      .16,      0,        0    ]
limit 		= [-99,   -99,     -99,    -99,    -99,    20.5,      20.5,        21.11,    20.912,    20.184,     20.268,    19.569,    19.2719,  16.7417,   14.6526]  
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
			
			#ASSUMED TAKEN OUT OF THE ANALYSIS AS OF 12/28			
			#if snr<5:
			#	data[wise_bands[j]+'_mag'][i] = fill
			#	data[wise_bands[j]+'_err'][i] = fill
			
			#if error>.5:
			#	for k in range(0,len(wise_bands)):
			#		data[wise_bands[k]+'_mag'][i] = fill
			#		data[wise_bands[k]+'_err'][i] = fill
			
		except:
			1

data3=Table(data,copy=True)
for j in range(0,num_bands):
	data[bands[j]+'_mag'].mask=False
	data[bands[j]+'_err'].mask=False
	for i in range(0,num_data):
		mag = data[bands[j]+'_mag'][i]
		if data['SDSS_REJ'][i]=='yes':
			for k in range(0,5):
				data[bands[k]+'_mag'][i]=fill
				data[bands[k]+'_err'][i]=fill
				
		if data[bands[j]+'_mag'][i] < -90:
			#data[bands[j]+'_mag'][i]=limit[j]
			#data[bands[j]+'_err'][i]=err_fill		
			data[bands[j]+'_mag'][i]=fill
			data[bands[j]+'_err'][i]=fill	
		else:	
			eBV=data['extinction_u'][i]/5.155
			data[bands[j]+'_mag'][i] = mag + ABoffset[j] + eBV*R[j] 

data3=Table(data,copy=True)
count3=0
for i in range(0,num_data):
	missing=0
	for j in range(0,num_bands):
		if data[bands[j]+'_mag'][i] < -90:
			missing=missing+1
	if missing>0:
		data3.remove_row(count3)
	else:
		count3=count3+1
		
		
extnvnox=Table(data,copy=True)
extnvx=Table(data,copy=True)
qsov=Table(data,copy=True)
count=[0,0,0]
#print len(data)
for i in range(0,len(data)):
	#print i,data['class'][i],len(data)
	if data['class'][i]=='GALAXY' or data['class'][i]=='NELG':
		if data['SOFT_FLUX'][i]>8*10^(-15):
			extnvnox.remove_row(count[0])
			qsov.remove_row(count[2])
			count[1]=count[1]+1
		else:
			extnvx.remove_row(count[1])
			qsov.remove_row(count[2])
			count[0]=count[0]+1
	else:
		extnvnox.remove_row(count[0])
		extnvx.remove_row(count[1])
		count[2]=count[2]+1
		
ascii.write(data.filled(), output, format='tab')	
ascii.write(extnvnox.filled(), output+'_extnvnox', format='tab')	
ascii.write(extnvx.filled(), output+'_extnvx', format='tab')	
ascii.write(qsov.filled(), output+'_qsov', format='tab')	
ascii.write(data3.filled(), output+'_allbands', format='tab')	 
	
