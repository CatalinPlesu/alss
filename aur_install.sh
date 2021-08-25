#!/bin/sh

echo "Installing aur packages"
grep -o '^\S*' aur.packages| grep -v '#' |\
	xargs yay -S --noconfirm --needed
