import sys

type = "HY"   #SF_,AGN_,HY_

try:
	lines = [line.strip() for line in open('/home/mth39/auto_project/data/info.txt')]
	#print lines
	#with open('data/info.txt') as f:
	#	inputs=f.readlines()
	s_type=lines[0] 
	g_type=lines[1] 
	u_type=lines[2] 
	w_type=lines[3]  
except:

	print("COULD NOT FIND INFO FILE")
	s_type="fiber" #dev,model,cmodel,petro,fiber2,fiber
	g_type="calib" #calib,aper1,aper2,aper3,aper4,aper5,auto,iso
	u_type="aper" #aper,petro
	w_type="pro" #pro,aper,aper1,aper2,aper3,aper4,g,

try:
	type = sys.argv[1]
except:
	1

f = open('data/info.txt','w')
f.write(s_type+"\n"+g_type+"\n"+u_type+"\n"+w_type)

type=type+"_"
SDSS_IN					=	type+"sdss"
SDSS_OUT                =   type+"sdssfix"

GALEX			    	=	type+"galex"
UKIDSS		 			=	type+"ukidss"
WISE					=	type+"wise"

XRAY					= "all_xray_fix"

BASE 					 = "sdss_galex_ukidss_wise"
SDSS_GALEX_UKIDSS_WISE   =	type+BASE
#SDSS_GALEX_UKIDSS_WISE	   =	SDSS_GALEX_UKIDSS_WISE_2+"_2"
SDSS_GALEX_UKIDSS_WISE_X =	"X_"+SDSS_GALEX_UKIDSS_WISE
SDSS_GALEX_UKIDSS_WISE_NOX =	"NOX_"+SDSS_GALEX_UKIDSS_WISE
#SDSS_GALEX_UKIDSS_WISE_X   =	SDSS_GALEX_UKIDSS_WISE_X_2+"_2"

if type=="MW_" or type=="MWT_" or type=="S82_" or type=="S82T_":
	IN_PATH 				=	"queries/temp_MW/"
	OUT_PATH 				= 	"queries/out_MW/"
else:
	IN_PATH 				=	"queries/temp/"
	OUT_PATH 				= 	"queries/out/"
FILES					= 	["galex.sql","sdss.sql","sdss_1.sql","sdss_2.sql","ukidss_fix.sql","wise.sql","wise_fix.sql","sdss_galex_ukidss_wise.sql","xray.sql","no_x.sql","query.sh","query_2.sh","convert.sh","lephare_all.py","wise_ukidss.sh","curlUp.pl","base.txt"]

#make sure files in order sdss,galex,all 


for x in range(0,len(FILES)):
	with open(OUT_PATH+FILES[x], "wt") as fout:
		with open(IN_PATH+"temp_"+FILES[x], "rt") as fin:
			for line in fin:
				a=line.replace('$$SDSS_IN$$', SDSS_IN)
				a=a.replace('$$SDSS_OUT$$', SDSS_OUT)
				a=a.replace('$$GALEX$$', GALEX)
				a=a.replace('$$UKIDSS$$', UKIDSS)
				a=a.replace('$$WISE$$', WISE)
				a=a.replace('$$CSC$$', XRAY)
				a=a.replace('$$BASE$$', BASE)
				a=a.replace('$$SDSS_GALEX_UKIDSS_WISE$$', SDSS_GALEX_UKIDSS_WISE)
				a=a.replace('$$SDSS_GALEX_UKIDSS_WISE_X$$', SDSS_GALEX_UKIDSS_WISE_X)
				a=a.replace('$$SDSS_GALEX_UKIDSS_WISE_NOX$$', SDSS_GALEX_UKIDSS_WISE_NOX)
							
				a=a.replace('$$s_type$$', s_type)
				a=a.replace('$$g_type$$', g_type)
				a=a.replace('$$u_type$$', u_type)
				a=a.replace('$$w_type$$', w_type)
				
				a=a.replace('$$FILEPATH$$', OUT_PATH)
				a=a.replace('$$F0$$', FILES[0])
				a=a.replace('$$F1$$', FILES[1])
				a=a.replace('$$F2$$', FILES[2])
				a=a.replace('$$F3$$', FILES[3])
				a=a.replace('$$F4$$', FILES[4])
				a=a.replace('$$F5$$', FILES[5])
				a=a.replace('$$F6$$', FILES[6])
				a=a.replace('$$F7$$', FILES[7])
				a=a.replace('$$F8$$', FILES[8])
				a=a.replace('$$F9$$', FILES[9])
				
				fout.write(a)					
print(type+" replace complete")
