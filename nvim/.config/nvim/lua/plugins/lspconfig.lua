local on_attach = function(_, bufnr)
    local opts = { buffer = bufnr }
    local builtin = require('telescope.builtin')
    vim.keymap.set("n", "gd", builtin.lsp_definitions, opts)
    vim.keymap.set("n", "gt", builtin.lsp_type_definitions, opts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "<leader>vws", builtin.lsp_workspace_symbols, opts)
    vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
    vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
    vim.keymap.set("n", "<leader>sd", vim.lsp.buf.document_highlight, opts)

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
        vim.lsp.config('kotlin_language_server', {
            on_attach = on_attach,
            capabilities = capabilities,
            settings = {
                filetypes = {
                    "kotlin", "kt", "kts"
                }
            }
        })
        vim.lsp.enable('kotlin_language_server')
        vim.lsp.config("vue_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = {"typescript", "javascript", "javascriptreact", "typescriptreact", "vue"},
            init_options = {
                typescript = {
                    tsdk = vim.fn.expand("$HOME/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib")
                },
                vue = {
                    hybridMode = false,
                }
            },
            before_init = function(params, config)
                local lib_path = vim.fs.find("node_modules/typescript/lib", { path = new_root_dir, upward = true })[1]
                if lib_path then
                    config.init_options.typescript.tsdk = lib_path
                end
            end,
        })
        vim.lsp.enable("vue_ls")
        vim.lsp.config("omnisharp", {
            on_attach = on_attach,
            capabilities = capabilities
        })
        vim.lsp.enable("omnisharp")

    end
}
