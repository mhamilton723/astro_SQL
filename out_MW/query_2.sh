#!/bin/bash
filepath="queries/out_MW/"
filenames=("galex.sql"      "sdss.sql"          "sdss_1.sql"          "sdss_2.sql"          "ukidss_fix.sql"          "wise.sql"      "wise_fix.sql"          "sdss_galex_ukidss_wise.sql"                     "xray.sql"                       "no_x.sql" )
tables=(   "S82T_galex"   "S82T_sdssfix"    "S82T_sdssfix_1"  "S82T_sdssfix_2"  "S82T_ukidss_fix"  "S82T_wise"    "S82T_wise_fix"    "S82T_sdss_galex_ukidss_wise" "X_S82T_sdss_galex_ukidss_wise" "NOX_S82T_sdss_galex_ukidss_wise")
source=(   "GalexGr6"    "DR10"            "DR10"            "DR10"            "myDB"            "dr10"        "myDB"            "myDB"                       "myDB"                         "myDB")

for i in 7  
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]}
done

for i in  7  
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath${filenames[i]}
done 

casjobs extract -b S82T_sdss_galex_ukidss_wise -F -type csv -d
find -iname "S82T_sdss_galex_ukidss_wise_mhamilton*.csv" -exec mv {} data  \;
FINAL_OUT_FN=$(find data -maxdepth 1 -name "S82T_sdss_galex_ukidss_wise_mhamilton*.csv")
rm "data/S82T_sdss_galex_ukidss_wise.csv"
mv $FINAL_OUT_FN "data/S82T_sdss_galex_ukidss_wise.csv"

#casjobs extract -b X_S82T_sdss_galex_ukidss_wise -F -type csv -d
#find -iname "X_S82T_sdss_galex_ukidss_wise_mhamilton*.csv" -exec mv {} data  \;
#FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_S82T_sdss_galex_ukidss_wise_mhamilton*.csv")
#rm "data/X_S82T_sdss_galex_ukidss_wise.csv"
#mv $FINAL_OUT_FN "data/X_S82T_sdss_galex_ukidss_wise.csv"


