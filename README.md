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

# RAW Conversion

## Scripts:

`ec-convert-raw-color-1280x720.sh` (D415)

`ec-convert-raw-color-1280x800.sh` (D455)

`ec-convert-raw-depth-1280x720.sh` (D415 | D455)

## Purpose:

Convert RAW images in a take folder to PNG for viewing in parallel.

## Usage:

Each script will process all of the files in the current directory. To isolate the a hero camera, or a subset of the camera's you're intereseted in, make a folder off of your take directory and copy them into it, e.g. (where `############` is the 12-digit device serial number):

`cd mytake.0010.hero.take.001/`

`mkdir HERO_############`

`cp ############-*.raw HERO_############/`

`cd HERO_############/`

`ec-convert-raw-color-1280x720.sh`


# Making Contact Sheets

## Scripts:

`ec-parallel-montage.sh`

`ec-montage.sh`

## Purpose:

Create MxN tiled contact sheets in parallel.

## Usage:

**First:**

Use the above RAW conversion scripts to convert RAW files to PNG.

**Next:**

`ec-parallel-montage.sh 1 2 100 ec-montage.sh 10x2 50`

**Where:**

`ec-parallel-montage.sh` runs the `ec-montage.sh` script in parallel for frames `1` to `100` with an increment of `2`.

`ec-montage.sh` is a wrapper script around the `montage` command, where `10x2` is the desired tiling and `50` is the scaling applied to the final image.

**Note:**

Depending on your where you've cloned `EvercoastOpenSource`, and whether that path is in your shell environment's $PATH variable, both `ec-parallel-montage.sh` and `ec-montage.sh` may need to prefaced by their concrete or relative paths, e.g.:

`~/EvercoastOpenSource/ec-parallel-montage.sh 1 2 100 ~/EvercoastOpenSource/ec-montage.sh 10x2 50`

**Watch Out For:**

If you receive contact sheets of the form `contact.0000235-0.png`, it indicates that your tiling leaves a remainder. Don't use tilings where `MxN < # of image sequences`. Should you have an odd number, e.g. `9` sequences, round up and use a tiling of `5x2`.

## Example Output:

![diagram](documentation/contact.0000327.png)

# Viewing Images

We recommend DJV as a free to use review tool, which is provided under a BSD-style license.

Download DJV [HERE](https://darbyjohnston.github.io/DJV/download.html).

# Unity

C# `Editor` and `Playback` scripts for OBJ sequences for playback in Unity.

## Types of Scripts:
**Editor Scripts:**

Editor scripts are used to control the import process for Evercoast assets. As Evercoast's OBJ, material, and texture assets are imported by Unity, these scripts will ensure that they're properly configured.

**Playback Scripts:**

A variety of playback controller scripts.

## Fundamentals:

**Time In Unity:**

Time in Unity is both plural (elapsed time, animation time, physics time, etc.) and non-linear. These times can scale internal to Unity to maintain frame-rate, accommodate complex physics, or other many factors.

Given that there is no unified singular concept of time, to maintain smooth playback while maintaining audio synchronization, we derive our volumetric playback frame based on the position of the read-head of the audio clip that's necessarily associated with each playback controller. Thus, we let Unity internally scale it's notion of time however it likes, and we simply lock onto the audio clip and stay in sync.

There are many ways to maintain synchronization. However, we have found this mechanism to be markedly the simplest and most reliable -- under all playback regimes, from real-time to using Unity Recorder as an offline renderer. So, as you consider the playback controller described herein, please understand maintaining audio-synchronization, for a long duration, under multiple playback mechanisms, as our primary design goal, and hence our reliance on an audio clip as the basis for playback strategy.

## Preparing RAW Frames For Adobe Premiere

Refer to the above `RAW Conversion` section and `Making Contact Sheets` process to create contact sheets for the hero camera, or a subset of cameras where the face is clearly visible.

In the end you'll have an image with the frame filenames, and hence the frame numbers, burned into the bottom of the image place, as so:

![diagram](documentation/contact.0000284.png)

## Synchronizing Audio In Adobe Premiere

**Note:**

If you have not recorded an audio track for your volumetric content, this process is still essential. Please substitute any audio track, e.g. your favorite song.

**Open The Image Sequence:**

In your project in Premiere select Open, then use the file browser to locate the first frame of the image sequence of the contact sheets. Please ensure that `Image Sequence` is pressed in the lower left of the file browser dialog before pressing OK.

**Adjust The Image Sequence's FPS:**

Right click on the image sequence and follow the `Modify Clip / Interpret Footage` menu. Set the FPS of the clip to the FPS used at record time in Mavericks.

![diagram](documentation/premiere_interpret_footage.png)

*Note: Modify Clip must be done before setting any markers, or syncing tracks.*

**Synchronize The Audio:**

Synchronize the audio track to the video track.

**Cut The Track:**

Use the `Cut Tool` to trim any excess frames from the beginning or end of the clip. This is your final `editorial` cut.

![diagram](documentation/premiere_cut.png)

**Export An Audio File:**

Export a WAV file. On the export dialog reset the timecode to `00:00:00`.


**Cutting The OBJ Sequence:**

The labels that are burned into the bottom of each contact sheet frame are 1:1 to the OBJ sequence files. From here trim your OBJ sequence to exactly what is used in your editorial from Premiere, either by deleting unneeded files, or by duplicating the sub-range into a separate folder.

## Installing Editor And Playback Scripts in Unity

**Scripts:**

Copy the `unity/EVERCOAST_SCRIPTS_Vx.y` folder into your Unity project under `Assets`.

![diagram](documentation/unity_scripts.png)

**OBJ Sequence(s):**

Create a folder under `Assets` called `EVERCOAST CONTENT`. Then, under `EVERCOAST CONTENT` create a folder that begins with the prefix (or is named) `EVERCOAST VOLUMETRIC`, e.g. `EVERCOAST VOLUMETRIC - HERO`.

*Note: The Editor and Playback scripts may refer to the above naming conventions, failing to adhere to these conventions may result in problems.*

![diagram](documentation/unity_obj_sequence.png)

**Audio File:**

For each `EVERCOAST VOLUMETRIC` folder, create subfolders `AUDIO` and `FRAMES`. Copy the synchronized audio file into `AUDIO`. You'll be notified that it has imported into Unity.

**Frames:**

Copy the synchronized OBJ sequence, that's been cut to match the audio file, into `FRAMES`.

![diagram](documentation/file_browser_editorial.png)

*Note: First, this may take several minutes.*

*Pro Tip: It may be easier to quit Unity, copy the files, and then restart Unity, rather than doing this either from within Unity, or while Unity is open. Closing the application will avoid Unity incrementally detecting the presence of new files under `Assets`, and trying to import them, prior to the copy finishing.*
