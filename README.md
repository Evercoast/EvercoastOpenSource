# Evercoast Open Source

Helpful open source scripts and code samples that make consuming Evercoast's volumetric content easier.

## Prerequisites:

**GNU Parallel:**

`sudo apt install parallel`

To silence the citation banner:

`parallel --bibtex will cite`

**Montage:**

`sudo apt-get install montage`

**Note:**

Depending on your GIT client, you may need to `chmod +x` the BASH scripts described herein.

## RAW Conversion

**Scripts:**

`ec-convert-raw-color-1280x720.sh`

`ec-convert-raw-color-1280x800.sh`

`ec-convert-raw-depth-1280x720.sh`

**Purpose:**

Convert images in a take folder to .PNG for viewing in parallel.

**Usage:**

Each script will process all of the files in the current directory. To isolate the a hero camera, or a subset of the camera's you're intereseted in, make a folder off of your take directory and copy them into it, e.g. (where `############` is the 12-digit device serial number):

`cd mytake.0010.hero.take.001/`

`mkdir HERO_############`

`cp ############-*.raw HERO_############/`

`cd HERO_############/`

`ec-convert-raw-color-1280x720.sh`


## Making Contact Sheets

**Scripts:**

`ec-parallel-montage.sh`

`ec-montage.sh`

**Purpose:**

Create a NxM contact sheets in parallel.

**Usage:**

First, Use the above RAW conversion scripts to convert RAW files to PNG.

`ec-parallel-montage.sh 1 2 100 ec-montage.sh 10x2 50`

Where:

`ec-parallel-montage` runs the `ec-montage.sh` script in parallel for frames `1` to `100` with an increment of `2`.

`ec-montage.sh` is a wrapper script around the `montage` command, where `10x2` is the desired tiling and `50` is the scaling applied to the final image.

**Example Output:**

![diagram](documentation/contact.0000327.png)

## Viewing Images

We recommend DJV as a free to use review tool, which is provided under a BSD-style license.

Download DJV [HERE](https://darbyjohnston.github.io/DJV/download.html).
