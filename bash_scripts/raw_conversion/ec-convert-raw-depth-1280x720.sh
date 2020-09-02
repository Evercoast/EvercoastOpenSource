#!/bin/bash
parallel --eta convert -size 1280x720 -depth 16 y:{} {.}.png ::: *DEPTH*.raw
