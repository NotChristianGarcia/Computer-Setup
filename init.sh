#!/bin/bash

apt install aptitude
aptitude update
aptitude upgrade

# Install other stuff
aptitude install git
                 python3
                 python3-pip
                 chromium-browser
                 ipython3
                 neovim
                 nordvpn
                 zsh
                 gnome-tweaks
                 numix-gtk-theme

# Set Gnome to Numix theme
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"

# Extra installs
aptitude install wine64
                 winetricks

# Setting nvim config
cp -r ./nvim ~/.config/nvim
echo :wq | nvim

# Zsh Stuff
chsh -s /bin/zsh;

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Powerlevel9k for zsh
aptitude install fonts-hack-ttf
