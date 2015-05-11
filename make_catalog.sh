#!/bin/bash


cd ~/auto_project
echo "makecatalog types beginning:"
cat data/info.txt


echo "1"
python scripts/replace.py MW 
source queries/out_MW/query_2.sh;
python scripts/replace.py MWT 
source queries/out_MW/query_2.sh;
python scripts/replace.py S82 
source queries/out_MW/query_2.sh;
python scripts/replace.py S82T 
source queries/out_MW/query_2.sh;

echo "5"
#python scripts/replace.py GAL 
#source queries/out/query_2.sh;
#python scripts/replace.py AGN 
#source queries/out/query_2.sh;
#python scripts/replace.py HY 
#source queries/out/query_2.sh;
#python scripts/replace.py SF 
#source queries/out/query_2.sh;
echo "catalog queries complete!"

echo "makecatalog types end:"
cat data/info.txt

source run_convert.sh


