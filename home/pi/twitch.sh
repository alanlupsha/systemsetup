#!/bin/bash
# stream a camera's rtsp stream directly to twitch

     INRES="640x386" # input resolution
     OUTRES="640x386" # output resolution
     FPS="10" # target FPS
     GOP="15" # i-frame interval, should be double of FPS,
     GOPMIN="10" # min i-frame interval, should be equal to fps,
     THREADS="2" # max 6
     CBR="200k" # constant bitrate (should be between 1000k - 3000k)
     QUALITY="ultrafast"  # one of the many FFMPEG preset
     AUDIO_RATE="44100"
     STREAM_KEY="live_xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx_secret_here"
     SERVER="live-atl" # twitch server in frankfurt, see http://bashtech.net/twitch/ingest.php for list

ffmpeg -rtsp_transport tcp -i rtsp://x.y.q.q/camera/stream/here \
       -f flv -ac 2 -ar $AUDIO_RATE \
       -vcodec libx264 -g $GOP -keyint_min $GOPMIN -b:v $CBR \
       -minrate $CBR -maxrate $CBR -pix_fmt yuv420p      \
       -s $OUTRES -preset $QUALITY -tune film -acodec libmp3lame -threads $THREADS  \
       -strict normal       \
       -bufsize $CBR "rtmp://$SERVER.twitch.tv/app/$STREAM_KEY"


