#!/bin/bash
type=("X_AGN" "AGN" "X_HY" "HY" "X_SF" "SF" "X_GAL" "GAL" "X_ALL" "ALL")
for i in 0 1 2 3 4 5 6 7 8 9
do 
type2=${type[i]}
done

python scripts/convert.py "data/GAL_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "GAL_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_GAL_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_GAL_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/AGN_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "AGN_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_AGN_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_AGN_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/HY_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "HY_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_HY_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_HY_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/SF_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "SF_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500

python scripts/convert.py "data/X_SF_sdss_galex_ukidss_wise.csv"
FINAL_OUT_FN=$(find data -maxdepth 1 -name "X_SF_sdss_galex_ukidss_wise_AB_ext")
python scripts/lephare.py $FINAL_OUT_FN
python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500
