" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " File Explorer
    Plug 'scrooloose/NERDTree'

    " Discord presence
    Plug 'andweeb/presence.nvim'

    "Important for LSP
    Plug 'nvim-lua/plenary.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'nvim-telescope/telescope.nvim'
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

    Plug 'p00f/nvim-ts-rainbow'
    Plug 'NvChad/nvim-colorizer.lua'
    Plug 'tpope/vim-commentary'

    " Plug 'shaunsingh/nord.nvim'
    Plug 'Mofiqul/vscode.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/everforest'

    " Easier Java
    Plug 'mfussenegger/nvim-jdtls'

    Plug 'windwp/nvim-autopairs'

call plug#end()
