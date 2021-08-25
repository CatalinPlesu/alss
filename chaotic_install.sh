#!/bin/sh
grep -o '^\S*' chaotic.packages | grep -v '#' |\
	xargs pacman -S --noconfirm --needed
