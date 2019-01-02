#!/bin/bash

apt install aptitude
aptitude update
aptitude upgrade

# Install other stuff
aptitude install git python3 python3-pip chromium-browser ipython3 neovim nordvpn zsh

# Extra installs
aptitude install wine64 winetricks

# Cloning nvim stuff
git clone https://github.com/NotChristianGarcia/nvim.git ~/.config/nvim

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Powerlevel9k for zsh
aptitude install fonts-hack-ttf
