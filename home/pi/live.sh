#!/bin/bash
#
# Use the tiny raspberry pi camera and go live, providing an rtsp stream to rtsp://thisip:8554
# which can be viewed from vlc player (Control N)
#

# If you need to rotate the camera, you can use:
# raspivid --nopreview --rotation 180 -o - ... etc

raspivid --nopreview -o - -t 0 -b 3000000 -w 800 -h 600 | cvlc --ffmpeg-hw -vvv stream:///dev/stdin --sout '#rtp{sdp=rtsp://:8554}' :demux=h264
