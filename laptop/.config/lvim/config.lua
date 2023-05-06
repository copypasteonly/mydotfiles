--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.relativenumber = true
vim.opt.wrap = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<CR>"
lvim.keys.normal_mode["<C-w>"] = ":BufferKill<CR>"
lvim.keys.normal_mode["<C-tab>"] = ":BufferLineCycleNext<CR>"
lvim.builtin.which_key.mappings["r"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" }
lvim.builtin.which_key.mappings["e"] = { "<cmd>TroubleToggle<CR>", "Diagnostics" }
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
lvim.builtin.lualine.style = "default"

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

lvim.plugins = {
  { "lunarvim/colorschemes" },
  { "sainnhe/everforest" },
  { "folke/trouble.nvim" },
}
-- everforest colorscheme
lvim.colorscheme = 'everforest'
vim.g.everforest_background = 'hard'
vim.g.everforest_better_performance = 1
vim.g.everforest_colors_override = {
  bg0 = { '#23292e', '234' },
  aqua = { '#55a869', '37' },
  red = { '#e2696b', '167' },
  green = { '#9eb971', '142' },
  yellow = { '#d6b36c', '214' },
  orange = { '#e2896a', '208' }
}
vim.g.everforest_diagnostic_virtual_text = 'colored'

-- for trouble to work
require("trouble").setup {}

lvim.builtin.cmp.formatting.kind_icons.Array = ""
lvim.builtin.cmp.formatting.kind_icons.Boolean = ""
lvim.builtin.cmp.formatting.kind_icons.Class = "ﴯ"
lvim.builtin.cmp.formatting.kind_icons.Color = ""
lvim.builtin.cmp.formatting.kind_icons.Constant = ""
lvim.builtin.cmp.formatting.kind_icons.Constructor = ""
lvim.builtin.cmp.formatting.kind_icons.Enum = ""
lvim.builtin.cmp.formatting.kind_icons.EnumMember = ""
lvim.builtin.cmp.formatting.kind_icons.Event = ""
lvim.builtin.cmp.formatting.kind_icons.Field = ""
lvim.builtin.cmp.formatting.kind_icons.File = ""
lvim.builtin.cmp.formatting.kind_icons.Folder = ""
lvim.builtin.cmp.formatting.kind_icons.Function = ""
lvim.builtin.cmp.formatting.kind_icons.Interface = ""
lvim.builtin.cmp.formatting.kind_icons.Key = ""
lvim.builtin.cmp.formatting.kind_icons.Keyword = ""
lvim.builtin.cmp.formatting.kind_icons.Method = ""
lvim.builtin.cmp.formatting.kind_icons.Module = ""
lvim.builtin.cmp.formatting.kind_icons.Namespace = ""
lvim.builtin.cmp.formatting.kind_icons.Null = "ﳠ"
lvim.builtin.cmp.formatting.kind_icons.Number = ""
lvim.builtin.cmp.formatting.kind_icons.Object = ""
lvim.builtin.cmp.formatting.kind_icons.Operator = ""
lvim.builtin.cmp.formatting.kind_icons.Package = ""
lvim.builtin.cmp.formatting.kind_icons.Property = "ﰠ"
lvim.builtin.cmp.formatting.kind_icons.Reference = ""
lvim.builtin.cmp.formatting.kind_icons.Snippet = ""
lvim.builtin.cmp.formatting.kind_icons.String = ""
lvim.builtin.cmp.formatting.kind_icons.Struct = ""
lvim.builtin.cmp.formatting.kind_icons.Text = ""
lvim.builtin.cmp.formatting.kind_icons.TypeParameter = ""
lvim.builtin.cmp.formatting.kind_icons.Unit = ""
lvim.builtin.cmp.formatting.kind_icons.Value = ""
lvim.builtin.cmp.formatting.kind_icons.Variable = ""

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
-- lvim.plugins = {
--     {
--       "folke/trouble.nvim",
--       cmd = "TroubleToggle",
--     },
-- }

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
