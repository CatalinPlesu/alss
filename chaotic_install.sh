#!/bin/sh
grep -o '^\S*' chaotic.packages | grep -v '#' |\
	xargs sudo pacman -S --noconfirm --needed
