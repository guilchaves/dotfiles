return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "auto", -- nightfly, modus-vivendi
                icons_enabled = true,
                section_separators = { left = "", right = "" }
            },
            sections = {
                lualine_c = { { "filename", path = 1 } },
            },
            dependencies = { "nvim-tree/nvim-web-devicons" },
        })
    end,
}
