#!/bin/bash
sleep 3
SONGLOC="$HOME/.config/spotifyd/song.txt"
SONG=$(playerctl -p spotifyd metadata -f "{{ title }} - {{ artist }}")
echo $SONG > $SONGLOC
