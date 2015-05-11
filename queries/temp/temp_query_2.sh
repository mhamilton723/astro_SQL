#!/bin/bash
filepath="$$FILEPATH$$"
filenames=("$$F0$$"         "$$F1$$"  "$$F2$$"          "$$F3$$"   "$$F4$$"       "$$F5$$"                      "$$F6$$"                     "$$F7$$")
tables=(   "$$SDSS_OUT$$" "$$GALEX$$" "$$UKIDSS$$_fix" "$$WISE$$" "$$WISE$$_fix" "$$SDSS_GALEX_UKIDSS_WISE$$" "$$SDSS_GALEX_UKIDSS_WISE_X$$" "$$SDSS_GALEX_UKIDSS_WISE_NOX$$")
source=(    "DR10"          "GalexGR6"    "myDB"            "dr10"      "myDB"             "myDB"                    "myDB"                        "myDB")

for i in 5 6 
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]}
done

for i in 5 6 
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath${filenames[i]}
done 

casjobs extract -b $$SDSS_GALEX_UKIDSS_WISE$$ -F -type csv -d
find -iname "$$SDSS_GALEX_UKIDSS_WISE$$_mhamilton*.csv" -exec mv {} data  \;
FINAL_OUT_FN=$(find data -maxdepth 1 -name "$$SDSS_GALEX_UKIDSS_WISE$$_mhamilton*.csv")
rm "data/$$SDSS_GALEX_UKIDSS_WISE$$.csv"
mv $FINAL_OUT_FN "data/$$SDSS_GALEX_UKIDSS_WISE$$.csv"

casjobs extract -b $$SDSS_GALEX_UKIDSS_WISE_X$$ -F -type csv -d
find -iname "$$SDSS_GALEX_UKIDSS_WISE_X$$_mhamilton*.csv" -exec mv {} data  \;
FINAL_OUT_FN=$(find data -maxdepth 1 -name "$$SDSS_GALEX_UKIDSS_WISE_X$$_mhamilton*.csv")
rm "data/$$SDSS_GALEX_UKIDSS_WISE_X$$.csv"
mv $FINAL_OUT_FN "data/$$SDSS_GALEX_UKIDSS_WISE_X$$.csv"


