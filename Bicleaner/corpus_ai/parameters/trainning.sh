#!/bin/bash

l1=en
l2=es

cd oovs

bicleaner-train ../corpus-train-100k.$l1-$l2 \
    --normalize_by_length \
    --relative_paths \
    --treat_oovs \
    -s $l1 -t $l2 \
    -d ../../dict-$l1.gz -D ../../dict-$l2.gz \
    -b 1000 -c $l1-$l2.classifier \
    -f ../../wordfreq-$l1.gz -F ../../wordfreq-$l2.gz \
    -m $l1-$l2.yaml \
    --lm_file_sl model.$l1-$l2.$l1 --lm_file_tl model.$l1-$l2.$l2
    
cd ..
cd feat-quest

bicleaner-train ../corpus-train-100k.$l1-$l2 \
    --normalize_by_length \
    --relative_paths \
    --disable_features_quest \
    -s $l1 -t $l2 \
    -d ../../dict-$l1.gz -D ../../dict-$l2.gz \
    -b 1000 -c $l1-$l2.classifier \
    -f ../../wordfreq-$l1.gz -F ../../wordfreq-$l2.gz \
    -m $l1-$l2.yaml \
    --lm_file_sl model.$l1-$l2.$l1 --lm_file_tl model.$l1-$l2.$l2
    
cd ..

cd qmax-limit-10

bicleaner-train ../corpus-train-100k.$l1-$l2 \
    --normalize_by_length \
    --relative_paths \
    --qmax_limit 10 \
    -s $l1 -t $l2 \
    -d ../../dict-$l1.gz -D ../../dict-$l2.gz \
    -b 1000 -c $l1-$l2.classifier \
    -f ../../wordfreq-$l1.gz -F ../../wordfreq-$l2.gz \
    -m $l1-$l2.yaml \
    --lm_file_sl model.$l1-$l2.$l1 --lm_file_tl model.$l1-$l2.$l2
    
cd ..

cd qmax-limit-40

bicleaner-train ../corpus-train-100k.$l1-$l2 \
    --normalize_by_length \
    --relative_paths \
    --qmax_limit 40 \
    -s $l1 -t $l2 \
    -d ../../dict-$l1.gz -D ../../dict-$l2.gz \
    -b 1000 -c $l1-$l2.classifier \
    -f ../../wordfreq-$l1.gz -F ../../wordfreq-$l2.gz \
    -m $l1-$l2.yaml \
    --lm_file_sl model.$l1-$l2.$l1 --lm_file_tl model.$l1-$l2.$l2
    
cd ..


