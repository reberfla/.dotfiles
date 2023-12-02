#!/usr/bin/env bash

STOW_FOLDERS="alacritty,i3,i3status,nvim,personal,picom,scripts,tmux,zsh"
pushd $DOTFILES

for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
	echo "stow $folder"
	stow -D $folder
	stow -t ~ $folder
done

