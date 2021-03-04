#!/bin/bash
#### Initialization Functions - Download said thing and update config
init_aptitude () {
	echo "Initializing aptitude and base packages."

	sudo apt-get update
	sudo apt-get install aptitude -y
	sudo aptitude update -y
	sudo aptitude upgrade -y

	sudo aptitude install\
		git\
		python3\
		python3-pip\
		curl\
		-y
}

init_docker () {
	echo "Initializing docker."
	sudo aptitude install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
	sudo aptitude update
	sudo aptitude install docker-ce -y

	groupadd docker
	usermod -aG docker $USER
}

init_docker-compose () {
	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
}

init_git () {
	git config --global user.email "christian.g21@gmail.com"
	git config --global user.name "Christian R. Garcia"
}

init_jupyter () {
	pip3 install jupyterlab
}

init_neovim () {
	echo "Initializing neovim."

	sudo aptitude install neovim -y
	cp -r ./configs/nvim ~/.config
	nvim +'PlugInstall --sync' +qa
}

init_tmux () {
	echo "Initializing tmux."

	sudo aptitude install tmux -y
	cp ./configs/tmux.conf ~/.tmux.conf
}

init_zsh () {
	echo "Initializing Zsh."

	sudo aptitude install zsh -y

	# Make Zsh default
	sudo chsh -s $(which zsh)

	# Install Oh-My-Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

     # Exit Zsh to complete stuff
	exit

	# Setting Zsh config
	cp ./configs/zshrc ~/.zshrc
}

init_all () {
	echo "Initializing whatever this is."
	init_aptitude
	init_docker
	init_docker-compose
	init_jupyter
	init_neovim
	init_tmux
	init_zsh
}


#### Pull Functions - Move files from remote to local
pull_neovim () {
	cp -r ./configs/nvim ~/.config
}

pull_tmux () {
	cp ./configs/tmux.conf ~/.tmux.conf

}

pull_zsh () {
	cp ./configs/zshrc ~/.zshrc
}

pull_all () {
	echo "Moving remote configs to local folders."
	pull_neovim
	pull_tmux
	pull_zsh
}


#### Push Functions - Move files from local to remote
push_neovim () {
	cp -r ~/.config/nvim ./configs
}

push_tmux () {
	cp ~/.tmux.conf ./configs/tmux.conf
}

push_zsh () {
	cp ~/.zshrc ./configs/zshrc
}

push_all () {
	echo "Moving local configs to remote folder."
	push_neovim
	push_tmux
	push_zsh
}


#### Windows Functions - Setting up whatever we need to work on WSL2
windows_docker () {
	mkdir -p ~/.local/bin
	echo "sudo service docker start" > ~/.local/bin/start_services.sh
	echo "$USER ALL=NOPASSWD: /home/$USER/.local/bin/start_services.sh" | sudo EDITOR='tee -a' visudo
}

windows_jupyter () {
	# Linking windows browser (Firefox) to Jupyter.
	# Create jupyter config
	jupyter lab --generate-config

	# Modifying said config (I think it should always be in this place, maybe not?)
	# Add browser to use (Using Firefox as default)
	sed -i "s/#c.NotebookApp.browser = ''/c.NotebookApp.browser = u'\/mnt\/c\/Program\\\ Files\/Mozilla\\\ Firefox\/firefox.exe %s'/g" ~/.jupyter/jupyter_notebook_config.py

	# Say that you don't want redirect file but url served to browser. *file is default but uses unix path, not windows, so broken
	sed -i "s/#c.NotebookApp.use_redirect_file = True/c.NotebookApp.use_redirect_file = False/g" ~/.jupyter/jupyter_notebook_config.py
}

windows_all () {
	windows_docker
	windows_jupyter
}


#### Check for root
if [ "$EUID" -eq 0 ]
	then echo "This script must NOT be ran as root."
	exit
fi

#### Run Things
if [ $# -eq 0 ]
	then
		echo -e "Specify one of the following functions to run:"
		echo "  Init: Initalize things"
		declare -F | awk '{print $NF}' | grep 'init_' | sort | sed -ne 's/.*/    - &/p' 
		echo "  Pull: Move remote configs to local"
		declare -F | awk '{print $NF}' | grep 'pull_' | sort | sed -ne 's/.*/    - &/p' 
		echo "  Push: Move local configs to remote"
		declare -F | awk '{print $NF}' | grep 'push_' | sort | sed -ne 's/.*/    - &/p' 
		echo "  Windows: Set up WSL2 stuff"
		declare -F | awk '{print $NF}' | grep 'windows_' | sort | sed -ne 's/.*/    - &/p' 


elif [ $# -ge 1 ]
	then
		echo "Running specified functions if they exist."
		$1
		$2
		$3
		$4
		$5
		$6
		$7
		$8
		$9
fi
