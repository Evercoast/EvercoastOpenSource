#!/bin/bash

# example usage:
# ec-reg-fill-gaps-all 1 100 ~/.../BLANK_FRAMES ec-reg-fill-gaps.sh
# ec-reg-remove-partial_frames_all.sh 1 100 1843200 2764800 ec-reg-remove-partial_frames.sh 
# 1                               = start frame
# 100                             = end frame
# 1843200                         = expected depth size
# 2764800                         = expected infrared size
# ec-reg-remove-partial_frames.sh = path to script

rm -f .ec_reg_remove_partial_frames_all

ssls | grep "DEPTH" | awk '{print substr($1,3); }' | sed 's/-.*//g' > .ec_reg_remove_partial_frames_all

while read line; do
	echo $5 $1 $2 $line $3 $4
	$5 $1 $2 $line $3 $4
done < .ec_reg_remove_partial_frames_all

rm -f .ec_reg_remove_partial_frames_all
