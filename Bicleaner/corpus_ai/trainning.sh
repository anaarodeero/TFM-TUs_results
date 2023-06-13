#!/bin/bash

l1=en
l2=es

bicleaner-train corpus_100k_train.$l1-$l2 \
    --normalize_by_length \
    -s $l1 -t $l2 \
    -d dict-$l1.gz -D dict-$l2.gz \
    -b 1000 -c $l1-$l2.classifier \
    -f wordfreq-$l1.gz -F wordfreq-$l2.gz \
    -m $l1-$l2.yaml \
    --lm_file_sl model.$l1-$l2.$l1 --lm_file_tl model.$l1-$l2.$l2
