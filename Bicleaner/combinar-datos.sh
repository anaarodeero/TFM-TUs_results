#!/bin/bash


shuf -n 4000000 7_OpenSubtitles.en-es.final >> corpus_p1.en-es
shuf -n 2000000 7_EUbookshop.en-es.final >> corpus_p2.en-es
shuf -n 2000000 7_DGT.en-es.final >> corpus_p3.en-es
shuf -n 2000000 7_TildeMODEL.en-es.final >> corpus_p4.en-es

cat corpus_p* >> corpus_10M.en-es
rm corpus_p*


shuf -n 100000 7_News-Commentary.en-es.final >> corpus_100k_train.en-es
