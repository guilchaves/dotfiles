return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },

    opts = {},

    keys = {
        { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
        { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
        { "<leader>tt", ":TodoTelescope<CR>", desc = "Todo Telescope" },
        { "<leader>to", ":TodoTelescope keywords=TODO<CR>", desc = "Todo Telescope TODO" },
    },
}
