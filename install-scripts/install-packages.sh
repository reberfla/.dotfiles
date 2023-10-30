#!/bin/sh
sudo apt install curl
#install zsh and setup Oh My Zsh config
sudo apt install zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#install tmux and plugin manager tpm
sudo apt-get install tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

#install Overpass Nerd Font
mkdir ~/.fonts
wget https://github.com/RedHatOfficial/Overpass/raw/master/fonts/otf_mono/OverpassMono-SemiBold.otf -P ~/.fonts
