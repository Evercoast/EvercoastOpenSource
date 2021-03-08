#!/bin/bash

# example usage:
# ec-reg-fill-gaps-all 1 2 101 INFRARED ec-check-for-duplicates.sh

# 1                          = start frame
# 2                          = frame increment
# 101                        = end frame
# INFRARED                   = tag
# ec-check-for-duplicates.sh = path to script

rm -f .ec-check-for-duplicates-all

ssls | grep $4 | awk '{print substr($1,3); }' | sed 's/-.*//g' > .ec-check-for-duplicates-all

while read line; do

	prefix=$line
	prefix+="-"
	prefix+=$4

	echo $5 $1 $2 $3 $prefix
	$5 $1 $2 $3 $prefix

done < .ec-check-for-duplicates-all

# rm -f .ec-check-for-duplicates-all
