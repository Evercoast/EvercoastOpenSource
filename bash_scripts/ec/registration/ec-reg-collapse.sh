#!/bin/bash

# example usage:
# ec-reg-collapse 1 100 030422250448

# 1             = start frame
# 100           = end frame
# 030422250448  = device serial #

mkdir -p collapse_result

rm -f .ec_reg_collapse

for i in $(seq $1 1 $2); do
	if [[ $(($i % 2)) -eq 1 ]]; then
		new_frame_number=$(( 1 + ($i - $1)/2 ))
		echo cp $3-DEPTH.`printf %07d $i`.raw collapse_result/$3-DEPTH.`printf %07d $new_frame_number`.raw >> .ec_reg_collapse
		echo cp $3-INFRARED.`printf %07d $i`.raw collapse_result/$3-INFRARED.`printf %07d $new_frame_number`.raw >> .ec_reg_collapse
	fi
done

parallel --eta < .ec_reg_collapse

rm -f .ec_reg_collapse
