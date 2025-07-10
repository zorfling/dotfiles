# Script to link dotfiles

SHELL = /bin/sh

link:
	-cp -f ../.bashrc ../bashrc.bak
	cd ../ && ln -sf dotfiles/zsh/zshrc .zshrc
	-cp -f ../.zshrc ../zshrc.bak
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

	git clone git://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
	vim +PluginInstall +qall
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
