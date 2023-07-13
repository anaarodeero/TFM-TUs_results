#!/bin/bash

bicleaner-ai-train \
	--classifier_type xlmr \
	--batch_size 8 \
	--steps_per_epoch 3000 \
	--seed 124 \
	--epochs 40 --patience 3 \
	--pos_ratio 2 --rand_ratio 2 \
	--womit_ratio 2 --min_omit_words 2 \
	--freq_ratio 3 --min_freq_words 2 \
	-m . -s en -t es \
	-F ../wordfreq-es.gz \
	--parallel_train corpus-sorted.en-es \
	--parallel_valid dev.en-es \
	--lm_file_sl model.en-es.en \
	--lm_file_tl model.en-es.es
