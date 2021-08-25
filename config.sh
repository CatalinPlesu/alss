#!/bin/sh
source ./install.conf
git clone https://github.com/catalinhimself/dotfiles /home/$username/.config
ln -s /home/$username/shell/env /home/$username/.zshenv
chown -R /home/$username $username
 
wget https://raw.github.com/seanyeh/vibreoffice/master/dist/vibreoffice-0.1.4.oxt
unopkg add vibreoffice-0.1.4.oxt 
