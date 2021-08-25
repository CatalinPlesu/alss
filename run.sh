#!/bin/sh
pacman -S --noconfirm reflector
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

source ./chaotic_aur.sh
source ./comunity_install.sh
source ./chaotic_install.sh

source ./post_chroot.sh
source ./config.sh

