# Nvim-Config
Stores NVim Init for ease of re-installation in new places.  
  
## Installation Instructions
### Linux
#### Neovim Appimage
~~~~
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage  
~~~~
or  
~~~~
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage  
chmod u+x nvim.appimage  
./nvim.appimage 
~~~~
Rename image to nvim (or don't) and move to usr/local/bin or whichever bin.  
  
#### Neovim True Install - Ubuntu
To check versions  
~~~~
sudo apt-cache policy neovim  
sudo apt install neovim  
~~~~
or  
~~~~
sudo apt install neovim version="---"  
~~~~
Nvim should be installed in .local/share/nvim/  
  
#### Neovim Config
~~~~
git clone https://github.com/NotChristianGarcia/nvim.git  
~~~~
Repo should be placed in ~/.config/nvim/  
Enter Nvim for initial install of vim-plug and plugins  
  
#### Alias alternatives to nvim
Run command on command line  
~~~~
alias alias_name="command_to_run"  
~~~~
ex.  
~~~~
alias vim="nvim"  
Runs nvim instead of vim now  
~~~~
  
### Windows
