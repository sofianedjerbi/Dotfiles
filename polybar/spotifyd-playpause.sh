#!/bin/bash
if [ $(playerctl -p spotifyd status) == "Playing" ]; then
	playerctl -p spotifyd pause
else
	playerctl -p spotifyd play
fi
