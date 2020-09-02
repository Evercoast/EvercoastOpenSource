#!/bin/bash

# example usage:
# ec-parallel_montage.sh 194 1 406 ec-montage.sh 1x1 50

# 194 = start frame
# 1 = frame increment
# 486 = end frame
# ec-montage.sh = montage script to be executed
# 1x1 = montage tiling
# 50 = image scaling

for i in $(seq $1 $2 $3); do
	echo $4 $5 $6 $i contact.`printf %07d $i`.png >> .ec_montage
done

parallel --eta < .ec_montage

rm .ec_montage
