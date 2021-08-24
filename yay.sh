#!/bin/sh

echo "Installing aur packages"
git clone https://aur.archlinux.org/yay
cd yay 
makepkg -si --noconfirm --needed
cd ..

grep -o '^\S*' ./apps/yay.list | grep -v '#' |\
	xargs yay -S --noconfirm --needed
