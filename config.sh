#!/bin/sh
source ./install.conf
git clone https://github.com/catalinplesu/dotfiles /home/$username/.config
ln -s /home/$username/shell/env /home/$username/.zshenv
chown -R /home/$username $username

sed -i '/Misc options/a\Color' /etc/pacman.conf 
sed -i '/Misc options/a\ILoveCandy' /etc/pacman.conf 
sed -i '/Misc options/a\ParallelDownloads = 8' /etc/pacman.conf 

ln -sfT dash /bin/sh

echo "permit persist :wheel" >> /etc/doas.conf

# wget https://raw.github.com/seanyeh/vibreoffice/master/dist/vibreoffice-0.1.4.oxt
# unopkg add --shared vibreoffice-0.1.4.oxt 


