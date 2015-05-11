#!/bin/bash
filepath="queries/out_MW/"
filenames=("galex.sql"      "sdss.sql"          "sdss_1.sql"          "sdss_2.sql"          "ukidss_fix.sql"          "wise.sql"      "wise_fix.sql"          "sdss_galex_ukidss_wise.sql"                     "xray.sql"                       "no_x.sql" )
tables=(   "S82T_galex"   "S82T_sdssfix"    "S82T_sdssfix_1"  "S82T_sdssfix_2"  "S82T_ukidss_fix"  "S82T_wise"    "S82T_wise_fix"    "S82T_sdss_galex_ukidss_wise" "X_S82T_sdss_galex_ukidss_wise" "NOX_S82T_sdss_galex_ukidss_wise")
source=(   "GalexGr6"    "DR10"            "DR10"            "DR10"            "myDB"            "dr10"        "myDB"            "myDB"                       "myDB"                         "myDB")

for i in 0 1 2 4 5 6 7 8
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]} #drop old tables
done


casjobs run -t ${source[0]} -n "Get Data" -f $filepath''${filenames[0]} #Get Galex Data

casjobs run -t ${source[1]} -n "Get S82T_sdssfix Data" -f $filepath''${filenames[1]} #get sdss data with thingid
casjobs run -t ${source[2]} -n "Get S82T_sdssfix_1 Data" -f $filepath''${filenames[2]} #get sdss-galex date data
casjobs run -t ${source[3]} -n "Get S82T_sdssfix_2 Data" -f $filepath''${filenames[3]} #update original sdss table

casjobs extract -b ${tables[1]} -F -type csv -d  #download sdss data

find -iname "S82T_sdssfix_mhamilton*.csv" -exec mv {} data \; #find and move downloaded file
SDSS_OUT_FN=$(find data -name "S82T_sdssfix_mhamilton*.csv") #find downloaded file
rm "data/S82T_sdssfix.csv" #remove old file
mv $SDSS_OUT_FN "data/S82T_sdssfix.csv" #rename downloaded file
python scripts/IPAC.py "data/S82T_sdssfix.csv" #convert new file to IPAC
source queries/out_MW/wise_ukidss.sh #run ukidss/wise queries
read -p #pause

for i in 4 5 6 #get other files
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath''${filenames[i]}
done 

source $filepath"/query_2.sh"




