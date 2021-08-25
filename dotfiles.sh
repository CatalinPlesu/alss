#!/bin/sh
source ./install.conf
git clone https://github.com/catalinhimself/dotfiles /home/$username/.config
ln -s /home/$username/shell/env /home/$username/.zshenv
