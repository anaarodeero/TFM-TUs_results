#!/bin/bash

l1=en
l2=es

for dir in noise_heuristic_rules2 synthetic_noise2; do

	echo "Clasificacion de $dir"
	
	cd $dir

	bicleaner-classify --scol 1 --tcol 2 ../JW300.en-es JW300.en-es.classified en-es.yaml --disable_hardrules
	
	cd ..
	    
	echo "------------------------"
    
done
