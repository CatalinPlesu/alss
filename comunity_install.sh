#!/bin/sh
grep -o '^\S*' comunity.packages | grep -v '#' |\
	xargs pacman -S --noconfirm --needed
