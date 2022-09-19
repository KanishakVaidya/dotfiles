call plug#begin('~/.local/share/nvim/plugged')
Plug 'itchyny/lightline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tomasiser/vim-code-dark'
Plug 'francoiscabrol/ranger.vim'
" Plug 'junegunn/fzf.vim'
Plug 'plasticboy/vim-markdown'
Plug 'folke/zen-mode.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
call plug#end()

"""""""""""""""" itchyny/lightline """"""""""""""""
set noshowmode " -- INSERT -- is unnecessary

"""""""""""""""" neoclide/coc """"""""""""""""
source ~/.config/nvim/plug-config/coc.vim
let g:coc_filetype_map = {'tex': 'latex'}

"""""""""""""""" tomasiser/vim-code-dark """"""""""""""""
" colorscheme nord
let base16colorspace=256
set termguicolors
colorscheme codedark
" colorscheme base16-gruvbox-dark-medium
