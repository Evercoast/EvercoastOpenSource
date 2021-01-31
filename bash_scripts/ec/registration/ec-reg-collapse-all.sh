#!/bin/bash

# example usage:
# ec-reg-collapse-all 1 100 ec-reg-collapse.sh

# 1                   = start frame
# 100                 = end frame
# ec-reg-collapse.sh  = path to script

rm -f .ec_reg_collapse_all

ssls | grep "DEPTH" | awk '{print substr($1,3); }' | sed 's/-.*//g' > .ec_reg_collapse_all

while read line; do
	echo $3 $1 $2 $line
	$3 $1 $2 $line
done < .ec_reg_collapse_all

rm -f .ec_reg_collapse_all
