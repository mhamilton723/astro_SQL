#!/bin/bash
filepath="queries/out/"
filenames=("sdss.sql"         "galex.sql"  "ukidss_fix.sql"          "wise.sql"   "wise_fix.sql"       "sdss_galex_ukidss_wise.sql"                      "xray.sql"                     "no_x.sql")
tables=(   "AGN_sdssfix" "AGN_galex" "AGN_ukidss_fix" "AGN_wise" "AGN_wise_fix" "AGN_sdss_galex_ukidss_wise" "X_AGN_sdss_galex_ukidss_wise" "NOX_AGN_sdss_galex_ukidss_wise")
source=(    "DR10"          "GalexGR6"    "myDB"            "dr10"      "myDB"             "myDB"                    "myDB"                        "myDB")

for i in 5 6 
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]}
done

for i in 5 6 
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath${filenames[i]}
done 

casjobs extract -b AGN_sdss_galex_ukidss_wise -F -type csv -d
find -iname "AGN_sdss_galex_ukidss_wise_mhamilton*.csv" -exec mv {} data  \;
FINAL_OUT_FN=$(find data -maxdepth 1 -name "AGN_sdss_galex_ukidss_wise_mhamilton*.csv")
rm "data/AGN_sdss_galex_ukidss_wise.csv"
mv $FINAL_OUT_FN "data/AGN_sdss_galex_ukidss_wise.csv"

casjobs extract -b X_AGN_sdss_galex_ukidss_wise -F -type csv -d
find -iname "X_AGN_sdss_galex_ukidss_wise_mhamilton*.csv" -exec mv {} data  \;
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_AGN_sdss_galex_ukidss_wise_mhamilton*.csv")
rm "data/X_AGN_sdss_galex_ukidss_wise.csv"
mv $FINAL_OUT_FN "data/X_AGN_sdss_galex_ukidss_wise.csv"


