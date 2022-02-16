" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Better Syntax Support
    Plug 'sheerun/vim-polyglot'
    " File Explorer
    Plug 'scrooloose/NERDTree'
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'
    Plug 'andweeb/presence.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " main one
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    " 9000+ Snippets
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'kyazdani42/nvim-web-devicons' " lua
    Plug 'ryanoasis/vim-devicons' " vimscript
    "Status bar
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'junegunn/rainbow_parentheses.vim'
    Plug 'norcalli/nvim-colorizer.lua'
    Plug 'tpope/vim-commentary'
    Plug 'catppuccin/nvim'
    Plug 'morhetz/gruvbox'
    Plug 'andweeb/presence.nvim'
call plug#end()
