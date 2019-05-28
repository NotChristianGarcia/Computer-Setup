#!/bin/bash

### Check for root
if [ "$EUID" -ne 0 ]
  then echo "This script must be ran as root."
  exit
fi

### Installing aptitude and base packages
echo "Installing aptitude and base packages."
apt install aptitude
aptitude update
aptitude upgrade -y

aptitude install\
	git\
	python3\
	python3-pip\
	chromium-browser\
	neovim\
	zsh\
	curl\
	gnome-tweaks\
	numix-gtk-theme\
	-y


### Install Docker
./docker.sh


### Initializing neovim
echo "Initializing neovim."
cp -a ./configs/nvim ~/.config/nvim
vim +'PlugInstall --sync' +qa


### Zsh
echo "Installing and initializing Zsh."
# Make Zsh default
chsh -s /bin/zsh

# Install Oh-My-Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Setting Zsh config
cp ./configs/zsh/zshrc ~/.zshrc


### Set gnome-terminal colors
echo "Setting gnome-terminal colors."
export TERMINAL=gnome-terminal-
./colors.sh


### Set gnome-terminal font
echo "Installing and setting gnome-terminal font."
mkdir ~/.fonts
cp ./configs/hack.tff ~/.fonts/
fc-cache -fv ~/.fonts

gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")/ use-system-font false
gsettings set org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")/ font 'Hack Nerd Font 11'


### Set Gnome to Numix theme
echo "Setting gnome-theme to Numix."
gsettings set org.gnome.desktop.interface gtk-theme "Numix"
gsettings set org.gnome.desktop.wm.preferences theme "Numix"
