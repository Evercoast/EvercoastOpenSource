#!/bin/bash
parallel --eta convert -size 1280x720 -depth 8 rgb:{} {.}.png ::: *COLOR*.raw
