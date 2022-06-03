set termguicolors
source $HOME/.config/nvim/vim-plug/plugins.vim
lua require 'init'
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
syntax enable
filetype plugin indent on
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
set showtabline=2
set updatetime=200
highlight Normal guibg=NONE ctermbg=None
nnoremap Y y$
let g:coq_settings = { 'auto_start': 'shut-up', 'keymap.jump_to_mark' : '<c-m>'}

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>r <cmd>CHADopen<cr>
let g:chadtree_settings = { "theme.text_colour_set" : "solarized_universal" }

colorscheme vscode
set background=dark
let g:vscode_transparency = 1
let g:vscode_italic_comment = 1
let g:vscode_disable_nvimtree_bg = v:true
