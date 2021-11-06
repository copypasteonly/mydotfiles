set termguicolors
source $HOME/.config/nvim/vim-plug/plugins.vim
lua require 'init'
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
syntax enable
filetype plugin indent on
let mapleader=" "
set makeprg=gcc\ %\ -o\ %<\ -lm
nnoremap <F11> :w<cr>:make<cr>
nnoremap <F12> :te./%<<cr>
autocmd FileType apache setlocal commentstring=#\ %s

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nohlsearch
set hidden
set noerrorbells
set incsearch
set scrolloff=8
set signcolumn=yes:1
set clipboard=unnamedplus
set relativenumber
set mouse=a
set smarttab
set autoindent

vnoremap < <gv
vnoremap > >gv
inoremap jk <Esc>
inoremap kj <Esc>
colorscheme catppuccino
nnoremap Y y$
autocmd FileType apache setlocal commentstring=#\ %s
let g:coq_settings = { 'auto_start': 'shut-up' }
nnoremap <leader>v <cmd>CHADopen<cr>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Using Lua functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" Status Bar
let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Ranger 
let g:rnvimr_ex_enable = 1
nmap <space>r :RnvimrToggle<CR>




































