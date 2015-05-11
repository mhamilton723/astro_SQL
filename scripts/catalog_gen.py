from astropy.io import ascii
from astropy.table import Table
import random
import numpy
import sys
import operator
	
cols   = ['s_type','g_type','u_type','w_type','trial_eta','test_eta','trial_sig','test_sig','state']
datatype=['S8','S8','S8','S8','S8','S8','S8','S8','S8']

s_type=['dev','model','cmodel','petro','fiber2','fiber']
g_type=['calib','aper1','aper2','aper3','aper4','aper5','auto','iso']
u_type=['aper','petro']
w_type=['pro','aper','aper1','aper2','aper3','aper4','g']
trial_eta=['0.']
test_eta=['0.']
trial_sig=['0.']
test_sig=['0.']
state=['0']

total_len=1
factors= [1] * len(cols)
marker=[0] * len(cols)


for i in range(0,len(cols)):
	exec('type_len = len('+cols[i]+')')
	total_len=total_len*type_len
	factors[i]=type_len
#print factors,total_len


def increment(marker,factors):
	length=reduce(operator.mul, factors, 1)
	sum=1
	for i in range(0,len(marker)):
		if marker[i]<factors[i]-1 and sum==1:
			marker[i]=marker[i]+1
			sum=0
		if marker[i]==factors[i]-1 and sum==1:
			marker[i]=0
	return marker			

t = Table(names=cols,dtype=datatype)
for h in range(0,total_len):
	content=['']*len(cols)
	for i in range(0,len(cols)):
		exec('new_content= '+cols[i]+'['+str(marker[i])+']')
		content[i]=new_content
	t.add_row(content)
	marker=increment(marker,factors)

t.write("table.dat",format='ascii.tab')
