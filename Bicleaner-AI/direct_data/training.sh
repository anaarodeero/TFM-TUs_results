#!/bin/bash

bicleaner-ai-train \
	--classifier_type xlmr \
	--batch_size 16 \
	--steps_per_epoch 3000 \
	--seed 123 \
	--epochs 15 --patience 4 \
	-m . -s en -t es \
	-F ../../wordfreq-es.gz \
	--parallel_train ../train.en-es \
	--parallel_valid ../dev.en-es \
	--lm_file_sl model.en-es.en \
	--lm_file_tl model.en-es.es
