return {
    "windwp/nvim-ts-autotag",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        require("nvim-ts-autotag").setup({
            opts = {
                enable_close = true,
                enable_rename = true,
                enable_close_on_slash = true,
            },
            per_filetype = {
                ["html"] = { enable_close = true },
                ["xml"] = { enable_close = true },
                ["javascriptreact"] = { enable_close = true },
                ["typescript"] = { enable_close = true },
                ["typescriptreact"] = { enable_close = true },
                ["javascript"] = { enable_close = true },
                ["ruby"] = { enable_close = true },
                ["go"] = { enable_close = true },
                ["rust"] = { enable_close = true },
                ["templ"] = { enable_close = true },
                ["htmx"] = { enable_close = true },
            }
        })
    end
}
