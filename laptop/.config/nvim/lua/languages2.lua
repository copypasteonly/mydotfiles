local lsp_flags = {
    debounce_text_changes = 150,
}

local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig')['pyright'].setup{
    flags = lsp_flags,
    capabilities = capabilities
}

require('lspconfig')['ccls'].setup{
    flags = lsp_flags,
    capabilities = capabilities
}

require('lspconfig')['cssls'].setup{
    flags = lsp_flags,
    capabilities = capabilities
}

require('lspconfig')['html'].setup{
    flags = lsp_flags,
    capabilities = capabilities
}
require('lspconfig')['sumneko_lua'].setup{
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim'},
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
                checkThirdParty = false,
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
}

require('rust-tools').setup{
    capabilities = capabilities,
    server = {
        on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
}
