# Super nifty config file to do everything I want it to do.

# Link locations
SYNGESTURE=/usr/local/etc/syngestures.toml
NEOVIM=~/.config
TMUX=~/.tmux.conf
ZSH=~/.zshrc

# Colors in echos: https://stackoverflow.com/questions/5947742/how-to-change-the-output-color-of-echo-in-linux
# Colors
BLACK=\033[0;30m
RED=\033[0;31m
GREEN=\033[0;32m
ORANGE=\033[0;33m
BLUE=\033[0;34m
PURPLE=\033[0;35m
CYAN=\033[0;36m
GRAY=\033[1;30m

# Light colors
WHITE=\033[1;37m
LRED=\033[1;31m
LGREEN=\033[1;32m
YELLOW=\033[1;33m
LBLUE=\033[1;34m
LPURPLE=\033[1;35m
LCYAN=\033[1;36m
LGRAY=\033[0;37m

# No color
NC=\033[0m

.PHONY: help

help:
	@# Got from: https://stackoverflow.com/a/59087509
	@grep -B1 -E "^[a-zA-Z0-9_-]+\:([^\=]|$$)" Makefile \
	| grep -v -- -- \
	| sed 'N;s/\n/###/' \
	| sed -n 's/^#: \(.*\)###\(.*\):.*/\2###\1/p' \
	| column -t  -s '###'


#: Runs all targets
all: syngesture
	@echo Configuration complete
	@echo ""


#: Base package installs - git python3 python3-pip curl
packages:
	echo ""


#: Docker & docker-compose install
docker:
	@echo ""
	@echo "### Docker & Docker Compose ###"
	@echo -e " - $(LRED)Do it yourself.$(NC)"
	@echo ""


#: Install neovim and link configs
neovim:
	@echo ""
	@echo "### Installing neovim ###"
	@yes | sudo pacman -S neovim
	@echo " - Location   $(NEOVIM)"
	@if [ -L $(NEOVIM) ]; then\
		sudo ln -s ./configs/nvim $(NEOVIM);\
		echo -e " - $(LCYAN)Linked$(NC)     Created link";\
	else\
		echo -e " - $(LPURPLE)Skipping$(NC)   Link already exists";\
	fi
	@nvim +'PlugInstall --sync' +qa
	@echo ""


#: Install tmux and link config
tmux:
	@echo ""
	@echo "### Installing tmux ###"
	@yes | sudo pacman -S tmux
	@echo " - Location   $(TMUX)"
	@if [ -L $(TMUX) ]; then\
		sudo ln -s ./configs/tmux.conf $(TMUX);\
		echo -e " - $(LCYAN)Linked$(NC)     Created link";\
	else\
		echo -e " - $(LPURPLE)Skipping$(NC)   Link already exists";\
	fi
	@echo ""
	

#: Zsh and zshrc install and config
zsh:
	@echo ""
	@echo "### Installing Zsh ###"
	@yes | sudo pacman -S zsh
	@echo " - Making zsh default for user '$(USER)'"
	@sudo chsh $(USER) -s $$(which zsh)
	@echo " - Installing Oh-My-Zsh"
	@exit | sh -c "$$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	@echo " - Location   $(ZSH)"
	@if [ -L $(ZSH) ]; then\
		sudo ln -s ./configs/zshrc $(ZSH);\
		echo -e " - $(LCYAN)Linked$(NC)     Created link";\
	else\
		echo -e " - $(LPURPLE)Skipping$(NC)   Link already exists";\
	fi
	@echo ""


#: Creates symlink for gesture support
syngesture:
	@# Gesture support: https://github.com/mqudsi/syngesture
	@echo ""
	@echo "### Syngestures - Linux Gesture Support ###"
	@echo " - Location   $(SYNGESTURE)"
	@if [ -L $(SYNGESTURE) ]; then\
		sudo ln -s ./syngestures.toml $(SYNGESTURE);\
		echo -e " - $(LCYAN)Linked$(NC)     Created link";\
	else\
		echo -e " - $(LPURPLE)Skipping$(NC)   Link already exists";\
	fi
	@echo ""


template:
	@echo ""
	@echo "### Syngestures - Linux Gesture Support ###"
	@echo " - Location   $(SYNGESTURE)"
	@if [ -L /usr/local/etc/syngestures.toml ]; then\
		echo -e " - $(LCYAN)Linked$(NC)     Created link";\
	else\
		echo -e " - $(LPURPLE)Skipping$(NC)   Link already exists";\
	fi
	@echo " - Syngestures successfully configured"
	@echo ""

var:
	@echo $(USER)
