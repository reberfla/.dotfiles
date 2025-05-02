#!/usr/bin/env bash

STOW_FOLDERS="wezterm,nvim,personal,scripts,tmux,zsh,starship"
NIX_FOLDER="/etc/nix-darwin"
pushd $DOTFILES

# Checking if Stow exists and install it if not
# No implementation for Linux yet
if ! command -v stow 2>&1 > /dev/null
then
	if [[ "OSTYPE" == 'darwin'* ]];then
		brew install stow
	fi
fi

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
	echo "stow $folder"
	stow -D $folder
	stow -t ~ $folder
done

echo "stow nix"
if [ ! -d "$NIX_FOLDER" ]; then
  echo "$NIX_FOLDER does not exist, assuming nix is not installed..."
  read -p "Do you want to install Nix ? [y/n]" -n 1 -r
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
		echo -e "Installing Nix, please select \e[31mNO\e[0m to using Determinate!!"
		curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install
		sudo mkdir -p $NIX_FOLDER
		sudo chown $(id -nu):$(id -ng) /etc/nix-darwin
		cd /etc/nix-darwin
		sed -i '' "s/simple/$(scutil --get LocalHostName)/" flake.nix
	fi
fi

stow -D nix
stow -t $NIX_FOLDER nix
darwin-rebuild switch

