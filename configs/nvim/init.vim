colorscheme molokai
set smartindent
set noexpandtab
set tabstop=4
set shiftwidth=4 " when indenting with '>', use 4 spaces width


" Allow mouse!
set mouse=a

set nocompatible              " be iMproved, required
filetype off                  " required


if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


" Vim-Plug
call plug#begin("~/.local/share/nvim/plugged/")

" Plugins
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'

call plug#end()
let g:ale_linters = {
\   'python': ['pylint'],
\}  "flake8 also available for Python

filetype plugin indent on    " required
