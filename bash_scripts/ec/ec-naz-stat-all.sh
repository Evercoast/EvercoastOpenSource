#!/bin/bash

# example usage:
# ec-naz-stat-all

ls -1 *.naz > .ec_naz_stat_all

while read line; do
	echo ec-naz-stat -n $line -m $1
	ec-naz-stat -n $line -m $1
done < .ec_naz_stat_all

rm .ec_naz_stat_all
