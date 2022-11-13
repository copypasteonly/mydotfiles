" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " Discord presence
    Plug 'andweeb/presence.nvim'

    "Important for LSP
    Plug 'nvim-lua/plenary.nvim'
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

    Plug 'nvim-tree/nvim-tree.lua'
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'simrat39/rust-tools.nvim'

    " main one
    Plug 'nvim-treesitter/nvim-treesitter-textobjects'
    Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
    Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
    Plug 'ms-jpq/coq.thirdparty', {'branch': '3p'}

    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'nvim-tree/nvim-web-devicons'
    Plug 'ryanoasis/vim-devicons' " vimscript

    "Status bar
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'NvChad/nvim-colorizer.lua'

    Plug 'tpope/vim-commentary'

    " Themes
    Plug 'Mofiqul/vscode.nvim'
    Plug 'sainnhe/gruvbox-material'
    Plug 'sainnhe/everforest'

    " Easier Java
    Plug 'mfussenegger/nvim-jdtls'

    Plug 'windwp/nvim-autopairs'
    Plug 'yioneko/nvim-yati', { 'tag': '*' }

call plug#end()
