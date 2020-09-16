#!/bin/bash

# example usage:
# ec-rs-fw-update firmware.bin

rs-fw-update -l | grep "serial number:" | awk  '{print $8}' | sed 's/,*$//g' > .ec_rs_fw_update

while read line; do
	echo rs-fw-update -s $line -f $1
	rs-fw-update -s $line -f $1
done < .ec_rs_fw_update

rm .ec_rs_fw_update
