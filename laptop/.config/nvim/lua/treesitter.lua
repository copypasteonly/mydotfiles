require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "bash", "cmake", "comment", "cpp", "css", "go", "html", "http", "java", "javascript", "json", "kotlin", "latex", "llvm", "make", "markdown", "ninja", "nix", "perl", "php", "python", "regex", "ruby", "scss", "toml", "swift", "typescript", "vim", "yaml"}, -- "all", or specify.
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,

  },
  indent = { enable = true, disable = { "yaml" } },
  rainbow = {
    enable = false,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
