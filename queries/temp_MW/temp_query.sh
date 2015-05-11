#!/bin/bash
filepath="$$FILEPATH$$"
filenames=("$$F0$$"      "$$F1$$"          "$$F2$$"          "$$F3$$"          "$$F4$$"          "$$F5$$"      "$$F6$$"          "$$F7$$"                     "$$F8$$"                       "$$F9$$" )
tables=(   "$$GALEX$$"   "$$SDSS_OUT$$"    "$$SDSS_OUT$$_1"  "$$SDSS_OUT$$_2"  "$$UKIDSS$$_fix"  "$$WISE$$"    "$$WISE$$_fix"    "$$SDSS_GALEX_UKIDSS_WISE$$" "$$SDSS_GALEX_UKIDSS_WISE_X$$" "$$SDSS_GALEX_UKIDSS_WISE_NOX$$")
source=(   "GalexGr6"    "DR10"            "DR10"            "DR10"            "myDB"            "dr10"        "myDB"            "myDB"                       "myDB"                         "myDB")

for i in 0 1 2 4 5 6 7 8
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]} #drop old tables
done


casjobs run -t ${source[0]} -n "Get Data" -f $filepath''${filenames[0]} #Get Galex Data

casjobs run -t ${source[1]} -n "Get $$SDSS_OUT$$ Data" -f $filepath''${filenames[1]} #get sdss data with thingid
casjobs run -t ${source[2]} -n "Get $$SDSS_OUT$$_1 Data" -f $filepath''${filenames[2]} #get sdss-galex date data
casjobs run -t ${source[3]} -n "Get $$SDSS_OUT$$_2 Data" -f $filepath''${filenames[3]} #update original sdss table

casjobs extract -b ${tables[1]} -F -type csv -d  #download sdss data

find -iname "$$SDSS_OUT$$_mhamilton*.csv" -exec mv {} data \; #find and move downloaded file
SDSS_OUT_FN=$(find data -name "$$SDSS_OUT$$_mhamilton*.csv") #find downloaded file
rm "data/$$SDSS_OUT$$.csv" #remove old file
mv $SDSS_OUT_FN "data/$$SDSS_OUT$$.csv" #rename downloaded file
python scripts/IPAC.py "data/$$SDSS_OUT$$.csv" #convert new file to IPAC
source queries/out_MW/wise_ukidss.sh #run ukidss/wise queries
read -p #pause

for i in 4 5 6 #get other files
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath''${filenames[i]}
done 

source $filepath"/query_2.sh"




