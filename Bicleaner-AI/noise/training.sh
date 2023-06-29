#!/bin/bash

l1=en
l2=es

for dir in noise_heuristic_rules synthetic_noise; do

	echo "Entrenamiento de $dir"
	
	cd $dir
	
	bicleaner-ai-train \
		--classifier_type xlmr \
		--batch_size 16 \
		--steps_per_epoch 3000 \
		--epochs 15 --patience 3 \
		--noisy_examples_file_sl mono_noise.$l1 \
	    	--noisy_examples_file_tl mono_noise.$l2 \
		-m . -s $l1 -t $l2 \
		-F ../../../wordfreq-$l2.gz \
		--parallel_train ../../train-m.$l1-$l2 \
		--parallel_valid ../../dev-m.$l1-$l2 \
		--lm_file_sl model.$l1-$l2.$l1 \
		--lm_file_tl model.$l1-$l2.$l2
	    
	cd ..
	    
	echo "------------------------"
    
done
