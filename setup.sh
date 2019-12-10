#!/bin/bash


### Installing aptitude and base packages
ins_aptitudeStart () {
	echo "Initializing aptitude and base packages."

	sudo apt-get install aptitude
	sudo aptitude update
	sudo aptitude upgrade -y

	sudo aptitude install\
		git\
		python3\
		python3-pip\
		curl\
		-y
}


### Docker
ins_docker () {
	echo "Initializing docker."

	snap install docker
	groupadd docker
	usermod -aG docker $USER
}


### neovim
ins_neovim () {
	echo "Initializing neovim."

	sudo aptitude install neovim -y
	cp -a ./configs/nvim ~/.config
	nvim +'PlugInstall --sync' +qa
}


### tmux
ins_tmux () {
	echo "Initializing tmux."

	sudo aptitude install tmux -y
	cp ./configs/tmux.conf ~/.tmux.conf
}


### Zsh
ins_zsh () {
	echo "Initializing Zsh."

	sudo aptitude install zsh -y

	# Make Zsh default
	sudo chsh -s $(which zsh)

	# Install Oh-My-Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

	# Setting Zsh config
	cp ./configs/zshrc ~/.zshrc

	# Setting up powerlevel9k
	git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
}


updates () {
	cp ./configs/zshrc ~/.zshrc
	cp ./configs/tmux.conf ~/.tmux.conf
	cp -a ./configs/nvim ~/.config
}


sync () {
	# Neovim
	cp -r ~/.config/nvim ./configs

	# Zsh
	cp ~/.zshrc ./configs/zshrc

	# tmux
	cp ~/.tmux.conf ./configs/tmux.conf
}

#### Check for root
#if not [ "$EUID" -ne 0 ]
#	then echo "This script must NOT be ran as root"
#	exit
#fi


### Run Things
if [ $0 == "init" ]
	then
		ins_aptitudeStart
		ins_docker
		ins_neovim
		ins_tmux
		ins_zsh
elif [ $0 == "sync" ]
	then
		sync
else
	updates
fi
