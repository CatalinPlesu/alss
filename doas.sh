#!/bin/sh
alias sudo='sudo'
sudo sh -c 'echo "permit persist :wheel" >> /etc/doas.conf'


