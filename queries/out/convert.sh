#!/bin/bash

old_IFS=$IFS
IFS=$'\n'
lines=($(cat ~/auto_project/queries/out/base.txt)) # array
IFS=$old_IFS


type0=("MW" "MWT" "S82" "S82T" )
for i in "${type0[@]}"
do 
	echo "convert.sh: running: convert_xray.py on data/"$i"_"${lines[0]}
	python scripts/convert_xray.py "data/"$i"_"${lines[0]}

	#type1=("_extnvnox" "_extnvx" "_qsov" "" )
	type1=("_extnvx" "_qsov" "" )
	for j in "${type1[@]}"
	do 
		FINAL_OUT_FN=$(find data -maxdepth 1 -name $i"_"${lines[0]}"_AB_ext"$j)
		#echo $i"_"${lines[0]}"_AB_ext"$j
		python scripts/lephare.py $FINAL_OUT_FN
		#python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500
		echo "Processed "$i$j" Data"
	done
done

#type=("X_AGN" "AGN" "X_HY" "HY" "X_SF" "SF" "X_GAL" "GAL")
#for i in "${type[@]}"
#do 
#python scripts/convert.py "data/"$i"_"${lines[0]}".csv"
#FINAL_OUT_FN=$(find data -maxdepth 1 -name $i"_"${lines[0]}"_AB_ext")
#python scripts/lephare.py $FINAL_OUT_FN
#python scripts/subsample.py $FINAL_OUT_FN"_lephare" 2500
#echo "Processed "$i" Data"
#done
