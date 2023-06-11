#!/bin/bash


for dir in direct_data my_data; do
	
	cd $dir

	echo "Classification $dir"

	bicleaner-ai-classify --scol 1 --tcol 2 ../JW300.en-es JW300.en-es.classified metadata.yaml --disable_hardrules
	
	echo "------------------------"

	cd ..
    
done
