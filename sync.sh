#!/bin/bash
# Updates vsh & nvim with new repo stuff
# Make it so that this update things both grabs new info from output locations and updates folder content
# and also grabs folder content and updates output location if needed.

# Neovim
cp -r ~/.config/nvim ./configs

# Zsh
cp ~/.zshrc ./configs/zshrc

# tmux
cp ~/.tmux.conf ./configs/tmux.conf
