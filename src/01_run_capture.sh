#!/bin/bash
#
# Main reference:
# https://it9ybg.blogspot.com/2018/10/tutorial-how-receive-sstv-with.html

# SSTV frequency in Hz
FREQUENCY=145800000

# Simple wrapper around the following command
echo "Starting receiving from rtl_sdr on frequency $FREQUENCY. Hit ctrl-c to stop."
rtl_sdr -s 1200000 -f $FREQUENCY - | csdr convert_u8_f | ncat -4l 4952 -k --send-only --allow 127.0.0.1

