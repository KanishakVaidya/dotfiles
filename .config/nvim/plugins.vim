call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'chriskempson/base16-vim'
Plug 'fcpg/vim-waikiki' 
Plug 'rbgrouleff/bclose.vim'
Plug 'francoiscabrol/ranger.vim'
Plug 'junegunn/fzf.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'folke/zen-mode.nvim'
call plug#end()

"""""""""""""""" itchyny/lightline """"""""""""""""
set noshowmode " -- INSERT -- is unnecessary

"""""""""""""""" neoclide/coc """"""""""""""""
source ~/.config/nvim/plug-config/coc.vim

"""""""""""""""" tomasiser/vim-code-dark """"""""""""""""
" colorscheme nord
let base16colorspace=256
set termguicolors
colorscheme codedark
" colorscheme base16-gruvbox-dark-medium

"""""""""""""""" fcpg/vim-waikiki """"""""""""""""
let g:waikiki_roots = ['~/doc/.wiki/']
let maplocalleader = "\<F7>"
let g:waikiki_default_maps = 1
