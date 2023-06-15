#!/bin/bash

l1=en
l2=es

for dir in svm nn nn1 adaboost random_forest; do

	mkdir $dir

	echo "Entrenamiento de $dir"

	./bicleaner-master/src/bicleaner/bicleaner_train.py corpus_train_100k.$l1-$l2 \
	    --normalize_by_length \
	    --classifier_type $dir \
	    -s $l1 -t $l2 \
	    -d dict-$l1.gz -D dict-$l2.gz \
	    -b 1000 -c $dir/$l1-$l2.classifier \
	    -f wordfreq-$l1.gz -F wordfreq-$l2.gz \
	    -m $dir/$l1-$l2.yaml \
	    --lm_file_sl $dir/model.$l1-$l2.$l1 \
	    --lm_file_tl $dir/model.$l1-$l2.$l2
	    
	echo "------------------------"
    
done
