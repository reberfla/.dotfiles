#!/usr/bin/env bash

STOW_FOLDERS="wezterm,nvim,personal,scripts,tmux,zsh,starship,aerospace"
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
  echo "Please install nix first and perform the initial setup."
fi

stow -D nix
stow -t $NIX_FOLDER nix
sudo darwin-rebuild switch
