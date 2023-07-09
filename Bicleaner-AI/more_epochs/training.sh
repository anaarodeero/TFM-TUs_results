#!/bin/bash

l1=en
l2=es

echo Entrenamiento con 50 epocas

bicleaner-ai-train \
	--classifier_type xlmr \
	--batch_size 16 \
	--steps_per_epoch 3000 \
	--epochs 50 --patience 3 \
	-m . -s $l1 -t $l2 \
	-F ../../wordfreq-$l2.gz \
	--parallel_train ../train-m.$l1-$l2 \
	--parallel_valid ../dev-m.$l1-$l2 \
	--lm_file_sl model.$l1-$l2.$l1 \
	--lm_file_tl model.$l1-$l2.$l2
