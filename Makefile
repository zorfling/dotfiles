# Script to link dotfiles

SHELL = /bin/sh

link:
	cd ../ && ln -sf dotfiles/bash/bashrc .bashrc
	cd ../ && ln -sf dotfiles/bash/bash_profile .bash_profile
	cd ../ && ln -sf dotfiles/vim/vimrc .vimrc
	cd ../ && ln -sf dotfiles/hg/hgrc .hgrc
	cd ../ && ln -sf dotfiles/gemrc .gemrc
	cd ../ && ln -sf dotfiles/git/gitconfig .gitconfig

	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
