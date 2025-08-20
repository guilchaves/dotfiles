local keymap = vim.keymap
local lsp = vim.lsp
local opts = { noremap = true, silent = true }

return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "tailwindcss",
                    "elixirls",
                    "ts_ls",
                    "htmx",
                    "templ",
                    "gopls",
                    "emmet_language_server",
                    "angularls",
                },
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")
            local util = require("lspconfig/util")
            local _border = "single"

            local on_attach = function(client, bufnr)
            end

            local ok, mason_registry = pcall(require, "mason-registry")
            local angularls_cmd = { "ngserver", "--stdio" }

            if ok then
                local success, pkg = pcall(mason_registry.get_package, mason_registry, "angular-language-server")
                if success and pkg then
                    -- Tenta usar get_install_path() se existir, senão usa install_path
                    local install_path = nil
                    if type(pkg.get_install_path) == "function" then
                        install_path = pkg:get_install_path()
                    elseif pkg.install_path then
                        install_path = pkg.install_path
                    end

                    if install_path then
                        angularls_cmd = {
                            "ngserver",
                            "--stdio",
                            "--tsProbeLocations",
                            table.concat({
                                install_path,
                                vim.uv.cwd(),
                            }, ","),
                            "--ngProbeLocations",
                            table.concat({
                                install_path .. "/node_modules/@angular/language-server",
                                vim.uv.cwd(),
                            }, ","),
                        }
                    end
                end
            end

            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
                border = _border,
            })

            vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
                border = _border,
            })

            vim.diagnostic.config({
                float = { border = _border },
            })

            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })

            lspconfig.rust_analyzer.setup({
                capabilities = capabilities,
            })

            lspconfig.elixirls.setup({
                capabilities = capabilities,
                cmd = { vim.fn.expand("~/.bin/elixir-ls/language_server.sh") },
            })

            lspconfig.tailwindcss.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = { "templ", "javascript", "typescript", "typescriptreact", "javascriptreact" },
                init_options = { userLanguages = { templ = "html" } },
            })

            lspconfig.templ.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    "html",
                    "templ",
                },
                templ_format = function()
                    local bufnr = vim.api.nvim_get_current_buf()
                    local filename = vim.api.nvim_buf_get_name(bufnr)
                    local cmd = "templ fmt " .. vim.fn.shellescape(filename)

                    vim.fn.jobstart(cmd, {
                        on_exit = function()
                            if vim.api.nvim_get_current_buf() == bufnr then
                                vim.cmd("e!")
                            end
                        end,
                    })
                end
            })

            lspconfig.htmx.setup({
                on_attach = on_attach,
                capabilities = capabilities,
                filetypes = {
                    "html",
                },
            })

            lspconfig.angularls.setup({
                cmd = angularls_cmd,
                capabilities = capabilities,
                on_new_config = function(new_config, new_root_dir)
                    new_config.cmd = angularls_cmd
                end,
            })

            lspconfig.ts_ls.setup({
                capabilities = capabilities,
                filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                cmd = { "typescript-language-server", "--stdio" },
                settings = {
                    completions = {
                        completeFunctionCalls = true,
                    },
                },
                keys = {
                    {
                        "<leader>co",
                        function()
                            vim.lsp.buf.code_action({
                                apply = true,
                                context = {
                                    only = { "source.organizeImports.ts" },
                                    diagnostics = {},
                                },
                            })
                        end,
                        desc = "Organize Imports",
                    },
                    {
                        "<leader>cR",
                        function()
                            vim.lsp.buf.code_action({
                                apply = true,
                                context = {
                                    only = { "source.removeUnused.ts" },
                                    diagnostics = {},
                                },
                            })
                        end,
                        desc = "Remove Unused Imports",
                    },
                },
            })

            lspconfig.gopls.setup({
                capabilities = capabilities,
                cmd = { "gopls" },
                filetypes = {
                    "go",
                    "gomod",
                    "gowork",
                    "gotmpl",
                },
                root_dir = util.root_pattern("go.work", "go.mod", ".git"),
                settings = {
                    gopls = {
                        completeUnimported = true,
                        usePlaceholders = true,
                        deepCompletion = true,
                        linkTarget = "gopls",
                        analyses = {
                            unusedparams = true,
                            useany = true,
                            fillstruct = true,
                        },
                        staticcheck = true,
                        hints = {
                            assignVariableTypes = true,
                            compositeLiteralFields = true,
                            compositeLiteralTypes = true,
                            constantValues = true,
                            functionTypeParameters = true,
                            parameterNames = true,
                            rangeVariableTypes = true,
                        },
                    },
                },
                on_attach = function(_, bufnr)
                    vim.keymap.set('n', '<leader>fs', function()
                        vim.lsp.buf.code_action({
                            context = { only = { 'refactor.rewrite' } },
                            apply = true,
                        })
                    end, { buffer = bufnr, desc = 'Fill struct' })
                end,
            })

            lspconfig.emmet_language_server.setup({
                filetypes = {
                    "css",
                    "html",
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                    "typescript.tsx",
                },
            })

            keymap.set("n", "K", lsp.buf.hover, {})
            keymap.set("n", "gd", lsp.buf.definition, {})
            keymap.set("n", "<leader>gr", lsp.buf.references, {})
            keymap.set({ "n", "v" }, "<leader>ca", lsp.buf.code_action, {})
            keymap.set({ "i", "n" }, "<C-s>", lsp.buf.signature_help, opts)
            keymap.set("n", "<leader>rn", lsp.buf.rename, opts)
        end,
    },
}
