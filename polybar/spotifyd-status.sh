#!/bin/bash
if [ $(playerctl -p spotifyd status) == "Playing" ]; then
	echo 
else
	echo 
fi
