#!/bin/zsh
# Create jupyter config
jupyter lab --generate-config

# Modifying said config (I think it should always be in this place, maybe not?)
# Add browser to use (Using Firefox as default)
sed -i "s/#c.NotebookApp.browser = ''/c.NotebookApp.browser = u'\/mnt\/c\/Program\ Files\/Mozilla\ Firefox\/firefox.exe %s'/g" ~/.jupyter/jupyter_notebook_config.py

# Say that you don't want redirect file but url served to browser. *file is default but uses unix path, not windows, so broken
sed -i "s/#c.NotebookApp.use_redirect_file = True/c.NotebookApp.use_redirect_file = False/g" ~/.jupyter/jupyter_notebook_config.py
