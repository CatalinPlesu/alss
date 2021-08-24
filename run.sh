#!/bin/sh
pacman -Syu reflector pacman git neovim --noconfirm --needed
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
