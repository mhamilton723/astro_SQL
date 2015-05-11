#!/bin/bash

cd ~/auto_project

python scripts/replace.py S82	
source queries/out_MW/query.sh;
python scripts/replace.py S82T	
source queries/out_MW/query.sh;
python scripts/replace.py MW	
source queries/out_MW/query.sh;
python scripts/replace.py MWT	
source queries/out_MW/query.sh;

#python scripts/replace.py GAL
#source queries/out/query.sh;
#python scripts/replace.py AGN
#source queries/out/query.sh;
#python scripts/replace.py HY
#source queries/out/query.sh;
#python scripts/replace.py SF
#source queries/out/query.sh;
#echo "queries complete!"

source make_catalog.sh
echo "catalogs made"

