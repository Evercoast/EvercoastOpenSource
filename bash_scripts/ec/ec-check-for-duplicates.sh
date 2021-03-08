#!/bin/bash

# example usage:
# ec-check-for-duplicates.sh 1 2 101 039222250214-INFRARED

# 1           = start frame
# 2           = frame increment
# 100         = end frame
# file prefix = e.g., 039222250214-INFRARED

for i in $(seq $1 $2 `expr $3 - $2`); do

	frame_number_current=$i
	filename_current=$4
	filename_current+="."
	filename_current+=`printf %07d $frame_number_current`
	filename_current+=".png"
	result_current=`identify -quiet -format \"%#\" $filename_current`

	#echo $filename_current
	#echo $result_current

	frame_number_next=`expr $frame_number_current + $2`
	filename_next=$4
	filename_next+="."
	filename_next+=`printf %07d $frame_number_next`
	filename_next+=".png"
	result_next=`identify -quiet -format \"%#\" $filename_next`

	#echo $filename_next
	#echo $result_next

	if [[ "$result_current" == "$result_next" ]]; then
		echo "iWarning: Frame ($filename_next) duplicates ($filename_current)."
	fi

done
