
# Neovim Quick Installation and Initialization
This is a quick guide to easily install Neovim on different platforms in different ways with my own config files on different computers.  
  
## Installation Instructions
### Linux
#### Neovim Appimage
~~~~
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
~~~~
or
~~~~
wget https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
~~~~
run with
~~~~
chmod u+x nvim.appimage
./nvim.appimage
~~~~
Rename image to nvim (or don't) and move to usr/local/bin or whichever bin.
  
#### Neovim True Install - Ubuntu
To check versions
~~~~
sudo apt-cache policy neovim
~~~~
and to install,
~~~~
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
Run command on command line  to make different things default to nvim
~~~~
alias alias_name="command_to_run"
~~~~
ex.
~~~~
alias vim="nvim"
Runs nvim instead of vim now
~~~~

### Windows
