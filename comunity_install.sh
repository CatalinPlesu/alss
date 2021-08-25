#!/bin/sh
grep -o '^\S*' comunity.packages | grep -v '#' |\
	xargs sudo pacman -S --noconfirm --needed
