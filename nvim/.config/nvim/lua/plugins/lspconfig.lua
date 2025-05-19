local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

    function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or 'rounded'

        return orig_util_open_floating_preview(contents, syntax, opts, ...)
    end
end


local capabilities = require('cmp_nvim_lsp').default_capabilities()

return {
    "neovim/nvim-lspconfig",
    config = function()
        vim.lsp.config('lua_ls', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
        vim.lsp.enable('lua_ls')
        vim.lsp.config('rust_analyzer', {
            on_attach = on_attach,
            capabilities = capabilities
        })
        vim.lsp.enable('rust_analyzer')
        vim.lsp.config('nil', {
            on_attach = on_attach,
            capabilities = capabilities,
            cmd = { 'nil' },
            filetypes = { 'nix' },
            root_markers = { 'flake.nix' },
        })
        vim.lsp.enable('nil')
        vim.lsp.enable('marksman')
        vim.lsp.config('pylsp', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                pylsp = {
                    plugins = {
                        pyflakes = { enabled = false },
                        pylint = { enabled = false },
                        pycodestyle = { enabled = false }
                    }
                }
            }
        })
        vim.lsp.enable('pylsp')
        vim.lsp.config('gitlab_ci_ls', {
            on_attach = on_attach,
            capabilities = capabilities
        })
        vim.lsp.enable('gitlab_ci_ls')
        vim.lsp.config('docker_compose_language_service', {
            on_attach = on_attach,
            capabilities = capabilities
        })
        vim.lsp.enable('docker_compose_language_service')
    end
}
