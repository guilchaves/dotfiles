return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            local builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
            vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                defaults = {
                    winblend = 0,
                    file_ignore_patterns = {
                        "node_modules",
                        "bun.lockb",
                        "yarn.lock",
                        "package-lock.json",
                        ".git/*",
                        ".next/*",
                    },
                },
                pickers = {
                    find_files = {
                        hidden = true,
                        no_ignore = true,
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
            
            -- Deixe o Telescope transparente
            local function telescope_transparent()
                local hl = vim.api.nvim_set_hl
                hl(0, "TelescopeNormal",       { bg = "none" })
                hl(0, "TelescopePromptNormal", { bg = "none" })
                hl(0, "TelescopeResultsNormal",{ bg = "none" })
                hl(0, "TelescopePreviewNormal",{ bg = "none" })

                hl(0, "TelescopeBorder",       { bg = "none" })
                hl(0, "TelescopePromptBorder", { bg = "none" })
                hl(0, "TelescopeResultsBorder",{ bg = "none" })
                hl(0, "TelescopePreviewBorder",{ bg = "none" })

                -- Se quiser a barra de prompt/results também transparente
                hl(0, "TelescopePromptTitle",  { bg = "none" })
                hl(0, "TelescopeResultsTitle", { bg = "none" })
                hl(0, "TelescopePreviewTitle", { bg = "none" })
            end

            -- Reaplicar quando trocar de colorscheme
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = telescope_transparent,
            })

            -- Aplicar imediatamente
            telescope_transparent()
        end,
    },
}
