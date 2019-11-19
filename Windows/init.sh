#!/bin/bash

### Installing aptitude and base packages
echo "Installing aptitude and base packages."
sudo apt-get install aptitude
sudo aptitude update
sudo aptitude upgrade -y

sudo aptitude install\
	git\
	python3\
	python3-pip\
	neovim\
	zsh\
	curl\
	tmux\
	-y

### Install Docker
./component/docker.sh


### Initializing neovim
echo "Initializing neovim."
cp -a ./configs/nvim ~/.config/nvim
nvim +'PlugInstall --sync' +qa


### Zsh
echo "Installing and initializing Zsh."
# Make Zsh default
sudo chsh -s $(which zsh)


# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setting Zsh config
cp ./configs/zsh/zshrc ~/.zshrc

# Setting up powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
