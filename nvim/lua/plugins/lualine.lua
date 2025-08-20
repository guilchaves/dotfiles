return {
    "nvim-lualine/lualine.nvim",
    config = function()
        require("lualine").setup({
            options = {
                theme = "nightfly",
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
