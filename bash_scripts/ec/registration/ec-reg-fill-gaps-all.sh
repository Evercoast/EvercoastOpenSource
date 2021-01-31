#!/bin/bash

# example usage:
# ec-reg-fill-gaps-all 1 100 ~/.../BLANK_FRAMES ec-reg-fill-gaps.sh

# 1                  = start frame
# 100                = end frame
# ec-reg-fill-gaps.sh = path to script
# ~/.../BLANK_FRAMES = path to blank frames

rm -f .ec_reg_fill_gaps_all

ssls | grep "DEPTH" | awk '{print substr($1,3); }' | sed 's/-.*//g' > .ec_reg_fill_gaps_all

while read line; do
	echo $4 $1 $2 $line $3
	$4 $1 $2 $line $3
done < .ec_reg_fill_gaps_all

rm -f .ec_reg_fill_gaps_all
