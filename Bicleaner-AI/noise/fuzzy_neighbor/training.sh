#!/bin/bash

bicleaner-ai-train \
	--classifier_type xlmr \
	--batch_size 16 \
	--steps_per_epoch 3000 \
	--seed 126 \
	--epochs 20 --patience 3 \
	--fuzzy_ratio 1 \
	--neighbour_mix True \
	-m . -s en -t es \
	-F ../wordfreq-es.gz \
	--parallel_train ../train-m.en-es \
	--parallel_valid ../dev-m.en-es \
	--lm_file_sl model.en-es.en \
	--lm_file_tl model.en-es.es
