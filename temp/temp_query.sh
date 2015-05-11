#!/bin/bash

filepath="$$FILEPATH$$"
filenames=("$$F0$$"         "$$F1$$"   "$$F2$$"          "$$F3$$"     "$$F4$$"       "$$F5$$"                      "$$F6$$"                     "$$F7$$")
tables=("$$SDSS_OUT$$"    "$$GALEX$$"  "$$UKIDSS$$_fix" "$$WISE$$"  "$$WISE$$_fix" "$$SDSS_GALEX_UKIDSS_WISE$$" "$$SDSS_GALEX_UKIDSS_WISE_X$$" "$$SDSS_GALEX_UKIDSS_WISE_NOX$$")
source=("DR10"            "GalexGR6"    "myDB"            "dr10"      "myDB"             "myDB"                    "myDB"                        "myDB")

for i in 0 1 2 3 4 5 6 
do
casjobs execute -t "myDB" -n "drop query" "drop table "${tables[i]}
done

casjobs run -t ${source[0]} -n "Get $$SDSS_OUT$$ Data" -f $filepath''${filenames[0]}
casjobs extract -b ${tables[0]} -F -type csv -d

find -iname "$$SDSS_OUT$$_mhamilton*.csv" -exec mv {} data \;
SDSS_OUT_FN=$(find data -name "$$SDSS_OUT$$_mhamilton*.csv")
rm "data/$$SDSS_OUT$$.csv"
mv $SDSS_OUT_FN "data/$$SDSS_OUT$$.csv"
#python scripts/IPAC.py "data/$$SDSS_OUT$$.csv"
#source queries/out/wise_ukidss.sh


for i in 1 2 3 4 
do
casjobs run -t ${source[i]} -n "Get Data" -f $filepath''${filenames[i]}
done 

source $filepath"/query_2.sh"

