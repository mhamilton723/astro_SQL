#!/bin/bash

filepath="queries/out/"
filenames=("sdss.sql"         "galex.sql"   "ukidss_fix.sql"          "wise.sql"     "wise_fix.sql"       "sdss_galex_ukidss_wise.sql"                      "xray.sql"                     "no_x.sql")
tables=("AGN_sdssfix"    "AGN_galex"  "AGN_ukidss_fix" "AGN_wise"  "AGN_wise_fix" "AGN_sdss_galex_ukidss_wise" "X_AGN_sdss_galex_ukidss_wise" "NOX_AGN_sdss_galex_ukidss_wise")
source=("DR10"            "GalexGR6"    "myDB"            "dr10"      "myDB"             "myDB"                    "myDB"                        "myDB")

for i in 0 1 2 3 4 5 6 
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]}
done

casjobs run -t ${source[0]} -n "Get AGN_sdssfix Data" -f $filepath''${filenames[0]}
casjobs extract -b ${tables[0]} -F -type csv -d

find -iname "AGN_sdssfix_mhamilton*.csv" -exec mv {} data \;
SDSS_OUT_FN=$(find data -name "AGN_sdssfix_mhamilton*.csv")
rm "data/AGN_sdssfix.csv"
mv $SDSS_OUT_FN "data/AGN_sdssfix.csv"
#python scripts/IPAC.py "data/AGN_sdssfix.csv"
#source queries/out/wise_ukidss.sh


for i in 1 2 3 4 
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath''${filenames[i]}
done 

source $filepath"/query_2.sh"

