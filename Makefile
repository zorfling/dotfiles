# Script to link dotfiles

SHELL = /bin/sh

link:
	-cp -f ../.bashrc ../bashrc.bak
	cd ../ && ln -sf dotfiles/bash/bashrc .bashrc
	-cp -f ../.bash_profile ../bash_profile.bak
	cd ../ && ln -sf dotfiles/bash/bash_profile .bash_profile
	-cp -f ../.vimrc ../vimrc.bak
	cd ../ && ln -sf dotfiles/vim/vimrc .vimrc
	-cp -f ../.hgrc ../hgrc.bak
	cd ../ && ln -sf dotfiles/hg/hgrc .hgrc
	-cp -f ../.gemrc ../gemrc.bak
	cd ../ && ln -sf dotfiles/gemrc .gemrc
	-cp -f ../.gitconfig ../gitconfig.bak
	cd ../ && ln -sf dotfiles/git/gitconfig .gitconfig
	-cp -f ../.gitignore ../gitignore.bak
	cd ../ && ln -sf dotfiles/git/gitignore .gitignore
	-cp -f ../.screenrc ../screenrc.bak
	cd ../ && ln -sf dotfiles/screen/screenrc .screenrc

	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +BundleInstall +qall
