#!/bin/bash
cat ~/.config/spotifyd/song.txt | zscroll -d 0.3 \
					  -l 40 \
	                                  -u t "cat $HOME/.config/spotifyd/song.txt"
