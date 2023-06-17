#!/bin/bash

l1=en
l2=es

#for dir in svm nn nn1 adaboost random_forest extra_trees; do

	echo "Clasificacion de $dir"
	
	cd $dir

	bicleaner-classify --scol 1 --tcol 2 ../JW300.en-es JW300.en-es.classified en-es.yaml --disable_hardrules
	
	cd ..
	    
	echo "------------------------"
    
done
