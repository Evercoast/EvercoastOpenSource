#!/bin/bash

# example usage:
# ec-reg-remove-partial-frames 1 100 03042225044 1843200 2764800

# 1            = start frame
# 100          = end frame
# 030422250448 = device serial #
# 1843200      = expected depth size
# 2764800      = expected infrared size

rm -f .ec_reg_remove_partial_frames

for i in $(seq $1 1 $2); do
	depth_frame=$3-DEPTH.`printf %07d $i`.raw
	if [ -f $depth_frame ]; then
	    depth_size=`wc -c $depth_frame | awk '{print $1}'`
		if [ "$depth_size" -ne "$4" ]; then
				echo $depth_frame $depth_size
				echo rm $depth_frame >> .ec_reg_remove_partial_frames
		fi
	fi
	infrared_frame=$3-INFRARED.`printf %07d $i`.raw
	if [ -f $infrared_frame ]; then
	    infrared_size=`wc -c $infrared_frame | awk '{print $1}'`
		if [ "$infrared_size" -ne "$5" ]; then
				echo $infrared_frame $infrared_size
				echo rm $infrared_frame >> .ec_reg_remove_partial_frames
		fi
	fi
done

parallel --eta < .ec_reg_remove_partial_frames

rm -f .ec_reg_remove_partial_frames
