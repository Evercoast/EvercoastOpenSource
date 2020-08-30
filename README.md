# Evercoast Open Source

Helpful open source scripts and code samples that make consuming Evercoast's volumetric content easier.

# RAW Conversion

## Prerequisites:

**GNU Parallel:**

`sudo apt install parallel`

To silence the citation banner:

`parallel --bibtex will cite`

## Batch file conversion from .RAW to .PNG:

**Scripts:**

`ec-convert-raw-color-1280x720.sh`

`ec-convert-raw-depth-1280x720.sh`

**Purpose:**

Convert images in a take folder to .PNG for viewing.

**Usage:**

Each script will process all of the files in the current directory. To isolate the a hero camera, or a subset of the camera's you're intereseted, in make a folder off of your take directory and copy them into it, e.g. (where `############` is the 12-digit device serial number):

`cd mytake.0010.hero.take.001`

`mkdir HERO_030422250448`
`mkdir HERO_############`

`cp ############-*.raw HERO_############`

`cd HERO_############`

`ec-convert-raw-color-1280x720.sh`

**Note:**

Depending on your GIT client, you may need to `chmod +x` the above scripts.

## Viewing images

We recommend DJV as a free to use review tool, which is provided under a BSD-style license.

Download DJV [HERE](https://darbyjohnston.github.io/DJV/download.html).
