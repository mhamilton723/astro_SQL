#!/bin/bash

cd ~/auto_project
echo 'run convert types beginning:'
cat data/info.txt
echo ""
python scripts/replace.py AGN
echo "replace AGN done"
source queries/out/convert.sh
echo "AB, ext, etc done"

#python queries/out/lephare_all.py "data/"  
#python queries/out/lephare_all.py "data/" "X_" 
#echo "stacking data done"

old_IFS=$IFS
IFS=$'\n'
lines=($(cat queries/out/base.txt)) # array
IFS=$old_IFS

#FINAL_OUT_FN=$(find data -maxdepth 1 -name "X*ALL*${lines[0]}_AB_ext_lephare")
#python scripts/subsample.py $FINAL_OUT_FN  10000
#FINAL_OUT_FN=$(find data -maxdepth 1 -name "ALL*${lines[0]}_AB_ext_lephare")
#python scripts/subsample.py $FINAL_OUT_FN  10000
#echo "subsampling done"

echo 'run convert types end:'
cat data/info.txt
echo ''


lephare_r
