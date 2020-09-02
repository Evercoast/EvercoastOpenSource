#!/bin/bash

# example usage:
# ec-parallel-montage.sh 1 2 100 ec-montage.sh 10x2 50

# 1             = start frame
# 2             = frame increment
# 100           = end frame
# ec-montage.sh = montage script to be executed
# 1x1           = montage mxn tiling
# 50            = result image scaling

for i in $(seq $1 $2 $3); do
	echo $4 $5 $6 $i contact.`printf %07d $i`.png >> .ec_montage
done

parallel --eta < .ec_montage

rm .ec_montage
