# Script to link dotfiles

SHELL = /bin/sh

link:
	cd ../ && ln -sf dotfiles/bashrc .bashrc
	cd ../ && ln -sf dotfiles/bash_profile .bash_profile
	cd ../ && ln -sf dotfiles/vimrc .vimrc
	cd ../ && ln -sf dotfiles/hgrc .hgrc
