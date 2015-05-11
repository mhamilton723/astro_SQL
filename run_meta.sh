#!/bin/bash

for step in `seq 1 650`;do
    python ~/auto_project/scripts/info_update.py  ~/auto_project/scripts/table.dat ~/auto_project/data/info.txt
    cat ~/auto_project/data/info.txt

    make_catalog

    echo 'run_meta run number '
    echo $step
    echo '\n'
    cat ~/auto_project/data/info.txt
done
