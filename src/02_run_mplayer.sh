#!/bin/bash
#
# Main reference:
# https://it9ybg.blogspot.com/2018/10/tutorial-how-receive-sstv-with.html

echo "Running mplayer to receive from rtl_sdr. Hit ctrl-c to stop."

# Simple wrapper around the following command:
ncat -v 127.0.0.1 4952 | csdr fir_decimate_cc 25 0.05 HAMMING | csdr bandpass_fir_fft_cc 0 0.5 0.05 | csdr realpart_cf | csdr agc_ff | csdr limit_ff | csdr convert_f_s16 | mplayer -nocache -rawaudio samplesize=2:channels=1:rate=48000 -demuxer rawaudio -

