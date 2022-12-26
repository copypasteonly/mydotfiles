local lsp_flags = {
    debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup(require('coq').lsp_ensure_capabilities({
    flags = lsp_flags,
}))

require('lspconfig')['ccls'].setup(require('coq').lsp_ensure_capabilities({
    flags = lsp_flags,
}))

require('lspconfig')['cssls'].setup(require('coq').lsp_ensure_capabilities({
    flags = lsp_flags,
}))

require('lspconfig')['html'].setup(require('coq').lsp_ensure_capabilities({
    flags = lsp_flags,
}))

require('lspconfig')['sumneko_lua'].setup(require('coq').lsp_ensure_capabilities({
    flags = lsp_flags,
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
}))

require('rust-tools').setup(require('coq').lsp_ensure_capabilities({
    server = {
        on_attach = function(_, bufnr)
        -- Hover actions
        vim.keymap.set("n", "<C-space>", require("rust-tools").hover_actions.hover_actions, { buffer = bufnr })
        -- Code action groups
        vim.keymap.set("n", "<Leader>a", require("rust-tools").code_action_group.code_action_group, { buffer = bufnr })
        end,
    },
}))
