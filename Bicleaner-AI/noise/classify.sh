#!/bin/bash

l1=en
l2=es

for dir in noise_heuristic_rules synthetic_noise; do

	echo "Clasificacion de $dir"
	
	cd $dir
	
	bicleaner-ai-classify --scol 1 --tcol 2 ../../../JW300.en-es JW300.en-es.classified metadata.yaml --disable_hardrules
	    
	cd ..
	    
	echo "------------------------"
    
done
