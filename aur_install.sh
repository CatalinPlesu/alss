#!/bin/sh

echo "Installing aur packages"
grep -o '^\S*' aur.packages| grep -v '#' |\
	xargs paru -S --noconfirm --needed
