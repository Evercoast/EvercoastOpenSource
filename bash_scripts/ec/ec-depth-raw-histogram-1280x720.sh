#!/bin/bash
parallel --eta ec-depth-histogram -d DEPTH-1280-720 -m JET -i {} -o {.}.jpg ::: *RAW*.png
