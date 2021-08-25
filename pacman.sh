#!/bin/sh
alias sudo='sudo'
echo "Configuring pacman"
echo "Enabling colors"
sudo sed -i '/Misc options/a\Color' /etc/pacman.conf 
echo "pacman style progress bar"
sudo sed -i '/Misc options/a\ILoveCandy' /etc/pacman.conf 
echo "parallel downloads"
sudo sed -i '/Misc options/a\ParallelDownloads = 8' /etc/pacman.conf 

