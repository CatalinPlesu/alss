#!/bin/sh
echo "Installing core packages"
grep -o '^\S*' ./apps/pacman.list | grep -v '#' |\
	xargs sudo pacman -S --noconfirm --needed
