require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "rust", "bash", "cmake", "comment", "cpp", "css", "go", "html", "http", "java", "javascript", "json", "kotlin", "latex", "llvm", "make", "markdown", "ninja", "nix", "perl", "php", "python", "regex", "ruby", "scss", "toml", "swift", "typescript", "vim", "yaml"}, -- "all", or specify.
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = false,

  },
  yati = {
    enable = false,
    default_lazy = true,
    default_fallback = "auto",
  },
  indent = { enable = true, disable = { "" } }
}

