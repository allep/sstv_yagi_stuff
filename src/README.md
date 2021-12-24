# SSTV stuff (Yagi, bash scripts)

## Introduction

This folder contains some useful stuff to be used to receive SSTV transmission from the ISS.
Currently, the content of this directory is composed of:

1. Bash scripts to help with the command sequence to be run on the linux box to enable reception with QSSTV
2. A .scad file used to produce a 3D-printable spacer for a simple 144 MHz Yagi antennta.

## Bash scripts

Main reference:
[1] https://it9ybg.blogspot.com/2018/10/tutorial-how-receive-sstv-with.html

Procedure:

1. Follow reference **[1]** to properly setup a virtual audio device to be used by pulseaudio.
	- Edit with su / sudo the file `/etc/pulse/default.pa` adding:
		```
		load-module module-null-sink sink_name=Virtual0 sink_properties=device.description="Virtual0"
		```
	- Restart `pulseaudio` server
2. Open `pavucontrol` to keep monitored all audio devices, including the virtual one just created.
3. Run the script `01_run_capture.sh`
4. On another shell run the script `02_run_mplayer.sh`
5. Run `qsstv` and configure its input (in "Sound" tab, select "From sound card")
6. Inside `pavucontrol` make sure that both mplayer and QSSTV are using `Virtual0` as their audio device.
7. Start capture from qsstv.

