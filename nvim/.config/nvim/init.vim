source $HOME/.config/nvim/vim-plug/plugins.vim
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
set clipboard+=unnamedplus
set relativenumber
set mouse=a
filetype plugin indent on
let mapleader=" "
set makeprg=gcc\ %\ -o\ %<\ -lm
nnoremap <F11> :w<cr>:make<cr>
nnoremap <F12> :te./%<<cr>
colorscheme catppuccino
nnoremap Y y$
autocmd FileType apache setlocal commentstring=#\ %s
let g:coq_settings = { 'auto_start': 'shut-up' }
nnoremap <leader>v <cmd>CHADopen<cr>
lua << EOF
local lsp = require "lspconfig"
local coq = require 'coq'
require'colorizer'.setup(
  {'*';},
  {
      RGB      = true;         -- #RGB hex codes
	  RRGGBB   = true;         -- #RRGGBB hex codes
	  names    = true;         -- "Name" codes like Blue
	  RRGGBBAA = true;         -- #RRGGBBAA hex codes
	  rgb_fn   = true;         -- CSS rgb() and rgba() functions
	  hsl_fn   = true;         -- CSS hsl() and hsla() functions
	  css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
	  css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
  })
require'nvim-treesitter.configs'.setup {
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
require'lspconfig'.pyright.setup{}
require'lspconfig'.ccls.setup{}
EOF

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

let g:airline_powerline_fonts = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'

" Ranger 
let g:rnvimr_ex_enable = 1
nmap <space>r :RnvimrToggle<CR>





































