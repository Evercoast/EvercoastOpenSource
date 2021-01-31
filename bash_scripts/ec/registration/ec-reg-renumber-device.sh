#!/bin/bash

# example usage:
# ec-reg-renumber-device 1 100 030422250448 030000000001 

# 1                  = start frame
# 100                = end frame
# 030422250448       = original device serial #
# 030000000001       = new device serial #

rm -f .ec_reg_renumber_device

for i in $(seq $1 1 $2); do
	depth_frame_in=$3-DEPTH.`printf %07d $i`.raw
	if [ -f $depth_frame_in ]; then
		depth_frame_out=$4-DEPTH.`printf %07d $i`.raw
		echo mv $depth_frame_in $depth_frame_out >> .ec_reg_renumber_device
	fi
	infrared_frame_in=$3-INFRARED.`printf %07d $i`.raw
	if [ -f $infrared_frame_in ]; then
		infrared_frame_out=$4-INFRARED.`printf %07d $i`.raw
		echo mv $infrared_frame_in $infrared_frame_out >> .ec_reg_renumber_device
	fi
done

parallel --eta < .ec_reg_renumber_device

rm -f .ec_reg_renumber_device
