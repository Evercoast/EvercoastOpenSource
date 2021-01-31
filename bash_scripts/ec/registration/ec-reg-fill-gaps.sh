#!/bin/bash

# example usage:
# ec-reg-fill-gaps 1 100 030422250448 ~/.../BLANK_FRAMES

# 1                  = start frame
# 100                = end frame
# 030422250448       = device serial #
# ~/.../BLANK_FRAMES = path to blank frames

rm -f .ec_reg_fill_gaps

for i in $(seq $1 1 $2); do
	depth_frame=$3-DEPTH.`printf %07d $i`.raw
	if [ ! -f $depth_frame ]; then
		echo cp $4/depth-blank.raw ./$depth_frame
		cp $4/depth-blank.raw ./$depth_frame
	fi
	infrared_frame=$3-INFRARED.`printf %07d $i`.raw
	if [ ! -f $infrared_frame ]; then
		echo cp $4/infrared-blank.raw ./$infrared_frame
		cp $4/infrared-blank.raw ./$infrared_frame
	fi
done

parallel --eta < .ec_reg_fill_gaps

rm -f .ec_reg_fill_gaps
