#!/bin/sh
if ! source ./install.conf; then
	echo "enter hostname"
	read hostname
	echo "enter username"
	read username
	echo "enter password"
	read password
	printf "hostname="$hostname"\n" >> "install.conf"
	printf "username="$username"\n" >> "install.conf"
	printf "password="$password"\n" >> "install.conf"
fi

ln -sf /usr/share/zoneinfo/Europe/Chisinau /etc/localtime
hwclock --systohc
pacman -S --noconfirm reflector
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
reflector --latest 5 --sort rate --save /etc/pacman.d/mirrorlist

nc=$(grep -c ^processor /proc/cpuinfo)
echo "You have " $nc" cores."
echo "Changing the makeflags for "$nc" cores."
sed -i 's/#MAKEFLAGS="-j2"/MAKEFLAGS="-j$nc"/g' /etc/makepkg.conf
sed -i 's/COMPRESSXZ=(xz -c -z -)/COMPRESSXZ=(xz -c -T $nc -z -)/g' /etc/makepkg.conf

echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf
echo "KEYMAP=us" >> /etc/vconsole.conf
echo "FONT=ter-132b" >> /etc/vconsole.conf 
echo "$hostname" >> /etc/hostname
echo "127.0.0.1\t$hostname" >> /etc/hosts
echo "::1\t$hostname" >> /etc/hosts
echo "127.0.1.1\t$hostname.localdomain\t$hostname" >> /etc/hosts
mkinitcpio -P

echo "root password"
passwd
useradd -mG wheel,audio,video,games -s /bin/zsh $username
echo -e "$password\n$password\n" | passwd $username

pacman -S grub efibootmgr os-prober ntfs-3g mtools
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=GRUB
echo "GRUB_DISABLE_OS_PROBER=false" >> /etc/default/grub
grub-mkconfig -o /boot/grub/grub.cfg

