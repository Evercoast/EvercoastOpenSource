#!/bin/bash
parallel --eta convert {} rgb:{.}.raw ::: *COLOR-CC*.png
