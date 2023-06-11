#!/bin/bash

l1=en
l2=es

cut -f2 corpusAI-10M.$l1-$l2 \
    | sacremoses -l $l2 tokenize -x \
    | awk '{print tolower($0)}' \
    | tr ' ' '\n' \
    | LC_ALL=C sort | uniq -c \
    | LC_ALL=C sort -nr \
    | grep -v "[[:space:]]*1" \
    | gzip > wordfreq-$l2.gz
