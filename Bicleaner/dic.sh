#!/bin/bash

l1=en
l2=es

sed -E 's/"/\\"/g;s/\t/","/g;s/^/"/;s/$/"/' corpus_10M.$l1-$l2 > corpus.$l1-$l2.pdict.csv

sed -i "1s/^/$l1,$l2\n/" corpus.$l1-$l2.pdict.csv

gzip -k corpus.$l1-$l2.pdict.csv
