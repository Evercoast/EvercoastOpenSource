#!/bin/bash
montage -rotate 90 -tile $1 -geometry +0+0 -gravity center -resize $2% -background grey42 -label %t *00$3.png $4
