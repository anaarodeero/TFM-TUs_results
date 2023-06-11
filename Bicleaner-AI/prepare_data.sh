#!/bin/bash

file="Europarl"
l1=en
l2=es

# 1: detokenize the data
sacremoses -l $l1 -j 4 detokenize < 0_$file.$l1 > 1_$file.$l1.detok
sacremoses -l $l2 -j 4 detokenize < 0_$file.$l2 > 1_$file.$l2.detok

# 2: combine both files into a single file
paste 1_$file.$l1.detok 1_$file.$l2.detok > 2_$file.$l1-$l2.detok

# 3: Bifixer
cat 2_$file.$l1-$l2.detok | parallel --pipe -j24 -q bifixer --scol 1 --tcol 2 --aggressive_dedup - - $l1 $l2 > 3_$file.$l1-$l2.bifixed

#4: Delete the duplicates identified by bixier
LANG=C sort -t $'\t' -k 4,3 -g -r 3_$file.$l1-$l2.bifixed | awk -F"\t" '{if(ACCUM[$3]==0){ACCUM[$3]++; print $1 "\t" $2}}' > 4_$file.$l1-$l2.fixed

#5: Default hardrules
bicleaner-hardrules 4_$file.$l1-$l2.fixed 5_$file.$l1-$l2.cleaned --annotated_output -s $l1 -t $l2 --scol 1 --tcol 2 --disable_minimal_length

# 6: Keep the sentences with the 1
awk -F'\t' '$3 > 0' < 5_$file.$l1-$l2.cleaned > 6_$file.$l1-$l2.filtered

# 7: Selection of the only needed columns
cut -f 1-2 6_$file.$l1-$l2.filtered > 7_$file.$l1-$l2.final
