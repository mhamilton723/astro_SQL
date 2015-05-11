#!/bin/bash
type=("X_AGN" "AGN" "X_HY" "HY" "X_SF" "SF" "X_GAL" "GAL" "X_ALL" "ALL")
for i in 0 1 2 3 4 5 6 7 8 9
do 
type2=${type[i]}
done

python scripts/convert.py "data/GAL_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "GAL_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_GAL_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_GAL_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/AGN_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "AGN_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_AGN_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_AGN_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/HY_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "HY_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_HY_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_HY_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/SF_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "SF_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_SF_$$BASE$$.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_SF_$$BASE$$_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500
